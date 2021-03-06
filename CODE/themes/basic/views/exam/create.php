<!--begin inside content-->
	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1>Administrator</h1>
			<div class="header-menu">
				<ul>
					<li class="ex-show"><a class="activities-icon" href=""><span>Add New Test</span></a></li>
				</ul>
			</div>
		</div>
		<!--end title-->
		<div class="folder-content">
		<div>
            	<input type="button" class="button" value="<?php echo Language::t('List exams')?>" style="width:180px;" onClick="parent.location='<?php echo Yii::app()->createUrl('exam/index')?>'"/>
                <div class="line top bottom"></div>	
        </div>
		<?php $form=$this->beginWidget('CActiveForm', array('method'=>'post','enableAjaxValidation'=>false, 'id'=>'add_exam')); ?>
            <input value="" name="Exam[test_id]" id="Exam_test_id" type="hidden">
            <input value="" id="Exam_users" name="Exam[users]" type="hidden">
            <div class="testpost-outer">
           		 <div class="testpost-box">
					<h2>Title</h2>
                    <div class="row">
                        <label style="width:66px;">Title:</label>
						<?php echo $form->textField($model,'title',array('style'=>'width:400px')); ?>
						<?php echo $form->error($model, 'title'); ?>
                    </div>
                </div><!--testpost-box-->
            	<div class="testpost-box">
					<h2>Choose Office</h2>
                    <div class="row">
                        <label style="width:66px;">Office:</label>
                        <?php 
						$list=array();
						foreach ($list_office as $id=>$level){
							$cat=Category::model()->findByPk($id);
							$view = "";
							for($i=1;$i<$level;$i++){
								$view .="---";
							}
							$list[$id]=$view." ".$cat->name." ".$view;
						}
						?>
						<?php 
						echo $form->dropDownList(
							$model,
							'office_id',
							$list,
							array(
								'ajax' => array(
									'type'=>'POST', 
									'url'=>CController::createUrl('course/ListCourses'),
									'update'=>'#Exam_course_id',
								),
								'style'=>'width:200px'
							)
						); 
						?>
						<?php echo $form->error($model, 'office_id'); ?>
                    </div>
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Choose Course</h2>
                    <div class="row">
                        <label style="width:66px;">Course:</label>
                        <?php 
                        $list=array();
						foreach ($list_courses as $i=>$course){
							$list[$course->id]=$course->title;
						}
						?>
						<?php 
						echo $form->dropDownList(
							$model,
							'course_id',
							$list,
							array(
								'style'=>'width:200px'
							)
						); 
						?>
						<?php echo $form->error($model, 'course_id'); ?>
                    </div>
                </div><!--testpost-box-->               
					<h2>Time</h2>
                    <div class="row">
                        <label style="width:70px;">Start:</label>   
                        <?php 
    					$this->widget('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker',array(
        					//'model'=>$model, //Model object
        					//'attribute'=>'start_time', //attribute name   						
                			'mode'=>'datetime', //use "time","date" or "datetime" (default)
        					'name'=>'Exam[start_time]',
    						'value'=>date('m/d/Y H:i',$model->start_time),
        					'language'=>'',
                			'options'=>array(	
    						),// jquery plugin options
        					'htmlOptions'=>array(
        						'readonly'=>true,
    							//'value' => $model->start_time,
    						), // HTML options
    					));
						?>                    
                    </div>
                    <div class="row">
                        <label style="width:70px;">Finish:</label>     
                        <?php 
    					$this->widget('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker',array(
        					//'model'=>$model, //Model object
        					//'attribute'=>'finish_time', //attribute name   						
                			'mode'=>'datetime', //use "time","date" or "datetime" (default)
        					'name'=>'Exam[finish_time]',
    						'value'=>date('m/d/Y H:i',$model->finish_time),
        					'language'=>'',
                			'options'=>array(
    						),// jquery plugin options
        					'htmlOptions'=>array(
        						'readonly'=>true,
    							//'value' => date('m/d/Y',$model->finish_time),
    						), // HTML options
    					));
						?>  
						<?php echo $form->error($model, 'start_time'); ?>                       
                    </div>
                </div><!--testpost-box-->
                <?php $this->endWidget(); ?>
                
                <div class="testpost-box">
				<?php 
				Yii::app()->clientScript->registerScript('submit-search-test', "
				$('#test-search').submit(function(){
				$.fn.yiiGridView.update('test-list', {
					data: $(this).serialize()});
					return false;
				});");
				Yii::app()->clientScript->registerScript('dropdown-search-test', "
				$('#ITest_type').change(function(){
				$.fn.yiiGridView.update('test-list', {
					data: $(this).serialize()});
					return false;
				});");
				?>
                <?php $form=$this->beginWidget('CActiveForm', array('method'=>'get','id'=>'test-search')); ?>
					<h2>Add test</h2>
					<div class="row">
						<label style="width:70px;">ID Test:</label>
						<input value="<?php echo $model->test_id?>" id="test_id" readonly="readonly">
                    </div>
                    <?php echo $form->error($model, 'test_id'); ?>   
                    <div class="row"><h4>Search:</h4></div>
                    <div class="row">
                        <label style="width:70px;">Type:</label>
                        <?php 
						$list=ITest::$list_type;
						echo $form->dropDownList($test,'type',$list,array('style'=>'width:200px')); ?>
                    </div>
                    <div class="row">
                        <label style="width:70px;">Title:</label>
                        <?php $this->widget('CAutoComplete', array(
                         	'model'=>$test,
                         	'attribute'=>'title',
							'url'=>array('exam/suggestTitleTest'),
							'htmlOptions'=>array(
								'style'=>'width:250px;',
								),
						)); ?>		
                    </div>
                    <div class="row">
                    	<input type="submit" class="button" value="Results" style="margin-left:74px; width:95px;" />
                    </div>
                    <?php $this->endWidget(); ?>
                    <div class="row">
                        <h4>List results searching:</h4>                        
                    <?php
					$this->widget('iPhoenixGridView', array(
  					'id'=>'test-list',
  					'dataProvider'=>$list_test,
  					'columns'=>array(	
    					array(
							'name'=>'title',
							'headerHtmlOptions'=>array('width'=>'15%','class'=>'table-title'),		
						),
						array(
							'name'=>'type',
							'value'=>'ITest::$list_type[$data->type]',
							'headerHtmlOptions'=>array('width'=>'15%','class'=>'table-title'),		
						),
						array(
							'name'=>'Group',
							'value'=>'$data->subGroup',
							'headerHtmlOptions'=>array('width'=>'10%','class'=>'table-title'),		
						),
						array(
							'name'=>'created_date',
							'value'=>'date("H:i d/m/Y",$data->created_date)',
							'headerHtmlOptions'=>array('width'=>'10%','class'=>'table-title'),		
						), 	
						array(
						'header'=>'Select',
						'class'=>'iPhoenixButtonColumn',
    					'template'=>'{select}',
    					'buttons'=>array
    					(
        					'select' => array
    						(
            					'label'=>Language::t('Select'),
            					'url'=>'Yii::app()->createUrl("exam/selectTest", array("test_id"=>$data->id))',
    							'click'=>'function(){
									var th=this;									
									jQuery.ajax({
										type:"POST",
										dataType:"json",
										url:$(this).attr("href"),
										success:function(data) {
											if(data.success){
												$("#test_id").val(data.id);
												$("#Exam_test_id").val(data.id);										
												$.fn.yiiGridView.update("test-list");
												}
										},
										error: function (request, status, error) {
        										jAlert(request.responseText);
    									}
										});
								return false;}',
        					),
        				),
						'headerHtmlOptions'=>array('width'=>'5%','class'=>'table-title'),
					), 						
 	 				),
 	 				'template'=>'{displaybox}{summary}{items}{pager}',
  					'summaryText'=>'{count} tests',
 	 				'pager'=>array('class'=>'CLinkPager','header'=>'','prevPageLabel'=>'< Trước','nextPageLabel'=>'Sau >','htmlOptions'=>array('class'=>'pages fr')),
 	 				'actions'=>array(
					),
					)); 
					?>
				</div>
                </div><!--testpost-box-->              
                <div class="testpost-box">
                <?php 
				Yii::app()->clientScript->registerScript('search-user', "
				$('#user-search').submit(function(){
				$.fn.yiiGridView.update('user-list', {
					data: $(this).serialize()});
					return false;
				});");
				Yii::app()->clientScript->registerScript('dropdown-search-user', "
				$('#User_office_id').change(function(){
				$.fn.yiiGridView.update('user-list', {
					data: $(this).serialize()});
					return false;
				});");
				?>
                <?php $form=$this->beginWidget('CActiveForm', array('method'=>'get','id'=>'user-search')); ?>
					<h2>Add employees</h2>
                    <div class="row"><h4>Search:</h4></div>
                    <div class="row">
                        <label style="width:70px;">Office:</label>
                        <?php 
						$list=array(''=>'All');
						foreach ($list_office as $id=>$level){
							$cat=Category::model()->findByPk($id);
							$view = "";
							for($i=1;$i<$level;$i++){
								$view .="---";
							}
							$list[$id]=$view." ".$cat->name." ".$view;
						}
						?>
						<?php echo $form->dropDownList($user,'office_id',$list,array('style'=>'width:200px')); ?>
                    </div>
                    <div class="row">
                        <label style="width:70px;">User Email:</label>
                        <?php $this->widget('CAutoComplete', array(
                         	'model'=>$user,
                         	'attribute'=>'email',
							'url'=>array('exam/suggestEmail'),
							'htmlOptions'=>array(
								'style'=>'width:250px;',
								),
						)); ?>		
                    </div>
                    <div class="row">
                    	<input type="submit" class="button" value="Search" style="margin-left:74px; width:95px;" />
                    </div>
                    <?php $this->endWidget(); ?>
                    <div class="row">
                        <h4>List results searching:</h4>                        
                    <?php 
					$this->widget('iPhoenixGridView', array(
  					'id'=>'user-list',
  					'dataProvider'=>$list_user,
  					'columns'=>array(	
    					array(
							'name'=>'username',
							'headerHtmlOptions'=>array('width'=>'10%','class'=>'table-title'),		
						), 
						array(
							'name'=>'email',
							'headerHtmlOptions'=>array('width'=>'15%','class'=>'table-title'),		
						), 
						array(
							'name'=>'fullname',
							'headerHtmlOptions'=>array('width'=>'15%','class'=>'table-title'),		
						),	
						array(
							'name'=>'office_id',
    						'value'=>'$data->office->name',
							'headerHtmlOptions'=>array('width'=>'8%','class'=>'table-title'),		
						),
						array(
							'name'=>'role',
							'value'=>'implode(", ",$data->label_role)',
							'headerHtmlOptions'=>array('width'=>'15%','class'=>'table-title'),		
						),	
						array(
						'header'=>'Add',
						'class'=>'iPhoenixButtonColumn',
    					'template'=>'{add}',
    					'buttons'=>array
    					(
        					'add' => array
    						(
            					'label'=>Language::t('Add'),
            					'url'=>'Yii::app()->createUrl("exam/addUser", array("user_id"=>$data->id))',
    							'click'=>'function(){
									var th=this;									
									jQuery.ajax({
										type:"POST",
										dataType:"json",
										url:$(this).attr("href"),
										success:function(data) {
											if(data.success){
											   	$("#Exam_users").val(data.value);               									
												$.fn.yiiGridView.update("user-list");
												$.fn.yiiGridView.update("choicing-user-list");
												}
										},
										error: function (request, status, error) {
        										jAlert(request.responseText);
    									}
										});
								return false;}',
        					),
        				),
						'headerHtmlOptions'=>array('width'=>'5%','class'=>'table-title'),
					), 						
 	 				),
 	 				'template'=>'{displaybox}{summary}{items}{pager}',
  					'summaryText'=>'{count} users',
 	 				'pager'=>array('class'=>'CLinkPager','header'=>'','prevPageLabel'=>'< Trước','nextPageLabel'=>'Sau >','htmlOptions'=>array('class'=>'pages fr')),
 	 				'actions'=>array(
					),
					)); 
					?>
                    </div>                  
                    <div class="row">
                        <h4>List choising user:</h4>  
                        <?php echo $form->error($model, 'list_users'); ?>                       
                        <?php 
					$this->widget('iPhoenixGridView', array(
  					'id'=>'choicing-user-list',
  					'dataProvider'=>$list_choicing_user,
  					'columns'=>array(	
    					array(
							'name'=>'username',
							'headerHtmlOptions'=>array('width'=>'10%','class'=>'table-title'),		
						), 
						array(
							'name'=>'email',
							'headerHtmlOptions'=>array('width'=>'15%','class'=>'table-title'),		
						), 
						array(
							'name'=>'fullname',
							'headerHtmlOptions'=>array('width'=>'15%','class'=>'table-title'),		
						),		
						array(
							'name'=>'role',
							'value'=>'implode(", ",$data->label_role)',
							'headerHtmlOptions'=>array('width'=>'15%','class'=>'table-title'),		
						),	
												array(
						'header'=>'Remove',
						'class'=>'iPhoenixButtonColumn',
    					'template'=>'{remove}',
    					'buttons'=>array
    					(
        					'remove' => array
    						(
            					'label'=>Language::t('Remove'),
            					'url'=>'Yii::app()->createUrl("exam/removeUser", array("user_id"=>$data->id))',
    							'click'=>'function(){
									var th=this;									
									jQuery.ajax({
										type:"POST",
										dataType:"json",
										url:$(this).attr("href"),
										success:function(data) {
											if(data.success){
												$("#Exam_users").val(data.value);  
												$.fn.yiiGridView.update("choicing-user-list");
												$.fn.yiiGridView.update("user-list");												
												}
										},
										error: function (request, status, error) {
        										jAlert(request.responseText);
    									}
										});
								return false;}',
        					),
        				),
						'headerHtmlOptions'=>array('width'=>'5%','class'=>'table-title'),
					), 						
 	 				),
 	 				'template'=>'{displaybox}{summary}{items}{pager}',
  					'summaryText'=>'{count} users',
 	 				'pager'=>array('class'=>'CLinkPager','header'=>'','prevPageLabel'=>'< Trước','nextPageLabel'=>'Sau >','htmlOptions'=>array('class'=>'pages fr')),
 	 				'actions'=>array(
					),
					)); 
					?>
                    </div>                  
                </div><!--testpost-box-->
                <div class="clear"></div>
                <br />
                <div class="testpost-button"><label style="width:140px; vertical-align:middle;">Click here to finish:</label><input type="submit" class="big-button" value="Create" style="width:100px;" onClick='$("#add_exam").submit(); return false;'/></div>		
			</div>
			<!--end content testpost outer-->
			<div class="clear"></div>
			<!--end pages-->
		</div>
	</div>
	<!--end inside content-->