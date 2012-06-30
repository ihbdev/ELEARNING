<?php
/**
 * 
 * Result class file 
 * @author ihbvietnam <hotro@ihbvietnam.com>
 * @link http://iphoenix.vn
 * @copyright Copyright &copy; 2012 IHB Vietnam
 * @license http://iphoenix.vn/license
 *
 */

/**
 * Exam includes attributes and methods of Exam class  
 */
class Result extends CActiveRecord
{
	/**
	 * @var array config list other attributes of the banner
	 * this attribute no need to search	 
	 */	
	private $config_other_attributes=array('modified,description');	
	private $list_other_attributes;
	
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
	 * Get url of this news
	 * @return string $url, the absoluted path of this news
	 */
	public function getUrl()
 	{
 		$url=Yii::app()->createUrl("result/view",array('id'=>$this->id));
		return $url;
 	}
	
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_result';
	}
	/**
	 * @return array validation rules for model attributes.
	 */	
	public function rules()
	{
		return array(
			array('exam_id,user_id','required'),
			array('answer','safe')
		);
	}
	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'exam_id'=>'Exam',
			'user_id'=>'Employee',
			'office_id'=>'Office'
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
			'exam'=>array(self::BELONGS_TO,'Exam','exam_id'),
			'user'=>array(self::BELONGS_TO,'User','user_id'),
			'office'=>array(self::BELONGS_TO,'Category','office_id'),
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
		//Decode answer		
		$this->answer=json_decode($this->answer,true);			

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
			$this->other=json_encode($this->list_other_attributes);
			$this->answer=json_encode($this->answer);			
			return true;
		}
		else
			return false;
	}
	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search() {
		$criteria = new CDbCriteria ();
		$criteria->compare ( 'exam_id',$this->exam_id);		
		$criteria->compare ( 'user_id',$this->user_id);	
		if (isset ( $_GET ['pageSize'] ))
			Yii::app ()->user->setState ( 'pageSize', $_GET ['pageSize'] );
		$list_results= new CActiveDataProvider ( 'Result', array (
			'criteria' => $criteria, 
			'pagination' => array ('pageSize' => Yii::app ()->user->getState ( 'pageSize', Setting::s('DEFAULT_PAGE_SIZE','System')  ) ), 
			'sort' => array ('defaultOrder' => 'id DESC' )    		
		));
		return $list_results;
	}
	/*
	 * get final result 
	 */
	public function getResult(){
		switch ($this->exam->type){
			case Exam::TYPE_MARKINGUP:
                  $num_correct=0;
                  $index=1;
                  foreach ($this->answer as $id=>$answer){
                  	$question=Question::model()->findByPk($id);
                    $check=$question->check($answer);
                    if($check) $num_correct++;
                  }
            break;
		}
		return $num_correct.'/'.sizeof($this->answer);
	}
}
