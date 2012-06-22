<!--begin page content-->
<div id="shell" class="forShell">
	<div class="fl main-test">
	<?php $form=$this->beginWidget('CActiveForm', array('method'=>'post','enableAjaxValidation'=>true, 'id'=>'view_exam')); ?>
    	<h2>Marking-up test</h2>
        <ul class="main-test-ul">
        	<li><h5>Marking-up test level: Level <?php echo $test->level?></h5></li>
            <li><label>Office:</label><span> <?php echo $model->office->name?></span></li>
        </ul>
        <div class="today">Today: <?php echo date('m/d/Y',time())?></div>
        <div class="line"></div>
        <div class="text-control-intro">
        	<div class="text-intro-hide"><span class="i16 i16-albumup"></span>Hide</div>
            <div class="text-intro-show"><span class="i16 i16-albumdown"></span>show</div>
        </div>
        <div class="test-introduction">
			<?php echo $test->description?>
        </div><!--test-introduction-->
        <div class="text-content">
        	<h3>Level <?php echo $test->level?></h3>
            <h4></h4>
            <div class="text-box">
            	<?php $question_index=1;?>
            	<?php foreach($test->content as $question_id):?>
            	<?php $question=Question::model()->findByPk($question_id);?>
            	<div class="text-question">
                	<div class="text-title">Q<?php echo $question_index?>) <?php echo $question->title?></div>
                    <div class="text-check">
                    	<?php $list_choices=Question::interChange($question->content);?>
                    	<?php $choice_index=1;?>
                    	<?php foreach($list_choices as $index=>$choice):?>
                    	<div><input id="<?php echo $choice_index?>" name="Result[<?php echo $question_id?>][]" type="checkbox" value="<?php echo $index?>"/><label for="<?php echo $choice_index?>"><?php echo $choice_index?>) <?php echo $choice;?></label></div>
						<?php $choice_index++;?>
                    	<?php endforeach;?>                   
                    </div>
                </div><!--text-question-->
                <?php $question_index++;?>
                <?php endforeach;?>               
            </div><!--text-box-->
        </div><!--text-content-->
     <div class="line"></div>
		<br/>
		<div class="text-finish">
        <center>    <input name="" type="submit" class="btn-submit" value="Click to finish Level" /></center>
        </div><!--text-finish-->
         <?php $this->endWidget(); ?>
    </div><!--main-test-->
	<div class="fr sidebar-test">
    	<ul class="employee-ul">
    		<?php 
    		$user=User::model()->findByPk(Yii::app()->user->id);
    		?>
        	<li><label>ID Test:</label><span><?php echo $user->username;?></span></li>
            <li><label>Employee:</label><span><b><?php echo $user->fullname;?></b></span></li>
			<li><label>Email:</label><span><b><?php echo $user->email;?></b></span></li>
            <li><label>Office:</label><span><?php echo $user->address;?></span></li>
        </ul>
        <div class="text-info">
        	<h5>Your marking-up test level infomation</h5>
        	<ul>
                <li>
                	<a href="#" class="text-item greenbg">Level1: 85%</a>
					<a href="#" class="text-item greenbg">Level2: 90%</a>
					<a href="#" class="text-item greenbg">Level3: 90%</a>
					<a href="#" class="text-item greenbg">Level4: 90%</a>
					<a href="#" class="text-item greenbg">Level5: 90%</a>
					<a href="#" class="text-item greenbg">Level6: 90%</a>
					<a href="#" class="text-item greenbg">Level7: 90%</a>
					<a href="#" class="text-item">Level8</a>
            		<a href="#" class="text-item">Level9</a>
                </li>
            </ul>
        </div><!--text-info-->
        <div class="text-note">
			<ul>
				<li>Level which background green is completed(>=85%) </li>
				<li>Level which background red is not completed </li>
			</ul>			
        </div><!--text-note-->
	</div><!--sidebar-test-->
