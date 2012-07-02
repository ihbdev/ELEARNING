<?php 
$cs = Yii::app()->getClientScript();
$cs->registerCssFile(Yii::app()->theme->baseUrl.'/css/sprite.css');
?>
	<!--begin inside content-->
	<div class="folder top">
		<!--begin title-->
		<div class="folder-header">
			<h1><?php echo $model->config_type[$type]['label']?></h1>
			<div>
                <input type="button" class="button" value="<?php echo Language::t('List Documents');?>" style="width:180px;margin-left: 15px;" onClick="parent.location='<?php echo Yii::app()->createUrl('Document/index')?>'"/>                
				<div class="line top bottom"></div>	
            </div>
			<div class="header-menu">
				<ul>
					<li><a class="header-menu-active new-icon" href=""><span><?php echo $model->config_type[$type]['label']?></span></a></li>					
				</ul>
			</div>
		</div>
		<!--end title-->
		<div class="folder-content form">			
			<!--begin left content-->			
			<?php	
			echo $this->renderPartial('_view', array('model'=>$model,'action'=>$action)); 
			?>
			<!--end left content-->
			<!--begin right content-->
			<?php			
			echo $this->renderPartial('_view_tree', array('list_nodes'=>$model->list_nodes)); 			
			?>
			<!--end right content-->
			<div class="clear"></div>
		</div>
	</div>
	<!--end inside content-->
<div type="hidden" value="" id="popup_value"></div>
<?php 
$lang='vi';
if(isset($_GET['lang'])){
	$lang=$_GET['lang'];
}
$cs = Yii::app()->getClientScript(); 
// Script delete
$cs->registerScript(
  'js-delete-category',
  "jQuery(function($) { $('body').on('click','.i16-trashgray',	
  		function(){
  			$('#popup_value').val(this.id);
  			jConfirm(
  				\"Bạn muốn xóa danh mục này?\",
  				\"Xác nhận xóa danh mục\",
  				function(r){
  					if(r){
  					jQuery.ajax({
  						'data':{id : $(\"#popup_value\").val(), current_id: $(\"#current_id\").val()},
  						'dataType':'json',
  						'success':function(data){
  							if(data.status == true){
								$(\".folder-content\").html(data.content);
								$(\".folder-content\").append('<div class=\"clear\"></div>');
							}
							else {
								jAlert(data.content);
							}
        				},
        				'type':'GET',
        				'url':'".$this->createUrl('document/delete')."',
        				'cache':false});
        			}
        		}
        	);
        	return false;	
        	});
        })",
  CClientScript::POS_END
);

// Script load form update 
$cs->registerScript(
  'js-update-category',
  "jQuery(
  	function($)
	{ 
		$('body').on(
  			'click',
  			'.i16-statustext-2',	
  			function(){
  				jQuery.ajax({
  					'data':{id : this.id},
  					'success':function(data){
						$(\".folder-content\").html(data);
						$(\".folder-content\").append('<div class=\"clear\"></div>');
					},
					'type':'GET',
					'url':'".$this->createUrl('document/view')."',
					'cache':false
				});
				return false;
			}
		);
	}
	);",
  CClientScript::POS_END
);
// Script load form create 
$cs->registerScript(
  'js-create-category',
  "jQuery(
  	function($) 
  	{ 
  		$('body').on(
  			'click',
  			'#create-category',	
  			function(){
  				jQuery.ajax({
  					'success':function(data){
						$(\".folder-content\").html(data);
						$(\".folder-content\").append('<div class=\"clear\"></div>');
        			},
        			'type':'GET',
        			'url':'".$this->createUrl('document/create')."',
        			'cache':false,
        			'data':{type:".$model->type."}
        		});
        		return false;
        	}
        );
     }
    );",
  CClientScript::POS_END
);
// Script update & create category to database
$cs->registerScript(
  'js-write-category',
  "jQuery(
  	function($) { 
  		$('body').on(
  			'click',
  			'#write-category-2',	
  			function(){
  				jQuery.ajax({
  					'success':function(data){
						$(\".folder-content\").html(data);
						$(\".folder-content\").append('<div class=\"clear\"></div>');
        			},
        			'type':'POST',
        			'url':'".$this->createUrl('document/write',array('type'=>$model->type))."',
        			'cache':false,
        			'data':jQuery(this).parents(\"form\").serialize()
        		});
        		return false;
        	}
        );
      }
   );",
  CClientScript::POS_END
);
?>