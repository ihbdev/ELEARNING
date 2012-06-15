<?php
/**
 * 
 * ExamController class file 
 * @author ihbvietnam <hotro@ihbvietnam.com>
 * @link http://iphoenix.vn
 * @copyright Copyright &copy; 2012 IHB Vietnam
 * @license http://iphoenix.vn/license
 *
 */

/**
 * ExamController includes actions relevant to Exam model:
 *** create Exam
 *** copy Exam
 *** update
 *** delete Exam
 *** index Exam
 *** reverse status Exam
 *** suggest title Exam
 *** update suggest
 *** load model  
 */
class ExamController extends Controller
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
	public function actionCreate()
	{
		$model=new Exam();
		if(isset($_POST['Exam']))
		{
			$exam->attributes=$_POST['ITest'];
			$exam->type=Exam::TYPE_MARKINGUP;			
			if($exam->save())
			{
				$this->redirect(array('update','id'=>$exam->id));
			}	
		}
		//Group categories that contains news
		$group=new Category();		
		$group->type=Category::TYPE_EXAM;
		$list_category=$group->list_nodes;
		
		//Get form search user
		$this->initCheckbox('checked-user-list');
		if(!isset(Yii::app()->session["list-choicing-user"]))
			Yii::app()->session["list-choicing-user"]=array();
		$user=new User('search');
		$user->unsetAttributes();  // clear any default values
		if(isset($_GET['User']))
			$user->attributes=$_GET['User'];
			
		//Search list user	
		$criteria=new CDbCriteria;
		$criteria->compare('email',$user->email,true);
		$criteria->addNotInCondition('id',Yii::app()->session["list-choicing-user"]);
		if(isset($_GET['pageSize']))
				Yii::app()->user->setState('pageSize',$_GET['pageSize']);
		$list_user=new CActiveDataProvider('User', array(
			'criteria'=>$criteria,
    		'pagination'=>array(
				'pageSize'=>Yii::app()->user->getState('pageSize',Setting::s('DEFAULT_PAGE_SIZE','System')),
    		),
    		'sort' => array ('defaultOrder' => 'id DESC')
		));
			
		//Search list choising user
		$criteria=new CDbCriteria;
		$criteria->addInCondition('id',Yii::app()->session["list-choicing-user"]);
		if(isset($_GET['pageSize']))
				Yii::app()->user->setState('pageSize',$_GET['pageSize']);		
		$list_choicing_user=new CActiveDataProvider('User', array(
			'criteria'=>$criteria,
    		'pagination'=>array(
				'pageSize'=>Yii::app()->user->getState('pageSize',Setting::s('DEFAULT_PAGE_SIZE','System')),
    		),
    		'sort' => array ('defaultOrder' => 'id DESC')
		));
				
		$this->render ( 'create',array(
			'model'=>$model,
			'list_category'=>$list_category,
			'user'=>$user,
			'list_user'=>$list_user,
			'list_choicing_user'=>$list_choicing_user
		) );
	}
	/**
	 * Add a user
	 */
	public function actionAddUser($user_id) {
		if(!isset(Yii::app()->session["list-choicing-user"]))
			Yii::app()->session["list-choicing-user"]=array();
		if(!in_array($user_id, Yii::app()->session["list-choicing-user"])){
			$list_choicing_user=Yii::app()->session["list-choicing-user"];
			$list_choicing_user[]=$user_id;
			Yii::app()->session["list-choicing-user"]=$list_choicing_user;
		}			
		echo json_encode(array('success'=>true));		
	}
	/**
	 * Remove a user
	 */
	public function actionRemoveUser($user_id) {
		$old_list_choicing_user=Yii::app()->session["list-choicing-user"];
		$new_list_choicing_user=array();
		foreach ($old_list_choicing_user as $index=>$choicing_user){
			if($choicing_user != $user_id)
				$new_list_choicing_user[]=$user_id;				
		}	
		Yii::app()->session["list-choicing-user"]=$new_list_choicing_user;	
		echo json_encode(array('success'=>true));		
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
			
		$criteria = new CDbCriteria ();
		$criteria->compare ( 'type', ITest::TYPE_MARKINGUP );
		if($model->title != '')
			$criteria->compare ( 'title', $model->title, true );
		if($model->group_level === '0')
			$criteria->compare ( 'level',0);
		if($model->group_level === '1')
			$criteria->addCondition( 'level <> 0');	
			
		$list_tests= new CActiveDataProvider ( 'ITest', array (
			'criteria' => $criteria, 
			'pagination' => array ('pageSize' => Yii::app ()->user->getState ( 'pageSize', Setting::s('DEFAULT_PAGE_SIZE','System')  ) ), 
			'sort' => array ('defaultOrder' => 'id DESC' )    		
		));
				
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

	/**
	 * Performs the AJAX validation.
	 * @param CModel the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		
	}
}

