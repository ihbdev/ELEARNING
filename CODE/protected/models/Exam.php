<?php
/**
 * 
 * Exam class file 
 * @author ihbvietnam <hotro@ihbvietnam.com>
 * @link http://iphoenix.vn
 * @copyright Copyright &copy; 2012 IHB Vietnam
 * @license http://iphoenix.vn/license
 *
 */

/**
 * Exam includes attributes and methods of Exam class  
 */
class Exam extends CActiveRecord
{
	/**
	 * Config status of news
	 */
	const STATUS_PENDING=0;
	const STATUS_ACTIVE=1;
	const TYPE_LANGUAGE=1;
	const TYPE_KNOWLEDGE=2;
	const TYPE_MARKINGUP=3;
	const TYPE_CODING=4;
	
	static $list_type=array(
			Exam::TYPE_LANGUAGE=>'Language Skill',
			Exam::TYPE_KNOWLEDGE=>'Knowledge Skill',
			Exam::TYPE_MARKINGUP=>'Marking-up Skill',
			Exam::TYPE_CODING=>'Coding Skill'
	);
	/**
	 * @var array config list other attributes of the banner
	 * this attribute no need to search	 
	 */	
	private $config_other_attributes=array('modified','list_users');	
	private $list_other_attributes;
	
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
 		$url=Yii::app()->createUrl("exam/view",array('id'=>$this->id));
		return $url;
 	}
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_exam';
	}
	/**
	 * @return array validation rules for model attributes.
	 */	
	public function rules()
	{
		return array(
			array('office_id,test_id,type,list_users','required'),
			array('start_time', 'compare', 'operator'=>'<','compareAttribute'=>'finish_time','message'=>'Start time must be less than Finish time'),
			array('start_time,finish_time','safe'),
		);
	}
	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'type' => 'Type',
			'level' => 'Level',
			'office_id'=>'Office',
			'start_time'=>'Start time',
			'finish_time'=>'Finish time',
			'created_by' => 'Author',
			'created_date' => 'Created Date',
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
			'office'=>array(self::BELONGS_TO,'Category','office_id'),
			'test'=>array(self::BELONGS_TO,'ITest','test_id'),
		);
	}
	/**
	 * This event is raised after the record is instantiated by a find method.
	 * @param CEvent $event the event parameter
	 */
	public function afterFind()
	{
		//Decode attribute other to set other attributes
		$this->list_other_attributes=(array)json_decode($this->other);	
			
		if(isset($this->list_other_attributes['modified']))
			$this->list_other_attributes['modified']=(array)json_decode($this->list_other_attributes['modified']);
		else 
			$this->list_other_attributes['modified']=array();
			
		if(isset($this->list_other_attributes['list_users']))
			$this->list_other_attributes['list_users']=(array)json_decode($this->list_other_attributes['list_users']);
		else 
			$this->list_other_attributes['list_users']=array();
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
			}
			else {
				$modified=$this->modified;
				$modified[time()]=Yii::app()->user->id;
				$this->modified=json_encode($modified);				
			}
			
			$this->list_users=json_encode($this->list_users);		
			
			$this->other=json_encode($this->list_other_attributes);
			return true;
		}
		else
			return false;
	}
/**
	 * Change status of image
	 * @param integer $id, the ID of contact model
	 */
	static function reverseStatus($id){
		$command=Yii::app()->db->createCommand()
		->select('status')
		->from('tbl_exam')
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
		$sql='UPDATE tbl_exam SET status = '.$status.' WHERE id = '.$id;
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
	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search() {
		$criteria = new CDbCriteria ();
		$criteria->compare ( 'type', Exam::TYPE_MARKINGUP );
		if($this->type != '')
			$criteria->compare ( 'type',$this->type);
		if($this->office_id != '')
			$criteria->compare ( 'office_id',$this->office_id);
			
		$list_exams= new CActiveDataProvider ( 'Exam', array (
			'criteria' => $criteria, 
			'pagination' => array ('pageSize' => Yii::app ()->user->getState ( 'pageSize', Setting::s('DEFAULT_PAGE_SIZE','System')  ) ), 
			'sort' => array ('defaultOrder' => 'id DESC' )    		
		));
		return $list_exams;
	}
}

