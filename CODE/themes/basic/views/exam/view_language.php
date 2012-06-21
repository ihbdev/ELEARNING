<!--begin page content-->
<div id="shell" class="forShell">
	<?php $form=$this->beginWidget('CActiveForm', array('method'=>'post','enableAjaxValidation'=>true, 'id'=>'add_exam')); ?>
	<div class="fl main-test">
    	<h2>Language Skills</h2>
        <ul class="main-test-ul">
        	<li><h5>Language Final Test: <?php echo $test->title?></h5></li>
            <li><label>Language:</label><span> <?php echo $test->cat->name?></span></li>
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
        <?php $i = -1;?>
        <?php foreach($test->content as $questions):?>
        <?php $i++ ?>
        <?php if($i > 0): ?>
        <?php if($questions[0] != ''): ?>
        <div class="text-content" id="text-content-<?php echo $i?>" style="display:none">
        	<h3>Text <?php echo $i?></h3>
            <!-- <h4>Allianz, Swiss Re post strong profits</h4> -->
            <div class="text-intro">
				<?php echo (Question::model()->findByPk($questions[0])->material_id != 0)?Question::model()->findByPk($questions[0])->material->content:'Have not any material';?>
            </div><!--text-intro-->
            <div class="text-box">
				<?php $question_index=1;?>
            	<?php foreach($questions as $question_id):?>
            	<?php $question=Question::model()->findByPk($question_id);?>
            	<div class="text-question">
					<div class="text-title">Q<?php echo $question_index?>) <?php echo $question->title?></div>
					<div class="text-check">
						<?php $list_choices=Question::interChange($question->content);?>
						<?php $choice_index=1;?>
						<?php foreach($list_choices as $index=>$choice):?>
						<div><input id="<?php echo $choice_index?>" name="Result[<?php echo $question_id?>][]" type="checkbox" value="<?php echo $index?>" /><label for="<?php echo $choice_index?>"><?php echo $choice_index?>) <?php echo $choice;?></label></div>
						<?php $choice_index++;?>
						<?php endforeach;?>
					</div>
				</div><!--text-question-->
				<?php $question_index++;?>
				<?php endforeach;?>
            </div><!--text-box-->
        </div><!--text-content-->
        <?php endif?>
        <?php endif?>
        <?php endforeach;?>
        <div class="line"></div>
        <div class="text-button">
        	<a class="fl btn-pre">&laquo;&nbsp;Pre Text</a>
        	<a class="fr btn-next">Next Text&nbsp;&raquo;</a>
        </div><!--text-button-->
        <div class="text-choose">
        	<h4>Choose other text</h4>
				<a id="text1" class="text-item">Text1</a>
				<a id="text2" class="text-item greenbg">Text2</a>
				<a id="text3" class="text-item yellowbg">Text3</a>
        </div><!-text-choose-->
    </div><!--main-test-->
	<div class="fr sidebar-test">
    	<ul class="employee-ul">
        	<li><label>ID Test:</label><span>352VN</span></li>
            <li><label>Employee:</label><span><b>Truong Van Hieu</b></span></li>
			<li><label>Email:</label><span><b>hieutv101@gmail.com</b></span></li>
            <li><label>Test Local:</label><span>Officer - Viet Nam</span></li>
        </ul>
        <div class="text-info">
        	<h5>Final test English skills infomation</h5>
        	<ul>
				<li>-&nbsp;Time test: 120'</li>
            	<li>-&nbsp;Include: 3 Text</li>
                <li>
					<a id="text1_" class="text-item">Text1</a>
					<a id="text2_" class="text-item greenbg">Text2</a>
					<a id="text3_" class="text-item yellowbg">Text3</a>
                </li>
            </ul>
        </div><!--text-info-->
        <div class="text-note">
        	<label>Note:</label>&nbsp; 	
			<ul>
				<li>Text which background red is not do </li>
				<li>Text which background yellow is doing </li>
				<li>Text which background green is completed</li> 	
			</ul>			
        </div><!--text-note-->
        <div class="text-finish">
        	<h5>Click to finish test.</h5>
        	<input name="" type="submit" class="btn-submit" value="Finish" />
        </div><!--text-finish-->
	</div><!--sidebar-test-->
	<?php $this->endWidget(); ?>
</div>
<script>
$(document).ready(function() {
	$('#text-content-1').show();
	var next = $('.text-content:first');
    $('a.btn-next').click(function() {
        next.hide();
		next = next.next('.text-content');
		if(next.text() == '') next = $('.text-content:first');
    	next.show();
    });
    $('a.btn-pre').click(function() {
        next.hide();
		next = next.prev('.text-content');
		if(next.text() == '') next = $('.text-content:last');
    	next.show();
    });

    $('#text1,#text1_').click(function() {
		$('#text-content-1').show();
		$('#text-content-2').hide();
		$('#text-content-3').hide();
    });
    $('#text2,#text2_').click(function() {
		$('#text-content-2').show();
		$('#text-content-1').hide();
		$('#text-content-3').hide();
    });
    $('#text3,#text3_').click(function() {
		$('#text-content-3').show();
		$('#text-content-2').hide();
		$('#text-content-1').hide();
    });
});
</script>