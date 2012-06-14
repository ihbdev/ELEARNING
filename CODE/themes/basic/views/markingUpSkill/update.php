<!--begin inside content-->
	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1>Administrator</h1>
			<div class="header-menu">
				<ul>
					<li class="ex-show"><a class="activities-icon" href=""><span>Marking-up Level</span></a></li>
				</ul>
			</div>
		</div>
		<!--end title-->
		<div class="folder-content">
		<?php $form=$this->beginWidget('CActiveForm', array('method'=>'post','enableAjaxValidation'=>true, 'id'=>'add_test')); ?>	
            <div class="testpost-outer">
            <?php
    			foreach(Yii::app()->user->getFlashes() as $key => $message) {
        			echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
    			}
			?>
            	<div class="testpost-box">
					<h2>Marking-up Level title</h2>
					 <?php echo $form->textField($test,'title',array('style'=>'width:600px')); ?>
                   	 <?php echo $form->error($test, 'title'); ?>	
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Choise Level</h2>
                     <div class="level-outer">
                    	<?php for($i=1;$i<ITest::MARKINGUP_MAX_LEVEL;$i++):?>
                    		<input name="ITest[level]" type="radio" value="<?php echo $i?>" <?php if($test->level==$i) echo 'checked="checked"';?> /><label>Level <?php echo $i?></label>
                    		<?php if($i == round(ITest::MARKINGUP_MAX_LEVEL/2)) echo '</br>';?>
                        <?php endfor;?>
                        <?php echo $form->error($test, 'level'); ?>
                    </div>
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Post Q&A Level</h2>
                    <div class="markingup-question">     
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
                        
                    	<div class="q-post">
                        	<div class="row"><h3>Question</h3></div>
                        	<input id="list_questions" name="ITest[questions]" type="hidden" value="<?php echo implode(',', $test->content)?>"/>
                        	<?php echo $form->error($test, 'content'); ?>
                        	<div class="row"><label style="width:70px;">Title:</label><textarea name="Question[title]" style="width:600px; height:80px;"></textarea></div>
                            <div class="row"><label style="width:70px;">Input file:</label><input type="text" name ="Question[supplement]" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A:</label><input name="Question[answer][]" type="checkbox" value="0"/><input type="text" name ="Question[content][0]" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">B:</label><input name="Question[answer][]" type="checkbox" value="1"/><input type="text" name ="Question[content][1]" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">C:</label><input name="Question[answer][]" type="checkbox" value="2"/><input type="text" name ="Question[content][2]" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">D:</label><input name="Question[answer][]" type="checkbox" value="3"/><input type="text" name ="Question[content][3]" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">E:</label><input name="Question[answer][]" type="checkbox" value="4"/><input type="text" name ="Question[content][4]" style="width: 600px;"></div>
                            <br />
                            <div class="row"><label style="width:70px;">&nbsp;</label><input id="add_question" type="submit" class="button" value="Add question" style="width:100px;" /></div>
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
                <div class="testpost-button"><label style="width:140px;">Click here to finish:</label><input type="submit" class="big-button" value="Finish" style="width:100px;" /></div>		
			</div>
			<!--end content testpost outer-->
			<div class="clear"></div>
			<!--end pages-->
		<?php $this->endWidget(); ?>
		</div>
	</div>
	<!--end inside content-->
