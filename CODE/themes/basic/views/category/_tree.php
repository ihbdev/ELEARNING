<div class="fl menu-tree" style="width: 370px;">
<ul>
	<li><label><b>Tree structure</b></label></li>
	<li>
		<?php 
		$list_style=array('color:red','color:blue','color:black');
		foreach ($list_nodes as $id=>$level){
			$node=Category::model()->findByPk($id);
			$blank = "&nbsp";
			$prefix = "--";
			$style = $list_style[$level-1];
			for($i=1;$i<$level;$i++){
				$blank .= "&nbsp &nbsp &nbsp";
				$prefix .= "---";
			}
			$view =$blank."|".$prefix;
			echo "<div><label style=".$style.">".$view." ".$node->name."</label><a id='".$id."' class='i16 i16-statustext'></a><a id='".$id."'class='i16 i16-trashgray'></a></div>";
		}
		?>           
		</li>
</ul>
</div>