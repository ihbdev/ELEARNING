<!--begin page content-->
<div id="shell" class="forShell">
	<div class="fl main-test">
		<?php $form=$this->beginWidget('CActiveForm', array('method'=>'post','enableAjaxValidation'=>true, 'id'=>'add_exam')); ?>
    	<h2>Knowledge Skills</h2>
        <ul class="main-test-ul">
            <li><label>Language:</label><span><?php echo $test->catid?></span></li>
        </ul>
        <div class="today"><?php echo date('d/m/Y')?></div>
        <div class="line"></div>
        <div class="text-content">
            <h4>Section A</h4>            
            <h5><?php echo $test->content['section_a']->description?></h5>
            <div class="text-box">   
            	<?php $question_index=1;?>        	
            	<?php foreach($test->content['section_a']->questions as $question_id):?>
            	<?php $question=Question::model()->findByPk($question_id);?>            	            	
            	<div class="text-question">
                	<div class="text-title"><?php echo $question_index.'. '.$question->title;?></div>
                	<?php if($question->type == Question::TYPE_FILL):?>                	                	
                    <div class="table">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                            	<?php foreach($question->content as $index=>$content):?>
                            	<?php if($index == 0):?>
                                <tr align="center" class="table-title">
                                    <td width="30%"><p><?php echo $content?></p></td>
                                    <td width="70%"><p><?php echo $question->answer[$index]?></p></td>
                                </tr>
                                <?php else:?>
                                <tr align="center">
                                    <td><p><?php echo $content?></p></td>
                                    <td><input type="input" name="Result[<?php echo $question_id?>][<?php echo $index?>]" style="width:405px;" value=""></td>
                                </tr>
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
                                    <td width="50%"><p><?php echo chr($Char_index+$index-1).' '.$content['A']?></p></td>
                                    <td width="50%"><p><?php echo $index.' '.$content['B']?></p></td>
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
                                    <td width="14%"><label><b><?php echo chr($Char_index+$index-1)?></b></label>&nbsp;&nbsp;&nbsp;<input type="input" name="Result[<?php echo $question_id?>][<?php echo chr($Char_index+$index-1)?>]" style="width:30px;"></td>
                                    <?php endforeach;?>                                    
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--end table data-->
                    <?php elseif($question->type == Question::TYPE_WRITING):?>
                    <div class="text-check">
                    	<div><textarea name="Result[<?php echo $question_id?>]['answer']" style="width:590px; height:50px;"></textarea></div>
                    </div>                                                   
                    <?php endif;?>
                    <!--end table data-->
                </div><!--text-question-->
                <?php $question_index++;?>
                <?php endforeach;?>                
            </div><!--text-box-->
        </div><!--text-content-->
		<div class="line"></div>
		<div class="text-content">
            <h4>Section B</h4>
            <h5>Afrikaans comprehension test</h5>
            <div class="text-intro">
            	<p>Regering wil praat oor handel in renosterhoring</p>
                <p>2012/05/03 12:03:30 PM</p>
                <p>Kaapstad – Die internasionale gemeenskap sal moontlik genader word om voorstelle te bespreek oor die handel met renosterhorings.</p>
                <p>Edna Molewa, minister van omgewingsake, het dié opmerking gemaak toe sy haar departement se begroting in die parlement ter tafel gelê het.</p>
				<p>Volgens die nuutste syfers is 199 renosters al vanjaar onwettig vir hul horings doodgemaak, het Landbou.com berig.</p>
				<p>Die Krugerwildtuin is steeds die grootste teiken met 119 renosters wat daar gestroop is. Die provinsies wat die meeste geteister word, is Limpopo, Mpumalanga, Noordwes en KwaZulu-Natal.</p>
				<p>Molewa het gesê sy sal met plaaslike belanghebbendes vergader om nasionale konsensus te bereik oor voorstelle vir die Konvensie op die Internasionale Handel in Bedreigde Spesies (Cites) se vergadering wat in volgende jaar in Bangkok, Thailand, plaasvind.</p> 
				<p>Die belanghebbendes sal veral hul mening oor die oopstel van handel in die horings moet lug.</p>
            </div><!--text-intro-->
            <div class="text-box">
            	<div class="text-question">
                	<div class="text-title">1. Translate the following Afrikaans words to English as it is used in context of the text above? (7)</div>
                    <div class="table">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                                <tr align="center">
                                    <td width="30%"><p>Stroop</p></td>
                                    <td width="70%"><input type="input" name="" style="width:405px;"></td>
                                </tr>
                                <tr align="center">
                                    <td><p>Handel</p></td>
                                    <td><input type="input" name="" style="width:405px;"></td>
                                </tr>
                                <tr align="center">
                                    <td><p>Departement van Omgewingsake</p></td>
                                    <td><input type="input" name="" style="width:405px;"></td>
                                </tr>
                                <tr align="center">
                                    <td><p>Belanghebbendes</p></td>
                                    <td><input type="input" name="" style="width:405px;"></td>
                                </tr>
                                <tr align="center">
                                    <td><p>Mening</p></td>
                                    <td><input type="input" name="" style="width:405px;"></td>
                                </tr>
                                <tr align="center">
                                    <td><p>Begroting</p></td>
                                    <td><input type="input" name="" style="width:405px;"></td>
                                </tr>
                                 <tr align="center">
                                    <td><p>Onwettig</p></td>
                                    <td><input type="input" name="" style="width:405px;"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--end table data-->
                </div><!--text-question-->
                <div class="text-question">
                	<div class="text-title">2. In 2-3 short sentences, explain what the above article is about? (4)</div>
                    <div class="text-check">
                    	<div><textarea style="width:590px; height:100px;"></textarea></div>
                    </div>
                </div><!--text-question-->
            </div><!--text-box-->
        </div><!--text-content-->
        <div class="line"></div>
		<div class="text-content">
            <h4>Section C</h4>
            <h5>English comprehension test</h5>
            <div class="text-intro">
            	<h3>World Bank: Food prices on the rise again</h3>
                <p>Apr 25 2012 17:33 Reuters</p>
                <p>Washington - Global food prices are rising again, pushed higher by costlier oil, strong demand</p>
				<p>from Asia and bad weather in parts of Europe, South America and the United States, the World</p>
                <p>Bank said on Wednesday.</p>
                <p>The latest World Bank food price index showed the cost of food rose 8% between December and</p>
                <p>March. In the previous four months, prices had declined.</p>
                <p>Even after the latest rise, food prices remain 1% below a year ago and 6% below the February</p>
                <p>2011 historical peak, the World Bank said.</p>
                <p>"After four months of consecutive price declines, food prices are on the rise again, threatening the</p>
                <p>food security of millions of people," Otaviano Canuto, World Bank vice-president for poverty</p>
                <p>reduction and economic management, said in a statement.</p>
                <p>"The price indices of grains, fats and oils, and other foods all increased in each month since</p>
                <p>January 2012," the World Bank said.</p>
                <p>The international rice price declined, however, due to abundant supplies of the grain and strong</p>
                <p>competition among exporters, the poverty-fighting institution said.</p>
                <p>If current food production forecast for 2012/2013 do not materialise, global food prices could</p>
                <p>reach higher levels and required close monitoring, the World Bank cautioned.</p>
            </div><!--text-intro-->
            <div class="text-box">
            	<div class="text-question">
                	<div class="text-title">1. Identify ALL the people and companies and institutions OR organisations mentioned in the article above? (5)</div>
                    <div class="table">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                                <tr align="center">
                                    <td width="50%"><input type="input" name="" style="width:290px;"></td>
                                    <td width="50%"><input type="input" name="" style="width:290px;"></td>
                                </tr>
                                <tr align="center">
                                    <td><input type="input" name="" style="width:290px;"></td>
                                    <td><input type="input" name="" style="width:290px;"></td>
                                </tr>
                                <tr align="center">
                                    <td><input type="input" name="" style="width:290px;"></td>
                                    <td><input type="input" name="" style="width:290px;"></td>
                                </tr>
                                <tr align="center">
                                    <td><input type="input" name="" style="width:290px;"></td>
                                    <td><input type="input" name="" style="width:290px;"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--end table data-->
                </div><!--text-question-->
                <div class="text-question">
                	<div class="text-title">2. In your own words, in 2-3 short sentences, what is the above article about, with emphasis on the topics mentioned in the article? (2)</div>
                    <div class="text-check">
                    	<div><textarea style="width:590px; height:100px;"></textarea></div>
                    </div>
                </div><!--text-question-->
            </div><!--text-box-->
        </div><!--text-content-->
    </div><!--main-test-->
	<div class="fr sidebar-test">
    	<ul class="employee-ul">
    		<?php 
    		$user=User::model()->findByPk(Yii::app()->user->id);
    		?>
        	<li><label>ID Test:</label><span><?php echo $user->username?></span></li>
            <li><label>Employee:</label><span><b><?php echo $user->fullname;?></b></span></li>
			<li><label>Email:</label><span><b><?php echo $user->email;?></b></span></li>
            <li><label>Test Local:</label><span><?php echo $user->address;?></span></li>
        </ul>
        <div class="text-info">
        	<h5>Your Knowledge Skills test infomation</h5>
        	<ul>
                <li>
                	- Time: 180'</br>
					- Include: 3 Sections
                </li>
            </ul>
        </div><!--text-info-->
        <div class="text-note">
	
        </div><!--text-note-->
		 <div class="text-finish">
        	<h5>Click to finish test.</h5>
            <input name="" type="submit" class="btn-submit" value="Finish" />
        </div><!--text-finish-->
	</div><!--sidebar-test-->
	<?php $this->endWidget(); ?>
</div>