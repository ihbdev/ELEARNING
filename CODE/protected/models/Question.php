<?php
/**
 * 
 * Question class file 
 * @author ihbvietnam <hotro@ihbvietnam.com>
 * @link http://iphoenix.vn
 * @copyright Copyright &copy; 2012 IHB Vietnam
 * @license http://iphoenix.vn/license
 *
 */

/**
 * Question includes attributes and methods of Question class  
 */
class Question extends CActiveRecord
{
	const TYPE_LANGUAGE=1;
	const TYPE_KNOWLEDGE=2;
	const TYPE_MARKINGUP=3;
	const TYPE_CODING=4;
	
	const TYPE_UPDATE_TITLE=1;
	const TYPE_UPDATE_CHOICE=2;
	/**
	 * @var array config list other attributes of the banner
	 * this attribute no need to search	 
	 */	
	private $config_other_attributes=array('supplement','modified');	
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
		return 'tbl_question';
	}
	/**
	 * @return array validation rules for model attributes.
	 */	
	public function rules()
	{
		return array(
			array('content,answer,title','required'),
			array('supplement,material_id','safe')
		);
	}
	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'type' => 'Dạng câu hỏi',
			'level' => 'Mức độ khó',
			'material_id'=>'Tài liệu gốc',
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
			'material'=>array(self::BELONGS_TO,'Material','material_id'),
		);
	}
	/**
	 * This event is raised after the record is instantiated by a find method.
	 * @param CEvent $event the event parameter
	 */
	public function afterFind()
	{
		//Decode content
		$this->content=(array)json_decode($this->content);
		//Decode answer
		$this->answer=(array)json_decode($this->answer);
		//Decode attribute other to set other attributes
		$this->list_other_attributes=(array)json_decode($this->other);	
			
		if(isset($this->list_other_attributes['modified']))
			$this->list_other_attributes['modified']=(array)json_decode($this->list_other_attributes['modified']);
		else 
			$this->list_other_attributes['modified']=array();
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
			$this->content=json_encode($this->content);
			//Encode answer
			$this->answer=json_encode($this->answer);
			$this->other=json_encode($this->list_other_attributes);
			return true;
		}
		else
			return false;
	}
	/*
	 * Check correct answer or uncorrect answer
	 */
	public function check($answer){
		
	}
	/*
	 * Interchange list options
	 */
	static function interChange($origin){
		$list_keys=array_keys($origin);
		shuffle($list_keys);
		$result=array();	
		foreach ($list_keys as $key) {
			$result[$key]=$origin[$key];
		}
		return $result;	
	}
}
