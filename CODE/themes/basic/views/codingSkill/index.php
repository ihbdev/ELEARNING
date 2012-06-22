	<!--begin inside content-->
	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1><?php echo Language::t('List test Marking-up')?></h1>
			<div class="header-menu">
				<ul>
					<li class="ex-show"><a class="activities-icon" href=""><span><?php echo Language::t('List test Marking-up')?></span></a></li>
				</ul>
			</div>
		</div>
		<!--end title-->
		<div class="folder-content">
            <div>
            	<input type="button" class="button" value="<?php echo Language::t('Add new test marking-up final')?>" style="width:180px;" onClick="parent.location='<?php echo Yii::app()->createUrl('markingUpSkill/create',array('group_level'=>0))?>'"/>
                <input type="button" class="button" value="<?php echo Language::t('Add new test marking-up level')?>" style="width:180px;" onClick="parent.location='<?php echo Yii::app()->createUrl('markingUpSkill/create',array('group_level'=>1))?>'"/>
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
                <h2>Tìm kiếm</h2>
                <?php $form=$this->beginWidget('CActiveForm', array('method'=>'get','id'=>'test-search')); ?>
                <!--begin left content-->
                <div class="fl" style="width:480px;">
                    <ul>
                        <li>
                         	<?php echo $form->labelEx($model,'title'); ?>
                         	<?php $this->widget('CAutoComplete', array(
                         	'model'=>$model,
                         	'attribute'=>'title',
							'url'=>array('markingUpSkill/suggestTitle'),
							'htmlOptions'=>array(
								'style'=>'width:230px;',
								),
						)); ?>	
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
                <!--begin right content-->
                <div class="fl" style="width:480px;">
                    <ul>
                    <?php 
					$list=array(''=>'All','0'=>'Final','1'=>'Level');
					?>
					<li>
						<?php echo $form->labelEx($model,'group_level'); ?>
						<?php echo $form->dropDownList($model,'group_level',$list,array('style'=>'width:200px')); ?>
					</li>				
                    </ul>
                </div>
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
						'headerHtmlOptions'=>array('width'=>'15%','class'=>'table-title'),		
					),
					array(
						'name'=>'group_level',
						'value'=>'$data->level==0?"Final":"Level"',
						'headerHtmlOptions'=>array('width'=>'10%','class'=>'table-title'),		
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
						'header'=>Language::t('Status'),
						'class'=>'iPhoenixButtonColumn',
    					'template'=>'{reverse}',
    					'buttons'=>array
    					(
        					'reverse' => array
    						(
            					'label'=>Language::t('Change status'),
            					'imageUrl'=>'$data->imageStatus',
            					'url'=>'Yii::app()->createUrl("markingUpSkill/reverseStatus", array("id"=>$data->id))',
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
						'header'=>Language::t('Tools'),
						'class'=>'CButtonColumn',
    					'template'=>'{update}{delete}{view}',
						'deleteConfirmation'=>Language::t('Are you sure that you want to delete the test?'),
						'afterDelete'=>'function(link,success,data){ if(success) jAlert("'.Language::t("Delete succcessfully").'"); }',
    					'buttons'=>array
    					(
    						'update' => array(
    							'label'=>Language::t('Edit'),
    						),
        					'delete' => array(
    							'label'=>Language::t('Delete'),
    						),
    						'copy' => array
    						(
            					'label'=>Language::t('Copy'),
            					'imageUrl'=>Yii::app()->theme->baseUrl.'/images/copy.gif',
            					'url'=>'Yii::app()->createUrl("markingUpSkill/copy", array("id"=>$data->id))',
        					),
        					'view'=>array(
    							'url'=>'$data->url',
    						)
        				),
						'headerHtmlOptions'=>array('width'=>'10%','class'=>'table-title'),
					),    				
 	 			),
 	 			'template'=>'{displaybox}{checkbox}{summary}{items}{pager}',
  				'summaryText'=>'{count} '.Language::t('tests'),
 	 			'pager'=>array('class'=>'CLinkPager','header'=>'','prevPageLabel'=>'< Trước','nextPageLabel'=>'Sau >','htmlOptions'=>array('class'=>'pages fr')),
				'actions'=>array(
					'delete'=>array(
						'action'=>'delete',
						'label'=>Language::t('Delete'),
						'imageUrl' => Yii::app()->theme->baseUrl.'/images/delete.png',
						'url'=>'markingUpSkill/checkbox'
					),
				),
 	 			)); ?>
		</div>
	</div>
	<!--end inside content-->