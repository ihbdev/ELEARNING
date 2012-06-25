	<!--begin inside content-->
	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1>quản trị các tham số cấu hình</h1>
			<div class="header-menu">
				<ul>
					<li><a class="header-menu-active new-icon" href=""><span>Thêm tham số cấu hình</span></a></li>					
				</ul>
			</div>
		</div>
		<!--end title-->	
		<div class="folder-content form">
			<div>
                <input type="button" class="button" value="Manager course" style="width:180px;" onClick="parent.location='<?php echo Yii::app()->createUrl('course/index')?>'"/>
                <div class="line top bottom"></div>	
            </div>
			<?php $form=$this->beginWidget('CActiveForm', array('method'=>'post','enableAjaxValidation'=>true)); ?>	
			<!--begin left content-->
			<div class="fl" style="width:480px;">
				<ul>             
                    <div class="row">
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
                    <li>
                        <?php echo $form->labelEx($model,'office_id'); ?>
                        <?php echo $form->dropDownList($model,'office_id',$list,array('style'=>'width:150px')); ?>
                  		<?php echo $form->error($model, 'office_id'); ?>
                    </li>
                    </div>
				    <div class="row">
                    <li>
                        <?php echo $form->labelEx($model,'title'); ?>
                        <?php echo $form->textField($model,'title',array('style'=>'width:150px')); ?>
                  		<?php echo $form->error($model, 'title'); ?>
                    </li>
                    </div>
                    <li>
                   		<input type="reset" class="button" value="Cancel" style="margin-left:153px; width:125px;" />
                    	<input type="submit" class="button" value="Update" style="margin-left:20px; width:125px;" />					 
                    	</li>
				</ul>
			</div>
			<!--end left content-->	
			<!--begin right content-->
			<div class="fl menu-tree" style="width:470px;">
			<ul>
				 <div class="row">
						<li>
                       		<?php echo $form->labelEx($model,'description',array('style'=>'width:200px;')); ?>
                        	<?php echo $form->textArea($model,'description',array('style'=>'width:300px;max-width:300px;','rows'=>6)); ?>
                   			<?php echo $form->error($model, 'description'); ?>
                    	</li>
                    </div>
			</ul>
			</div>				
			<?php $this->endWidget(); ?>
			<div class="clear"></div>
		</div>
	</div>
	<!--end inside content-->