<?php
/**
 * 
 * ResultController class file 
 * @author ihbvietnam <hotro@ihbvietnam.com>
 * @link http://iphoenix.vn
 * @copyright Copyright &copy; 2012 IHB Vietnam
 * @license http://iphoenix.vn/license
 *
 */

/**
 * ResultController includes actions relevant to Result model:
 *** create Result
 *** copy Result
 *** update
 *** delete Result
 *** index Result
 *** reverse status Result
 *** suggest title Result
 *** update suggest
 *** load model  
 */
class ResultController extends Controller
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
	 * Lists all models.
	 */
	public function actionIndex($exam_id)
	{
		$this->initCheckbox('checked-result-list');
		
		$model=new Result('search');
		$model->exam_id=$exam_id;
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Result']))
			$model->attributes=$_GET['Result'];
			
		//Group categories that contains news
		$group=new Category();		
		$group->type=Category::TYPE_OFFICE;
		$list_office=$group->list_nodes;
		
		$this->render('index',array(
			'model'=>$model,
			'list_office'=>$list_office
		));
	}
	
	public function actionView($id)
	{		
		$model=Result::model()->findByPk($id);
		$test=ITest::model()->findByPk($model->test_id);
		if(in_array(Yii::app()->user->id,$model->list_users)){
			if(time() > $model->start_time && time() < $model->finish_time)	{		
				switch($model->type){
					case Result::TYPE_LANGUAGE:
						$form='view_language';
						break;
					case Result::TYPE_KNOWLEDGE:
						$form='view_knowledge';
						break;
					case Result::TYPE_MARKINGUP:
						if($test->level > 0)
							$form='view_marking_up_level';
						else 
							$form='view_marking_up_final';
						break;
					case Result::TYPE_CODING:
						$form='view_coding';
						break;
				}

				if(isset($_POST['Result']))
				{
					$result=new Result();	
					$result->result_id=$id;
					$result->user_id=Yii::app()->user->id;
					$list_answer=array();
					foreach ($_POST['Result'] as $question_id=>$content){
						$question=Question::model()->findByPk($question_id);
						$tmp=array();
						foreach ($question->answer as $index=>$item){
							if(in_array($index,$content))
								$tmp[$index]=1;
							else 
								$tmp[$index]=0;
						}
						$list_answer[$question_id]=$tmp;
					}	
					$result->answer=$list_answer;
					if($result->save())
					{
						Yii::app()->user->setFlash('success', Language::t('Finish'));
					}	
				}
				
				$this->render ( $form, array(
					'model'=>$model,
					'test'=>$test
				) );
			}
		}
	}
	
	/**
	 * Suggests a list of existing email matching the specified keyword.
	 * @param string the keyword to be matched
	 * @param integer maximum number of tags to be returned
	 * @return array list of matching username names
	 */
	public function actionSuggestEmail()
	{
		if(isset($_GET['q']) && ($keyword=trim($_GET['q']))!=='')
		{
			$criteria=new CDbCriteria;
			$criteria->compare('email',$keyword,true);
			$criteria->addNotInCondition('id', Yii::app()->session["list-choicing-user"]);
			$criteria->limit=10;
			$criteria->order='email DESC';
			$users=User::model()->findAll($criteria);
			$emails=array();
			foreach($users as $user)
				$emails[]=$user->email;
			if($emails!==array())
				echo implode("\n",$emails);
		}	
		
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
						$item = Result::model ()->findByPk ( (int)$id );
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
		$model=Result::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}
}

