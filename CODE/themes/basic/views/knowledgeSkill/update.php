<!--begin page content-->
<div id="shell" class="forShell">
	<?php $form=$this->beginWidget('CActiveForm', array('method'=>'post','enableAjaxValidation'=>true, 'id'=>'add_exam')); ?>
	<div class="fl main-test">
			<?php
    			foreach(Yii::app()->user->getFlashes() as $key => $message) {
        			echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
    			}
			?>
    	<h2>Knowledge Skills</h2>
        <ul class="main-test-ul">
            <li><label>Language:</label><span><?php echo $test->catid?></span></li>
        </ul>
        <div class="today"><?php echo date('d/m/Y')?></div>
        <div class="line"></div>
        <div class="text-content">
            <h4>Section A</h4>            
            <h5><?php echo $test->content['section_a']->description?></h5>
            <div class="text-box">   
            	<?php $question_index=1;?>        	
            	<?php foreach($test->content['section_a']->questions as $question_id):?>
            	<?php $question=Question::model()->findByPk($question_id);?>          	            	
            	<div class="text-question">
                	<div class="text-title"><?php echo $question_index.'. '.$question->title;?></div>
                	<?php if($question->type == Question::TYPE_FILL):?>                	                	
                    <div class="table">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                            	<?php foreach($question->content as $index=>$content):?>
                            	<?php if($index == 0):?>
                                <tr align="center" class="table-title">
                                    <td width="30%"><p><?php echo $content?></p></td>
                                    <td width="70%"><p><?php echo $question->answer[$index]?></p></td>
                                </tr>
                                <?php else:?>
                                <tr align="center">
                                    <td><p><?php echo $content?></p></td>
                                    <td><input type="input" name="Result[<?php echo $question_id?>][<?php echo $index?>]" style="width:405px;" value=""></td>
                                </tr>
                                <?php endif;?>
                                <?php endforeach;?>                                
                            </tbody>
                        </table>
                    </div>
                    <?php elseif($question->type == Question::TYPE_MATCHING):?>              
                    <div class="table">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                            	<?php $Char_index = 65?>                             	                  	
                            	<?php foreach($question->content as $index=>$content):?>
                                <tr align="center">
                                    <td width="50%"><p><?php echo chr($Char_index+$index-1).'. '.$content->A?></p></td>
                                    <td width="50%"><p><?php echo $index.'. '.$content->B?></p></td>
                                </tr>
                                <?php endforeach;?>
                            </tbody>
                        </table>
                    </div>
                    <!--end table data-->
                    <div class="table">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                                <tr align="center">
                                    <?php $Char_index = 65?>
                            		<?php foreach($question->content as $index=>$content):?>
                                    <td width="14%"><label><b><?php echo chr($Char_index+$index-1)?></b></label>&nbsp;&nbsp;&nbsp;<input type="input" name="Result[<?php echo $question_id?>][<?php echo chr($Char_index+$index-1)?>]" style="width:30px;"></td>
                                    <?php endforeach;?>                                    
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--end table data-->
                    <?php elseif($question->type == Question::TYPE_WRITING):?>
                    <div class="text-check">
                    	<div><textarea name="Result[<?php echo $question_id?>]['answer']" style="width:590px; height:50px;"></textarea></div>
                    </div>                                                   
                    <?php endif;?>
                    <!--end table data-->
                </div><!--text-question-->
                <?php $question_index++;?>
                <?php endforeach;?>                
            </div><!--text-box-->
        </div><!--text-content-->
		<div class="line"></div>
		<div class="text-content">
            <h4>Section B</h4>            
            <h5><?php echo $test->content['section_b']->description?></h5>
            <?php $qindex =1 ?>
            <?php foreach($test->content['section_b']->questions as $question_id):?>
            <?php $question=Question::model()->findByPk($question_id);?>
            <?php if($qindex == 1):?>
            <?php $material = Material::model()->findByPk($question->material_id);?>
            <div class="text-intro">
            	<p><?php echo $material->content?></p>            	
            </div><!--text-intro-->
            <?php endif;?>
            <div class="text-box">
            	<div class="text-question">
                	<div class="text-title"><?php echo $qindex.'. '.$question->title?></div>
                	<?php if($question->type == Question::TYPE_FILL):?>                	                	
                    <div class="table">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
								<?php foreach($question->content as $index=>$content):?>                            	
                            	<?php if($index == 0):?>
                                <tr align="center" class="table-title">
                                    <td width="30%"><p><?php echo $content?></p></td>
                                    <td width="70%"><p><?php echo $question->answer[$index]?></p></td>
                                </tr>
                                <?php else:?>
                                <tr align="center">
                                    <td><p><?php echo $content?></p></td>
                                    <td><input type="input" name="Result[<?php echo $question_id?>][<?php echo $index?>]" style="width:405px;" value=""></td>
                                </tr>
                                <?php endif;?>
                                <?php endforeach;?>                                
                            </tbody>
                        </table>
                    </div>
                    <?php elseif($question->type == Question::TYPE_WRITING):?>
                    <div class="text-check">
                    	<div><textarea name="Result[<?php echo $question_id?>]['answer']" style="width:590px; height:100px;"></textarea></div>
                    </div>
                    <?php endif;?>                    
                </div><!--text-question-->                
            </div><!--text-box-->
            <?php $qindex++;?>
			<?php endforeach;?>
        </div><!--text-content-->
        <div class="line"></div>
		<div class="text-content">
            <h4>Section C</h4>
            <h5><?php echo $test->content['section_c']->description?></h5>
            <?php $qindex =1 ?>
            <?php foreach($test->content['section_c']->questions as $question_id):?>
            <?php $question=Question::model()->findByPk($question_id);?>
            <?php if($qindex == 1):?>
            <?php $material = Material::model()->findByPk($question->material_id);?>
            <div class="text-intro">
            	<p><?php echo $material->content?></p>            	
            </div><!--text-intro-->
            <?php endif;?>
            <div class="text-box">
            	<div class="text-question">
                	<div class="text-title"><?php echo $qindex.'. '.$question->title?></div>
                	<?php if($question->type == Question::TYPE_FILL):?>                	                	
                    <div class="table">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                            	<?php foreach($question->content as $index=>$content):?>
                            	<?php if($index == 0):?>
                                <tr align="center" class="table-title">
                                    <td width="30%"><p><?php echo $content?></p></td>
                                    <td width="70%"><p><?php echo $question->answer[$index]?></p></td>
                                </tr>
                                <?php else:?>
                                <tr align="center">
                                    <td><p><?php echo $content?></p></td>
                                    <td><input type="input" name="Result[<?php echo $question_id?>][<?php echo $index?>]" style="width:405px;" value=""></td>
                                </tr>
                                <?php endif;?>
                                <?php endforeach;?>                                
                            </tbody>
                        </table>
                    </div>
                    <?php elseif($question->type == Question::TYPE_WRITING):?>
                    <div class="text-check">
                    	<div><textarea name="Result[<?php echo $question_id?>]['answer']" style="width:590px; height:100px;"></textarea></div>
                    </div>
                    <?php endif;?>                     
                </div><!--text-question-->                
            </div><!--text-box-->
            <?php $qindex++;?>
			<?php endforeach;?>
        </div><!--text-content-->
        <div class="testpost-button"><label style="width:140px;">Click here to finish:</label><input type="submit" class="big-button" value="Finish" style="width:100px;" /></div>
    </div><!--main-test-->   
	<?php $this->endWidget(); ?>
</div>
		