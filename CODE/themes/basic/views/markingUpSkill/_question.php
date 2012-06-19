                        <div class="text-question">
                            <div class="text-title"><?php echo $question->title?></div>
                            <div class="text-check">
                            	<?php 
                            	$list_answer=$question->answer;
                            	?>
                            	<?php foreach ($question->content as $index=>$option):?>
                            	<div class="<?php if($list_answer[$index]) echo 'active'?>"><label><?php echo ($index+1)?>) <?php echo $option?></label><a class="i16 i16-statustext"></a><a class="i16 i16-trashgray"></a></div>
                            	<?php endforeach;?>
                            </div>
                        </div><!--text-question-->