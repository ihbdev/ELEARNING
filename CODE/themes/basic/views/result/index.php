	<!--begin inside content-->
	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1><?php echo Language::t('List results')?></h1>
			<div class="header-menu">
				<ul>
					<li class="ex-show"><a class="activities-icon" href=""><span><?php echo Language::t('List results')?></span></a></li>
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
                         	<?php echo $form->labelEx($model,'title'); ?>
                         	<?php $this->widget('CAutoComplete', array(
                         	'model'=>$model,
                         	'attribute'=>'title',
							'url'=>array('exam/suggestTitle'),
							'htmlOptions'=>array(
								'style'=>'width:230px;',
								),
						)); ?>								
                        </li>			
                    <?php 
					$list=array(''=>'All')+Exam::$list_type;
					?>
					<li>
						<?php echo $form->labelEx($model,'type'); ?>
						<?php echo $form->dropDownList($model,'type',$list,array('style'=>'width:200px')); ?>
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
					<li>
						<?php echo $form->labelEx($model,'office_id'); ?>
						<?php echo $form->dropDownList($model,'office_id',$list,array('style'=>'width:200px')); ?>
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
						'name'=>'title',
						'headerHtmlOptions'=>array('width'=>'10%','class'=>'table-title'),		
					),		
    				array(
						'name'=>'office_id',
    					'value'=>'$data->office->name',
						'headerHtmlOptions'=>array('width'=>'8%','class'=>'table-title'),		
					),
					array(
						'name'=>'type',
    					'value'=>'Exam::$list_type[$data->type]',
						'headerHtmlOptions'=>array('width'=>'8%','class'=>'table-title'),			
					),
					array(
						'name'=>'results',
						'value'=>'$data->countResults',
						'headerHtmlOptions'=>array('width'=>'10%','class'=>'table-title'),		
					), 																   	   
					array(
						'header'=>Language::t('View results'),
						'class'=>'CButtonColumn',
    					'template'=>'{view}',
    					'buttons'=>array
    					(
        					'view'=>array(
    							'url'=>'Yii::app()->createUrl("result/list",array("exam_id"=>$data->id))',
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
