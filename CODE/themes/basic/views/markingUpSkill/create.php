<!--begin inside content-->
	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1><?php echo Language::t('Marking-up')?></h1>
			<div class="header-menu">
				<ul>
					<li class="ex-show"><a class="activities-icon" href=""><span><?php echo Language::t('Marking-up Level')?></span></a></li>
				</ul>
			</div>
		</div>
		<!--end title-->
		<div class="folder-content">
		<div>
				<?php if($group_level != 0):?>
				<input type="button" class="button" value="<?php echo Language::t('Add new test marking-up final')?>" style="width:180px;" onClick="parent.location='<?php echo Yii::app()->createUrl('markingUpSkill/create',array('group_level'=>0))?>'"/>
				<?php else:?>
				<input type="button" class="button" value="<?php echo Language::t('Add new test marking-up level')?>" style="width:180px;" onClick="parent.location='<?php echo Yii::app()->createUrl('markingUpSkill/create',array('group_level'=>1))?>'"/>
				<?php endif;?>
            	<input type="button" class="button" value="<?php echo Language::t('List tests')?>" style="width:180px;" onClick="parent.location='<?php echo Yii::app()->createUrl('markingUpSkill/index')?>'"/>
                <div class="line top bottom"></div>	
        </div>
		<?php $form=$this->beginWidget('CActiveForm', array('method'=>'post','enableAjaxValidation'=>false, 'id'=>'add_test')); ?>	
            <div class="testpost-outer">
            <?php
    			foreach(Yii::app()->user->getFlashes() as $key => $message) {
        			echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
    			}
			?>
            	<div class="testpost-box">
					<h2><?php echo Language::t('Test title')?></h2>
					 <?php echo $form->textField($test,'title',array('style'=>'width:600px')); ?>
                   	 <?php echo $form->error($test, 'title'); ?>	
                </div><!--testpost-box-->
                 <?php if($group_level != 0):?>
                <div class="testpost-box">
					<h2><?php echo Language::t('Choise level')?></h2>
                    <div class="level-outer">
                    	<?php for($i=1;$i<ITest::MARKINGUP_MAX_LEVEL;$i++):?>
                    		<input name="ITest[level]" type="radio" value="<?php echo $i?>" <?php if($test->level==$i) echo 'checked="checked"';?> /><label><?php echo Language::t('Level')?> <?php echo $i?></label>
                    		<?php if($i == round(ITest::MARKINGUP_MAX_LEVEL/2)) echo '</br>';?>
                        <?php endfor;?>
                        <?php echo $form->error($test, 'level'); ?>
                    </div>
                </div><!--testpost-box-->
                <?php else:?>
                	<input name="ITest[level]" type="hidden" value="0"/>
                <?php endif;?>
                <div class="testpost-box">
					<h2><?php echo Language::t('List questions')?></h2>
					<?php foreach ($test->content as $question_id):?>
                    	<?php $question=Question::model()->findByPk($question_id);?>
                         <div class="text-question">
                            <div class="text-title">
                            	<?php $css_id='question'.$question_id.'_'.'title';?> 	
                            	<div id="<?php echo $css_id;?>">
                            		<?php echo $question->title?>
                            		<a class="i16 i16-statustext"></a>
                            		<a class="i16 i16-trashgray" href="<?php echo Yii::app()->createUrl('markingUpSkill/removeQuestion',array('question_id'=>$question_id))?>"></a>
                            	</div>
                            	<div id="<?php echo $css_id.'_form';?>" style="display: none;">
                            		<input type="text" name ="UpdateQuestion[title]" style="width:600px;" value="<?php echo $question->title;?>">
                            		<a class="i16 i16-checkblue" href="<?php echo Yii::app()->createUrl('markingUpSkill/updateQuestion',array('id'=>$question_id))?>"></a>
                            		<a class="i16 i16-removered"></a>
                            	</div>
                            </div>
                            <div class="text-check">
                            	<?php 
                            	$list_answer=$question->answer;
                            	?>
                            	<?php foreach ($question->content as $index=>$option):?>
                            	<?php $css_id='question'.$question_id.'_'.'choice_'.$index;?> 
                            	<div id="<?php echo $css_id?>" class="<?php if($list_answer[$index]) echo 'active'?>"><label><?php echo ($index+1)?>) <?php echo $option?></label>
                            		<a class="i16 i16-statustext"></a>
                            		<a class="i16 i16-trashgray" href="<?php echo Yii::app()->createUrl('markingUpSkill/removeQuestion',array('question_id'=>$question_id,'index_choice'=>$index))?>"></a>
                            	</div>
                            	<div id="<?php echo $css_id.'_form';?>" class="row" style="display: none;">
                            		<input name="UpdateQuestion[answer][]" type="checkbox" value="<?php echo $index?>" <?php if($list_answer[$index]) echo 'checked="checked"'?>/>
                            		<input type="text" name ="UpdateQuestion[content][<?php echo $index?>]" value="<?php echo $option?>" style="width: 600px;">
                            		<a class="i16 i16-checkblue" href="<?php echo Yii::app()->createUrl('markingUpSkill/updateQuestion',array('id'=>$question_id))?>"></a>
                            		<a class="i16 i16-removered"></a>
                            	</div>
                            	<?php endforeach;?>
                            	<div class="row"><a class="i16 i16-addgreen add_choice_form" id="<?php echo $question_id?>" href="<?php echo Yii::app()->createUrl('markingUpSkill/updateQuestion',array('id'=>$question_id))?>"></a></div>
                            </div>                            
                        </div><!--text-question-->
                        <?php endforeach;?>
                    <div class="markingup-question">                               
                    	<div class="q-post">
                        	<div class="row"><h3><?php echo Language::t('Question')?></h3></div>
                        	<input id="list_questions" name="ITest[questions]" type="hidden" value="<?php echo implode(',', $test->content)?>"/>
                        	<?php echo $form->error($test, 'content'); ?>
                        	<div class="row"><label style="width:70px;"><?php echo Language::t('Title')?>:</label><textarea name="Question[title]" style="width:600px; height:80px;"></textarea></div>
                            <div class="row"><label style="width:70px;"><?php echo Language::t('File')?>:</label><input type="text" name ="Question[supplement]" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">1)</label><input name="Question[answer][]" type="checkbox" value="0"/><input type="text" name ="Question[content][0]" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">2)</label><input name="Question[answer][]" type="checkbox" value="1"/><input type="text" name ="Question[content][1]" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">3)</label><input name="Question[answer][]" type="checkbox" value="2"/><input type="text" name ="Question[content][2]" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">4)</label><input name="Question[answer][]" type="checkbox" value="3"/><input type="text" name ="Question[content][3]" style="width: 600px;"></div>
                            <div class="row"><a class="i16 i16-addgreen add_choice"></a></div>
                            <br />
                            <div class="row"><label style="width:70px;">&nbsp;</label><input id="add_question" type="submit" class="button" value="<?php echo Language::t('Add question')?>" style="width:100px;" /></div>
                        </div><!--q-post-->
                    </div><!--markingup-question-->	
                </div><!--testpost-box-->
                <div class="testpost-button"><input type="submit" class="big-button" value="<?php echo Language::t('Create')?>" style="width:100px;" /></div>		
			</div>
			<!--end content testpost outer-->
			<div class="clear"></div>
			<!--end pages-->
		<?php $this->endWidget(); ?>
		</div>
	</div>
	<!--end inside content-->
