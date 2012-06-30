<div class="fl menu-tree" style="width: 300px;">
<ul>
	<li><label><b>Document's Tree structure</b></label></li>
	<li>
		<?php 
		$list_style=array('color:red','color:blue','color:black');
		foreach ($list_nodes as $id=>$level){
			$node=Document::model()->findByPk($id);
			$blank = "&nbsp";
			$prefix = "--";
			$style = $list_style[$level-1];
			for($i=1;$i<$level;$i++){
				$blank .= "&nbsp &nbsp &nbsp";
				$prefix .= "---";
			}
			$view =$blank."|".$prefix;
			echo "<div><label style=".$style.">".$view." <a href=".Yii::app()->createUrl('document/view',array('id'=>$id)).">".$node->name."</a></label></div>";
		}
		?>           
		</li>
</ul>
</div>