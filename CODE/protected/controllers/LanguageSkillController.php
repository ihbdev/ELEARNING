<?php
/**
 * 
 * LanguageSkillController class file 
 * @author ihbvietnam <hotro@ihbvietnam.com>
 * @link http://iphoenix.vn
 * @copyright Copyright &copy; 2012 IHB Vietnam
 * @license http://iphoenix.vn/license
 *
 */

/**
 * LanguageSkillController includes actions relevant to LanguageSkill model:
 *** create LanguageSkill
 *** copy LanguageSkill
 *** update LanguageSkill
 *** delete LanguageSkill
 *** index LanguageSkill
 *** reverse status LanguageSkill
 *** suggest title LanguageSkill
 */
class LanguageSkillController extends Controller
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
				'actions'=>array('update'),
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
			array('deny', 
				'users'=>array('*'),
			),	
			*/
			array(
				'allow',
				'users'=>array('*')
			)		
		);
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$test=new TestLanguageSkill();
		$test->content=array();
		if(isset($_POST['TestLanguageSkill']))
		{
			$test->attributes=$_POST['TestLanguageSkill'];
			/*
			 * Update material
			 */
			for ($i=1; $i<4; $i++)
			{
				if(isset($_POST['TestLanguageSkill']['materials'][$i])){
					$material = new Material();
					$material->catid  = Material::TYPE_LANGUAGE;
					$material->content  = $_POST['TestLanguageSkill']['materials'][$i];
					$material->save();

					$list_questions[$i] = '';
					if(isset($_POST['TestLanguageSkill']['questions'][$i])) $list_questions[$i] = array_diff ( explode ( ',', $_POST['TestLanguageSkill']['questions'][$i] ), array ('') );

					foreach($list_questions[$i] as $question_id){
						$question = Question::model()->findByPk($question_id);
						$question->material_id = $material->id;
						$question->save();
					}
				}
			}

			/*
			 * Update Test
			 */
			$test->content=array('',$list_questions[1],$list_questions[2],$list_questions[3]);

			if($test->save())
			{
				$this->redirect(array('update','id'=>$test->id));
			}	
		}
		$this->render('create',array('test'=>$test));
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
		$test=TestLanguageSkill::model()->findByPk($id);
		if(isset($_POST['TestLanguageSkill']))
		{
			$test->attributes=$_POST['TestLanguageSkill'];

			/*
			 * Update material
			 */
			for ($i=1; $i<4; $i++)
			{
				if(isset($_POST['TestLanguageSkill']['materials'][$i])){
					$list_questions[$i] = '';
					if(isset($_POST['TestLanguageSkill']['questions'][$i]) && $_POST['TestLanguageSkill']['questions'][$i]!='' ) 
					{
						$list_questions[$i] = array_diff ( explode ( ',', $_POST['TestLanguageSkill']['questions'][$i] ), array ('') );
						$question = Question::model()->findByPk($list_questions[$i][0]);

						if($question->material_id != 0) 
							$material = Material::model()->findByPk($question->material_id);
						else
						{
							$material = new Material();
							$material->catid  = Material::TYPE_LANGUAGE;
						}

						$material->content  = $_POST['TestLanguageSkill']['materials'][$i];
						$material->save();
						
						foreach($list_questions[$i] as $question_id){
							$question = Question::model()->findByPk($question_id);
							$question->material_id = $material->id;
							$question->save();
						}
					}
				}
			}

			/*
			 * Update Test
			 */
			$test->content=array('',$list_questions[1],$list_questions[2],$list_questions[3]);
			if($test->save())
			{
				$test=TestLanguageSkill::model()->findByPk($id);
				Yii::app()->user->setFlash('success', Language::t('Update successfully'));
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
		
	}

	/**
	 * Performs the action with multi-selected language from checked models in section
	 * @param string action to perform
	 * @return boolean, true if the action is procced successfully, otherwise return false
	 */
	public function actionCheckbox($action)
	{
		
	}
	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$this->initCheckbox('checked-test-list');
		$model=new TestLanguageSkill('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['TestLanguageSkill']))
			$model->attributes=$_GET['TestLanguageSkill'];
			
		$this->render('index',array(
			'model'=>$model
		));
	}
	/**
	 * Reverse status of language
	 * @param integer $id, the ID of language to be reversed
	 */
	public function actionReverseStatus($id)
	{
		$src=TestLanguageSkill::reverseStatus($id);
		if($src) 
			echo json_encode(array('success'=>true,'src'=>$src));
		else 
			echo json_encode(array('success'=>false));	
	}
	
	/**
	 * Suggests title of language.
	 */
	public function actionSuggestTitle()
	{
		if(isset($_GET['q']) && ($keyword=trim($_GET['q']))!=='')
		{
			$titles=TestLanguageSkill::model()->suggestTitle($keyword);
			if($titles!==array())
				echo implode("\n",$titles);
		}
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
		if(Yii::app()->getRequest()->getIsAjaxRequest() )
		{
			if( !isset($_GET['ajax'] )){
				echo CActiveForm::validate($model);
				Yii::app()->end();
			}
		}
	}

	/**
	 * Init checkbox selection
	 * @param string $name_params, name of section to work	 
	 */
	public function initCheckbox($name_params){
		if (! isset ( Yii::app ()->session [$name_params] ))
			Yii::app ()->session [$name_params] = array ();
		if (! Yii::app ()->getRequest ()->getIsAjaxRequest () && $name_params != 'checked-suggest-list')
		{
				Yii::app ()->session [$name_params] = array ();
		}
		else {
			if (isset ( $_POST ['list-checked'] )) {
				$list_new = array_diff ( explode ( ',', $_POST ['list-checked'] ), array ('' ) );
				$list_old = Yii::app ()->session [$name_params];
				$list = $list_old;
				foreach ( $list_new as $id ) {
					if (! in_array ( $id, $list_old ))
						$list [] = $id;
				}
				Yii::app ()->session [$name_params] = $list;
			}
			if (isset ( $_POST ['list-unchecked'] )) {
				$list_unchecked = array_diff ( explode ( ',', $_POST ['list-unchecked'] ), array ('' ) );
				$list_old = Yii::app ()->session [$name_params];
				$list = array ();
				foreach ( $list_old as $id ) {
					if (! in_array ( $id, $list_unchecked )) {
						$list [] = $id;
					}
				}
				Yii::app ()->session [$name_params] = $list;
			}
		}if (! isset ( Yii::app ()->session [$name_params] ))
			Yii::app ()->session [$name_params] = array ();
		if (! Yii::app ()->getRequest ()->getIsAjaxRequest () && $name_params != 'checked-suggest-list')
		{
				Yii::app ()->session [$name_params] = array ();
		}
		else {
			if (isset ( $_POST ['list-checked'] )) {
				$list_new = array_diff ( explode ( ',', $_POST ['list-checked'] ), array ('' ) );
				$list_old = Yii::app ()->session [$name_params];
				$list = $list_old;
				foreach ( $list_new as $id ) {
					if (! in_array ( $id, $list_old ))
						$list [] = $id;
				}
				Yii::app ()->session [$name_params] = $list;
			}
			if (isset ( $_POST ['list-unchecked'] )) {
				$list_unchecked = array_diff ( explode ( ',', $_POST ['list-unchecked'] ), array ('' ) );
				$list_old = Yii::app ()->session [$name_params];
				$list = array ();
				foreach ( $list_old as $id ) {
					if (! in_array ( $id, $list_unchecked )) {
						$list [] = $id;
					}
				}
				Yii::app ()->session [$name_params] = $list;
			}
		}
	}

	/**
	 * Add a new question
	 */
	public function actionAddQuestion() {
		if (isset ( $_POST ['Question'])) {
			$question = new Question ();
			$question->attributes=$_POST['Question'];		
			if (! isset ( $_POST['Question']['answer'] )) {
				$result = array ('success' => false, 'message' => 'Select answer' );
				echo json_encode ( $result );
			}
			else {
				$content=array();
				$answer=array();
				foreach ($_POST ['Question']['content'] as $index=>$choice){
					if($choice != '') {
						$content[]=$choice;
						if (in_array ( $index, $_POST ['Question']['answer'] ))
							$answer [] = 1;
						else
							$answer [] = 0;
					}
				};
				$question->content = $content;				
				$question->answer = $answer;
				$question->type = Question::TYPE_LANGUAGE;
				$question->material_id = 0;

				if ($question->save ()) {
					$question = Question::model ()->findByPk ( $question->id );
					if(isset($test_id) && $test_id>0){
						$test=TestLanguageSkill::model()->findByPk($test_id);
						$content=$test->content;
						$content[]=$question->id;
						$test->content=$content;
						if($test->save()){
							$view = $this->renderPartial ( '_update_question', array ('question' => $question, 'test'=>$test ), true );
							$result = array ('success' => true, 'id' => $question->id, 'view' => $view );
							echo json_encode ( $result );
						}
					}
					else {
						$view = $this->renderPartial ( '_create_question', array ('question' => $question), true );
						$result = array ('success' => true, 'id' => $question->id, 'view' => $view );
						echo json_encode ( $result );
					}
				}
			}
		}
	}

	/**
	 * Update an existed question
	 */
	public function actionUpdateQuestion($id,$test_id=null) {
		$question=Question::model()->findByPk($id);
		$answer=$question->answer;
		$content=$question->content;
		$question->attributes=$_POST['UpdateQuestion'];
		if(isset($_POST['UpdateQuestion']['content'])){
			foreach ($_POST['UpdateQuestion']['content'] as $index=>$choice){
				$content[$index]=$choice;
				if(isset($_POST['UpdateQuestion']['answer']) && in_array($index,$_POST['UpdateQuestion']['answer']))
					$answer[$index]=1;
				else 	
					$answer[$index]=0;
			}
		}
		$review=false;
		foreach ($answer as $index=>$item){
			if($item) $review=true;
		}
		if($review){
			$question->answer=$answer;
			$question->content=$content;
			if ($question->save ()) {
				$question = Question::model ()->findByPk ( $question->id );
				if(isset($test_id) && $test_id>0){
					$test=TestLanguageSkill::model()->findByPk($test_id);
					$view = $this->renderPartial ( '_update_question', array ('question' => $question, 'test'=>$test ), true );
					$result = array ('success' => true, 'view' => $view );
					echo json_encode ( $result );
				}
				else {
					$view = $this->renderPartial ( '_create_question', array ('question' => $question), true );
					$result = array ('success' => true, 'view' => $view );
					echo json_encode ( $result );
				}
			}
		}
		else{
				$result = array ('success' => false, 'message' => 'Correct answer not empty' );
				echo json_encode ( $result );
			}
	}
	
	/**
	 * Remove a question or a choice 
	 */
	public function actionRemoveQuestion($question_id,$index_choice=-1,$test_id=null) {
		$question=Question::model()->findByPk($question_id);
		if($index_choice == -1){
			$test=TestLanguageSkill::model()->findByPk($test_id);
			$content=array();
			foreach ($test->content as $index=>$item){
				if($item != $question_id)
					$content[]=$item;
			}
			$test->content=$content;
			if($test->save()){
				if($question->delete()){
					$view='';
					$result = array ('success' => true, 'view' => $view );
					echo json_encode ( $result );
				}
			}
		}
		else {
			$content=array();
			$answer=array();
			foreach ($question->content as $index=>$item){
				if($index != $index_choice)
				{
					$content[]=$item;
				}
			}
			foreach ($question->answer as $index=>$item){
				if($index != $index_choice)
				{
					$answer[]=$item;
				}
			}
			$review=false;
			foreach ($answer as $index=>$item){
				if($item) $review=true;
			}
			if($review){
				$question->answer=$answer;
				$question->content=$content;			
				if($question->save()){
					$question=Question::model()->findByPk($question_id);
					if(isset($test_id) && $test_id>0){
						$test=TestLanguageSkill::model()->findByPk($test_id);
						$view = $this->renderPartial ( '_update_question', array ('question' => $question, 'test'=>$test ), true );
						$result = array ('success' => true, 'view' => $view );
						echo json_encode ( $result );
					}
					else{
						$view = $this->renderPartial ( '_create_question', array ('question' => $question), true );
						$result = array ('success' => true, 'view' => $view );
						echo json_encode ( $result );
					}
				}
			}
			else{
				$result = array ('success' => false, 'message' => 'Correct answer not empty' );
				echo json_encode ( $result );
			}
		}
	}
}