<?php 
$cs = Yii::app()->getClientScript(); 
// Script view form update
$cs->registerScript(
  'js-view-update',
  "jQuery(function($) { $('body').on('click','.i16-statustext',	
  		function(){
  			var parent=$(this).parent();
  			parent.hide();
  			var id=parent.attr('id') + '_form';
        	$('#'+id).show();
        	});
        })",
  CClientScript::POS_END
  );
  // Script hide form update
$cs->registerScript(
  'js-view-cancel',
  "jQuery(function($) { $('body').on('click','.i16-removered',	
  		function(){
  			var hasClass=$(this).hasClass('form');
  			if(hasClass){
  				var parent=$(this).parent();
  				parent.remove();
  			}
  			else
  			{			
  				var parent=$(this).parent();
  				parent.hide();
  				var tmp=parent.attr('id');
  				var id=tmp.substring(0,tmp.length-5);
        		$('#'+id).show();
        	}
        	});
        })",
  CClientScript::POS_END
  );
  
  $cs->registerScript(
  'js-view-remove',
  "jQuery(function($) { $('body').on('click','.i16-removered',	
  		function(){
  			var hasClass=$(this).hasClass('form');
  			if(hasClass){
  				var parent=$(this).parent();
  				parent.remove();
  			}
  			else
  			{			
  				var parent=$(this).parent();
  				parent.hide();
  				var tmp=parent.attr('id');
  				var id=tmp.substring(0,tmp.length-5);
        		$('#'+id).show();
        	}
        	});
        })",
  CClientScript::POS_END
  );
   
 $cs->registerScript(
  'js-update',
  "jQuery(function($) { $('body').on('click','.i16-checkblue',	
  		function(){
  			var parent=$(this).parent();	
  			var url=$(this).attr('href');	 				
  			jQuery.ajax({
  				'data':parent.parent().parent().find('input').serialize(),
  				'dataType':'json',
  				'success':function(data){
  					if(data.success)
  						parent.parent().parent().replaceWith(data.view);
  					else
						jAlert(data.message);
        		},
        		'type':'POST',
        		'url':url,
        		'cache':false});
       return false;	
       });
      })",
  CClientScript::POS_END
);

