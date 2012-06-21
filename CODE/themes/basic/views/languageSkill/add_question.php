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