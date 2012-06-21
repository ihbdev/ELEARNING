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
                                        <td width="10%"><p>A1</p></td>
                                        <td width="10%"><p>A2</p></td>
                                        <td width="10%"><p>A3</p></td>
                                        <td width="10%"><p>A4</p></td>
                                        <td width="10%"><p>A5</p></td>
                                        <td width="10%"><p>A6</p></td>
                                    </tr>
                                    <tr align="center">
                                        <td>Q1</td>
                                        <td><p>T</p></td>
                                        <td><p>F</p></td>
                                        <td><p>F</p></td>
                                        <td><p>T</p></td>
                                        <td><p>F</p></td>
                                        <td><p>F</p></td>
                                    </tr>
                                    <tr align="center">
                                        <td>Q2</td>
                                        <td><p>T</p></td>
                                        <td><p>F</p></td>
                                        <td><p>F</p></td>
                                        <td><p>T</p></td>
                                        <td><p>F</p></td>
                                        <td><p>F</p></td>
                                    </tr>
                                    <tr align="center">
                                        <td>Q3</td>
                                        <td><p>T</p></td>
                                        <td><p>F</p></td>
                                        <td><p>F</p></td>
                                        <td><p>T</p></td>
                                        <td><p>F</p></td>
                                        <td><p>F</p></td>
                                    </tr>
                                    <tr align="center">
                                        <td>Q4</td>
                                        <td><p>T</p></td>
                                        <td><p>F</p></td>
                                        <td><p>F</p></td>
                                        <td><p>T</p></td>
                                        <td><p>F</p></td>
                                        <td><p>F</p></td>
                                    </tr>
                                    <tr align="center">
                                        <td>Q5</td>
                                        <td><p>T</p></td>
                                        <td><p>F</p></td>
                                        <td><p>F</p></td>
                                        <td><p>T</p></td>
                                        <td><p>F</p></td>
                                        <td><p>F</p></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!--table-->
                    </div>
                </div><!--testpost-box-->
                <div class="testpost-box">
					<h2>Final result:</h2>
                    <div class="row">
                        <label>Result:</label>
                        <span><b>85%</b></span>
                    </div>
                    <div class="row">
                        <label>Status:</label>
                        <span><b>Passed</b></span>
                    </div>
                </div><!--testpost-box-->
                <div class="clear"></div>
                <div class="testpost-button">
                	<span>Do you want to send result for <b>Lee Haira</b>:&nbsp;</span>
                    <input type="submit" class="button" value="Click here" style="width:100px;" />
                </div><!--testpost-button-->		
			</div>
			<!--end content testpost outer-->
			<div class="clear"></div>
			<!--end pages-->
		</div>
	</div>