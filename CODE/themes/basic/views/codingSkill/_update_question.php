
						<div class="text-question">
                            <div class="text-title">
                            	<?php $css_id='question'.$question->id.'_'.'title';?> 	
                            	<div id="<?php echo $css_id;?>">
                            		<?php echo $question->title?>
                            		<a class="i16 i16-statustext"></a>
                            		<a class="i16 i16-trashgray" href="<?php echo Yii::app()->createUrl('markingUpSkill/removeQuestion',array('question_id'=>$question->id,'index_choice'=>-1,'test_id'=>$test->id))?>"></a>
                            	</div>
                            	<div id="<?php echo $css_id.'_form';?>" style="display: none;">
                            		<input type="text" name ="UpdateQuestion[title]" style="width:600px;" value="<?php echo $question->title;?>">
                            		<a class="i16 i16-checkblue" href="<?php echo Yii::app()->createUrl('markingUpSkill/updateQuestion',array('id'=>$question->id,'test_id'=>$test->id))?>"></a>
                            		<a class="i16 i16-removered"></a>
                            	</div>
                            </div>
                            <div class="text-check">
                            	<?php 
                            	$list_answer=$question->answer;
                            	?>
                            	<?php foreach ($question->content as $index=>$option):?>
                            	<?php $css_id='question'.$question->id.'_'.'choice_'.$index;?> 
                            	<div id="<?php echo $css_id?>" class="<?php if($list_answer[$index]) echo 'active'?>"><label><?php echo ($index+1)?>) <?php echo $option?></label>
                            		<a class="i16 i16-statustext"></a>
                            		<a class="i16 i16-trashgray" href="<?php echo Yii::app()->createUrl('codingSkill/removeQuestion',array('question_id'=>$question->id,'index_choice'=>$index,'test_id'=>$test->id))?>"></a>
                            	</div>
                            	<div id="<?php echo $css_id.'_form';?>" class="row" style="display: none;">
                            		<input name="UpdateQuestion[answer][]" type="checkbox" value="<?php echo $index?>" <?php if($list_answer[$index]) echo 'checked="checked"'?>/>
                            		<input type="text" name ="UpdateQuestion[content][<?php echo $index?>]" value="<?php echo $option?>" style="width: 600px;">
                            		<a class="i16 i16-checkblue" href="<?php echo Yii::app()->createUrl('codingSkill/updateQuestion',array('id'=>$question->id,'test_id'=>$test->id))?>"></a>
                            		<a class="i16 i16-removered"></a>
                            	</div>
                            	<?php endforeach;?>
                            	<div class="row"><a class="i16 i16-addgreen add_choice_form" id="<?php echo $question->id?>" href="<?php echo Yii::app()->createUrl('codingSkill/updateQuestion',array('id'=>$question->id,'test_id'=>$test->id))?>"></a></div>
                            </div>                            
                        </div><!--text-question-->