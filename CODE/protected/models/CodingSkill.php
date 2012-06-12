<?php
/**
 * 
 * CodingSkillForm class file 
 * @author ihbvietnam <hotro@ihbvietnam.com>
 * @link http://iphoenix.vn
 * @copyright Copyright &copy; 2012 IHB Vietnam
 * @license http://iphoenix.vn/license
 *
 */

/**
 * ImportForm includes attributes and methods of ImportForm class, using in import data into systems  
 */ 
class CodingSkill extends CFormModel
{
	/**
	 * @var array $exam
	 */
    public $exam;
    /**
     * @var array $material
     */
    public $material;    
     /**
     * @var array $question
     */
    public $question; 

	/**
	 * @return array validation rules for model attributes.
	 */    
	 public function rules()
    {
        return array(
        	array('exam,material,question','required'),
        );
    }
	/**
	 * @return array customized attribute labels (name=>label)
	 */        
	public function attributeLabels()
	{
		return array(
		);
	}	
}
?>

