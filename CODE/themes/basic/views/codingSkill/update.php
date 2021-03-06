<!--begin inside content-->
	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1><?php echo Language::t('Coding Test')?></h1>
			<div class="header-menu">
				<ul>
					<li class="ex-show"><a class="activities-icon" href=""><span><?php echo Language::t('Language Skills');?></span></a></li>
				</ul>
			</div>
		</div>
		<!--end title-->
		<div class="folder-content">
		<div>
            <input type="button" class="button" value="<?php echo Language::t('Add new test coding detail')?>" style="width:220px;" onClick="parent.location='<?php echo Yii::app()->createUrl('codingSkill/create',array('type'=>'detail'))?>'"/>
			<input type="button" class="button" value="<?php echo Language::t('Add new test coding profile')?>" style="width:220px;" onClick="parent.location='<?php echo Yii::app()->createUrl('codingSkill/create',array('type'=>'profile'))?>'"/>
           	<input type="button" class="button" value="<?php echo Language::t('List tests')?>" style="width:220px;" onClick="parent.location='<?php echo Yii::app()->createUrl('codingSkill/index')?>'"/>
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
					<h2><?php echo Language::t('Test info')?></h2>
					<label style="width:66px;"><?php echo Language::t('Title');?>:</label>
					 <?php echo $form->textField($test,'title',array('style'=>'width:610px')); ?>
                   	 <?php echo $form->error($test, 'title'); ?>
                   	 <br /><br />
                   	<label style="width:66px;"><?php echo Language::t('Description');?>:</label>
					<?php echo $form->textArea($test,'description',array('style'=>'width:610px;height:60px')); ?>
                   	<?php echo $form->error($test, 'description'); ?>
                </div><!--testpost-box-->
                 <?php if($test->type_coding == 'detail'):?>
               	<div class="testpost-box">
               		<?php
						$material = array('index1'=>'','index2'=>'','index3'=>'');
						$style = array(1=>'',2=>'none',3=>'none');
						$check = array(1=>'checked',2=>'',3=>'');
						if(isset($test->content[0]))
							if(Question::model()->findByPk($test->content[0])->material_id != 0)
							{
								$material = Question::model()->findByPk($test->content[0])->material->content;
							}
						if($material["index2"]!="") {
							$style[1]='none';$style[2]='';$style[3]='none';
							$check[1]='';$check[2]='checked';$check[3]='';
						}
					?>
					<h2><?php echo Language::t('Material for test')?></h2>
					<input type="radio" name="group1" value="Text" <?php echo $check[1];?> id="Materials_text"> Internal Article &nbsp &nbsp
					<input type="radio" name="group1" value="Url" <?php echo $check[2];?> id="Materials_url"> External Url &nbsp &nbsp
					<input type="radio" name="group1" value="Upload" id="Materials_upload"> Upload File <br /><br />
                    <!-- Material for question -->
                    
					<label style="width:66px;"><?php echo Language::t('Material');?>:</label>
					<textarea  id ="material_1" name="TestCodingSkill[materials][1]" style="width:610px; height:350px;display:<?php echo $style[1]?>"><?php echo $material['index1']?></textarea>
					<input id = "material_2" type="text" value ="<?php echo $material['index2']?>" name="TestCodingSkill[materials][2]" style="width:610px;display:<?php echo $style[2]?>">
					<?php echo CHtml::form('','post',array('enctype'=>'multipart/form-data')); ?>
					<input id ="material_3" style="display:none;" type="file" name="TestCodingSkill[materials][3]">
                 <?php else:?>
                	<input name="TestCodingSkill[level]" type="hidden" value="0"/>
                <?php endif;?>
                <br /><br />
                <div class="testpost-box">
					<h2><?php echo Language::t('List questions')?></h2>

					<!-- List the current questions -->
					<div class = "testpost-box">
					<?php foreach ($test->content as $question_id):?>
                    	<?php $question=Question::model()->findByPk($question_id);?>
                    	<?php 
                    	// Check question is normal or upload question
                    	if($question->answer != 'By trainer'):
                    	?>
                         <div class="text-question">
                            <div class="text-title">
                            	<?php $css_id='question'.$question_id.'_'.'title';?> 	
                            	<div id="<?php echo $css_id;?>">
                            		<?php echo $question->title?>
                            		<a class="i16 i16-statustext"></a>
                            		<a class="i16 i16-trashgray" href="<?php echo Yii::app()->createUrl('codingSkill/removeQuestion',array('question_id'=>$question_id,'index_choice'=>-1,'test_id'=>$test->id))?>"></a>
                            	</div>
                            	<div id="<?php echo $css_id.'_form';?>" style="display: none;">
                            		<input type="text" name ="UpdateQuestion[title]" style="width:600px;" value="<?php echo $question->title;?>">
                            		<a class="i16 i16-checkblue" href="<?php echo Yii::app()->createUrl('codingSkill/updateQuestion',array('id'=>$question_id,'test_id'=>$test->id))?>"></a>
                            		<a class="i16 i16-removered"></a>
                            	</div>
                            </div>
							<div class="text-title">
                            	<?php $css_id='question'.$question->id.'_'.'supplement';?>
                            	<label style="width:70px;"><?php echo Language::t('File')?>:</label>
                            	<div id="<?php echo $css_id;?>">
                            		<?php echo $question->supplement?>
                            		<a class="i16 i16-statustext"></a>
                            		<a class="i16 i16-trashgray" href="<?php echo Yii::app()->createUrl('codingSkill/removeQuestion',array('question_id'=>$question->id))?>"></a>
                            	</div>
                            	<div id="<?php echo $css_id.'_form_';?>" style="display: none;">
                            		<input type="text" name ="UpdateQuestion[supplement]" style="width:600px;" value="<?php echo $question->title;?>">
                            		<a class="i16 i16-checkblue" href="<?php echo Yii::app()->createUrl('codingSkill/updateQuestion',array('id'=>$question->id))?>"></a>
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
                            		<a class="i16 i16-trashgray" href="<?php echo Yii::app()->createUrl('codingSkill/removeQuestion',array('question_id'=>$question_id,'index_choice'=>$index,'test_id'=>$test->id,))?>"></a>
                            	</div>
                            	<div id="<?php echo $css_id.'_form';?>" class="row" style="display: none;">
                            		<input name="UpdateQuestion[answer][]" type="checkbox" value="<?php echo $index?>" <?php if($list_answer[$index]) echo 'checked="checked"'?>/>
                            		<input type="text" name ="UpdateQuestion[content][<?php echo $index?>]" value="<?php echo $option?>" style="width: 600px;">
                            		<a class="i16 i16-checkblue" href="<?php echo Yii::app()->createUrl('codingSkill/updateQuestion',array('id'=>$question_id,'test_id'=>$test->id))?>"></a>
                            		<a class="i16 i16-removered"></a>
                            	</div>
                            	<?php endforeach;?>
                            	<div class="row"><a class="i16 i16-addgreen add_choice_form" id="<?php echo $question_id?>" href="<?php echo Yii::app()->createUrl('codingSkill/updateQuestion',array('id'=>$question_id,'test_id'=>$test->id))?>"></a></div>
                            </div>                            
                        </div><!--text-question-->
						<?php else:?>
						<div class="text-question">
                            <div class="text-title">
                            	<?php echo $question->title;?><br />
                            	<a href="<?php echo $question->content;?>"><?php echo $question->content;?></a>
                            </div>
						</div>
						<?php endif;?>
                        <?php endforeach;?>
					</div>

					<!-- Radio box for chosing question type -->
					<input type="radio" name="group2" value="Text" checked id="question_editor"> Internal Article &nbsp &nbsp
					<input type="radio" name="group2" value="Url" id="question_upload"> Upload question sheet &nbsp &nbsp <br /><br />

					<!-- Multiple choice question -->
					<div id="testpost-box-1">
                    <div class="markingup-question">                               
                    	<div class="q-post">
                        	<div class="row"><h3><?php echo Language::t('Question')?></h3></div>
                        	<input id="list_questions" name="TestCodingSkill[questions]" type="hidden" value="<?php echo implode(',', $test->content)?>"/>
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
                    </div>
					<div id="testpost-box-2" style="display:none">
                    	<div class="q-post">
                    		<div class="row"><h3>Upload Question sheet</h3></div>
                    		<?php echo CHtml::form('','post',array('enctype'=>'multipart/form-data')); ?>
							<input type="file" name="TestCodingSkill[upload]">
						</div>
                    </div>
                </div><!--testpost-box-->
                <div class="testpost-button"><input type="submit" class="big-button" value="<?php echo Language::t('Update')?>" style="width:100px;" /></div>		
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
		url:'".Yii::app()->createUrl('codingSkill/addQuestion',array('test_id'=>$test->id))."',
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
<script type="text/javascript">
	$("#Materials_text").click(
		function()
		{
			$("#material_1").show();
			$("#material_2").hide();
			$("#material_3").hide();
		}
	);
	$("#Materials_url").click(
		function()
		{
			$("#material_1").hide();
			$("#material_2").show();
			$("#material_3").hide();
		}
	);
	$("#Materials_upload").click(
		function()
		{
			$("#material_1").hide();
			$("#material_2").hide();
			$("#material_3").show();
		}
	);
	$("#question_editor").click(
		function()
		{
			$("#testpost-box-1").show();
			$("#testpost-box-2").hide();
		}
		);
	$("#question_upload").click(
		function()
		{
			$("#testpost-box-1").hide();
			$("#testpost-box-2").show();
		}
		);
</script>