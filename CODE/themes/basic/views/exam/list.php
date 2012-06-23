	<!--begin inside content-->
	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1><?php echo Language::t('List exams')?></h1>
			<div class="header-menu">
				<ul>
					<li class="ex-show"><a class="activities-icon" href=""><span><?php echo Language::t('List exams')?></span></a></li>
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
                   </ul>
                </div>
                <!--end left content-->
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
						'name'=>'start_time',
						'value'=>'date("m/d/Y H:i",$data->start_time)',
						'headerHtmlOptions'=>array('width'=>'10%','class'=>'table-title'),		
					), 
					array(
						'name'=>'finish_time',
						'value'=>'date("m/d/Y H:i",$data->finish_time)',
						'headerHtmlOptions'=>array('width'=>'10%','class'=>'table-title'),		
					), 					 														   	   
					array(
						'header'=>Language::t('To Do'),
						'class'=>'CButtonColumn',
    					'template'=>'{view}',
    					'buttons'=>array
    					(
        					'view'=>array(
    							'url'=>'$data->getCheckToDoUrl()',
    							'click'=>'function(){
									var th=this;									
									jQuery.ajax({
										type:"POST",
										dataType:"json",
										url:$(this).attr("href"),
										success:function(data) {
											if(data.success==true){
												window.location.href=data.url;
											}
											else{
												jAlert(data.message);
											}
										},
										});
									return false;
								}',
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
