<?php
/**
 * 
 * CategoryController class file 
 * @author ihbvietnam <hotro@ihbvietnam.com>
 * @link http://iphoenix.vn
 * @copyright Copyright &copy; 2012 IHB Vietnam
 * @license http://iphoenix.vn/license
 *
 */

/**
 * CategoryController includes actions relevant to Document:
 *** create new Document
 *** update information of a Document
 *** delete Document
 *** validate Document
 *** index Document
 *** write 
 *** update list order view
 *** load model Banner from banner's id
 *** perform action to list of selected banner from checkbox  
 */
class DocumentController extends Controller
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
				'roles'=>array('category_index'),
			),
			array('allow',  
				'actions'=>array('create'),
				'roles'=>array('category_create'),
			),
			array('allow',  
				'actions'=>array('write'),
				'roles'=>array('category_write'),
			),
			array('allow',  
				'actions'=>array('validate'),
				'roles'=>array('category_validateCategory'),
			),
			array('allow', 
				'actions'=>array('update'),
				'roles'=>array('category_update'),
			),
			array('allow',  
				'actions'=>array('updateListOrderView'),
				'roles'=>array('category_updateListOrderView'),
			),
			array('allow',  
				'actions'=>array('delete'),
				'roles'=>array('category_delete'),
			),
			array('allow',  
				'actions'=>array('configUrl'),
				'roles'=>array('category_configUrl'),
			),
			array('allow',  
				'actions'=>array('setActiveAdminMenu'),
				'roles'=>array('category_setActiveAdminMenu'),
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
	 * @param $type type of Document, like below constant
	 */
	public function actionCreate($type)
	{
			$action="create";
			$model=new Document();			
			//Define type of Document
			$model->type=$type;	
			if(isset($model->config_type[$type]['form']))
				$form=$model->config_type[$type]['form'];
			else 
				$form='_form';
			
			Yii::app()->clientScript->scriptMap['jquery.js'] = false;
			/*
			$html_tree=$this->renderPartial('_tree',array(
					'list_nodes'=>$model->list_nodes,
			),true);
			
			$html_form = $this->renderPartial($form,array(
					'model'=>$model,'type'=>$type,'action'=>$action
				),true,true); 
			echo $html_form.$html_tree;
			*/
			if(isset($_POST['Document']))
			{
				$model->attributes = $_POST['Document'];
				$model->save();
			}			
			$this->render('index',array(
				'model'=>$model,
				'type'=>$type,
				'action'=>$action
			));	
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
			$action="update";
			$model=$this->loadModel($id);

			//Define type of Document
			$type=$model->type;	
			//Update document content
			if(isset($_POST['Document']))
			{
				$model->attributes = $_POST['Document'];
				$model->save();
			}			
			$this->render('index',array(
				'model'=>$model,
				'type'=>$type,
				'action'=>'update'
			));						
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id,$current_id)
	{
			$result=array();
			$model=$this->loadModel($id);
			//Define type of Document
			$type=$model->type;
			if(isset($model->config_type[$type]['form']))		
				$form=$model->config_type[$type]['form'];
			else 
				$form='_form';
			switch ((int)$model->checkDelete($id))	{
				case Document::DELETE_OK:		
					if($model->delete()) {
						$result['status']=true;
						if($id!=$current_id && $current_id!=0){
							$model=$this->loadModel($current_id);
							//Define type of Document
							$action="update";
						}
						else {
							$model=new Document();
							//Define type of Document
							$model->type=$type;
							$action="create";
						}
						//Yii::app()->clientScript->scriptMap['jquery.js'] = false;
						$model->type=$type;
						/*
						$html_tree=$this->renderPartial('_tree',array(
							'list_nodes'=>$model->list_nodes,
							),true);
						$html_form = $this->renderPartial($form,array(
							'model'=>$model,'type'=>$type,'action'=>$action
							),true,true); 
						$result['content']=$html_form.$html_tree;
						*/
						$this->render('index',array(
							'model'=>$model,
							'type'=>$type,
							'action'=>$action,
						));
												
					}
					else {
						$result['status']='false';
						$action['content']='Hệ thống đang quá tải';
					}
					break;
				case Document::DELETE_HAS_CHILD:
					$result['status']= false;
					$result['content'] = "Bạn phải xóa hết các thư mục con.";
					break;
				case Document::DELETE_HAS_ITEMS:
					$result['status']= false;
					$result['content'] = "Thư mục không rỗng.";
					break;
				default:
					$result['status']='false';
					$action['content']='Hệ thống đang quá tải';
					break;
			}
			echo CJSON::encode($result);
	}

	/**
	 * Validate Document
	 * @param type $type of Document
	 * @return 
	 */
	public function actionValidate($type)
	{
		if(Yii::app()->getRequest()->getIsAjaxRequest())
		{
			if($_POST['id']>0){
				$model=Document::model()->findByPk($_POST['id']);
			}
			else {
				$model=new Document();
				$model->type=$type;
			}
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
	
	/**
	 * Display list of Document.
	 * @param integer $type, id of menu type
	 * @return
	 */
	/*
	public function actionIndex($type)
	{
		$model=new Document();
		
		$model->type=$type;	
		$this->render('index',array(
			'model'=>$model,
			'type'=>$type,
			'action'=>'create'
		));
	}
	*/
	/**
	 * Display list of Document.
	 * @param integer $type, id of menu type
	 * @return
	 */
	public function actionEdit($type)
	{
		$criteria = new CDbCriteria ();
		$criteria->compare ( 'type', $type );
		$criteria->compare ( 'parent_id', Document::TYPE_ORIGIN );
		$criteria->compare ( 'order_view', Document::FIRST_DOC );
		
		$model=Document::model()->find($criteria);		
		$model->type=$type;
		
		$this->render('index',array(
			'model'=>$model,
			'type'=>$type,
			'action'=>'create'
		));
	}	
	/**
	 * Creates and updates a new Document model.
	 * @param integer $type, id of menu type
	 * @return 
	 */
	public function actionWrite($type)
	{	
		if(isset($_POST['Document']))
		{
			$id=(int)$_POST['id'];
			if ( is_int($id) && $id>0){
				$action="update";
				$model=$this->loadModel($id);
			}
			else {
				$action="create";
				$model=new Document();
				$model->type=$type;
			}	
			if(isset($model->config_type[$type]['form']))		
				$form=$model->config_type[$type]['form'];
			else 
				$form='_form';
			$model->attributes=$_POST['Document'];
			$model->list_special=array();
			if(!isset($model->parent_id)){
					$model->parent_id=$type;
			}
			if($model->save()){
				if($action == 'update')
					$model->changeOrderView();
				if($action=="create"){
					$model=new Document();
					$model->type=$type;
				}
			}
			Yii::app()->clientScript->scriptMap['jquery.js'] = false;
			$html_tree=$this->renderPartial('_tree',array(
					'list_nodes'=>$model->list_nodes,
				),true)
				;
			$html_form = $this->renderPartial($form,array(
					'model'=>$model,'type'=>$type,'action'=>$action
				),true,true); 
			echo $html_form.$html_tree;
		}
	}
	
	/**
	 * Updates list order view.
	 * @param integer $parent_id id of parent Document
	 */
	public function actionUpdateListOrderView($parent_id)
	{	
		$list=Document::model()->findAll('parent_id='.$parent_id);
		$max_order=sizeof($list)+1;
		echo $max_order;
	}
		
	/**
	 * 
	 * action set menu active in the admin cp 
	 * @param integer $id, id of the menu
	 */
	public function actionSetActiveAdminMenu($id)
	{
		if(Yii::app()->session['active_admin_menu'] = $id)
			echo json_encode ( array('success'=>true) );
		else 
			echo json_encode ( array('success'=>false) );
	}
	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer the ID of the model to be loaded
	 */
	public function loadModel($id)
	{
		$model=Document::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}
	
	/**
	 * action View long training document
	 */
	public function actionView($type='',$id='')
	{
		$criteria = new CDbCriteria ();
		if($type!='')
		{			
			$criteria->compare ( 'type', $type );
			$criteria->compare ( 'parent_id', Document::TYPE_ORIGIN );
			$criteria->compare ( 'order_view', Document::FIRST_DOC );
		} else 
			$criteria->compare ( 'id', $id );
		$model = Document::model ()->find ( $criteria );
		$type=$model->type;
				
		$this->render('view',array(
			'model'=>$model,
			'type'=>$type,
			'action'=>'update'
		));			
	}
	
	/**
	 * action view list of document
	 */
	public function actionIndex()
	{					
		$this->render('index_document');			
	}
}
