<?php
/**
 * 
 * Test class file 
 * @author ihbvietnam <hotro@ihbvietnam.com>
 * @link http://iphoenix.vn
 * @copyright Copyright &copy; 2012 IHB Vietnam
 * @license http://iphoenix.vn/license
 *
 */

/**
 * Test includes attributes and methods of Test class  
 */
class TestKnowledgeSkill extends CActiveRecord
{
	/**
	 * Config scope of news
	 */
	public function defaultScope(){
		return array(
			'condition'=>'type = '.ITest::TYPE_KNOWLEDGE,
		);	
	}
	/**
	 * Config status of news
	 */
	const STATUS_PENDING=0;
	const STATUS_ACTIVE=1;
	
	/**
	 * @var array config list other attributes of the banner
	 * this attribute no need to search	 
	 */	
	private $config_other_attributes=array('modified','description','content');	
	private $list_other_attributes;
	public $section_a;
	public $section_b;
	public $section_c;
	
	public $group_level;
	
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	/**
	 * PHP setter magic method for other attributes
	 * @param $name the attribute name
	 * @param $value the attribute value
	 * set value into particular attribute
	 */
	public function __set($name,$value)
	{
		if(in_array($name,$this->config_other_attributes))
			$this->list_other_attributes[$name]=$value;
		else 
			parent::__set($name,$value);
	}
	
