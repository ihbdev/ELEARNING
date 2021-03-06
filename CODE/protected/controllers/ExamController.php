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
	public function actionCheckToDo($id){
		$exam=Exam::model()->findByPk($id);
		if(!in_array(Yii::app()->user->id,$exam->list_users))
		{			
			if(Yii::app()->getRequest()->getIsAjaxRequest()){
				$result=array('success'=>false,'message'=>'Không trong danh sách làm bài test này');
				echo json_encode($result);
				Yii::app()->end();
			}
			return false;
		}
		if(time() < $exam->start_time && time() > $exam->finish_time)	
		{
			if(Yii::app()->getRequest()->getIsAjaxRequest()){
				$result=array('success'=>false,'message'=>'Hết thời gian làm bài');
				echo json_encode($result);
				Yii::app()->end();
			}
			return false;
		}
		$criteria = new CDbCriteria ();
		$criteria->compare ( 'exam_id',$exam->id);		
		$criteria->compare ( 'user_id',Yii::app()->user->id);
		$result=Result::model()->find($criteria);
		if(isset($result))
		{
			if(Yii::app()->getRequest()->getIsAjaxRequest()){
				$result=array('success'=>false,'message'=>'Đã nộp bài. Bạn không có quyền thay đổi.');
				echo json_encode($result);
				Yii::app()->end();
			}
			return false;	
		}	
		if(Yii::app()->getRequest()->getIsAjaxRequest()){
				$result=array('success'=>true,'url'=>$exam->getToDoUrl());
				echo json_encode($result);
				Yii::app()->end();
			}
		return true;
	}
	public function actionToDo($id) {
		$model = Exam::model ()->findByPk ( $id );
		if ($this->actionCheckToDo ( $model->id )) {
			$criteria = new CDbCriteria ();
			$criteria->compare ( 'exam_id', $model->id );
			$criteria->compare ( 'user_id', Yii::app ()->user->id );
			$tmp_result = TmpResult::model ()->find ( $criteria );
			switch ($model->type) {
				case Exam::TYPE_LANGUAGE :
					$test = TestLanguageSkill::model ()->findByPk ( $model->test_id );
					$form = 'todo_language';
					break;
				case Exam::TYPE_KNOWLEDGE :
					$test = TestKnowledgeSkill::model ()->findByPk ( $model->test_id );
					$form = 'todo_knowledge';
					break;
				case Exam::TYPE_MARKINGUP :
					$test = TestMarkingUpSkill::model ()->findByPk ( $model->test_id );
					if ($test->level > 0)
						$form = 'todo_marking_up';
					else
						$form = 'todo_marking_up';
					break;
				case Exam::TYPE_CODING :
					$test = TestCodingSkill::model ()->findByPk ( $model->test_id );
					$form = 'todo_coding';
					break;
			}

			if (isset ( $_POST ['Result'] )){
				$result = new Result ();
				$result->exam_id = $id;
				$result->user_id = Yii::app ()->user->id;
				$list_answer = array ();
				if($model->type == Exam::TYPE_KNOWLEDGE){
					$result->answer = $_POST['Result'];
				} else {	
					foreach ( $_POST ['Result'] as $question_id => $content ) {
						$question = Question::model ()->findByPk ( $question_id );
						$tmp = array ();
						foreach ( $question->answer as $index => $item ) {
							if (in_array ( $index, $content ))
								$tmp [$index] = 1;
							else
								$tmp [$index] = 0;
						}
						$list_answer [$question_id] = $tmp;
					}						
					$result->answer = $list_answer;
				}					
				if ($result->save())
					{
						if(isset($tmp_result))
							$tmp_result->delete();
						$this->redirect(array('result/view','id'=>$result->id));
					}
			}
			$this->render ( $form, array ('tmp_result'=>$tmp_result,'model' => $model, 'test' => $test ) );
		}
	}
	public function actionView($id) {
		$model = Exam::model ()->findByPk ( $id );
		
		switch ($model->type) {
			case Exam::TYPE_LANGUAGE :
					$test = TestLanguageSkill::model ()->findByPk ( $model->test_id );
					$form = 'view_language';
					break;
				case Exam::TYPE_KNOWLEDGE :
					$test = TestKnowledgeSkill::model ()->findByPk ( $model->test_id );
					$form = 'view_knowledge';
					break;
				case Exam::TYPE_MARKINGUP :
					$test = TestMarkingUpSkill::model ()->findByPk ( $model->test_id );
					if ($test->level > 0)
						$form = 'view_marking_up';
					else
						$form = 'view_marking_up';
					break;
				case Exam::TYPE_CODING :
					$test = TestCodingSkill::model ()->findByPk ( $model->test_id );
					$form = 'view_coding';
					break;
		}
		
		$this->render ( $form, array ('model' => $model, 'test' => $test ) );
	}
	
	public function actionStore($id) {
		$model = Exam::model ()->findByPk ( $id );	
		if (isset ( $_POST ['Result'] )) {
			$criteria = new CDbCriteria ();
			$criteria->compare ( 'exam_id',$model->id);		
			$criteria->compare ( 'user_id',Yii::app()->user->id);
			$result=TmpResult::model()->find($criteria);
			if(!isset($result))	
			{	
				$result = new TmpResult ();
				$result->exam_id = $id;
				$result->user_id = Yii::app ()->user->id;
			}
			$list_answer = array ();
			if($model->type == Exam::TYPE_KNOWLEDGE){
					$result->answer = $_POST['Result'];
			} else {
				foreach ( $_POST ['Result'] as $question_id => $content ) {
					$question = Question::model ()->findByPk ( $question_id );
					$tmp = array ();
					foreach ( $question->answer as $index => $item ) {
						if (in_array ( $index, $content ))
							$tmp [$index] = 1;
						else
							$tmp [$index] = 0;
					}
					$list_answer [$question_id]=$tmp;
				}
			}
			$result->answer=$list_answer;
			if($result->save())
			{
				Yii::app()->user->setFlash('success', Language::t('Finish'));
			}	
		}
	}
	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Exam();
		
		if(!isset(Yii::app()->session["test_id"]) || ! Yii::app ()->getRequest ()->getIsAjaxRequest ())
			Yii::app()->session["test_id"]=0;
		if(!isset(Yii::app()->session["list-choicing-user"]) || ! Yii::app ()->getRequest ()->getIsAjaxRequest ())		
			Yii::app()->session["list-choicing-user"]=array();
		
		if(isset($_POST['Exam']))
		{
			$model->attributes=$_POST['Exam'];
			$model->test_id = $_POST['Exam']['test_id'];
			$model->start_time=strtotime($model->start_time);
			$model->finish_time=strtotime($model->finish_time);
			$model->list_users=array_diff(explode(',',$_POST['Exam']['users']),array(''));
			
			$test=ITest::model()->findByPk($model->test_id);
			$model->type=$test->type;
			
			$course=Course::model()->findByPk($model->course_id);
			$model->office_id=$course->office_id;
			if($model->save())
			{
				$this->redirect(array('update','id'=>$model->id));
			}
		}
		//List office
		$group=new Category();		
		$group->type=Category::TYPE_OFFICE;
		$list_office=$group->list_nodes;	
			
		if(!isset($model->office_id) || $model->office_id <= 0)
			$model->office_id=array_shift(array_keys($list_office));

		//List course
		$criteria = new CDbCriteria ();
		$criteria->compare('status',Course::STATUS_ACTIVE);
		$criteria->compare('office_id',$model->office_id);
  		$list_courses=Course::model()->findAll($criteria);
		
		//Get form search test
		$this->initCheckbox('checked-test-list');
		$test=new ITest('search');
		$test->unsetAttributes();  // clear any default values
		$test->type=ITest::TYPE_LANGUAGE;
		if(isset($_GET['ITest']))
			$test->attributes=$_GET['ITest'];
			
		//Search list test		
		$criteria=new CDbCriteria;
		$criteria->compare('title',$test->title,true);
		$criteria->compare('type',$test->type,true);
		$criteria->addCondition('id <> '.Yii::app()->session["test_id"]);
		if(isset($_GET['pageSize']))
				Yii::app()->user->setState('pageSize',$_GET['pageSize']);
		$list_test=new CActiveDataProvider('ITest', array(
			'criteria'=>$criteria,
    		'pagination'=>array(
				'pageSize'=>Yii::app()->user->getState('pageSize',Setting::s('DEFAULT_PAGE_SIZE','System')),
    		),
    		'sort' => array ('defaultOrder' => 'id DESC')
		));
		
		//Get form search user
		$this->initCheckbox('checked-user-list');
		$user=new User('search');
		$user->unsetAttributes();  // clear any default values
		if(isset($_GET['User']))
			$user->attributes=$_GET['User'];
			
		//Search list user	
		$criteria=new CDbCriteria;
		$criteria->compare('office_id',$user->office_id);
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
			'list_office'=>$list_office,
			'list_courses'=>$list_courses,
			'user'=>$user,
			'list_user'=>$list_user,
			'test'=>$test,
			'list_test'=>$list_test,
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
		echo json_encode(array('success'=>true,'value'=>implode(',',Yii::app()->session["list-choicing-user"])));		
	}
	/**
	 * Remove a user
	 */
	public function actionRemoveUser($user_id) {
		$old_list_choicing_user=Yii::app()->session["list-choicing-user"];
		$new_list_choicing_user=array();
		foreach ($old_list_choicing_user as $index=>$choicing_user){
			if($choicing_user != $user_id)
				$new_list_choicing_user[]=$choicing_user;				
		}	
		Yii::app()->session["list-choicing-user"]=$new_list_choicing_user;	
		echo json_encode(array('success'=>true,'value'=>implode(',',Yii::app()->session["list-choicing-user"])));				
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
	 * Suggests a list of existing test matching the specified keyword.
	 * @param string the keyword to be matched
	 * @param integer maximum number of tags to be returned
	 * @return array list of matching tilte
	 */
	public function actionSuggestTitleTest()
	{
		if(isset($_GET['q']) && ($keyword=trim($_GET['q']))!=='')
		{
			$criteria=new CDbCriteria;
			$criteria->compare('title',$keyword,true);
			$criteria->limit=10;
			$criteria->order='title DESC';
			$tests=ITest::model()->findAll($criteria);
			$titles=array();
			foreach($tests as $test)
				$titles[]=$test->title;
			if($titles!==array())
				echo implode("\n",$titles);
		}	
		
	}
	/**
	 * Suggests a list of existing test matching the specified keyword.
	 * @param string the keyword to be matched
	 * @param integer maximum number of tags to be returned
	 * @return array list of matching tilte
	 */
	public function actionSuggestTitle()
	{
		if(isset($_GET['q']) && ($keyword=trim($_GET['q']))!=='')
		{
			$owners=Exam::model()->suggestTitle($keyword);
			if($owners!==array())
				echo implode("\n",$owners);
		}
	}
	/**
	 * Select test
	 */
	public function actionSelectTest($test_id) {
		Yii::app()->session["test_id"]=$test_id;		
		echo json_encode(array('success'=>true,'id'=>$test_id));		
	}
	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{		
		$model=Exam::model()->findByPk($id);
		
		if(!isset(Yii::app()->session["test_id"]) || ! Yii::app ()->getRequest ()->getIsAjaxRequest ())
			Yii::app()->session["test_id"]=$model->test_id;
		if(!isset(Yii::app()->session["list-choicing-user"]) || ! Yii::app ()->getRequest ()->getIsAjaxRequest ())		
			Yii::app()->session["list-choicing-user"]=$model->list_users;
		
		if(isset($_POST['Exam']))
		{
			$model->attributes=$_POST['Exam'];	
			
			$model->start_time=strtotime($model->start_time);
			$model->finish_time=strtotime($model->finish_time);
			$model->list_users=array_diff(explode(',',$_POST['Exam']['users']),array(''));
			
			$test=ITest::model()->findByPk($model->test_id);
			$model->type=$test->type;		
			if($model->save())
			{
				$model=Exam::model()->findByPk($id);
				Yii::app()->session["test_id"]=$model->test_id;
				Yii::app()->session["list-choicing-user"]=$model->list_users;
				Yii::app()->user->setFlash('success', Language::t('Update successfully'));
			}	
		}
		//List office
		$group=new Category();		
		$group->type=Category::TYPE_OFFICE;
		$list_office=$group->list_nodes;
		
		//List course
		$criteria = new CDbCriteria ();
		$criteria->compare('status',Course::STATUS_ACTIVE);
		$criteria->compare('office_id',$model->office_id);
  		$list_courses=Course::model()->findAll($criteria);
		
		//Get form search test
		$this->initCheckbox('checked-test-list');
		$test=new ITest('search');
		$test->unsetAttributes();  // clear any default values
		$test->type=$model->type;
		if(isset($_GET['ITest']))
			$test->attributes=$_GET['ITest'];
			
		//Search list test		
		$criteria=new CDbCriteria;
		$criteria->compare('title',$test->title,true);
		$criteria->compare('type',$test->type,true);
		$criteria->addCondition('id <> '.Yii::app()->session["test_id"]);
		if(isset($_GET['pageSize']))
				Yii::app()->user->setState('pageSize',$_GET['pageSize']);
		$list_test=new CActiveDataProvider('ITest', array(
			'criteria'=>$criteria,
    		'pagination'=>array(
				'pageSize'=>Yii::app()->user->getState('pageSize',Setting::s('DEFAULT_PAGE_SIZE','System')),
    		),
    		'sort' => array ('defaultOrder' => 'id DESC')
		));
		
		//Get form search user
		$this->initCheckbox('checked-user-list');
		$user=new User('search');
		$user->unsetAttributes();  // clear any default values
		if(isset($_GET['User']))
			$user->attributes=$_GET['User'];
			
		//Search list user	
		$criteria=new CDbCriteria;
		$criteria->compare('office_id',$user->office_id);
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
				
		$this->render ( 'update',array(
			'model'=>$model,
			'list_office'=>$list_office,
			'list_courses'=>$list_courses,
			'user'=>$user,
			'list_user'=>$list_user,
			'test'=>$test,
			'list_test'=>$list_test,
			'list_choicing_user'=>$list_choicing_user
		) );
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
						$item = Exam::model ()->findByPk ( (int)$id );
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
	public function actionList($type)
	{
		$this->initCheckbox('checked-exam-list');
		
		$model=new Exam('search');
		$model->unsetAttributes();  // clear any default values
		$model->type=$type;
		$user=User::model()->findByPk(Yii::app()->user->id);
		$model->office_id=$user->office_id;
		
		if(isset($_GET['Exam']))
			$model->attributes=$_GET['Exam'];
			
		$this->render('list',array(
			'model'=>$model,
		));
	}
	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$this->initCheckbox('checked-exam-list');
		
		$model=new Exam('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Exam']))
			$model->attributes=$_GET['Exam'];
			
		//Group categories that contains news
		$group=new Category();		
		$group->type=Category::TYPE_OFFICE;
		$list_office=$group->list_nodes;
		
		//List course
		$criteria = new CDbCriteria ();
		$criteria->compare('status',Course::STATUS_ACTIVE);
  		$list_courses=Course::model()->findAll($criteria);
  		
		$this->render('index',array(
			'model'=>$model,
			'list_office'=>$list_office,
			'list_courses'=>$list_courses
		));
	}
	/**
	 * Reverse status of language
	 * @param integer $id, the ID of language to be reversed
	 */
	public function actionReverseStatus($id)
	{
		$src=Exam::reverseStatus($id);
		if($src) 
			echo json_encode(array('success'=>true,'src'=>$src));
		else 
			echo json_encode(array('success'=>false));		
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
		$model=Exam::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}
}

