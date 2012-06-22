	<!--begin inside content-->
	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1><?php echo Language::t('List results')?></h1>
			<div class="header-menu">
				<ul>
					<li class="ex-show"><a class="activities-icon" href=""><span><?php echo $exam->title?></span></a></li>
				</ul>
			</div>
		</div>
		<!--end title-->
		<div class="folder-content">
             <!--begin box search-->
         <?php 
			Yii::app()->clientScript->registerScript('search', "
				$('#exam-search').submit(function(){
				$.fn.yiiGridView.update('exam-list', {
					data: $(this).serialize()});
					return false;
				});");
		?>
            <div class="box-search">            
                <h2><?php echo Language::t("Search")?></h2>
                <?php $form=$this->beginWidget('CActiveForm', array('method'=>'get','id'=>'exam-search')); ?>
                <!--begin left content-->
                <div class="fl" style="width:480px;">
                    <ul>                 
					<li>
                         	<?php echo $form->labelEx($model,'username'); ?>
                         	<?php $this->widget('CAutoComplete', array(
                         	'model'=>$model,
                         	'attribute'=>'user_id',
							'url'=>array('user/suggestUsername'),
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
  				'id'=>'exam-list',
  				'dataProvider'=>$model->search(),		
  				'columns'=>array(
					array(
      					'class'=>'CCheckBoxColumn',
						'selectableRows'=>2,
						'headerHtmlOptions'=>array('width'=>'2%','class'=>'table-title'),
						'checked'=>'in_array($data->id,Yii::app()->session["checked-exam-list"])'
    				),	
    				array(
						'name'=>'username',
    					'value'=>'$data->user->username',
						'headerHtmlOptions'=>array('width'=>'10%','class'=>'table-title'),		
					),	
					array(
						'name'=>'email',
    					'value'=>'$data->user->email',
						'headerHtmlOptions'=>array('width'=>'10%','class'=>'table-title'),		
					),
    				array(
						'name'=>'exam_id',
    					'value'=>'$data->exam->title',
						'headerHtmlOptions'=>array('width'=>'10%','class'=>'table-title'),		
					),		
					array(
						'name'=>'type',
    					'value'=>'Exam::$list_type[$data->exam->type]',
						'headerHtmlOptions'=>array('width'=>'10%','class'=>'table-title'),			
					),																		   	   
					array(
						'header'=>Language::t('Tools'),
						'class'=>'CButtonColumn',
    					'template'=>'{delete}{view}',
						'deleteConfirmation'=>Language::t('Are you sure that you want to delete the exam?'),
						'afterDelete'=>'function(link,success,data){ if(success) jAlert("'.Language::t("Delete succcessfully").'"); }',
    					'buttons'=>array
    					(
        					'delete' => array(
    							'label'=>Language::t('Delete'),
    						),
        					'view'=>array(
    							'url'=>'$data->url',
    						)
        				),
						'headerHtmlOptions'=>array('width'=>'10%','class'=>'table-title'),
					),    				
 	 			),
 	 			'template'=>'{displaybox}{checkbox}{summary}{items}{pager}',
  				'summaryText'=>'{count} '.Language::t('exams'),
 	 			'pager'=>array('class'=>'CLinkPager','header'=>'','prevPageLabel'=>'< Trước','nextPageLabel'=>'Sau >','htmlOptions'=>array('class'=>'pages fr')),
				'actions'=>array(
					'delete'=>array(
						'action'=>'delete',
						'label'=>Language::t('Delete'),
						'imageUrl' => Yii::app()->theme->baseUrl.'/images/delete.png',
						'url'=>'exam/checkbox'
					),
				),
 	 			)); ?>
		</div>
	</div>
	<!--end inside content-->
