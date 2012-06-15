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
		<?php $form=$this->beginWidget('CActiveForm', array('method'=>'post','enableAjaxValidation'=>true, 'id'=>'add_test')); ?>
            <div class="testpost-outer">
            	<div class="testpost-box">
					<h2>Choose Office</h2>
                    <div class="row">
                        <label style="width:66px;">Office:</label>
                        <?php 
						$list=array();
						foreach ($list_category as $id=>$level){
							$cat=Category::model()->findByPk($id);
							$view = "";
							for($i=1;$i<$level;$i++){
								$view .="---";
							}
							$list[$id]=$view." ".$cat->name." ".$view;
						}
						?>
						<?php echo $form->dropDownList($model,'catid',$list,array('style'=>'width:200px')); ?>
						<?php echo $form->error($model, 'catid'); ?>
                    </div>
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Type of test</h2>
                    <div class="level-outer">
                    	<input name="Exam[type]" type="radio" value="<?php echo Exam::TYPE_LANGUAGE?>" checked="checked" /><label>Langguage skills</label>
                        <input name="Exam[type]" type="radio" value="<?php echo Exam::TYPE_MARKINGUP?>" /><label>Marking-up</label>
                        <input name="Exam[type]" type="radio" value="<?php echo Exam::TYPE_KNOWLEDGE?>" /><label>Knowledge</label>
                        <input name="Exam[type]" type="radio" value="<?php echo Exam::TYPE_CODING?>" /><label>Coding</label>
                    </div>
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Time</h2>
                    <div class="row">
                        <label style="width:70px;">Start:</label>   
                        <?php 
    					$this->widget('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker',array(
        					'model'=>$model, //Model object
        					'attribute'=>'start_time', //attribute name
                			'mode'=>'datetime', //use "time","date" or "datetime" (default)
        					'options'=>array() // jquery plugin options
    					));
						?>                    
                    </div>
                    <div class="row">
                        <label style="width:70px;">Finish:</label>     
                        <?php 
    					$this->widget('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker',array(
        					'model'=>$model, //Model object
        					'attribute'=>'finish_time', //attribute name
                			'mode'=>'datetime', //use "time","date" or "datetime" (default)
        					'options'=>array() // jquery plugin options
    					));
						?>                       
                    </div>
                </div><!--testpost-box-->
                <?php $this->endWidget(); ?>
                <div class="testpost-box">
                <?php 
				Yii::app()->clientScript->registerScript('search', "
				$('#user-search').submit(function(){
				$.fn.yiiGridView.update('user-list', {
					data: $(this).serialize()});
					return false;
				});");
				?>
                <?php $form=$this->beginWidget('CActiveForm', array('method'=>'get','id'=>'user-search')); ?>
					<h2>Add New Employee</h2>
                    <div class="row"><h4>Search:</h4></div>
                    <div class="row">
                        <label style="width:70px;">Office:</label>
                        <?php 
						$list=array();
						foreach ($list_category as $id=>$level){
							$cat=Category::model()->findByPk($id);
							$view = "";
							for($i=1;$i<$level;$i++){
								$view .="---";
							}
							$list[$id]=$view." ".$cat->name." ".$view;
						}
						?>
						<?php echo $form->dropDownList($user,'office',$list,array('style'=>'width:200px')); ?>
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
                    	<input type="submit" class="button" value="Results" style="margin-left:74px; width:95px;" />
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
      						'class'=>'CCheckBoxColumn',
							'selectableRows'=>2,
							'headerHtmlOptions'=>array('width'=>'2%','class'=>'table-title'),
							'checked'=>'in_array($data->id,Yii::app()->session["checked-user-list"])'
    					),	
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
  					'summaryText'=>'Có tổng cộng {count} user',
 	 				'pager'=>array('class'=>'CLinkPager','header'=>'','prevPageLabel'=>'< Trước','nextPageLabel'=>'Sau >','htmlOptions'=>array('class'=>'pages fr')),
 	 				'actions'=>array(
					),
					)); 
					?>
                    </div>                  
                    <div class="row">
                        <h4>List choising user:</h4>                        
                        <?php 
					$this->widget('iPhoenixGridView', array(
  					'id'=>'choicing-user-list',
  					'dataProvider'=>$list_choicing_user,
  					'columns'=>array(
						array(
      						'class'=>'CCheckBoxColumn',
							'selectableRows'=>2,
							'headerHtmlOptions'=>array('width'=>'2%','class'=>'table-title'),
							'checked'=>'in_array($data->id,Yii::app()->session["checked-user-list"])'
    					),	
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
  					'summaryText'=>'Có tổng cộng {count} user',
 	 				'pager'=>array('class'=>'CLinkPager','header'=>'','prevPageLabel'=>'< Trước','nextPageLabel'=>'Sau >','htmlOptions'=>array('class'=>'pages fr')),
 	 				'actions'=>array(
					),
					)); 
					?>
                    </div>                  
                </div><!--testpost-box-->
                <div class="clear"></div>
                <br />
                <div class="testpost-button"><label style="width:140px; vertical-align:middle;">Click here to finish:</label><input type="submit" class="big-button" value="Finish" style="width:100px;" /></div>		
			</div>
			<!--end content testpost outer-->
			<div class="clear"></div>
			<!--end pages-->
		</div>
	</div>
	<!--end inside content-->