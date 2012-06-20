	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1>Administrator</h1>
			<div class="header-menu">
				<ul>
					<li class="ex-show"><a class="activities-icon" href=""><span>Knowledge Skills</span></a></li>
				</ul>
			</div>
		</div>
		<!--end title-->
		<div class="folder-content">
		<?php $form=$this->beginWidget('CActiveForm', array('method'=>'post','enableAjaxValidation'=>true, 'id'=>'add_test')); ?>
            <div class="testpost-outer">
            <?php
    			foreach(Yii::app()->user->getFlashes() as $key => $message) {
        			echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
    			}
			?>
            	<div class="testpost-box">
					<h2>Language</h2>
					<?php echo $form->dropDownList($test,'catid',array('Western Europe'=>'-Western Europe-','Eastern Europe'=>'-Eastern Europe-','ZA'=>'- ZA -','Vietnam'=>'- Vietnam -','USA'=>'- USA -'),array('style'=>'width:200px;')); ?>
                    <?php echo $form->error($test, 'catid'); ?>
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Write part</h2>
                    <input type="text" name="" style="width:155px;" value="Section A">
                    <br /><br />
                    <textarea name="section_a[description]" style="width:620px; height:150px;">Section A description</textarea>                    
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Add quetions</h2>
                    <div class="markingup-question">
                    	<div class="text-box" style="width:640px;">
                            <div class="text-question">                              
                                <div class="text-title" style="display:none;"><input type="text" name ="section_a[questions][1][type]" value="5"></div>
                                <div class="text-title">1.&nbsp;&nbsp;<textarea name="section_a[questions][1][title]" style="width:592px; height:35px;">What do the following acronyms mean (write their full name)? (5)</textarea></div>
                                <div class="table">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                            <tr align="center" class="table-title">                                                
                                                <td width="30%"><p><input type="text" name ="section_a[questions][1][content][0]" value="Acronym"></p></td>                                
                                                <td width="70%"><p><input type="text" name ="section_a[questions][1][answer][0]" value="Full Name"></p></td>
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_a[questions][1][content][1]" style="width:155px;" value="TRC"></td>
                                                <td><input type="text" name="section_a[questions][1][answer][1]" style="width:405px;" value="Truth & Reconciliation Committee"></td>
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_a[questions][1][content][2]" style="width:155px;" value="WHO"></td>
                                                <td><input type="text" name="section_a[questions][1][answer][2]" style="width:405px;"></td>
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_a[questions][1][content][3]" style="width:155px;" value="SABS"></td>
                                                <td><input type="text" name="section_a[questions][1][answer][3]" style="width:405px;"></td>
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_a[questions][1][content][4]" style="width:155px;" value="UN"></td>
                                                <td><input type="text" name="section_a[questions][1][answer][4]" style="width:405px;"></td>
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_a[questions][1][content][5]" style="width:155px;" value="GDP"></td>
                                                <td><input type="text" name="section_a[questions][1][answer][5]" style="width:405px;" value="Gross Domestic Product"></td>
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_a[questions][1][content][6]" style="width:155px;" value="VAT"></td>
                                                <td><input type="text" name="section_a[questions][1][answer][6]" style="width:405px;"></td>
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_a[questions][1][content][7]" style="width:155px;" value="CFO"></td>
                                                <td><input type="text" name="section_a[questions][1][answer][7]" style="width:405px;"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!--end table data-->
                            </div><!--text-question-->
                            <div class="text-question">
                            	<div class="text-title" style="display:none;"><input type="text" name ="section_a[questions][2][type]" value="5"></div>
                            	<div class="text-title">2.&nbsp;&nbsp;<textarea name="section_a[questions][2][title]" style="width:592px; height:35px;">Who is? (5)</textarea></div>                                
                                <div class="table">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                            <tr align="center" class="table-title">
                                            	<td width="30%"><p><input type="text" name ="section_a[questions][2][content][0]" value="Name"></p></td>                                
                                                <td width="70%"><p><input type="text" name ="section_a[questions][2][answer][0]" value="Title"></p></td>                                                
                                            </tr>
                                            <tr align="center">
                                            	<td><input type="text" name="section_a[questions][2][content][1]" style="width:155px;" value="Jaco Maree"></td>
                                                <td><input type="text" name="section_a[questions][2][answer][1]" style="width:405px;" value="Chief Executive – Standard Bank"></td>                                                
                                            </tr>
                                            <tr align="center">
                                            	<td><input type="text" name="section_a[questions][2][content][2]" style="width:155px;" value="Anders Behring Breivik"></td>
                                                <td><input type="text" name="section_a[questions][2][answer][2]" style="width:405px;" value=""></td>                                                
                                            </tr>
                                            <tr align="center">
                                            	<td><input type="text" name="section_a[questions][2][content][3]" style="width:155px;" value="Jim Yong Kim"></td>
                                                <td><input type="text" name="section_a[questions][2][answer][3]" style="width:405px;" value=""></td>                                                                                             
                                            </tr>
                                            <tr align="center">
                                            	<td><input type="text" name="section_a[questions][2][content][4]" style="width:155px;" value="Gwede Mantashe"></td>
                                                <td><input type="text" name="section_a[questions][2][answer][4]" style="width:405px;" value=""></td>                                                 
                                            </tr>
                                            <tr align="center">
                                            	<td><input type="text" name="section_a[questions][2][content][5]" style="width:155px;" value="Oscar Pistorius"></td>
                                                <td><input type="text" name="section_a[questions][2][answer][5]" style="width:405px;" value=""></td>                                                
                                            </tr>
                                            <tr align="center">
                                            	<td><input type="text" name="section_a[questions][2][content][6]" style="width:155px;" value="Maria Ramos"></td>
                                                <td><input type="text" name="section_a[questions][2][answer][6]" style="width:405px;" value=""></td>                                                
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!--end table data-->
                            </div><!--text-question-->
                            <div class="text-question">
                            	<div class="text-title" style="display:none;"><input type="text" name ="section_a[questions][3][type]" value="5"></div>
                            	<div class="text-title">3.&nbsp;&nbsp;<textarea name="section_a[questions][3][title]" style="width:592px; height:35px;">Name the leader of the organization/political party: (3)</textarea></div>                                
                                <div class="table">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                            <tr align="center" class="table-title">
                                            	<td><input type="text" name="section_a[questions][3][content][0]" style="width:155px;" value="Political Party"></td>
                                                <td><input type="text" name="section_a[questions][3][answer][0]" style="width:405px;" value="Party Leader"></td>                                                
                                            </tr>
                                            <tr align="center">
                                            	<td><input type="text" name="section_a[questions][3][content][1]" style="width:155px;" value="ANC"></td>
                                                <td><input type="text" name="section_a[questions][3][answer][1]" style="width:405px;" value="Jacob Zuma"></td>                                                  
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_a[questions][3][content][2]" style="width:155px;" value=""></td>
                                                <td><input type="text" name="section_a[questions][3][answer][2]" style="width:405px;" value="Helen Zille"></td>                                                 
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_a[questions][3][content][3]" style="width:155px;" value="UDM"></td>
                                                <td><input type="text" name="section_a[questions][3][answer][3]" style="width:405px;" value=""></td>                                                
                                            </tr>                                            
                                            <tr align="center">
                                                <td><input type="text" name="section_a[questions][3][content][3]" style="width:155px;" value=""></td>
                                                <td><input type="text" name="section_a[questions][3][answer][3]" style="width:405px;" value="Pieter Mulder"></td>                                                
                                            </tr>                                            
                                        </tbody>
                                    </table>
                                </div>
                                <!--end table data-->
                            </div><!--text-question-->
                            <div class="text-question">
                            	<div class="text-title" style="display:none;"><input type="text" name ="section_a[questions][4][type]" value="5"></div>
                            	<div class="text-title">4.&nbsp;&nbsp;<textarea name="section_a[questions][4][title]" style="width:592px; height:35px;">Name two  SA companies for each of the following: (8)</textarea></div>                                
                                <div class="text-check">
                                    <div><input type="text" name="section_a[questions][4][content][0]" style="width:590px;" value="Airlines"><textarea name="section_a[questions][4][answer][0]" style="width:592px; height:35px;"></textarea></div>
                                    <div><input type="text" name="section_a[questions][4][content][1]" style="width:590px;" value="Mining"><textarea name="section_a[questions][4][answer][1]" style="width:592px; height:35px;"></textarea></div>
                                    <div><input type="text" name="section_a[questions][4][content][2]" style="width:590px;" value="Telecommunications"><textarea name="section_a[questions][4][answer][2]" style="width:592px; height:35px;"></textarea></div>                                    
                                    <div><input type="text" name="section_a[questions][4][content][3]" style="width:590px;" value="Retailers"><textarea name="section_a[questions][4][answer][3]" style="width:592px; height:35px;"></textarea></div>                                                                                                            
                                </div>
                            </div><!--text-question-->
                            <div class="text-question">
                            	<div class="text-title" style="display:none;"><input type="text" name ="section_a[questions][5][type]" value="5"></div>
                            	<div class="text-title">5.&nbsp;&nbsp;<textarea name="section_a[questions][5][title]" style="width:592px; height:35px;">Complete the following companies / industries: (6)</textarea></div>                                
                                <div class="table">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                            <tr align="center" class="table-title">
                                                <td width="30%"><input type="text" name="section_a[questions][5][content][0]" style="width:155px;" value="Company"></td>
                                                <td width="70%"><input type="text" name="section_a[questions][5][answer][0]" style="width:405px;" value="Industry"></td>                                                
                                            </tr>
                                            <tr align="center">
                                            	<td><input type="text" name="section_a[questions][5][content][1]" style="width:155px;" value="ABSA"></td>
                                                <td><input type="text" name="section_a[questions][5][answer][1]" style="width:405px;" value="Banking"></td>                                                
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_a[questions][5][content][2]" style="width:155px;" value="Massmart"></td>
                                                <td><input type="text" name="section_a[questions][5][answer][2]" style="width:405px;" value=""></td>                                                
                                            </tr>
                                             <tr align="center">
                                                <td><input type="text" name="section_a[questions][5][content][3]" style="width:155px;" value=""></td>
                                                <td><input type="text" name="section_a[questions][5][answer][3]" style="width:405px;" value=""></td>                                                    
                                            </tr>
                                             <tr align="center">
                                             	<td><input type="text" name="section_a[questions][5][content][4]" style="width:155px;" value="Anglo American"></td>
                                                <td><input type="text" name="section_a[questions][5][answer][4]" style="width:405px;" value=""></td>                                                    
                                            </tr>
                                            <tr align="center">
                                            	<td><input type="text" name="section_a[questions][5][content][5]" style="width:155px;" value=""></td>
                                                <td><input type="text" name="section_a[questions][5][answer][5]" style="width:405px;" value="Private hospital group"></td>                                                  
                                            </tr>
                                            <tr align="center">
                                            	<td><input type="text" name="section_a[questions][5][content][5]" style="width:155px;" value="Capitec"></td>
                                                <td><input type="text" name="section_a[questions][5][answer][5]" style="width:405px;" value=""></td>                                                
                                            </tr>
                                            <tr align="center">
                                            	<td><input type="text" name="section_a[questions][5][content][5]" style="width:155px;" value="Daihatsu"></td>
                                                <td><input type="text" name="section_a[questions][5][answer][5]" style="width:405px;" value=""></td>                                                                                                 
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!--end table data-->
                            </div><!--text-question-->
                            <div class="text-question">
                            	<div class="text-title" style="display:none;"><input type="text" name ="section_a[questions][6][type]" value="5"></div>
                            	<div class="text-title">6.&nbsp;&nbsp;<textarea name="section_a[questions][6][title]" style="width:592px; height:35px;">What 'nationality' are the following companies? (eg Ford – USA)? (4)</textarea></div>                                
                                <div class="table">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                            <tr align="center">
                                            	<td width="30%"><input type="text" name="section_a[questions][6][content][0]" style="width:155px;" value="De Beers"></td>
                                                <td width="70%"><input type="text" name="section_a[questions][6][answer][0]" style="width:405px;" value=""></td>                                                
                                            </tr>
                                            <tr align="center">
                                            	<td><input type="text" name="section_a[questions][5][content][1]" style="width:155px;" value="BP"></td>
                                                <td><input type="text" name="section_a[questions][5][answer][1]" style="width:405px;" value=""></td>                                                                                           
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_a[questions][5][content][2]" style="width:155px;" value="Tata"></td>
                                                <td><input type="text" name="section_a[questions][5][answer][2]" style="width:405px;" value=""></td>                                                
                                            </tr>
                                            <tr align="center">
                                            	<td><input type="text" name="section_a[questions][5][content][3]" style="width:155px;" value="Walmart"></td>
                                                <td><input type="text" name="section_a[questions][5][answer][3]" style="width:405px;" value=""></td>                                              
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!--end table data-->
                            </div><!--text-question-->
                            <div class="text-question">
                            	<div class="text-title" style="display:none;"><input type="text" name ="section_a[questions][7][type]" value="7"></div>
                            	<div class="text-title">7.&nbsp;&nbsp;<textarea name="section_a[questions][7][title]" style="width:592px; height:35px;">Name all the BRICS member countries (5)</textarea></div>                                
                                <div class="table">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                            <tr align="center">
                                            	<td width="50%"><input type="text" name="section_a[questions][7][content][0]" style="width:290px;" value=""></td>
                                                <td width="50%"><input type="text" name="section_a[questions][7][content][1]" style="width:290px;" value=""></td>                                                
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_a[questions][7][content][2]" style="width:290px;" value="Walmart"></td>
                                                <td><input type="text" name="section_a[questions][7][content][3]" style="width:290px;" value=""></td>
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_a[questions][7][content][4]" style="width:290px;"></td>
                                                <td><input type="text" name="section_a[questions][7][content][5]" style="width:290px;"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!--end table data-->
                            </div><!--text-question-->
                            <div class="text-question">
                            	<div class="text-title" style="display:none;"><input type="text" name ="section_a[questions][8][type]" value="7"></div>
                            	<div class="text-title">8.&nbsp;&nbsp;<textarea name="section_a[questions][8][title]" style="width:592px; height:35px;">List a few non-political examples of stories that have made headlines recently (e.g. the London Olympics) (6)</textarea></div>                                
                                <div class="text-check">
                                    <div><textarea name="section_a[questions][8][content]"style="width:590px; height:50px;"></textarea></div>
                                </div>
                            </div><!--text-question-->
                            <div class="text-question">
                            	<div class="text-title" style="display:none;"><input type="text" name ="section_a[questions][9][type]" value="6"></div>
                            	<div class="text-title">9.&nbsp;&nbsp;<textarea name="section_a[questions][9][title]" style="width:592px; height:35px;">Link the currencies to their respective countries? (only write down the matching number next to the letter eg F9) (3)</textarea></div>                                
                                <div class="table">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                            <tr align="center">
                                                <td width="50%">A.&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][content][A]" style="width:90px;" value="United States"></td>
                                                <td width="50%">1.&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][content][1]" style="width:90px;" value="Naira"></td>
                                            </tr>
                                            <tr align="center">
                                                <td>B.&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][content][B]" style="width:90px;" value="China"></td>
                                                <td>2.&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][content][2]" style="width:90px;" value="Euro"></td>
                                            </tr>
                                            <tr align="center">
                                                <td>C.&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][content][C]" style="width:90px;" value="Belguim"></td>
                                                <td>3.&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][content][3]" style="width:90px;" value="Dollar"></td>
                                            </tr>
                                            <tr align="center">
                                                <td>D.&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][content][D]" style="width:90px;" value="England"></td>
                                                <td>4.&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][content][4]" style="width:90px;" value="Yen"></td>
                                            </tr>
                                            <tr align="center">
                                                <td>E.&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][content][E]" style="width:90px;" value="Nigeria"></td>
                                                <td>5.&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][content][5]" style="width:90px;" value="Dinar"></td>
                                            </tr>
                                            <tr align="center">
                                                <td>F.&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][content][F]" style="width:90px;" value="Japan"></td>
                                                <td>6.&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][content][6]" style="width:90px;" value="Pound"></td>
                                            </tr>
                                            <tr align="center">
                                                <td>G.&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][content][G]" style="width:90px;" value="Palestine"></td>
                                                <td>7.&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][content][7]" style="width:90px;" value="Yuan"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!--end table data-->
                                <div class="table">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                            <tr align="center">
                                                <td width="14%"><label><b>A</b></label>&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][answer][A]" style="width:30px;"></td>
                                                <td width="14%"><label><b>B</b></label>&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][answer][B]" style="width:30px;"></td>
                                                <td width="14%"><label><b>C</b></label>&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][answer][C]" style="width:30px;"></td>
                                                <td width="14%"><label><b>D</b></label>&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][answer][D]" style="width:30px;"></td>
                                                <td width="14%"><label><b>E</b></label>&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][answer][E]" style="width:30px;"></td>
                                                <td width="14%"><label><b>F</b></label>&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][answer][F]" style="width:30px;"></td>
                                                <td width="14%"><label><b>G</b></label>&nbsp;&nbsp;&nbsp;<input type="text" name="section_a[questions][9][answer][G]" style="width:30px;"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!--end table data-->
                            </div><!--text-question-->
                            <div class="text-question">
                            	<div class="text-title" style="display:none;"><input type="text" name ="section_a[questions][10][type]" value="7"></div>
                            	<div class="text-title">10.&nbsp;&nbsp;<textarea name="section_a[questions][10][title]" style="width:592px; height:35px;">List a few political examples of stories that have made headlines recently (4)</textarea></div>                                
                                <div class="text-check">
                                    <div><textarea name="section_a[questions][10][content][0]" style="width:590px; height:50px;"></textarea></div>
                                </div>
                            </div><!--text-question-->
                            <div class="text-question">
                            	<div class="text-title" style="display:none;"><input type="text" name ="section_a[questions][11][type]" value="7"></div>
                            	<div class="text-title">11.&nbsp;&nbsp;<textarea name="section_a[questions][11][title]" style="width:592px; height:35px;">Who is the Parliamentary Leader for the Democratic Alliance (DA)? (1)</textarea></div>                                
                                <div class="text-check">
                                    <div><textarea name="section_a[questions][11][content][0]" style="width:590px; height:50px;"></textarea></div>
                                </div>
                            </div><!--text-question-->
                            <div class="text-question">
                            	<div class="text-title" style="display:none;"><input type="text" name ="section_a[questions][12][type]" value="7"></div>
                                <div class="text-title">12.&nbsp;&nbsp;<textarea name="section_a[questions][12][title]" style="width:592px; height:35px;">Which statutory body is responsible for the official statistics in SA such as e.g. official unemployment figures, or GDP growth rate or CPIX inflation numbers? (1)</textarea></div>                                
                                <div class="text-check">
                                    <div><textarea name="section_a[questions][12][content][0]" style="width:590px; height:50px;"></textarea></div>
                                </div>
                            </div><!--text-question-->
                            <div class="text-question">
                                <div class="text-title">13.&nbsp;&nbsp;<textarea name="section_a[questions][13][title]" style="width:592px; height:35px;">Who/what sets the interest rates for South Africa? (1)</textarea></div>                                
                                <div class="text-check">
                                    <div><textarea name="section_a[questions][13][content][0]" style="width:590px; height:50px;"></textarea></div>
                                </div>
                            </div><!--text-question-->
                            <div class="text-question">
                            	<div class="text-title" style="display:none;"><input type="text" name ="section_a[questions][14][type]" value="7"></div>
                                <div class="text-title">14.&nbsp;&nbsp;<textarea name="section_a[questions][14][title]" style="width:592px; height:35px;">Name as many South African State-owned companies as possible? (Bonus)</textarea></div>                                
                                <div class="text-check">
                                    <div><textarea name="section_a[questions][14][content][0]" style="width:590px; height:50px;"></textarea></div>
                                </div>
                            </div><!--text-question-->
                            <div class="text-question">
                            	<div class="text-title" style="display:none;"><input type="text" name ="section_a[questions][15][type]" value="7"></div>
                            	<div class="text-title">15.&nbsp;&nbsp;<textarea name="section_a[questions][15][title]" style="width:592px; height:35px;">Which SA company has been strongly associated with Walmart (1)</textarea></div>                                
                                <div class="table">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                            <tr align="center">
                                            	<td width="50%"><input type="text" name="section_a[questions][15][content][0]" style="width:290px;"></td>
                                                <td width="50%"><input type="text" name="section_a[questions][15][content][1]" style="width:290px;"></td>                                                
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_a[questions][15][content][2]" style="width:290px;"></td>
                                                <td><input type="text" name="section_a[questions][15][content][3]" style="width:290px;"></td>
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_a[questions][15][content][4]" style="width:290px;"></td>
                                                <td><input type="text" name="section_a[questions][15][content][5]" style="width:290px;"></td>
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_a[questions][15][content][6]" style="width:290px;"></td>
                                                <td><input type="text" name="section_a[questions][15][content][7]" style="width:290px;"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!--end table data-->
                            </div><!--text-question-->
                            <div class="text-question">
                            	<div class="text-title" style="display:none;"><input type="text" name ="section_a[questions][16][type]" value="7"></div>
                            	<div class="text-title">16.&nbsp;&nbsp;<textarea name="section_a[questions][16][title]" style="width:592px; height:35px;">What is Naspers? (1)</textarea></div>                                
                                <div class="text-check">
                                    <div><textarea name="section_a[questions][16][content][0]" style="width:590px; height:50px;"></textarea></div>
                                </div>
                            </div><!--text-question-->
                            <div class="text-question">
                            	<div class="text-title" style="display:none;"><input type="text" name ="section_a[questions][17][type]" value="5"></div>
                                <div class="text-title">17.&nbsp;&nbsp;<textarea name="section_a[questions][17][title]" style="width:592px; height:35px;">What is the core business of the following companies: (3)</textarea></div>                                
                                <div class="text-check">
                                    <div><input type="text" name="section_a[questions][17][content][0]" style="width:590px;" value="Transnet"><textarea name="section_a[questions][17][answer][0]" style="width:590px; height:35px;"></textarea></div>
                                    <div><input type="text" name="section_a[questions][17][content][1]" style="width:590px;" value="ArcelorMittal"><textarea name="section_a[questions][17][answer][1]" style="width:590px; height:35px;"></textarea></div>
                                    <div><input type="text" name="section_a[questions][17][content][2]" style="width:590px;" value="OUTsurance"><textarea name="section_a[questions][17][answer][2]" style="width:590px; height:35px;"></textarea></div>
                                    <div><input type="text" name="section_a[questions][17][content][3]" style="width:590px;" value="Avis"><textarea name="section_a[questions][17][answer][3]" style="width:590px; height:35px;"></textarea></div>
                                </div>
                            </div><!--text-question-->
                        </div><!--text-box-->
                    </div><!--markingup-question-->	
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Write part</h2>
                    <input type="text" name="" style="width:155px;" value="Section B">
                    <br /><br />
                    <textarea name="materials[B]" style="width:620px; height:150px;">
