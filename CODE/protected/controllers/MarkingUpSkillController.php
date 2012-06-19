<?php
/**
 * 
 * MarkingUpSkillController class file 
 * @author ihbvietnam <hotro@ihbvietnam.com>
 * @link http://iphoenix.vn
 * @copyright Copyright &copy; 2012 IHB Vietnam
 * @license http://iphoenix.vn/license
 *
 */

/**
 * MarkingUpSkillController includes actions relevant to MarkingUpSkill model:
 *** create MarkingUpSkill
 *** copy MarkingUpSkill
 *** update
 *** delete MarkingUpSkill
 *** index MarkingUpSkill
 *** reverse status MarkingUpSkill
 *** suggest title MarkingUpSkill
 *** update suggest
 *** load model  
 */
class MarkingUpSkillController extends Controller
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
			array('allow', 
				'users'=>array('*'),
			),
		);
	}
	
	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate($group_level)
	{
		$test=new ITest();
		$test->content=array();
		if(isset($_POST['ITest']))
		{
			$test->attributes=$_POST['ITest'];
			$test->type=ITest::TYPE_MARKINGUP;			
			$list_questions = array_diff ( explode ( ',', $_POST['ITest']['questions'] ), array ('') );
			$test->content=$list_questions;
			if($test->save())
			{
				$this->redirect(array('update','id'=>$test->id));
			}	
		}
		$this->render ( 'create',array('test'=>$test,'group_level'=>$group_level));
	}

	/**
	 * Add a new question
	 */
	public function actionAddQuestion() {
		if (isset ( $_POST ['Question'] )) {
			$question = new Question ();
			$question->attributes=$_POST['Question'];		
			if (! isset ( $_POST['Question']['answer'] )) {
				$result = array ('success' => false, 'message' => 'Select answer' );
				echo json_encode ( $result );
			} else {
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
				$question->type = Question::TYPE_MARKINGUP;
				$question->material_id = 0;
				
				if ($question->save ()) {
					$question = Question::model ()->findByPk ( $question->id );
					$view = $this->renderPartial ( '_question', array ('question' => $question ), true );
					$result = array ('success' => true, 'id' => $question->id, 'view' => $view );
					echo json_encode ( $result );
				}
			}
		}
	}
/**
	 * Add a new question
	 */
	public function actionUpdateQuestion($id,$type) {
		$question=Question::model()->findByPk($id);
		switch ($type){
			case Question::TYPE_UPDATE_TITLE :
				$question->title=$_POST['title'];
				break;
			case Question::TYPE_UPDATE_CHOICE :
				$question->content[$_POST['choice_index']]=$_POST['choice_content'];
				break;
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
		$test=ITest::model()->findByPk($id);
		if(isset($_POST['ITest']))
		{
			$test->attributes=$_POST['ITest'];
			$test->type=ITest::TYPE_MARKINGUP;			
			$list_questions = array_diff ( explode ( ',', $_POST['ITest']['questions'] ), array ('') );
			$test->content=$list_questions;
			if($test->save())
			{
				$test=ITest::model()->findByPk($id);
				Yii::app()->user->setFlash('success', Language::t('Update successfully'));
			}	
		}
		$this->render ( 'update',array('test'=>$test,'group_level'=>$group_level));
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
				//if (Yii::app ()->user->checkAccess ( 'test_delete')) {
				if(true){
					foreach ( $list_checked as $id ) {
						$item = ITest::model ()->findByPk ( (int)$id );
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
		$model=new ITest('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['ITest']))
			$model->attributes=$_GET['ITest'];
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
		$src=ITest::reverseStatus($id);
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
			$titles=ITest::model()->suggestTitle($keyword);
			if($titles!==array())
				echo implode("\n",$titles);
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
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer the ID of the model to be loaded
	 */
	public function loadModel($id)
	{
		$model=ITest::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}
}

