	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1>Administrator</h1>
			<div class="header-menu">
				<ul>
					<li class="ex-show"><a class="activities-icon" href=""><span>Knowledge Skills</span></a></li>
				</ul>
			</div>
		</div>
		<!--end title-->
		<div class="folder-content">
		<?php $form=$this->beginWidget('CActiveForm', array('method'=>'post','enableAjaxValidation'=>true, 'id'=>'add_test')); ?>
            <?php
    			foreach(Yii::app()->user->getFlashes() as $key => $message) {
        			echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
    			}
			?>
            <div class="testpost-outer">
            	<div class="testpost-box">
					<h2>Language</h2>
					<?php echo $form->dropDownList($test,'catid',Category::getLanguageOption(),array('style'=>'width:200px;')); ?>
                    <?php echo $form->error($test, 'catid'); ?>
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Write part</h2>
                    <input type="text" name="" style="width:155px;" value="Section A">
                    <br /><br />
                    <textarea name="section_a[description]" style="width:620px; height:150px;"><?php echo $test->content['section_a']->description;?></textarea>                    
                </div><!--testpost-box-->
                <div class="testpost-box">
                <?php $question_index=1;?>        	
            	<?php foreach($test->content['section_a']->questions as $question_id):?>            	
            	<?php $question=Question::model()->findByPk($question_id);?>               	        	            						
                    <div class="markingup-question">
                    	<div class="text-box" style="width:640px;">                            
                            <div class="text-question">                            	              	                                                         
                                <div class="text-title"><?php echo $question_index.'.'?>&nbsp;&nbsp;<textarea name="section_a[questions][<?php echo $question_index?>][title]" style="width:592px; height:35px;"><?php echo $question->title;?></textarea></div>
                                <?php if($question->type == Question::TYPE_FILL):?>
                                <div class="table">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
			                            	<?php $content_tmp = $question->content;
			                            		$answer_tmp = $question->answer;			                            		
			                            	?>
                                			<?php foreach($question->content as $index=>$content):?>			                            				                            	
			                            	<?php if($index == 0):?>
			                            	<?php foreach ($answer_tmp as $i=>$answer):?>
			                            	<?php if ($i==$index):?>                                    
	                                            <tr align="center" class="table-title">                                                
	                                                <td width="30%"><p><input type="text" name ="section_a[questions][<?php echo $question_index?>][content][0]" value="<?php echo $content?>"></p></td>                                
	                                                <td width="70%"><p><input type="text" name ="section_a[questions][<?php echo $question_index?>][answer][0]" value="<?php echo $answer?>"></p></td>
	                                            </tr>
	                                        <?php endif;?>   
	                                        <?php endforeach;?>    
                                            <?php else:?>
			                            	<?php foreach ($answer_tmp as $i=>$answer):?>
			                            	<?php if ($i==$index):?>                                             
	                                            <tr align="center">
	                                                <td><input type="text" name="section_a[questions][<?php echo $question_index?>][content][<?php echo $index?>]" style="width:155px;" value="<?php echo $content?>"></td>
	                                                <td><input type="text" name="section_a[questions][<?php echo $question_index?>][answer][<?php echo $index?>]" style="width:405px;" value="<?php echo $answer?>"></td>
	                                            </tr>
                                            <?php endif;?>
                                            <?php endforeach;?>
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
                                                <td width="50%"><?php echo chr($Char_index+$index-1).'.'?>&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][<?php echo $question_index;?>][content][<?php echo $index;?>][A]" style="width:90px;" value="<?php echo $content->A?>"></td>
                                                <td width="50%"><?php echo $index.'.'?>&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][<?php echo $question_index;?>][content][<?php echo $index;?>][B]" style="width:90px;" value="<?php echo $content->B?>"></td>
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
			                            		<td width="14%"><label><b><?php echo chr($Char_index+$index-1)?></b></label>&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][<?php echo $question_index?>][answer][<?php echo chr($Char_index+$index-1)?>]" style="width:30px;"></td>
                                    			<?php endforeach;?>                                                                                                                                          
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>                                                            
                                <!--end table data-->
                                <?php elseif($question->type == Question::TYPE_WRITING):?>                                                                                        	                                
                                <div class="text-check">                                    
                                    <div><textarea name="section_a[questions][<?php echo $question_index?>][answer]" style="width:590px; height:50px;"></textarea></div>
                                </div>
                            	<?php endif;?>
                            </div><!--text-question-->                            
                        </div><!--text-box-->
                    </div><!--markingup-question-->
                    <?php $question_index++;?>
                			<?php endforeach;?>
                </div><!--testpost-box-->
                
                <div class="testpost-box">
					<h2>Write part</h2>
                    <input type="text" name="" style="width:155px;" value="Section B">
                    <br /><br />
                    <?php $qindex =1 ?>
            		<?php foreach($test->content['section_b']->questions as $question_id):?>
                    <?php $question=Question::model()->findByPk($question_id);?>
                    <?php if($qindex == 1):?>
            		<?php $material = Material::model()->findByPk($question->material_id);?>
                    <textarea name="materials[B]" style="width:620px; height:150px;"><?php echo $material->content;?>
                    </textarea>
                    <?php endif;?>
                </div><!--testpost-box-->
                <div class="testpost-box">					
                    <div class="markingup-question">
                    	<div class="text-box" style="width:640px;">
                        	<div class="text-question">                        		
                                <div class="text-title"><?php echo $qindex?>.&nbsp;&nbsp;<textarea name="section_b[questions][<?php echo $qindex?>][title]" style="width:592px; height:35px;"><?php echo $question->title;?></textarea></div>
                                <?php if($question->type == Question::TYPE_FILL):?>
                                <div class="table">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                        	<?php foreach($question->content as $index=>$content):?> 
                                        	<?php if($index == 0):?>
                                            <tr align="center" class="table-title">
                                            	<td width="30%"><input type="text" name="section_b[questions][<?php echo $qindex?>][content][<?php echo $index?>]" style="width:155px;" value="<?php echo $content?>"></td>
                                                <td width="70%"><input type="text" name="section_b[questions][<?php echo $qindex?>][answer][<?php echo $index?>]" style="width:405px;" value="<?php echo $question->answer[$index]?>"></td>                                                
                                            </tr>
                                            <?php else:?>
                                            <tr>	
                                            	<td><input type="text" name="section_b[questions][<?php echo $qindex?>][content][<?php echo $index?>]" style="width:155px;" value="<?php echo $content?>"></td>
	                                        	<td><input type="text" name="section_b[questions][<?php echo $qindex?>][answer][<?php echo $index?>]" style="width:405px;" value="<?php echo $question->answer[$index]?>"></td>
                                            </tr>
                                            <?php endif;?>
                                            <?php endforeach;?>                               
                                        </tbody>
                                    </table>
                                </div><!--end table data-->
                                <?php elseif($question->type == Question::TYPE_WRITING):?>
                                <div class="text-check">
                    				<div><textarea name="section_b[questions][<?php echo $qindex?>]['answer']" style="width:590px; height:100px;"></textarea></div>
                    			</div>
                    			<?php endif;?>
                            </div><!--text-question-->                            
                        </div><!--text-box-->                    
                </div><!--testpost-box-->                
                <?php $qindex++;?>
				<?php endforeach;?>				

			<div class="testpost-box">
					<h2>Write part</h2>
                    <input type="text" name="" style="width:155px;" value="Section C">
                    <br /><br />
                    <?php $qindex =1 ?>
            		<?php foreach($test->content['section_c']->questions as $question_id):?>
                    <?php $question=Question::model()->findByPk($question_id);?>
                    <?php if($qindex == 1):?>
            		<?php $material = Material::model()->findByPk($question->material_id);?>
                    <textarea name="materials[C]" style="width:620px; height:150px;"><?php echo $material->content;?>
                    </textarea>
                    <?php endif;?>
                </div><!--testpost-box-->
                <div class="testpost-box">					
                    <div class="markingup-question">
                    	<div class="text-box" style="width:640px;">
                        	<div class="text-question">                        		
                                <div class="text-title"><?php echo $qindex?>.&nbsp;&nbsp;<textarea name="section_c[questions][<?php echo $qindex?>][title]" style="width:592px; height:35px;"><?php echo $question->title;?></textarea></div>
                                <?php if($question->type == Question::TYPE_FILL):?>
                                <div class="table">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                        	<?php foreach($question->content as $index=>$content):?> 
                                        	<?php if($index == 0):?>
                                            <tr align="center" class="table-title">
                                            	<td width="30%"><input type="text" name="section_c[questions][<?php echo $qindex?>][content][<?php echo $index?>]" style="width:155px;" value="<?php echo $content?>"></td>
                                                <td width="70%"><input type="text" name="section_c[questions][<?php echo $qindex?>][answer][<?php echo $index?>]" style="width:405px;" value="<?php echo $question->answer[$index]?>"></td>                                                
                                            </tr>
                                            <?php else:?>
                                            <tr>	
                                            	<td><input type="text" name="section_c[questions][<?php echo $qindex?>][content][<?php echo $index?>]" style="width:155px;" value="<?php echo $content?>"></td>
	                                        	<td><input type="text" name="section_c[questions][<?php echo $qindex?>][answer][<?php echo $index?>]" style="width:405px;" value="<?php echo $question->answer[$index]?>"></td>
                                            </tr>
                                            <?php endif;?>
                                            <?php endforeach;?>                               
                                        </tbody>
                                    </table>
                                </div><!--end table data-->
                                <?php elseif($question->type == Question::TYPE_WRITING):?>
                                <div class="text-check">
                    				<div><textarea name="section_c[questions][<?php echo $qindex?>]['answer']" style="width:590px; height:100px;"></textarea></div>
                    			</div>
                    			<?php endif;?>
                            </div><!--text-question-->                            
                        </div><!--text-box-->
                    </div><!--markingup-question-->	
                               
                <?php $qindex++;?>
				<?php endforeach;?>
				<div class="line"></div>				             
                <div class="testpost-button"><label style="width:140px;">Click here to Update test:</label><input type="submit" class="big-button" value="Finish" style="width:100px;" /></div>		
			</div>
			<!--end content testpost outer-->
			<div class="clear"></div>
			<!--end pages-->
			<?php $this->endWidget(); ?>
		</div>
	</div>