Regering wil praat oor handel in renosterhoring
2012/05/03 12:03:30 PM
Kaapstad – Die internasionale gemeenskap sal moontlik genader word om voorstelle te bespreek oor die handel met renosterhorings.
Edna Molewa, minister van omgewingsake, het dié opmerking gemaak toe sy haar departement se begroting in die parlement ter tafel gelê het.
Volgens die nuutste syfers is 199 renosters al vanjaar onwettig vir hul horings doodgemaak, het Landbou.com berig.
Die Krugerwildtuin is steeds die grootste teiken met 119 renosters wat daar gestroop is. Die provinsies wat die meeste geteister word, is Limpopo, Mpumalanga, Noordwes en KwaZulu-Natal.
Molewa het gesê sy sal met plaaslike belanghebbendes vergader om nasionale konsensus te bereik oor voorstelle vir die Konvensie op die Internasionale Handel in Bedreigde Spesies (Cites) se vergadering wat in volgende jaar in Bangkok, Thailand, plaasvind. 
Die belanghebbendes sal veral hul mening oor die oopstel van handel in die horings moet lug.
                    </textarea>
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Add quetions</h2>
                    <div class="markingup-question">
                    	<div class="text-box" style="width:640px;">
                        	<div class="text-question">
                        		<div class="text-title" style="display:none;"><input type="text" name ="section_b[questions][1][type]" value="5"></div>
                                <div class="text-title">1.&nbsp;&nbsp;<textarea name="section_b[questions][1][title]" style="width:592px; height:35px;">Translate the following Afrikaans words to English as it is used in context of the text above? (7)</textarea></div>
                                <div class="table">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                            <tr align="center">
                                            	<td width="30%"><input type="text" name="section_b[questions][1][content][0]" style="width:155px;"></td>
                                                <td width="70%"><input type="text" name="section_b[questions][1][answer][0]" style="width:405px;"></td>                                                
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_b[questions][1][content][1]" style="width:155px;" value="Handel"></td>
                                                <td><input type="text" name="section_b[questions][1][answer][1]" style="width:405px;"></td>
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_b[questions][1][content][2]" style="width:155px;" value="Departement van Omgewingsake"></td>
                                                <td><input type="text" name="section_b[questions][1][answer][2]" style="width:405px;"></td>
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_b[questions][1][content][3]" style="width:155px;" value="Belanghebbendes"></td>
                                                <td><input type="text" name="section_b[questions][1][answer][3]" style="width:405px;"></td>
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_b[questions][1][content][4]" style="width:155px;" value="Mening"></td>
                                                <td><input type="text" name="section_b[questions][1][answer][4]" style="width:405px;"></td>
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_b[questions][1][content][5]" style="width:155px;" value="Begroting"></td>
                                                <td><input type="text" name="section_b[questions][1][answer][5]" style="width:405px;"></td>
                                            </tr>
                                             <tr align="center">
                                                <td><input type="text" name="section_b[questions][1][content][6]" style="width:155px;" value="Onwettig"></td>
                                                <td><input type="text" name="section_b[questions][1][answer][6]" style="width:405px;"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!--end table data-->
                            </div><!--text-question-->
                            <div class="text-question">
                            	<div class="text-title" style="display:none;"><input type="text" name ="section_b[questions][2][type]" value="7"></div>
                            	<div class="text-title">2.&nbsp;&nbsp;<textarea name="section_b[questions][2][title]" style="width:592px; height:35px;">In 2-3 short sentences, explain what the above article is about? (4)</textarea></div>                                
                                <div class="text-check">
                                    <div><textarea name="section_b[questions][2][answer][0]" style="width:590px; height:100px;"></textarea></div>
                                </div>
                            </div><!--text-question-->
                        </div><!--text-box-->
                    </div><!--markingup-question-->	
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Write part</h2>
                    <input type="text" name="" style="width:155px;" value="Section c">
                    <br /><br />
                    <textarea name="materials[C]" style="width:620px; height:150px;">
