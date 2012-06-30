	<!--begin inside content-->
	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1><?php echo Language::t('List training document');?></h1>
			<div class="header-menu">
				<ul>
					<li class="ex-show"><a class="activities-icon" href=""><span><?php echo Language::t('List test Knowledge Skills');?></span></a></li>
				</ul>
			</div>
		</div>
		<!--end title-->
		<div class="folder-content">                      
            <div class="testpost-outer">
            	<div class="testpost-box">					                                                             
                    <div class="row">
                        <div class="table">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tbody>
                                    <tr align="center" class="table-title">                                        
                                        <td width="35%"><p>Document Name</p></td>
                                        <td width="15%"><p>Description</p></td>
                                        <td width="15%"><p>Use for</p></td>                                                                               
                                        <td width="10%"><p>Edit</p></td>
                                        <td width="10%"><p>View</p></td>
                                    </tr>
                                    <tr align="center">                                        
                                        <td><p>Guide for Coding Test</p></td>
                                        <td><p>Guide for Coding Test</p></td>
                                        <td><p>Coding Test</p></td>                                        
                                        <td><p><a href="<?php echo Yii::app()->createUrl('Document/edit',array('type'=>Document::TYPE_CODING_GUIDE))?>">Edit</a></p></td>
                                        <td><p><a href="<?php echo Yii::app()->createUrl('Document/view',array('type'=>Document::TYPE_CODING_GUIDE))?>">View</a></p></td>
                                    </tr>
                                    <tr align="center">                                        
                                        <td><p>Guide for Knowledge Skill Test</p></td>
                                        <td><p>Guide for Knowledge Skill Test</p></td>
                                        <td><p>Langguage Skill Test</p></td>                                        
                                        <td><p><a href="<?php echo Yii::app()->createUrl('Document/edit',array('type'=>Document::TYPE_KNOWLEDGE_SKILL))?>">Edit</a></p></td>
                                        <td><p><a href="<?php echo Yii::app()->createUrl('Document/view',array('type'=>Document::TYPE_KNOWLEDGE_SKILL))?>">View</a></p></td>
                                    </tr>
                                    <tr align="center">                                        
                                        <td><p>Guide for Knowledge Skill Test</p></td>
                                        <td><p>Guide for Knowledge Skill Test</p></td>
                                        <td><p>Knowledge Skill Test</p></td>                                        
                                        <td><p><a href="<?php echo Yii::app()->createUrl('Document/edit',array('type'=>Document::TYPE_LANGUAGE_SKILL))?>">Edit</a></p></td>
                                        <td><p><a href="<?php echo Yii::app()->createUrl('Document/view',array('type'=>Document::TYPE_LANGUAGE_SKILL))?>">View</a></p></td>
                                    </tr>
                                    <tr align="center">                                        
                                        <td><p>Guide for Marking Up skills Test</p></td>
                                        <td><p>Guide for Marking Up skills Test</p></td>
                                        <td><p>Marking Up Skill Test</p></td>                                        
                                        <td><p><a href="<?php echo Yii::app()->createUrl('Document/edit',array('type'=>Document::TYPE_MARKING_UP))?>">Edit</a></p></td>
                                        <td><p><a href="<?php echo Yii::app()->createUrl('Document/view',array('type'=>Document::TYPE_MARKING_UP))?>">View</a></p></td>                                       
                                    </tr>
                                </tbody>
                            </table>
                        </div><!--table-->
                    </div>
                </div><!--testpost-box-->
                <div class="clear"></div>		
			</div>
			<!--end content testpost outer-->		            						
		</div>
	</div>
	<!--end inside content-->