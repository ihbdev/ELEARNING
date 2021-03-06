	<!--begin inside content-->
	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1><?php echo Language::t('List test language skills');?></h1>
			<div class="header-menu">
				<ul>
					<li class="ex-show"><a class="activities-icon" href=""><span><?php echo Language::t('List test Knowledge Skills');?></span></a></li>
				</ul>
			</div>
		</div>
		<!--end title-->
		<div class="folder-content">
            <div>
                <input type="button" class="button" value="<?php echo Language::t('Add new Knowledge Skill Test');?>" style="width:180px;" onClick="parent.location='<?php echo Yii::app()->createUrl('knowledgeSkill/create')?>'"/>                
				<div class="line top bottom"></div>	
            </div>
			<!--begin box search-->
			<?php 
			Yii::app()->clientScript->registerScript('search', "
				$('#test-search').submit(function(){
				$.fn.yiiGridView.update('test-list', {
					data: $(this).serialize()});
					return false;
				});");
			?>
            <div class="box-search">
                <h2><?php echo Language::t('Search');?>:</h2>
                <?php $form=$this->beginWidget('CActiveForm', array('method'=>'get','id'=>'test-search')); ?>
                <!--begin left content-->
                <div class="fl" style="width:480px;">
                    <ul>                    
                        <li>
                        <?php echo $form->labelEx($model,'title'); ?>
                         	<?php $this->widget('CAutoComplete', array(
                         	'model'=>$model,
                         	'attribute'=>'title',
							'url'=>array('test/suggestTitle'),
							'htmlOptions'=>array(
								'style'=>'width:230px;',
								),
						)); ?>
						</li>
						<li>
                            <label>Chose Language:</label>
                            <?php echo $form->dropDownList($model,'catid',Category::getLanguageOption(),array('style'=>'width:258px')); ?>                   	                             
                        </li>
						<li>
                        <?php 
							echo CHtml::submitButton('Search',
    						array(
    							'class'=>'button',
    							'style'=>'margin-left:153px; width:95px;',
    							''
    						)); 						
    					?>                        
                        </li>
                    </ul>
                </div>
                <!--end left content-->
                
                <!--end right content-->
                <?php $this->endWidget(); ?>
                <div class="clear"></div>
                <div class="line top bottom"></div>
            </div>
            <!--end box search-->           
			<?php 
			$this->widget('iPhoenixGridView', array(
  				'id'=>'test-list',
  				'dataProvider'=>$model->search(),		
  				'columns'=>array(
					array(
      					'class'=>'CCheckBoxColumn',
						'selectableRows'=>2,
						'headerHtmlOptions'=>array('width'=>'2%','class'=>'table-title'),
						'checked'=>'in_array($data->id,Yii::app()->session["checked-test-list"])'
    				),			
    				array(
						'name'=>'title',
						'headerHtmlOptions'=>array('width'=>'20%','class'=>'table-title'),		
					),					
					array(
						'name'=>'author',
						'value'=>'$data->author->username',
						'headerHtmlOptions'=>array('width'=>'5%','class'=>'table-title'),		
					), 						
					array(
						'name'=>'created_date',
						'value'=>'date("H:i d/m/Y",$data->created_date)',
						'headerHtmlOptions'=>array('width'=>'10%','class'=>'table-title'),		
					), 		
					array(
						'header'=>'Status',
						'class'=>'iPhoenixButtonColumn',
    					'template'=>'{reverse}',
    					'buttons'=>array
    					(
        					'reverse' => array
    						(
            					'label'=>'Đổi trạng thái bài viết',
            					'imageUrl'=>'$data->imageStatus',
            					'url'=>'Yii::app()->createUrl("test/reverseStatus", array("id"=>$data->id))',
    							'click'=>'function(){
									var th=this;									
									jQuery.ajax({
										type:"POST",
										dataType:"json",
										url:$(this).attr("href"),
										success:function(data) {
											if(data.success){
												$(th).find("img").attr("src",data.src);
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
					array(
						'header'=>'Tool',
						'class'=>'CButtonColumn',
    					'template'=>'{update}{delete}{view}',
						'deleteConfirmation'=>'Do you want to delete this test?',
						'afterDelete'=>'function(link,success,data){ if(success) jAlert("Item deleted"); }',
    					'buttons'=>array
    					(
    						'update' => array(
    							'label'=>'Edit Test',
    						),
        					'delete' => array(
    							'label'=>'Delete Test',
    						),
    						'copy' => array
    						(
            					'label'=>'Copy Test',
            					'imageUrl'=>Yii::app()->theme->baseUrl.'/images/copy.gif',
            					'url'=>'Yii::app()->createUrl("test/copy", array("id"=>$data->id))',
        					),
        					'view'=>array(
    							'url'=>'$data->url',
    						)
        				),
						'headerHtmlOptions'=>array('width'=>'10%','class'=>'table-title'),
					),    				
 	 			),
 	 			'template'=>'{displaybox}{checkbox}{summary}{items}{pager}',
  				'summaryText'=>'Have {count} test',
 	 			'pager'=>array('class'=>'CLinkPager','header'=>'','prevPageLabel'=>'< Prev','nextPageLabel'=>'Next >','htmlOptions'=>array('class'=>'pages fr')),
				'actions'=>array(
					'delete'=>array(
						'action'=>'delete',
						'label'=>'Delete',
						'imageUrl' => Yii::app()->theme->baseUrl.'/images/delete.png',
						'url'=>'test/checkbox'
					),
				),
 	 			)); ?>
			<!--begin results-->
			<!--end results-->			            						
		</div>
	</div>
	<!--end inside content-->