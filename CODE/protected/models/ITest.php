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
class ITest extends CActiveRecord
{
	const TYPE_LANGUAGE=1;
	const TYPE_KNOWLEDGE=2;
	const TYPE_MARKINGUP=3;
	const TYPE_CODING=4;
	/**
	 * @var array config list other attributes of the banner
	 * this attribute no need to search	 
	 */	
	private $config_other_attributes=array('modified','description','content');	
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
			array('title,level,content','required'),
			array('type', 'numerical'),
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
			'type' => 'Dạng câu hỏi',
			'level' => 'Mức độ khó',
			'catid'=>'Nhóm',
			'title'=>'Tiêu đề',
			'content'=>'Danh sách câu hỏi',
			'created_by' => 'Người tạo',
			'created_date' => 'Ngày tạo',
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
			
		//Decode content
		if(isset($this->list_other_attributes['content']))
			$this->list_other_attributes['content']=(array)json_decode($this->list_other_attributes['content']);
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
			}
			else {
				$modified=$this->modified;
				$modified[time()]=Yii::app()->user->id;
				$this->modified=json_encode($modified);				
			}
			//Encode content
			$content=$this->content;
			$this->content=json_encode($this->content);
			
			$this->other=json_encode($this->list_other_attributes);
			return true;
		}
		else
			return false;
	}
	
	/*
	 * Encode content
	 */
	public function encode(){
	
	}
	/*
	 * Decode content
	 */
	public function decode(){
	
	}
	
	/*
	 * auto create
	 */
	public function autoCreate(){
	
	}
}
