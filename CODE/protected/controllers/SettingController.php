<?php
/**
 * 
 * SettingController class file 
 * @author ihbvietnam <hotro@ihbvietnam.com>
 * @link http://iphoenix.vn
 * @copyright Copyright &copy; 2012 IHB Vietnam
 * @license http://iphoenix.vn/license
 *
 */

/**
 * SettingController includes actions relevant to system setting
 *** create
 *** update
 *** delete
 *** index
 *** suggest name
 *** load model
 *** perform action to list of selected models from checkbox   
 */
class SettingController extends Controller
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
					array('allow',  
				'actions'=>array('index'),
				'roles'=>array('setting_index'),
			),
			array('allow',  
				'actions'=>array('create'),
				'roles'=>array('setting_create'),
			),
			array('allow',  
				'actions'=>array('suggestName'),
				'roles'=>array('setting_suggestName'),
			),
			array('allow', 
				'actions'=>array('update'),
				'roles'=>array('setting_update'),
			),
			array('allow',  
				'actions'=>array('reverseStatus'),
				'roles'=>array('setting_reverseStatus'),
			),
			array('allow',  
				'actions'=>array('delete'),
				'roles'=>array('setting_delete'),
			),
				array('allow',  
				'actions'=>array('checkbox'),
				'roles'=>array('setting_checkbox'),
			),
			array('deny', 
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
		$model=new Setting('write');
		// Ajax validate
		$this->performAjaxValidation($model);	
		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);
		if(isset($_POST['Setting']))
		{
			$model->attributes=$_POST['Setting'];
			if($model->save())
				$this->redirect(array('update','id'=>$model->id));
		}
			
		$this->render('create',array(
			'model'=>$model			
		));
	}
	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);
		// Ajax validate
		$this->performAjaxValidation($model);	
		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);
		if(isset($_POST['Setting']))
		{
			$model->attributes=$_POST['Setting'];
			if($model->save())
				$this->redirect(array('update','id'=>$model->id));
		}
			
		$this->render('update',array(
			'model'=>$model			
		));
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
	 * Performs the action with multi-selected model from checked models in section
	 * @param string action to perform
	 * @return boolean, true if the action is procced successfully, otherwise return false
	 */	
	public function actionCheckbox($action)
	{
		$this->initCheckbox('checked-setting-list');
		$list_checked = Yii::app()->session["checked-setting-list"];
		switch ($action) {
			case 'delete' :
				if (Yii::app ()->user->checkAccess ( 'setting_delete')) {
					foreach ( $list_checked as $id ) {
						$item = Setting::model ()->findByPk ( $id );
						if (isset ( $item ))
							if (! $item->delete ()) {
								echo 'false';
								Yii::app ()->end ();
							}
					}
					Yii::app ()->session ["checked-setting-list"] = array ();
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
		$this->initCheckbox('checked-setting-list');
		$model=new Setting('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Setting']))
			$model->attributes=$_GET['Setting'];			
		$this->render('index',array(
			'model'=>$model
		));
	}
	/**
	 * Suggests title of setting.
	 */
	public function actionSuggestName()
	{
		if(isset($_GET['q']) && ($keyword=trim($_GET['q']))!=='')
		{
			$titles=Setting::model()->suggestName($keyword);
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
		if (! Yii::app ()->getRequest ()->getIsAjaxRequest ())
			Yii::app ()->session [$name_params] = array ();
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
		$model=Setting::model()->findByPk($id);
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
		if( !isset($_GET['ajax'] )  || $_GET['ajax'] != 'setting-list'){
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
		}
	}
}