$cs->registerScript(
  'js-remove',
  "jQuery(function($) { $('body').on('click','.i16-trashgray',	
  		function(){
  			var parent=$(this).parent();	
  			var url=$(this).attr('href');				
  			jQuery.ajax({
  				'dataType':'json',
  				'success':function(data){
  					if(data.success)
  						parent.parent().parent().replaceWith(data.view);
  					else
						jAlert(data.message);
        		},
        		'type':'POST',
        		'url':url,
        		'cache':false});
       return false;	
       });
      })",
  CClientScript::POS_END
);

Yii::app()->clientScript->registerScript(
'add_choice_form', 
"$('body').on('click','.add_choice_form',
	function(){
		var question_id=$(this).attr('id');
		var href=$(this).attr('href');
		var css_id='question'+question_id+'_'+'choice_';
																		
		var value=0;
		var parent=$(this).parent();
		parent.parent().find('input[type=checkbox]').each(
			function(){
				if(value < $(this).val()) 
					value=$(this).val();
				}
			);
		value++;
		$('<div id=\"$' + css_id + value + '\" class=\"row\"><input name=\"UpdateQuestion[answer][]\" type=\"checkbox\" value=\"' + value + '\"/><input type=\"text\" name =\"UpdateQuestion[content][' + value + ']\" style=\"width: 600px;\"><a class=\"i16 i16-checkblue\" href=\"' + href + '\"></a><a class=\"i16 i16-removered form\"></a></div>').insertBefore(parent);
		return false;
})",
CClientScript::POS_END
);	

Yii::app()->clientScript->registerScript('add_choice', 
"$('body').on('click','.add_choice',
function(){
	var value=0;
	var parent=$(this).parent();
	parent.parent().find('input[type=checkbox]').each(
		function(){
			if(value < $(this).val()) 
				value=$(this).val();
		}
	);
	value++;
	$('<div class=\"row\"><label style=\"width:30px;\">'+(value+1)+')</label><input name=\"Question[answer][]\" type=\"checkbox\" value=\"'+value+'\"/><input type=\"text\" name =\"Question[content]['+value+']\" style=\"width: 600px;\"></div>').insertBefore(parent);
})",
CClientScript::POS_END
);

Yii::app()->clientScript->registerScript(
'add_question', 
"$('body').on('click','#add_question',
function(){
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