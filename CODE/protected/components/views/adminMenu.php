<div id="menuBar">
				<ul id="ja-cssmenu">
					<?php 
					foreach ($list as $id=>$item){
						$menu=Menu::model()->findByPk($id);
						$class='';
						if($item['last-item']) $class .= ' last-item';
						if($item['first-item']) $class .= ' first-item';
						if($item['first']) $class .= ' first';
						if($item['last']) $class .= ' last';
						if($item['havechild'] && $item['level'] > 1) $class .=' x';
						if($item['active']) $class .= ' active';
						if($item['havechild'] && $item['level'] == 1){
							echo '<li class="havechild">';
							echo '<a id="'.$id.'" class="'.$class.'" href="'.$menu->url.'">'.$menu->name.'</a>';
							echo '<ul>';
							}
						elseif ($item['havechild'] && $item['level'] >1){
							echo '<li class="x">';
							echo '<a id="'.$id.'" class="'.$class.'" href="'.$menu->url.'">'.$menu->name.'</a>';
							echo '<ul>';
						}
						else {
							echo '<li>';
							echo '<a id="'.$id.'" class="'.$class.'" href="'.$menu->url.'">'.$menu->name.'</a>';
							echo '</li>';
						}
						if($item['level_close']) {
							for ($i=0;$i<$item['level_close'];$i++) {
									echo '</ul>';
									echo '</li>';
							}
						}
					}
					?>
				</ul>
			</div>