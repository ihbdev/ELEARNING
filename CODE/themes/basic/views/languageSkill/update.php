<?php
/*
 * create Language array to make dropdownList
 */
 	$list_cat=Category::model()->findAll('type ='.Category::TYPE_ITEST_LANG.'');
 	foreach ($list_cat as $cat) $list_lang[$cat->id] = $cat->name;
?>
	<!--begin inside content-->
	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1><?php echo Language::t('Create Language Skill Test');?></h1>
			<div class="header-menu">
				<ul>
					<li class="ex-show"><a class="activities-icon" href=""><span><?php echo Language::t('Language Skills');?></span></a></li>
				</ul>
			</div>
		</div>
		<!--end title-->
		<div class="folder-content">
		<?php $form=$this->beginWidget('CActiveForm', array('method'=>'post','enableAjaxValidation'=>true, 'id'=>'add_test')); ?>	
            <div class="testpost-outer">
            <?php
    			foreach(Yii::app()->user->getFlashes() as $key => $message){
        			echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
    			}
			?>
				<div class="testpost-box">
					<h2>Choose language</h2>
					<label style="width:66px;"><?php echo Language::t('Language');?>:</label>
					<?php echo $form->dropDownList($test,'catid',$list_lang,array('style'=>'width:200px'));?>
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2><?php echo Language::t('Language Skills Title');?></h2>
					<label style="width:66px;"><?php echo Language::t('Title');?>:</label>
					 <?php echo $form->textField($test,'title',array('style'=>'width:610px')); ?>
                   	 <?php echo $form->error($test, 'title'); ?>
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2><?php echo Language::t('List questions')?></h2>
					<?php foreach ($test->content as $question_id):?>
                    	<?php $question=Question::model()->findByPk($question_id);?>
                         <div class="text-question">
                            <div class="text-title"><?php echo $question->title?></div>
                            <div class="text-check">
                            	<?php 
                            	$list_answer=$question->answer;
                            	?>
                            	<?php foreach ($question->content as $index=>$option):?>
                            	<div class="<?php if($list_answer[$index]) echo 'active'?>"><label><?php echo ($index+1)?>) <?php echo $option?></label></div>
                            	<?php endforeach;?>
                            </div>
                        </div><!--text-question-->
                        <?php endforeach;?>
                    <div class="markingup-question">                               
                    	<div class="q-post">
                        	<div class="row"><h3><?php echo Language::t('Question')?></h3></div>
                        	<input id="list_questions" name="ITest[questions]" type="hidden" value="<?php echo implode(',', $test->content)?>"/>
                        	<?php echo $form->error($test, 'content'); ?>
                        	<div class="row"><label style="width:70px;"><?php echo Language::t('Title')?>:</label><textarea name="Question[title]" style="width:600px; height:80px;"></textarea></div>
                            <div class="row"><label style="width:70px;"><?php echo Language::t('File')?>:</label><input type="text" name ="Question[supplement]" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A:</label><input name="Question[answer][]" type="checkbox" value="0"/><input type="text" name ="Question[content][0]" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">B:</label><input name="Question[answer][]" type="checkbox" value="1"/><input type="text" name ="Question[content][1]" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">C:</label><input name="Question[answer][]" type="checkbox" value="2"/><input type="text" name ="Question[content][2]" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">D:</label><input name="Question[answer][]" type="checkbox" value="3"/><input type="text" name ="Question[content][3]" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">E:</label><input name="Question[answer][]" type="checkbox" value="4"/><input type="text" name ="Question[content][4]" style="width: 600px;"></div>
                            <br />
                            <div class="row"><label style="width:70px;">&nbsp;</label><input id="add_question" type="submit" class="button" value="<?php echo Language::t('Add question')?>" style="width:100px;" /></div>
                        </div><!--q-post-->
                        <?php 
						Yii::app()->clientScript->registerScript('add_question', "
							$('#add_question').click(function(){
								jQuery.ajax({
										type:'POST',
										dataType:'json',
										url:'".Yii::app()->createUrl('LanguageSkill/addQuestion')."',
										data: $('#add_test').serialize(),
										success:function(data) {
											if(data.success){												
												var current_list_question=$('#list_questions').val();
												if (data.id > 0)  
        										{
               										if(current_list_question != ''){
               											$('#list_questions').val(current_list_question+','+data.id);
               										}
               										else {
               											$('#list_questions').val(data.id);
               										}
               									}	
												$('.q-post').find('input[name=Question[title]').each(function(){\$(this).val('')});
												$('.q-post').find('textarea').each(function(){\$(this).val('')});
												$('.q-post').find('input[type=text]').each(function(){\$(this).val('')});
												$('.q-post').find('input[type=checkbox]').removeAttr('checked');
												
												$(data.view).insertBefore($('.q-post'));
											}
											else{
												jAlert(data.message);
											}
										},
										});
								return false;
								});
							");
						?>
                    </div><!--markingup-question-->
                </div><!--testpost-box-->
                <div class="testpost-button"><label style="width:140px;">Click here to update:</label><input type="submit" class="big-button" value="Update" style="width:100px;" /></div>		
			</div>
			<!--end content testpost outer-->
			<div class="clear"></div>
			<!--end pages-->
			<?php $this->endWidget(); ?>
		</div>
	</div>
	<!--end inside content-->