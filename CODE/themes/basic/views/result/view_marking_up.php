	<!--begin inside content-->
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
            <div class="testpost-outer">
            	<div class="testpost-box">
                	<h2>Detail:</h2>
                	 <div class="row">
                        <label>Title test:</label>
                        <span><?php echo $exam->title?></span>
                    </div>
                    <div class="row">
                        <label>Name:</label>
                        <span><b><?php echo $user->username?></b></span>
                    </div>      
                    <div class="row">
                        <label>Fullname:</label>
                        <span><b><?php echo $user->fullname?></b></span>
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
                <div class="testpost-box">
					<h2>Table result detail:</h2>
                    <div class="row">
                        <div class="table">
                            <table border="0" cellpadding="0" cellspacing="0" width="70%">
                                <tbody>
                                    <tr align="center" class="table-title">
                                   		<td width="10%">&nbsp;</td>
                                        <td width="10%">&nbsp;</td>                                                                               
                                        <?php for ($i=0;$i<$max_num_choices;$i++):?>
                                        <td width="10%"><p>A<?php echo $i+1?></p></td>
                                        <?php endfor;?>
                                        <td width="10%">Result</td> 
                                    </tr>
                                    <?php 
                                    $num_correct=0;
                                    $index=1;
                                    ?>
                                    <?php foreach ($model->answer as $id=>$answer):?>
                                    <?php $question=Question::model()->findByPk($id);?>
                                    <?php 
                                    $check=$question->check($answer);
                                    if($check) $num_correct++;
                                    ?>
                                    <tr align="center">
                                        <td ROWSPAN=2>Q<?php echo $index?></td>                                        
                                        <td>Answer Key</td>
                                        <?php foreach ($answer as $choice):?>
                                       		<td><p><?php echo $choice?'T':'F';?></p></td>
                                        <?php endforeach;?>
                                        <?php for($i=0;$i<($max_num_choices - sizeof($answer));$i++):?>
                                        	<td><p><?php echo '';?></p></td>
                                        <?php endfor;?> 
                                        <td ROWSPAN=2><?php echo $check?'TRUE':'FALSE'?></td>                                      
                                    </tr>
                                    
                                     <tr align="center">
                                        <td>Answer</td>                                        
                                        <?php foreach ($question->answer as $choice):?>
                                       		<td><p><?php echo $choice?'T':'F';?></p></td>
                                        <?php endforeach;?>
                                        <?php for($i=0;$i<($max_num_choices - sizeof($answer));$i++):?>
                                        	<td><p><?php echo '';?></p></td>
                                        <?php endfor;?>                                       
                                    </tr>
                                    <?php $index++?>
                                    <?php endforeach;?>                                   
                                </tbody>
                            </table>
                        </div><!--table-->
                    </div>
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Final result:</h2>
                    <div class="row">
                        <label>Result:</label>
                        <span><b><?php echo $num_correct.'/'.sizeof($model->answer)?></b></span>
                    </div>
                </div><!--testpost-box-->
                <div class="clear"></div>		
			</div>
			<!--end content testpost outer-->
			<div class="clear"></div>
			<!--end pages-->
		</div>
	</div>