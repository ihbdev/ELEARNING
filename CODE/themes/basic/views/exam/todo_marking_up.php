<!--begin page content-->
<div id="shell" class="forShell">
	<div class="fl main-test">
	<?php $form=$this->beginWidget('CActiveForm', array('method'=>'post','enableAjaxValidation'=>true, 'id'=>'view_exam')); ?>
    	<h2>Marking-up test</h2>
        <ul class="main-test-ul">
        	<?php if($test->level > 0):?>
        	<li><h5>Marking-up test level: Level <?php echo $test->level?></h5></li>
        	<?php else:?>
        	<li><h5>Marking-up final test</h5></li>
        	<?php endif;?>
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
            	<?php 
            	$tmp_choice=array();
            	if(isset($tmp_result))
            	{
            		foreach ($tmp_result->answer as $id=>$choice){
            			if($id==$question_id) 
            				$tmp_choice=$choice;    
            		}        		
            	}
            	?>
            	<div class="text-question">
                	<div class="text-title">Q<?php echo $question_index?>) <?php echo $question->title?></div>
                    <div class="text-check">
                    	<?php $list_choices=Question::interChange($question->content);?>
                    	<?php $choice_index=1;?>
                    	<?php foreach($list_choices as $index=>$choice):?>
                    	<div <?php if( isset($tmp_choice[$index]) && $tmp_choice[$index]) echo "class='active'"?>><input id="<?php echo $choice_index?>" name="Result[<?php echo $question_id?>][]" type="checkbox" value="<?php echo $index?>" <?php if( isset($tmp_choice[$index]) && $tmp_choice[$index]) echo "checked='checked'"?> class="answer_input"/><label for="<?php echo $choice_index?>"><?php echo $choice_index?>) <?php echo $choice;?></label></div>
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
            <li><label>Office:</label><span><?php echo $user->office->name;?></span></li>
        </ul>
        <div class="text-info">
        	<h5>Your marking-up test level infomation</h5>
        	<ul>
                <li>
                <?php for($i=1;$i<=TestMarkingUpSkill::MARKINGUP_MAX_LEVEL;$i++):?>
                	<?php 
                	$result=$model->getResultMarkingUp($i);
                	?>
                	<?php if(isset($result)):?>
                	<a href="<?php echo $result->url;?>" class="text-item greenbg">Level <?php echo $i?>: <?php echo $result->getResult();?></a>
                	<?php else:?>
                	<a href="" class="text-item">Level <?php echo $i?></a>
                	<?php endif;?>
            	<?php endfor;?>
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
<?php 
$cs = Yii::app()->getClientScript(); 
 // Script hide form update
$cs->registerScript(
  'js-store-answer',
  "jQuery(function($) { $('body').on('change','.answer_input',	
  		function(){
  				jQuery.ajax({
  				'data':$('#view_exam').serialize(),
  				'dataType':'json',
  				'success':function(data){},
        		'type':'POST',
        		'url':'".Yii::app()->createUrl('exam/store',array('id'=>$model->id))."',
        		'cache':false});
        	});
        })",
  CClientScript::POS_END
  );
  ?>