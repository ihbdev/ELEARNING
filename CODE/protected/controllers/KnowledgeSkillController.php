<?php
/**
 * 
 * KnowledgeSkillController class file 
 * @author ihbvietnam <hotro@ihbvietnam.com>
 * @link http://iphoenix.vn
 * @copyright Copyright &copy; 2012 IHB Vietnam
 * @license http://iphoenix.vn/license
 *
 */

/**
 * KnowledgeSkillController includes actions relevant to KnowledgeSkill model:
 *** create KnowledgeSkill
 *** copy KnowledgeSkill
 *** update
 *** delete KnowledgeSkill
 *** index KnowledgeSkill
 *** reverse status KnowledgeSkill
 *** suggest title KnowledgeSkill
 *** update suggest
 *** load model  
 */
class KnowledgeSkillController extends Controller
{
	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
		/*
			array('allow',  
				'actions'=>array('index'),
				'roles'=>array('language_index'),
			),
			array('allow',  
				'actions'=>array('create'),
				'roles'=>array('language_create'),
			),
			array('allow',  
				'actions'=>array('suggestTitle'),
				'roles'=>array('language_suggestTitle'),
			),
			array('allow', 
				'actions'=>array('update','index'),
				'users'=>array('@'),
			),
			array('allow',  
				'actions'=>array('reverseStatus'),
				'roles'=>array('language_reverseStatus'),
			),
			array('allow',  
				'actions'=>array('delete'),
				'roles'=>array('language_delete'),
			),
			array('allow',  
				'actions'=>array('checkbox'),
				'roles'=>array('language_checkbox'),
			),
			array('allow',  
				'actions'=>array('copy'),
				'roles'=>array('language_copy'),
			),
			array('allow',  
				'actions'=>array('dynamicCat'),
				'roles'=>array('language_dynamicCat'),
			),
			array('allow',  
				'actions'=>array('updateSuggest'),
				'roles'=>array('language_updateSuggest'),
			),
*/			
			array('allow', 
				'users'=>array('*'),
			),			
		);
	}
	
	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$test=new KnowledgeSkillTest();		
		$test->title = 'Knowledskill test';
		$temp_content = array('section_a'=>'','section_b'=>'','section_c'=>'');	
		$temp_section = array('description'=>"",'questions'=>array());		
		//var_dump($test->section_a['questions']); //exit;
		if(isset($_POST['section_a']))
		{		
			$test->type=KnowledgeSkillTest::TYPE_KNOWLEDGE;	
			for($i=1; $i<=17; $i++)
			{
				$question = new Question();
				$question->attributes = $_POST ['section_a']['questions'][$i];
				if($question->type==Question::TYPE_WRITING)
				{
					$question->content = $question->title;
					$question->answer = 'get from trainee';
					//var_dump($question); exit;						
				}
				//var_dump($_POST ['section_a']['questions'][$i]); exit;
				if($question->save())
				{	
					$temp_section['questions'][$i] = $question->id;					
				}
			}
			$temp_section['description']=$_POST['section_a']['description'];			
			$test->section_a = $temp_section;
			//var_dump($test->section_a);
			$temp_content['section_a'] = $test->section_a;
		}
		$temp_section = array('description'=>"",'questions'=>array());
		if(isset($_POST['materials']['B']) && isset($_POST['section_b']))
		{			
			$material = new Material();
			$material->catid = Material::TYPE_KNOWLEDGE;
			$material->content = $_POST['materials']['B'];
			$material->save();
			for($i=1; $i<=2; $i++)
			{
				$question = new Question();
				$question->attributes = $_POST ['section_b']['questions'][$i];
				if($question->type==Question::TYPE_WRITING)
				{
					$question->content = $question->title;
					$question->answer = $question->title;				
				}
				$question->material_id = $material->id;
				if($question->save())
				{	
					$temp_section['questions'][$i] = $question->id;					
				}
			}
			//var_dump($temp_section);exit;
			$test->section_b = $temp_section;
			$temp_content['section_b'] = $test->section_b;
		}
		$temp_section = array('description'=>"",'questions'=>array());
		if(isset($_POST['materials']['C']) && isset($_POST['section_c']))
		{
			$material = new Material();
			$material->catid = Material::TYPE_KNOWLEDGE;
			$material->content = $_POST['materials']['C'];
			$material->save();
			for($i=1; $i<=2; $i++)
			{
				$question = new Question();
				$question->attributes = $_POST ['section_c']['questions'][$i];
				$question->material_id = $material->id;
				if($question->type==Question::TYPE_WRITING)
				{
					$question->content = $question->title;					
				}				
				if($question->save())
				{	
					$temp_section['questions'][$i] = $question->id;					
				}
			}
			$test->section_c = $temp_section;
			$temp_content['section_c'] = $test->section_c;
		}						
		if(isset($_POST['KnowledgeSkillTest']['catid']))
		{
			$test->catid = $_POST['KnowledgeSkillTest']['catid'];
			$test->content = $temp_content;
		}
		//var_dump($test->save());
		if($test->save())
		{
			//$this->redirect(array('update','id'=>$test->id));
			Yii::app()->user->setFlash('success', Language::t('Knowledge created successfully'));
		}
		//var_dump($test); exit;
		/*
		if(isset($_POST['ITest']))
		{
			$test->attributes=$_POST['ITest'];
			$test->type=ITest::TYPE_KNOWLEDGE;		
			$list_questions = array_diff ( explode ( ',', $_POST['ITest']['section_a']['questions'] ), array ('') );
			$test->section_a->questions=$list_questions;
			if($test->save())
			{
				$this->redirect(array('update','id'=>$test->id));
			}	
		}
		*/
		$this->render ( 'create',array('test'=>$test));		
	}
	/**
	 * Add a new question
	 */
	public function actionAddQuestion() {		
		if (isset ( $_POST ['Question'] )) {
			$question = new Question ();
			$question->attributes = $_POST ['Question'];
			if (! isset ( $question->answer )) {
				$result = array ('success' => false, 'message' => 'Select answer' );
				echo json_encode ( $result );
			} else {				
				if (! isset ( $question->material_id ) && isset ( $material->id ))
					$question->material_id = $material->id;
				else
					$question->material_id = 0;
				if ($question->save ()) {
					$question = Question::model ()->findByPk ( $question->id );
					$view = $this->renderPartial ( 'add_question', array ('question' => $question ), true );
					$result = array ('success' => true, 'id' => $question->id, 'view' => $view );
					echo json_encode ( $result );
				}
			}
		}
	}	
	/**
	 * Copy a new model
	 * @param integer $id the ID of model to be copied
	 */
	public function actionCopy($id)
	{
	}
	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$test=KnowledgeSkillTest::model()->findByPk($id);
		if(isset($_POST['KnowledgeSkillTest']))
		{
			$test->attributes=$_POST['KnowledgeSkillTest'];
			$test->type=KnowledgeSkillTest::TYPE_KNOWLEDGE;			
			//$list_questions = array_diff ( explode ( ',', $_POST['ITest']['questions'] ), array ('') );
			//$test->content=$list_questions;
			if($test->save())
			{
				$test=KnowledgeSkillTest::model()->findByPk($id);
				Yii::app()->user->setFlash('success', Language::t('Update success'));
			}	
		}
		$this->render ( 'update',array('test'=>$test));	
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		if(Yii::app()->request->isPostRequest)
		{
			// we only allow deletion via POST request
			$this->loadModel($id)->delete();

			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if(!isset($_GET['ajax']))
				$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
		}
		else
			throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');		
	}

	/**
	 * Performs the action with multi-selected language from checked models in section
	 * @param string action to perform
	 * @return boolean, true if the action is procced successfully, otherwise return false
	 */
	public function actionCheckbox($action)
	{
		$this->initCheckbox('checked-test-list');
		$list_checked = Yii::app()->session["checked-test-list"];
		switch ($action) {
			case 'delete' :
				if (Yii::app ()->user->checkAccess ( 'test_delete')) {
					foreach ( $list_checked as $id ) {
						$item = KnowledgeSkillTest::model ()->findByPk ( (int)$id );
						if (isset ( $item ))
							if (! $item->delete ()) {
								echo 'false';
								Yii::app ()->end ();
							}
					}
					Yii::app ()->session ["checked-test-list"] = array ();
				} else {
					echo 'false';
					Yii::app ()->end ();
				}
				break;
		}
		echo 'true';
		Yii::app()->end();		
	}
	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$this->initCheckbox('checked-test-list');
		$criteria = new CDbCriteria ();
		$criteria->compare ( 'type', KnowledgeSkillTest::TYPE_KNOWLEDGE );
		$list_tests= new CActiveDataProvider ( 'KnowledgeSkillTest', array (
			'criteria' => $criteria, 
			'pagination' => array ('pageSize' => Yii::app ()->user->getState ( 'pageSize', Setting::s('DEFAULT_PAGE_SIZE','System')  ) ), 
			'sort' => array ('defaultOrder' => 'id DESC' )    		
		));
		
		$model=new KnowledgeSkillTest('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['KnowledgeSkillTest']))
			$model->attributes=$_GET['KnowledgeSkillTest'];
				
		$this->render('index',array(
			'list_tests'=>$list_tests,
			'model'=>$model
		));
		
	}
	/**
	 * Reverse status of language
	 * @param integer $id, the ID of language to be reversed
	 */
	public function actionReverseStatus($id)
	{
	}
	
	/**
	 * Suggests title of language.
	 */
	public function actionSuggestTitle()
	{
	
	}
	
	/**
	 * Init checkbox selection
	 * @param string $name_params, name of section to work	 
	 */
	public function initCheckbox($name_params){
	
	}
	/*
	 * List language suggest 
	 */
	public function actionUpdateSuggest()
	{
		
	}
	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer the ID of the model to be loaded
	 */
	public function loadModel($id)
	{
		$model=LanguageSkill::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param CModel the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		
	}
	/**
	 * 
	 * function for tester doing the test
	 */
	public function actionTest()
	{
		//$employee = User::model()->findByPk($employee_id);
		//$test = ITest::model()->findByPk($test_id);
		//$exam = Exam::model()->findByPk($exam_id);
		
		$this->render('making_test', array(
				//'test'=>$test,
				//'employee'=>$employee,
				//'exam'=>$exam,	
			));
			
	}
}
