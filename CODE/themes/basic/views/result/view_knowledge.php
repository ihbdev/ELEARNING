	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1>Administrator</h1>
			<div class="header-menu">
				<ul>
					<li class="ex-show"><a class="activities-icon" href=""><span>View Detail Test Result</span></a></li>
				</ul>
			</div>
		</div>
		<!--end title-->
		<div class="folder-content">			
		      	<div class="testpost-box">
                	<h2>Trainee's Detail:</h2>
                    <div class="row">
                        <label>Name:</label>
                        <span><b><?php echo $user->fullname?></b></span>
                    </div>
                    <div class="row">
                        <label>Title test:</label>
                        <span><?php echo $test->title;?></span>
                    </div>
                    <div class="row">
                        <label>Office:</label>
                        <span><?php echo $user->office->name?></span>
                    </div>
                    <div class="row">
                        <label>Type of test:</label>
                        <span><?php echo Exam::$list_type[$exam->type]?></span>
                    </div>
                    <div class="row">
                        <label>Start:</label>
                        <span><?php echo date("H:i d/m/Y",$exam->start_time)?></span>
                    </div>
                    <div class="row">
                        <label>Finish:</label>
                        <span><?php echo date("H:i d/m/Y",$exam->finish_time)?></span>
                    </div>
                </div><!--testpost-box-->
			<h2>Test result detail:</h2> 
			<div class="testpost-outer">                                               		            
            	<div class="testpost-box">
					<h2>Language</h2>
					<?php echo $test->cat->name; ?>                    
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Write part</h2>
                    Section A
                    <br /><br />                    
                    <?php echo $test['content']['section_a']['description'];?>                    
                </div><!--testpost-box-->
                <div class="testpost-box">
                <?php $question_index=1;?>                                     	
            	<?php foreach($model->answer['section_a'] as $question_id=>$result):?>            	
            	<?php $question=Question::model()->findByPk($question_id);?>               	        	            						
                    <div class="markingup-question">
                    	<div class="text-box" style="width:640px;">                            
                            <div class="text-question">                            	              	                                                         
                                <div class="text-title"><?php echo $question_index.'.'?>&nbsp;&nbsp;<?php echo $question->title;?></div>
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
	                                                <td width="30%"><p><?php echo $content?></p></td>                                
	                                                <td width="70%"><p><?php echo $answer?></p></td>
	                                            </tr>
	                                        <?php endif;?>   
	                                        <?php endforeach;?>    
                                            <?php else:?>
			                            	<?php foreach ($result as $i=>$tmpresult):?>
			                            	<?php if ($i==$index):?>                                             
	                                            <tr align="center">
	                                                <td width="30%"><?php echo $content?></td>
	                                                <td width="70%"><?php echo $tmpresult?></td>
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
                                                <td width="50%"><?php echo chr($Char_index+$index-1).'.'?>&nbsp;&nbsp;&nbsp;<?php echo $content['A']?></td>
                                                <td width="50%"><?php echo $index.'.'?>&nbsp;&nbsp;&nbsp;<?php echo $content['B']?></td>
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
			                            		<?php foreach($result as $index=>$tmp):?>			                            					                            		
			                            		<td width="14%" style="width:30px;"><label><b><?php echo $index?></b></label>&nbsp;&nbsp;&nbsp;<?php echo $tmp;?></td>
			                            		
                                    			<?php endforeach;?>                                                                                                                                          
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>                                                            
                                <!--end table data-->
                                <?php elseif($question->type == Question::TYPE_WRITING):?>                                                                                        	                                
                                <div class="text-check">
                                	<?php foreach ($result as $key=>$content):?>                                 
                                    <div><?php echo $content?></div>
                                    <?php endforeach;?>
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
                    Section B
                    <br /><br />
                    <?php $qindex =1 ?>
            		<?php foreach($model->answer['section_b'] as $question_id=>$result):?>
                    <?php $question=Question::model()->findByPk($question_id);?>
                    <?php if($qindex == 1):?>
            		<?php $material = Material::model()->findByPk($question->material_id);?>
                    <div style="width:620px; height:150px;"> <?php echo $material->content;?></div>
                    <br>                    
                    <?php endif;?>
                </div><!--testpost-box-->
                <div class="testpost-box">					
                    <div class="markingup-question">
                    	<div class="text-box" style="width:640px;">
                        	<div class="text-question">                        		
                                <div class="text-title" style="width:592px; height:35px;"><?php echo $qindex?>.&nbsp;&nbsp;<?php echo $question->title;?></div>
                                <?php if($question->type == Question::TYPE_FILL):?>
                                <div class="table">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                        	<?php foreach($question->content as $index=>$content):?> 
                                        	<?php if($index == 0):?>
                                            <tr align="center" class="table-title">
                                            	<td width="30%"><?php echo $content?></td>
                                                <td width="70%"><?php echo $question->answer[$index]?></td>                                                
                                            </tr>
                                            <?php else:?>
                                            <tr align="center" >	
                                            	<td><?php echo $content?></td>
	                                        	<td><?php echo $result[$index]?></td>
                                            </tr>
                                            <?php endif;?>
                                            <?php endforeach;?>                               
                                        </tbody>
                                    </table>
                                </div><!--end table data-->
                                <?php elseif($question->type == Question::TYPE_WRITING):?>
                                <div class="text-check">
                    				<div style="width:590px; height:100px;"><?php echo $result['answer']?></div>
                    			</div>
                    			<?php endif;?>
                            </div><!--text-question-->                            
                        </div><!--text-box-->                    
                </div><!--testpost-box-->                
                <?php $qindex++;?>
				<?php endforeach;?>				

                <div class="testpost-box">
					<h2>Write part</h2>
                    Section C
                    <br /><br />
                    <?php $qindex =1 ?>
            		<?php foreach($model->answer['section_c'] as $question_id=>$result):?>
                    <?php $question=Question::model()->findByPk($question_id);?>
                    <?php if($qindex == 1):?>
            		<?php $material = Material::model()->findByPk($question->material_id);?>
                    <div style="width:620px; height:150px;"> <?php echo $material->content;?></div>
                    <br>                    
                    <?php endif;?>
                </div><!--testpost-box-->
                <div class="testpost-box">					
                    <div class="markingup-question">
                    	<div class="text-box" style="width:640px;">
                        	<div class="text-question">                        		
                                <div class="text-title" style="width:592px; height:35px;"><?php echo $qindex?>.&nbsp;&nbsp;<?php echo $question->title;?></div>
                                <?php if($question->type == Question::TYPE_FILL):?>
                                <div class="table">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                        	<?php foreach($question->content as $index=>$content):?> 
                                        	<?php if($index == 0):?>
                                            <tr align="center" class="table-title">
                                            	<td width="30%"><?php echo $content?></td>
                                                <td width="70%"><?php echo $question->answer[$index]?></td>                                                
                                            </tr>
                                            <?php else:?>
                                            <tr align="center" >	
                                            	<td><?php echo $content?></td>
	                                        	<td><?php echo $result[$index]?></td>
                                            </tr>
                                            <?php endif;?>
                                            <?php endforeach;?>                               
                                        </tbody>
                                    </table>
                                </div><!--end table data-->
                                <?php elseif($question->type == Question::TYPE_WRITING):?>
                                <div class="text-check">
                    				<div style="width:590px; height:100px;"><?php echo $result['answer']?></div>
                    			</div>
                    			<?php endif;?>
                            </div><!--text-question-->                            
                        </div><!--text-box-->                    
                </div><!--testpost-box-->                
                <?php $qindex++;?>
				<?php endforeach;?>
				<div class="line"></div>				                             		
			</div>
			<!--end content testpost outer-->
			<div class="clear"></div>
			<!--end pages-->			
		</div>
	</div>
	</div>
	</div>