 			<div class="fl" style="width:580px;">
				<ul>					
					<div class="row">
						<li><b>                       		
                        	<?php echo $model->name; ?>                   			
                    	</b></li>
                    </div>                                                                   
                   <div class="row">
						<li>                       		                     		                     
                   			<?php echo $model->description; ?>
                    	</li>
                    </div>
					<?php foreach($model->getChild_nodes() as $id=>$level):?>
					<?php $doc = Document::model()->findByPk($id);?>
					<div class="row">
						<li><b><i>                        		
                        	<?php echo $doc->name; ?>                   			
                    	</i></b></li>
                    </div>                                                                   
                   <div class="row">
						<li>                       		                     		                     
                   			<?php echo $doc->description; ?>
                    	</li>
                    </div>
					<?php endforeach;?>
				</ul>
			</div>			

