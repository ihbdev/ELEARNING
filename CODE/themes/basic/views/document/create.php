<?php 
$cs = Yii::app()->getClientScript();
$cs->registerCssFile(Yii::app()->theme->baseUrl.'/css/sprite.css');
?>
<!--begin inside content-->
	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1>Create Training Document</h1>
			<div class="header-menu">
				<ul>
					<li><a class="header-menu-active new-icon" href=""><span>Create Training Document</span></a></li>					
				</ul>
			</div>
		</div>
		<!--end title-->	
		<div class="folder-content form">
		
	

<?php $form=$this->beginWidget('CActiveForm', array('id'=>'category-form','enableAjaxValidation'=>true,'clientOptions'=>array('validationUrl'=>$this->createUrl('document/validate',array('type'=>$model->type))))); ?>	
<input type="hidden" name="id" id="current_id" value="<?php echo isset($model->id)?$model->id:'0';?>" /> 
			<div class="fl" style="width:580px;">
				<ul>
					<?php if($model->id > 0):?>
                    <div class="row">
						<li>
                       		<label>Mã danh mục</label>
                       		<?php echo $model->id;?>
                    	</li>
                    </div>
                    <?php endif;?>
					<div class="row">
						<li>
                       		<?php echo $form->labelEx($model,'name'); ?>
                        	<?php echo $form->textField($model,'name',array('style'=>'width:300px;','maxlength'=>'256')); ?>
                   			<?php echo $form->error($model, 'name'); ?>
                    	</li>
                    </div> 
                    <div class="row">
                    <li>
                        <?php echo $form->labelEx($model,'parent_id'); ?>
                        <?php
                        	$view_parent_nodes=array('0'=>'Training Document');                        	
                        	echo $form->dropDownList($model,'parent_id',$view_parent_nodes,array('style'=>'width:200px'));
                        ?>
                  		<?php echo $form->error($model, 'parent_id'); ?>
					</li>
                    </div>                                                                
                    <?php if(!$model->isNewRecord):?>
                    <div class="row">
                    <li>
                        <?php echo $form->labelEx($model,'order_view'); ?>
                        <?php 
                           	$list_order=array(); 
                           	$max_order=$model->list_order_view;  
                        	for($i=1;$i<=sizeof($max_order);$i++){
                        		$list_order[$i]=$i;
                        	}                
                        	echo $form->dropDownList($model,'order_view',$list_order,array('style'=>'width:50px')); 
                        ?>
                  		<?php echo $form->error($model, 'order_view'); ?>
					</li>  
					</div>
					<?php endif;?>  
                   <div class="row">
						<li>
                       		<?php echo $form->labelEx($model,'description'); ?>
                        	<?php echo $form->textArea($model,'description',array('style'=>'width:300px;max-width:300px;','rows'=>6)); ?>
                   			<?php echo $form->error($model, 'description'); ?>
                    	</li>
                    </div>
                   	<li>
                    	<?php 
                    	if($action=="update") 
                    	{ 
                    		$label_button="Update Document";     
                    	}
                    	else $label_button="Add Document";
                    	
						echo '<input type="submit" value="'.$label_button.'" style="margin-left:153px; width:125px;" id="write-category" class="button">';  
    					if($action=="update") 
                    	{   
    						echo '<input type="submit" value="Tạo danh mục mới" style="margin-left:10px; width:125px;" id="create-category" class="button">'; 
                    	}
    					?>  
                    </li>
				</ul>
			</div>
			<?php $this->endWidget(); ?>
</div>
</div>			
			
<?php 
$cs = Yii::app()->getClientScript(); 
// Script load form update 
$cs->registerScript(
  'js-update-list-order-view',
  "jQuery(
  	function($)
	{ 
		$('body').on(
  			'change',
  			'#Category_parent_id',	
  			function(){
  				jQuery.ajax({
  					'data':{parent_id : $(this).val()},
  					'success':function(data){  		
  						if($(\"#Category_order_view\")){				
							$(\"#Category_order_view\").html(\"\");
							for(var i=1;i<=data;i++){
								if(i==data){
									var option='<option value=\"'+i+'\" selected=\"selected\">'+i+'</option>';
								}
								else {
									var option='<option value=\"'+i+'\">'+i+'</option>';
								}
								$(\"#Category_order_view\").append(option);
							}
						}
					},
					'type':'GET',
					'url':'".$this->createUrl('document/updateListOrderView')."',
					'cache':false
				});
				return false;
			}
		);
	}
	);",
  CClientScript::POS_END
);
?>