	/**
	 * PHP getter magic method for other attributes
	 * @param $name the attribute name
	 * @return value of {$name} attribute
	 */
	public function __get($name)
	{
		if(in_array($name,$this->config_other_attributes))
			if(isset($this->list_other_attributes[$name])) 
				return $this->list_other_attributes[$name];
			else 
		 		return null;
		else
			return parent::__get($name);
	}
	/**
	 * Get image url which display status of contact
	 * @return string path to enable.png if this status is STATUS_ACTIVE
	 * path to disable.png if status is STATUS_PENDING
	 */
 	public function getImageStatus()
 	{
 		switch ($this->status) {
 			case self::STATUS_ACTIVE: 
 				return Yii::app()->theme->baseUrl.'/images/enable.png';
 				break;
 			case self::STATUS_PENDING:
 				return Yii::app()->theme->baseUrl.'/images/disable.png';
 				break;
 		}	
 	}
	/**
	 * Get url of this news
	 * @return string $url, the absoluted path of this news
	 */
	public function getUrl()
 	{
 		$url=Yii::app()->createUrl("markingUpSkill/view",array('id'=>$this->id));
		return $url;
 	}
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_test';
	}
	/**
	 * @return array validation rules for model attributes.
	 */	
	public function rules()
	{
		return array(
			array('title,content','required'),
			array('type', 'numerical'),
			array('title,group_level,catid','safe','on'=>'search'),
			array('catid','safe')
		);
	}
	public function validatorContent($attributes,$params){
		if(sizeof($this->content)==0){
			$this->addError('content', 'Chưa có câu hỏi');
		}
	}
	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'type' => 'Type',
			'level' => 'Level',
			'catid'=>'Group',
			'title'=>'Title',
			'content'=>'List questions',
			'created_by' => 'Author',
			'created_date' => 'Created Time',
		);
	}
	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'author'=>array(self::BELONGS_TO,'User','created_by'),
			'cat'=>array(self::BELONGS_TO,'Category','catid'),
		);
	}
	/**
	 * This event is raised after the record is instantiated by a find method.
	 * @param CEvent $event the event parameter
	 */
	public function afterFind()
	{
		//Decode attribute other to set other attributes
		$this->list_other_attributes=json_decode($this->other,true);	
			
		if(isset($this->list_other_attributes['modified']))
			$this->list_other_attributes['modified']=json_decode($this->list_other_attributes['modified'],true);
		else 
			$this->list_other_attributes['modified']=array();
			
		//Decode content
		if(isset($this->list_other_attributes['content']))
			$this->list_other_attributes['content']=json_decode($this->list_other_attributes['content'],true);
		else 
			$this->list_other_attributes['content']=array();
		return parent::afterFind();
	}
		
	/**
	 * This method is invoked before saving a record (after validation, if any).
	 * The default implementation raises the {@link onBeforeSave} event.
	 * You may override this method to do any preparation work for record saving.
	 * Use {@link isNewRecord} to determine whether the saving is
	 * for inserting or updating record.
	 * Make sure you call the parent implementation so that the event is raised properly.
	 * @return boolean whether the saving should be executed. Defaults to true.
	 */
	public function beforeSave()
	{
		if(parent::beforeSave())
		{
			if($this->isNewRecord)
			{
				$this->created_date=time();
				$this->created_by=Yii::app()->user->id;		
				$this->status=TestKnowledgeSkill::STATUS_ACTIVE;		
			}
			else {
				$modified=$this->modified;
				$modified[time()]=Yii::app()->user->id;
				$this->modified=json_encode($modified);				
			}
			$this->type=ITest::TYPE_KNOWLEDGE;
			//Encode content
			$content=$this->content;
			$this->content=json_encode($this->content);
			
			$this->other=json_encode($this->list_other_attributes);
			return true;
		}
		else
			return false;
	}
	
	/**
	 * Suggests a list of existing titles matching the specified keyword.
	 * @param string the keyword to be matched
	 * @param integer maximum number of tags to be returned
	 * @return array list of matching username names
	 */
	public function suggestTitle($keyword,$limit=20)
	{
		$list_test=$this->findAll(array(
			'condition'=>'title LIKE :keyword',
			'order'=>'title DESC',
			'limit'=>$limit,
			'params'=>array(
				':keyword'=>'%'.strtr($keyword,array('%'=>'\%', '_'=>'\_', '\\'=>'\\\\')).'%',
			),
		));
		$titles=array();
		foreach($list_test as $test)
			$titles[]=$test->title;
			return $titles;
	}
	/**
	 * Change status of image
	 * @param integer $id, the ID of contact model
	 */
	static function reverseStatus($id){
		$command=Yii::app()->db->createCommand()
		->select('status')
		->from('tbl_test')
		->where('id=:id',array(':id'=>$id))
		->queryRow();
		switch ($command['status']){
			case self::STATUS_PENDING:
				 $status=self::STATUS_ACTIVE;
				 break;
			case self::STATUS_ACTIVE:
				$status=self::STATUS_PENDING;
				break;
		}
		$sql='UPDATE tbl_test SET status = '.$status.' WHERE id = '.$id;
		$command=Yii::app()->db->createCommand($sql);
		if($command->execute()) {
			switch ($status) {
 			case self::STATUS_ACTIVE: 
 				$src=Yii::app()->theme->baseUrl.'/images/enable.png';
 				break;
 			case self::STATUS_PENDING:
 				$src=Yii::app()->theme->baseUrl.'/images/disable.png';
 				break;
 		}	
			return $src;
		}
		else return false;
	}
	
	/*
	 * Encode content
	 */
	public function search(){
		$criteria = new CDbCriteria ();
		$criteria->compare ( 'type', ITest::TYPE_KNOWLEDGE );
		if($this->title != '')
			$criteria->compare ( 'title', $this->title, true );
		if($this->group_level === '0')
			$criteria->compare ( 'level',0);
		if($this->group_level === '1')
			$criteria->addCondition( 'level <> 0');	
		if (isset ( $_GET ['pageSize'] ))
			Yii::app ()->user->setState ( 'pageSize', $_GET ['pageSize'] );	
		$list_tests= new CActiveDataProvider ( 'TestKnowledgeSkill', array (
			'criteria' => $criteria, 
			'pagination' => array ('pageSize' => Yii::app ()->user->getState ( 'pageSize', Setting::s('DEFAULT_PAGE_SIZE','System')  ) ), 
			'sort' => array ('defaultOrder' => 'id DESC' )    		
		));
		return $list_tests;
	}
}
