<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
	<title><?php echo $site_name; ?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<?php echo $header_block; ?>
	<?php
	// Action::header_scripts - Additional Inline Scripts from Plugins
	Event::run('ushahidi_action.header_scripts');
	?>
</head>

<body id="page">
	<!-- wrapper -->
	<div class="rapidxwpr floatholder">

		<!-- header -->
		<div id="header">

			<!-- searchbox -->
			<div id="searchbox">
				
				<!-- user actions -->
				<?php if($loggedin_username != FALSE){ ?>
				<div id="loggedin_user_action" class="clearingfix">
					<?php echo $loggedin_username; ?> [<a href="<?php echo url::site();?>logout/front"><?php echo Kohana::lang('ui_admin.logout');?></a>]
				</div><br/>
				<?php } ?>
				<!-- / user actions -->
				
				<!-- languages -->
				<?php echo $languages;?>
				<!-- / languages -->

				<!-- searchform -->
				<?php echo $search; ?>
				<!-- / searchform -->

			</div>
			<!-- / searchbox -->
			
			<!-- logo -->
			<div id="logo">
				<h1><?php echo "<p>&nbsp</p> ";//$site_name; ?></h1>
				<span><?php echo "<p>&nbsp</p> ";//$site_tagline; ?></span>
			</div>
			<!-- / logo -->
			
			<!-- submit incident -->
			<?php echo $submit_btn; ?>
			<!-- / submit incident -->
			
		</div>
		<!-- / header -->

		<!-- main body -->
		<div id="middle">
			<div class="background layoutleft">

				<!-- mainmenu -->
				<div id="mainmenu" class="clearingfix">
					<ul>
						<?php nav::main_tabs($this_page); ?>
					</ul>
					<div class="form">
<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="8CRQZRP33GHLG">
<input type="image" src="http://bushfireconnect.org/themes/default/images/donate.png" border="0" name="submit" alt="PayPal - The safer, easier way to pay online.">
<img alt="" border="0" src="https://www.paypalobjects.com/WEBSCR-640-20110401-1/en_AU/i/scr/pixel.gif" width="1" height="1">
</form></div>

				</div>
				<!-- / mainmenu -->
