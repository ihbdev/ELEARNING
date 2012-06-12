<?php
return array(
			'role'=>array(
				'manager_operation'=>Yii::app ()->user->checkAccess ('role_index')?'role/index':'',
				'manager_task'=>Yii::app ()->user->checkAccess ('role_index')?'role/index':'',
				'manager_role'=>Yii::app ()->user->checkAccess ('role_index')?'role/index':'',
			),			
			'news'=>array(
				'index'=>Yii::app ()->user->checkAccess ('news_index')?'news/index':'',
				'create'=>Yii::app ()->user->checkAccess ('news_create')?'news/create':'',
				'manager_category'=>Yii::app ()->user->checkAccess ('category_index')?'category':'',
				'view_categories'=>'/news/list',
				'view_all'=>'/news/index',
			),
			'user'=>array(
				'index'=>Yii::app ()->user->checkAccess ('user_index')?'user/index':'',
				'create'=>Yii::app ()->user->checkAccess ('user_create')?'user/create':'',
			),
			'keyword'=>array(
				'index'=>Yii::app ()->user->checkAccess ('keyword_index')?'keyword/index':'',
				'create'=>Yii::app ()->user->checkAccess ('keyword_create')?'keyword/create':'',
				'manager_category'=>Yii::app ()->user->checkAccess ('category_index')?'category':'',
			),
			'setting'=>array(
				'index'=>Yii::app ()->user->checkAccess ('setting_index')?'setting/index':'',
			), 
			'language'=>array(
				'edit'=>Yii::app ()->user->checkAccess ('language_edit')?'language/edit':'',
				'create'=>Yii::app ()->user->checkAccess ('language_create')?'language/create':'',
				'delete'=>Yii::app ()->user->checkAccess ('language_delete')?'language/delete':'',
				'export'=>Yii::app ()->user->checkAccess ('language_export')?'language/export':'',
				'import'=>Yii::app ()->user->checkAccess ('language_import')?'language/import':'',
			),
			'image'=>array(
				'list'=>Yii::app ()->user->checkAccess ('image_list')?'image/list':'',
				'clear_image' => Yii::app ()->user->checkAccess ('image_clear')?'image/clear':'',
			),
			'menu' => array (
				'manager' => Yii::app ()->user->checkAccess ('menu_index')?'menu':'', 				
			),
		);