<!--begin inside content-->
	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1><?php echo Language::t('Marking-up')?></h1>
			<div class="header-menu">
				<ul>
					<li class="ex-show"><a class="activities-icon" href=""><span><?php echo Language::t('Marking-up Level')?></span></a></li>
				</ul>
			</div>
		</div>
		<!--end title-->
		<div class="folder-content">
		<div>
            	<input type="button" class="button" value="<?php echo Language::t('List tests')?>" style="width:180px;" onClick="parent.location='<?php echo Yii::app()->createUrl('markingUpSkill/index')?>'"/>
            	<input type="button" class="button" value="<?php echo Language::t('Add new test marking-up final')?>" style="width:180px;" onClick="parent.location='<?php echo Yii::app()->createUrl('markingUpSkill/create',array('group_level'=>0))?>'"/>
                <input type="button" class="button" value="<?php echo Language::t('Add new test marking-up level')?>" style="width:180px;" onClick="parent.location='<?php echo Yii::app()->createUrl('markingUpSkill/create',array('group_level'=>1))?>'"/>
                <div class="line top bottom"></div>	
        </div>
		<?php $form=$this->beginWidget('CActiveForm', array('method'=>'post','enableAjaxValidation'=>true, 'id'=>'add_test')); ?>	
            <div class="testpost-outer">
            <?php
    			foreach(Yii::app()->user->getFlashes() as $key => $message) {
        			echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
    			}
			?>
            	<div class="testpost-box">
					<h2><?php echo Language::t('Test title')?></h2>
					 <?php echo $form->textField($test,'title',array('style'=>'width:600px')); ?>
                   	 <?php echo $form->error($test, 'title'); ?>	
                </div><!--testpost-box-->
                 <?php if($test->level != 0):?>
               	<div class="testpost-box">
					<h2><?php echo Language::t('Choise level')?></h2>
                    <div class="level-outer">
                    	<?php for($i=1;$i<ITest::MARKINGUP_MAX_LEVEL;$i++):?>
                    		<input name="ITest[level]" type="radio" value="<?php echo $i?>" <?php if($test->level==$i) echo 'checked="checked"';?> /><label><?php echo Language::t('Level')?> <?php echo $i?></label>
                    		<?php if($i == round(ITest::MARKINGUP_MAX_LEVEL/2)) echo '</br>';?>
                        <?php endfor;?>
                        <?php echo $form->error($test, 'level'); ?>
                    </div>
                </div><!--testpost-box-->
                 <?php else:?>
                	<input name="ITest[level]" type="hidden" value="0"/>
                <?php endif;?>
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
										url:'".Yii::app()->createUrl('markingUpSkill/addQuestion')."',
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
                <div class="testpost-button"><input type="submit" class="big-button" value="<?php echo Language::t('Update')?>" style="width:100px;" /></div>		
			</div>
			<!--end content testpost outer-->
			<div class="clear"></div>
			<!--end pages-->
		<?php $this->endWidget(); ?>
		</div>
	</div>
	<!--end inside content-->
