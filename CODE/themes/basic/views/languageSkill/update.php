<?php
/*
 * create Language array to make dropdownList
 */
 	$list_cat=Category::model()->findAll('type ='.Category::TYPE_ITEST_LANG.'');
 	foreach ($list_cat as $cat) $list_lang[$cat->id] = $cat->name;
?>
	<!--begin inside content-->
	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1><?php echo Language::t('Create Language Skill Test');?></h1>
			<div class="header-menu">
				<ul>
					<li class="ex-show"><a class="activities-icon" href=""><span><?php echo Language::t('Language Skills');?></span></a></li>
				</ul>
			</div>
		</div>
		<!--end title-->
		<div class="folder-content">
		<?php $form=$this->beginWidget('CActiveForm', array('method'=>'post','enableAjaxValidation'=>true, 'id'=>'add_test')); ?>	
            <div class="testpost-outer">
            <?php
    			foreach(Yii::app()->user->getFlashes() as $key => $message){
        			echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
    			}
			?>
				<div class="testpost-box">
					<h2>Choose language</h2>
					<label style="width:66px;"><?php echo Language::t('Language');?>:</label>
					<?php echo $form->dropDownList($test,'catid',$list_lang,array('style'=>'width:200px'));?>
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2><?php echo Language::t('Language Skills Title');?></h2>
					<label style="width:66px;"><?php echo Language::t('Title');?>:</label>
					<?php echo $form->textField($test,'title',array('style'=>'width:610px')); ?>
                   	<?php echo $form->error($test, 'title'); ?>
                   	<br /><br />
                   	<label style="width:66px;"><?php echo Language::t('Description');?>:</label>
					<?php echo $form->textArea($test,'description',array('style'=>'width:610px;height:60px')); ?>
                   	<?php echo $form->error($test, 'description'); ?>
                </div><!--testpost-box-->
                <!-- Loop for displaying Post Q&A Text 1 to Post Q&A Text 3 -->
                <?php for($i=1;$i<4;$i++):?>
	                <div class="testpost-box">
						<h2><?php echo Language::t('Post Q&A Text ').$i?></h2>
						<!-- Material for question -->
						<label style="width:66px;"><?php echo Language::t('Material');?>:</label>
						<textarea  name="ITest[materials][<?php echo $i?>]"  style="width:610px; height:100px;"><?php if(isset($test->content[$i][0])) if(Question::model()->findByPk($test->content[$i][0])->material_id != 0){
								echo Question::model()->findByPk($test->content[$i][0])->material->content;
							}?></textarea>
                		<?php if(isset($test->content[$i]) && $test->content[$i] != ''):?>
						<?php foreach ($test->content[$i] as $question_id):?>
                    	<?php $question=Question::model()->findByPk($question_id);?>
						<div class="text-question">
                            <div class="text-title">
                            	<?php $css_id='question'.$question_id.'_'.'title';?>
								<div id="<?php echo $css_id;?>">
                            		<?php echo $question->title?>
                            		<a class="i16 i16-statustext"></a>
                            		<a class="i16 i16-trashgray"></a>
                            	</div>
                            	<div id="<?php echo $css_id.'_form';?>" style="display: none;">
                            		<input type="text" name ="" style="width:600px;" value="<?php echo $question->title;?>">
                            		<a class="i16 i16-checkblue" href="<?php echo Yii::app()->createUrl('languageSkill/updateQuestion',array('id'=>$question_id))?>"></a>
                            		<a class="i16 i16-removered"></a>
                            	</div>
                            </div>
                            <div class="text-check">
                            	<?php
                            	$list_answer=$question->answer;
                            	?>
                            	<?php foreach ($question->content as $index=>$option):?>
                            	<?php $css_id='question'.$question_id.'_'.'choice_'.$index;?> 
                            	<div id="<?php echo $css_id?>" class="<?php if($list_answer[$index]) echo 'active'?>"><label><?php echo chr(65+$index)?>) <?php echo $option?></label>
                            		<a class="i16 i16-statustext"></a>
                            		<a class="i16 i16-trashgray"></a>
                            	</div>
                            	<div id="<?php echo $css_id.'_form';?>" class="row" style="display: none;">
                            		<input name="Question[answer][]" type="checkbox" value="<?php echo $index?>" <?php if($list_answer[$index]) echo 'checked="checked"'?>/>
                            		<input type="text" name ="Question[content][<?php echo $index?>]" value="<?php echo $option?>" style="width: 600px;">
                            		<a class="i16 i16-checkblue"></a>
                            		<a class="i16 i16-removered"></a>
                            	</div>
                            	<?php endforeach;?>
                            </div>
                        </div><!--text-question-->
                        <?php endforeach;?>
                        <?php endif;?>
						<div class="markingup-question">                               
	                    	<div class="q-post_<?php echo $i?>">
	                        	<div class="row"><h3><?php echo Language::t('Question')?></h3></div>
	                        	<input id="list_questions_<?php echo $i?>" name="ITest[questions][<?php echo $i?>]" type="hidden" value="<?php echo (isset($test->content[$i]) && $test->content[$i] != '')?implode(',', $test->content[$i]):'';?>"/>
	                        	<?php echo $form->error($test, 'content'); ?>
	                        	<div class="row"><label style="width:70px;"><?php echo Language::t('Title')?>:</label><textarea name="Question[title]" style="width:600px; height:80px;"></textarea></div>
	                            <div class="row"><label style="width:70px;"><?php echo Language::t('File')?>:</label><input type="text" name ="Question[supplement]" style="width: 600px;"></div>
	                            <div class="row"><label style="width:30px;">A)</label><input name="Question[answer][]" type="checkbox" value="0"/><input type="text" name ="Question[content][0]" style="width: 600px;"></div>
	                            <div class="row"><label style="width:30px;">B)</label><input name="Question[answer][]" type="checkbox" value="1"/><input type="text" name ="Question[content][1]" style="width: 600px;"></div>
	                            <div class="row"><label style="width:30px;">C)</label><input name="Question[answer][]" type="checkbox" value="2"/><input type="text" name ="Question[content][2]" style="width: 600px;"></div>
	                            <div class="row"><label style="width:30px;">D)</label><input name="Question[answer][]" type="checkbox" value="3"/><input type="text" name ="Question[content][3]" style="width: 600px;"></div>
								<div class="row"><a id="add_choice_<?php echo $i?>" class="i16 i16-addgreen"></a></div>
	                            <br />
	                            <div class="row"><label style="width:70px;">&nbsp;</label><input id="add_question_<?php echo $i?>" type="submit" class="button" value="<?php echo Language::t('Add question')?>" style="width:100px;" /></div>
	                        </div><!--q-post-->
	                    </div><!--markingup-question-->
	                </div><!--testpost-box-->
				<?php endfor;?>
                <div class="testpost-button"><label style="width:140px;">Click here to update:</label><input type="submit" class="big-button" value="Update" style="width:100px;" /></div>		
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
  			var parent=$(this).parent();
  			parent.hide();
  			var tmp=parent.attr('id');
  			var id=tmp.substring(0,tmp.length-5);
        	$('#'+id).show();
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
  			alert(url);	  				
  			jQuery.ajax({
  				'data':parent.find('input').serialize(),
  				'dataType':'json',
  				'success':function(data){
        		},
        		'type':'POST',
        		'url':url,
        		'cache':false});
       return false;	
       });
      })",
  CClientScript::POS_END
);
?>
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
  			var parent=$(this).parent();
  			parent.hide();
  			var tmp=parent.attr('id');
  			var id=tmp.substring(0,tmp.length-5);
        	$('#'+id).show();
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
  			alert(url);	  				
  			jQuery.ajax({
  				'data':parent.find('input').serialize(),
  				'dataType':'json',
  				'success':function(data){
        		},
        		'type':'POST',
        		'url':url,
        		'cache':false});
       return false;	
       });
      })",
  CClientScript::POS_END
);
?>
<?php 
Yii::app()->clientScript->registerScript('add_choice_1', "
	$('#add_choice_1').click(function(){
		var value=0;
		var parent=$(this).parent();
		parent.parent().find('input[type=checkbox]').each(
			function(){
				if(value < $(this).val()) 
					value=$(this).val();
			}
		);
		value++;
		var tmp = new Array('A','B','C','D','E','F','G','H','I','J','K');
		$('<div class=\"row\"><label style=\"width:30px;\">'+(tmp[value])+')</label><input name=\"Question[answer][]\" type=\"checkbox\" value=\"'+value+'\"/><input type=\"text\" name =\"Question[content]['+value+']\" style=\"width: 600px;\"></div>').insertBefore(parent);
	})");
?>
<?php 
Yii::app()->clientScript->registerScript('add_choice_2', "
	$('#add_choice_2').click(function(){
		var value=0;
		var parent=$(this).parent();
		parent.parent().find('input[type=checkbox]').each(
			function(){
				if(value < $(this).val()) 
					value=$(this).val();
			}
		);
		value++;
		var tmp = new Array('A','B','C','D','E','F','G','H','I','J','K');
		$('<div class=\"row\"><label style=\"width:30px;\">'+(tmp[value])+')</label><input name=\"Question[answer][]\" type=\"checkbox\" value=\"'+value+'\"/><input type=\"text\" name =\"Question[content]['+value+']\" style=\"width: 600px;\"></div>').insertBefore(parent);
	})");
?>
<?php 
Yii::app()->clientScript->registerScript('add_choice_3', "
	$('#add_choice_3').click(function(){
		var value=0;
		var parent=$(this).parent();
		parent.parent().find('input[type=checkbox]').each(
			function(){
				if(value < $(this).val()) 
					value=$(this).val();
			}
		);
		value++;
		var tmp = new Array('A','B','C','D','E','F','G','H','I','J','K');
		$('<div class=\"row\"><label style=\"width:30px;\">'+(tmp[value])+')</label><input name=\"Question[answer][]\" type=\"checkbox\" value=\"'+value+'\"/><input type=\"text\" name =\"Question[content]['+value+']\" style=\"width: 600px;\"></div>').insertBefore(parent);
	})");
?>
<?php 
Yii::app()->clientScript->registerScript('add_question_1', "
	$('#add_question_1').click(function(){
		jQuery.ajax({
		type:'POST',
		dataType:'json',
		url:'".Yii::app()->createUrl('LanguageSkill/addQuestion')."',
		data: $(this).parent().parent().find('input,textarea').serialize(),
			success:function(data) {
				if(data.success){									
					var current_list_question=$('#list_questions_1').val();
					if (data.id > 0)  
        			{
               			if(current_list_question != ''){
               				$('#list_questions_1').val(current_list_question+','+data.id);
               		}
               		else {
               			$('#list_questions_1').val(data.id);
               		}
               	}
				$('.q-post_1').find('input[name=Question[2][title]').each(function(){\$(this).val('')});
				$('.q-post_1').find('textarea').each(function(){\$(this).val('')});
				$('.q-post_1').find('input[type=text]').each(function(){\$(this).val('')});
				$('.q-post_1').find('input[type=checkbox]').removeAttr('checked');
				$(data.view).insertBefore($('.q-post_1'));
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
<?php 
Yii::app()->clientScript->registerScript('add_question_2', "
	$('#add_question_2').click(function(){
		jQuery.ajax({
		type:'POST',
		dataType:'json',
		url:'".Yii::app()->createUrl('LanguageSkill/addQuestion')."',
		data: $(this).parent().parent().find('input,textarea').serialize(),
			success:function(data) {
				if(data.success){												
					var current_list_question=$('#list_questions_2').val();
					if (data.id > 0)  
        			{
               			if(current_list_question != ''){
               				$('#list_questions_2').val(current_list_question+','+data.id);
               		}
               		else {
               			$('#list_questions_2').val(data.id);
               		}
               	}
				$('.q-post_2').find('input[name=Question[2][title]').each(function(){\$(this).val('')});
				$('.q-post_2').find('textarea').each(function(){\$(this).val('')});
				$('.q-post_2').find('input[type=text]').each(function(){\$(this).val('')});
				$('.q-post_2').find('input[type=checkbox]').removeAttr('checked');
				$(data.view).insertBefore($('.q-post_2'));
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
<?php 
Yii::app()->clientScript->registerScript('add_question_3', "
	$('#add_question_3').click(function(){
		jQuery.ajax({
		type:'POST',
		dataType:'json',
		url:'".Yii::app()->createUrl('LanguageSkill/addQuestion')."',
		data: $(this).parent().parent().find('input,textarea').serialize(),
			success:function(data) {
				if(data.success){												
					var current_list_question=$('#list_questions_3').val();
					if (data.id > 0)  
        			{
               			if(current_list_question != ''){
               				$('#list_questions_3').val(current_list_question+','+data.id);
               		}
               		else {
               			$('#list_questions_3').val(data.id);
               		}
               	}
				$('.q-post_3').find('input[name=Question[3][title]').each(function(){\$(this).val('')});
				$('.q-post_3').find('textarea').each(function(){\$(this).val('')});
				$('.q-post_3').find('input[type=text]').each(function(){\$(this).val('')});
				$('.q-post_3').find('input[type=checkbox]').removeAttr('checked');
				$(data.view).insertBefore($('.q-post_3'));
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