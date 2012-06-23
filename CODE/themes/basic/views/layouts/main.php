<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<?php echo Yii::app()->theme->baseUrl?>/css/standard.css" rel="stylesheet" type="text/css" media="screen, projection" />
<link href="<?php echo Yii::app()->theme->baseUrl?>/css/sprite.css" rel="stylesheet" type="text/css" media="screen, projection" />
<link href="<?php echo Yii::app()->theme->baseUrl?>/css/ja.cssmenu.css" rel="stylesheet" type="text/css" media="screen, projection" />
<script src="<?php echo Yii::app()->theme->baseUrl?>/js/mootools.v1.11.js" language="javascript" type="text/javascript"></script>
<script src="<?php echo Yii::app()->theme->baseUrl?>/js/ja.moomenu.js" language="javascript" type="text/javascript"></script>
<script src="<?php echo Yii::app()->theme->baseUrl?>/js/iphoenix.js" language="javascript" type="text/javascript"></script>
<script src="<?php echo Yii::app()->theme->baseUrl?>/js/csspopup.js" type="text/javascript" ></script>
<script src="<?php echo Yii::app()->theme->baseUrl?>/js/popup.js" type="text/javascript" ></script>
<script src="<?php echo Yii::app()->theme->baseUrl?>/js/jquery-1.7.1.min.js" type="text/javascript" ></script>
<script src="<?php echo Yii::app()->theme->baseUrl?>/js/style.js" type="text/javascript" ></script>
<?php 
$cs = Yii::app()->getClientScript(); 
$cs->registerScriptFile(Yii::app()->theme->baseUrl.'/js/jquery.alerts.js');
$cs->registerCssFile(Yii::app()->theme->baseUrl.'/css/jquery.alerts.css');
?>
<title>.:: Mediatenor! Coding Profile - Training - Protagonists ::.</title>
<!--[if IE]>
<style type="text/css" media="screen, projection">
#menu ul li {float: left; width:100%;}
</style>
<![endif]-->
<!--[if lt IE 7]>
<style type="text/css" media="screen, projection">
#menu ul li a { height: 1%; }
#menu a, #menu h2 { font: bold 0.7em/1.4em; }
</style>
<![endif]-->
</head>

<body id="home">
<div id="blanket" style="display: none;"></div>
<!--begin top panel-->
<div id="TP_fixed_header" style="position:absolute; top:0%;">
	<div id="TP_container">
		<div id="TP_inner">
			<!--begin left content-->
			<div id="TP_left_panel" class="TP_toolbar_item">
				<img src="<?php echo Yii::app()->theme->baseUrl?>/images/tp_title.png" />
			</div>
			<!--end left content-->
			<div id="TP_feed" class="TP_toolbar_item">
			</div>
			<!--begin right content-->
			<div id="TP_right_panel" class="TP_toolbar_item">
				<p><a href="http://www.mediatenor.com/">www.MediaTenor.com</a> | <a href="<?php echo Yii::app()->createUrl('user/changePassword');?>">Change password</a> | <a href="<?php echo Yii::app()->createUrl('default/logout');?>">Logout</a> (<span style="color:#d9251d;"><?php echo Yii::app()->user->name;?></span>)</p>
			</div>
			<!--end right content-->
			<!--begin menuBar-->
			<?php $this->widget('AdminMenu');?>
			<!--end menuBar-->
		</div>
	</div>
</div>
<!--end top panel-->
<!--begin page content-->
<div id="shell" class="forShell">
<?php echo $content;?>
<div class="clear"></div>
	<!--begin footer-->
	<div id="footer" class="top">
		<p>© 2012 <a href="">Media Tenor International</a>. All rights reserved</p>
	</div>
	<!--end footer-->
</div>
<!--end page content-->
</body>
</html>