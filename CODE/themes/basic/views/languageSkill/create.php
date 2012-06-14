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
                    <div class="row">
                        <label style="width:66px;"><?php echo Language::t('Language');?>:</label>
						<?php echo $form->dropDownList($test,'catid',$list_lang,array('style'=>'width:200px'));?>
                    </div>
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2><?php echo Language::t('Language Skills Title');?></h2>
                    <div class="row"><label style="width:70px;">Title:</label><input type="text" name ="" style="width:600px;"></div>
                    <div class="row"><label style="width:70px;">Content:</label><textarea style="width:600px; height:80px;"></textarea></div>
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Post Q&A Text 1</h2>
                    <div class="texttile-box">
                        <div class="row"><label style="width:70px;">Title:</label><input type="text" name ="" style="width:600px;"></div>
                        <div class="row"><label style="width:70px;">Content:</label><textarea style="width:600px; height:80px;"></textarea></div>
                    </div><!--texttile-box-->
                    <div class="language-question">
                    	<div class="text-question">
                            <div class="text-title">Q1) Insurers'rosy outlook fail to sway skeptical investors reading between the lines.</div>
                            <div class="text-check">
                                <div><label>1) Investors are forecasting rosy results for Allianz and Swiss Re.</label></div>
                                <div><label>2) Investors are not convinced by the new design of Allianz´s business report.</label></div>
                                <div class="active"><label>3) Allianz and Swiss Re cannot convince investors to read between the lines.</label></div>
                                <div><label>4) Allianz and Swiss re forecast a rosy outlook.</label></div>
                                <div><label>5) Investors aren´t convinced about Allianz´s prospects.</label></div>
                                <div><label>6) Investors are reading Allianz´s business report different from what Allianz communicates.</label></div>
                            </div>
                        </div><!--text-question-->
                        <div class="text-question">
                            <div class="text-title">Q2) Insurers'rosy outlook fail to sway skeptical investors reading between the lines.</div>
                            <div class="text-check">
                                <div><label>1) Investors are forecasting rosy results for Allianz and Swiss Re.</label></div>
                                <div><label>2) Investors are not convinced by the new design of Allianz´s business report.</label></div>
                                <div class="active"><label>3) Allianz and Swiss Re cannot convince investors to read between the lines.</label></div>
                                <div><label>4) Allianz and Swiss re forecast a rosy outlook.</label></div>
                                <div><label>5) Investors aren´t convinced about Allianz´s prospects.</label></div>
                                <div><label>6) Investors are reading Allianz´s business report different from what Allianz communicates.</label></div>
                            </div>
                        </div><!--text-question-->
                    	<div class="q-post">
                        	<div class="row"><h3>Question</h3></div>
                        	<div class="row"><label style="width:70px;">Title:</label><textarea style="width:600px; height:80px;"></textarea></div>
                            <div class="row"><label style="width:70px;">Input file:</label><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A1:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A2:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A3:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A4:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A5:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A6:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <br />
                            <div class="row"><label style="width:70px;">&nbsp;</label><input type="submit" class="button" value="Add question" style="width:100px;" /></div>
                        </div><!--q-post-->
                    </div><!--language-question-->	
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Post Q&A Text 2</h2>
                    <div class="texttile-box">
                        <div class="row"><label style="width:70px;">Title:</label><input type="text" name ="" style="width:600px;"></div>
                        <div class="row"><label style="width:70px;">Content:</label><textarea style="width:600px; height:80px;"></textarea></div>
                    </div><!--texttile-box-->
                    <div class="language-question">
                    	<div class="text-question">
                            <div class="text-title">Q1) Insurers'rosy outlook fail to sway skeptical investors reading between the lines.</div>
                            <div class="text-check">
                                <div><label>1) Investors are forecasting rosy results for Allianz and Swiss Re.</label></div>
                                <div><label>2) Investors are not convinced by the new design of Allianz´s business report.</label></div>
                                <div class="active"><label>3) Allianz and Swiss Re cannot convince investors to read between the lines.</label></div>
                                <div><label>4) Allianz and Swiss re forecast a rosy outlook.</label></div>
                                <div><label>5) Investors aren´t convinced about Allianz´s prospects.</label></div>
                                <div><label>6) Investors are reading Allianz´s business report different from what Allianz communicates.</label></div>
                            </div>
                        </div><!--text-question-->
                        <div class="text-question">
                            <div class="text-title">Q2) Insurers'rosy outlook fail to sway skeptical investors reading between the lines.</div>
                            <div class="text-check">
                                <div><label>1) Investors are forecasting rosy results for Allianz and Swiss Re.</label></div>
                                <div><label>2) Investors are not convinced by the new design of Allianz´s business report.</label></div>
                                <div class="active"><label>3) Allianz and Swiss Re cannot convince investors to read between the lines.</label></div>
                                <div><label>4) Allianz and Swiss re forecast a rosy outlook.</label></div>
                                <div><label>5) Investors aren´t convinced about Allianz´s prospects.</label></div>
                                <div><label>6) Investors are reading Allianz´s business report different from what Allianz communicates.</label></div>
                            </div>
                        </div><!--text-question-->
                    	<div class="q-post">
                        	<div class="row"><h3>Question</h3></div>
                        	<div class="row"><label style="width:70px;">Title:</label><textarea style="width:600px; height:80px;"></textarea></div>
                            <div class="row"><label style="width:70px;">Input file:</label><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A1:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A2:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A3:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A4:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A5:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A6:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <br />
                            <div class="row"><label style="width:70px;">&nbsp;</label><input type="submit" class="button" value="Add question" style="width:100px;" /></div>
                        </div><!--q-post-->
                    </div><!--language-question-->	
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Post Q&A Text 3</h2>
                    <div class="texttile-box">
                        <div class="row"><label style="width:70px;">Title:</label><input type="text" name ="" style="width:600px;"></div>
                        <div class="row"><label style="width:70px;">Content:</label><textarea style="width:600px; height:80px;"></textarea></div>
                    </div><!--texttile-box-->
                    <div class="language-question">
                    	<div class="text-question">
                            <div class="text-title">Q1) Insurers'rosy outlook fail to sway skeptical investors reading between the lines.</div>
                            <div class="text-check">
                                <div><label>1) Investors are forecasting rosy results for Allianz and Swiss Re.</label></div>
                                <div><label>2) Investors are not convinced by the new design of Allianz´s business report.</label></div>
                                <div class="active"><label>3) Allianz and Swiss Re cannot convince investors to read between the lines.</label></div>
                                <div><label>4) Allianz and Swiss re forecast a rosy outlook.</label></div>
                                <div><label>5) Investors aren´t convinced about Allianz´s prospects.</label></div>
                                <div><label>6) Investors are reading Allianz´s business report different from what Allianz communicates.</label></div>
                            </div>
                        </div><!--text-question-->
                        <div class="text-question">
                            <div class="text-title">Q2) Insurers'rosy outlook fail to sway skeptical investors reading between the lines.</div>
                            <div class="text-check">
                                <div><label>1) Investors are forecasting rosy results for Allianz and Swiss Re.</label></div>
                                <div><label>2) Investors are not convinced by the new design of Allianz´s business report.</label></div>
                                <div class="active"><label>3) Allianz and Swiss Re cannot convince investors to read between the lines.</label></div>
                                <div><label>4) Allianz and Swiss re forecast a rosy outlook.</label></div>
                                <div><label>5) Investors aren´t convinced about Allianz´s prospects.</label></div>
                                <div><label>6) Investors are reading Allianz´s business report different from what Allianz communicates.</label></div>
                            </div>
                        </div><!--text-question-->
                    	<div class="q-post">
                        	<div class="row"><h3>Question</h3></div>
                        	<div class="row"><label style="width:70px;">Title:</label><textarea style="width:600px; height:80px;"></textarea></div>
                            <div class="row"><label style="width:70px;">Input file:</label><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A1:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A2:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A3:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A4:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A5:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <div class="row"><label style="width:30px;">A6:</label><input name="" type="checkbox" value="" /><input type="text" name ="" style="width: 600px;"></div>
                            <br />
                            <div class="row"><label style="width:70px;">&nbsp;</label><input type="submit" class="button" value="Add question" style="width:100px;" /></div>
                        </div><!--q-post-->
                    </div><!--language-question-->	
                </div><!--testpost-box-->
                <div class="testpost-button"><label style="width:140px;">Click here to finish:</label><input type="submit" class="big-button" value="Finish" style="width:100px;" /></div>		
			</div>
			<!--end content testpost outer-->
			<div class="clear"></div>
			<!--end pages-->
			<?php $this->endWidget(); ?>
		</div>
	</div>
	<!--end inside content-->