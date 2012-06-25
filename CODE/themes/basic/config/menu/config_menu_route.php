<?php
return array(
			'role'=>array(
				'manager_operation'=>Yii::app ()->user->checkAccess ('role_index')?'role/index':'',
				'manager_task'=>Yii::app ()->user->checkAccess ('role_index')?'role/index':'',
				'manager_role'=>Yii::app ()->user->checkAccess ('role_index')?'role/index':'',
			),			
			'user'=>array(
				'index'=>Yii::app ()->user->checkAccess ('user_index')?'user/index':'',
				'create'=>Yii::app ()->user->checkAccess ('user_create')?'user/create':'',
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
			'languageSkill'=>array(
				'index'=>'languageSkill/index',
				'create'=>'languageSkill/create'
			),
			'knowledgeSkill'=>array(
				'index'=>'knowledgeSkill/index',
				'create'=>'knowledgeSkill/create'
			),
			'markingUpSkill'=>array(
				'index'=>'markingUpSkill/index',
				'create'=>'markingUpSkill/create'
			),
			'codingSkill'=>array(
				'index'=>'codingSkill/index',
				'create'=>'codingSkill/create'
			),
			'exam'=>array(
				'index'=>'exam/index',
				'create'=>'exam/create',
				'list'=>'exam/list'
			),
			'result'=>array(
				'index'=>'result/index',
			),
			'system'=>array(
				'language'=>'category/index',
				'office'=>'category/index',				
			),
			'course'=>array(
				'index'=>'course/index',
				'create'=>'course/create'
			)
		);