World Bank: Food prices on the rise again
Apr 25 2012 17:33 Reuters
Washington - Global food prices are rising again, pushed higher by costlier oil, strong demand
from Asia and bad weather in parts of Europe, South America and the United States, the World
Bank said on Wednesday.
The latest World Bank food price index showed the cost of food rose 8% between December and
March. In the previous four months, prices had declined.
Even after the latest rise, food prices remain 1% below a year ago and 6% below the February
2011 historical peak, the World Bank said.
"After four months of consecutive price declines, food prices are on the rise again, threatening the
food security of millions of people," Otaviano Canuto, World Bank vice-president for poverty
reduction and economic management, said in a statement.
"The price indices of grains, fats and oils, and other foods all increased in each month since
January 2012," the World Bank said.
The international rice price declined, however, due to abundant supplies of the grain and strong
competition among exporters, the poverty-fighting institution said.
If current food production forecast for 2012/2013 do not materialise, global food prices could
reach higher levels and required close monitoring, the World Bank cautioned.
                    </textarea>
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Add quetions</h2>
                    <div class="markingup-question">
                    	<div class="text-box" style="width:640px;">
                        	<div class="text-question">
                        		<div class="text-title" style="display:none;"><input type="text" name ="section_c[questions][1][type]" value="7"></div>
                        		<div class="text-title">1.&nbsp;&nbsp;<textarea name="section_c[questions][1][title]" style="width:592px; height:35px;">Identify ALL the people and companies and institutions OR organisations mentioned in the article above? (5)</textarea></div>                                
                                <div class="table">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                            <tr align="center">
                                            	<td width="50%"><input type="text" name="section_c[questions][1][content][0]" style="width:290px;"></td>
                                                <td width="50%"><input type="text" name="section_c[questions][1][answer][0]" style="width:290px;"></td>                                
                                            </tr>
                                            <tr align="center">
                                                <td><input type="text" name="section_c[questions][1][content][1]" style="width:290px;" value=""></td>
                                                <td><input type="text" name="section_c[questions][1][answer][1]" style="width:290px;"></td>                                                                                            
                                            </tr>
                                            <tr align="center">
                                            	<td><input type="text" name="section_c[questions][1][content][2]" style="width:290px;" value=""></td>
                                                <td><input type="text" name="section_c[questions][1][answer][2]" style="width:290px;"></td>                                                
                                            </tr>
                                            <tr align="center">
                                            	<td><input type="text" name="section_c[questions][1][content][3]" style="width:290px;" value=""></td>
                                                <td><input type="text" name="section_c[questions][1][answer][3]" style="width:290px;"></td>                                                     
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!--end table data-->
                            </div><!--text-question-->
                            <div class="text-question">
                            	<div class="text-title" style="display:none;"><input type="text" name ="section_c[questions][2][type]" value="7"></div>
                            	<div class="text-title">2.&nbsp;&nbsp;<textarea name="section_c[questions][2][title]" style="width:592px; height:35px;">In your own words, in 2-3 short sentences, what is the above article about, with emphasis on the topics mentioned in the article? (2)</textarea></div>                                
                                <div class="text-check">
                                    <div><textarea name="section_c[questions][2][answer][0]"style="width:590px; height:100px;"></textarea></div>
                                </div>
                            </div><!--text-question-->
                        </div><!--text-box-->
                    </div><!--markingup-question-->	
                </div><!--testpost-box-->                
                <div class="testpost-button"><label style="width:140px;">Click here to finish:</label><input type="submit" class="big-button" value="Finish" style="width:100px;" /></div>		
			</div>
			<!--end content testpost outer-->
			<div class="clear"></div>
			<!--end pages-->
			<?php $this->endWidget(); ?>
		</div>
	</div>