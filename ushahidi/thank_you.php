<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
	<title>Bushfire Connect</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="http://bushfireconnect.org/themes/default/css/style.css" />
<link rel="stylesheet" type="text/css" href="http://bushfireconnect.org/media/css/jquery-ui-themeroller.css" />
<!--[if lte IE 7]><link rel="stylesheet" type="text/css" href="http://bushfireconnect.org/media/css/iehacks.css" />
<![endif]--><!--[if IE 7]><link rel="stylesheet" type="text/css" href="http://bushfireconnect.org/media/css/ie7hacks.css" />
<![endif]--><!--[if IE 6]><link rel="stylesheet" type="text/css" href="http://bushfireconnect.org/media/css/ie6hacks.css" />
<![endif]--><link rel="alternate" type="application/rss+xml" href="http://bushfireconnect.org/feed/" title="RSS2" /><script type="text/javascript" src="http://bushfireconnect.org/media/js/jquery.js"></script>
<script type="text/javascript" src="http://bushfireconnect.org/media/js/jquery.ui.min.js"></script>
<script type="text/javascript" src="http://bushfireconnect.org/media/js/jquery.pngFix.pack.js"></script>

<script type="text/javascript">
                        <!--//
function runScheduler(img){img.onload = null;img.src = 'http://bushfireconnect.org/scheduler';}
			$(document).ready(function(){$(document).pngFix();});//-->
                        </script>	</head>

<body id="page">
	<!-- wrapper -->
	<div class="rapidxwpr floatholder">

		<!-- header -->
		<div id="header">

			<!-- searchbox -->

			<div id="searchbox">
				
				<!-- user actions -->
								<!-- / user actions -->
				
				<!-- languages -->
				<div class="language-box"><form action=""><select id="l" name="l"  onchange="this.form.submit()" >
<option value="en_US" selected="selected">English (US)</option>
<option value="fr_FR">français (FR)</option>
</select></form></div>				<!-- / languages -->

				<!-- searchform -->
				<div class="search-form"><form method="get" id="search" action="http://bushfireconnect.org/search/"><ul><li><input type="text" name="k" value="" class="text" /></li><li><input type="submit" name="b" class="searchbtn" value="search" /></li></ul></form></div>				<!-- / searchform -->

			</div>
			<!-- / searchbox -->
			
			<!-- logo -->
			<div id="logo">
				<h1><p>&nbsp</p> </h1>

				<span><p>&nbsp</p> </span>
			</div>
			<!-- / logo -->
			
			<!-- submit incident -->
			<div class="submit-incident clearingfix"><a href="http://bushfireconnect.org/reports/submit">Submit a Report</a></div>			<!-- / submit incident -->
			
		</div>
		<!-- / header -->

		<!-- main body -->
		<div id="middle">
			<div class="background layoutleft">

				<!-- mainmenu -->
				<div id="mainmenu" class="clearingfix">
					<ul>
						<li><a href="http://bushfireconnect.org/main" >Home</a></li><li><a href="http://bushfireconnect.org/reports" >Reports</a></li><li><a href="http://bushfireconnect.org/reports/submit" >Submit a Report</a></li><li><a href="http://bushfireconnect.org/alerts" >Get Alerts</a></li><li><a href="http://bushfireconnect.org/contact" >Contact Us</a></li><li><a href="http://bushfireconnect.org/page/index/1"  >About Us</a></li><li><a href="http://bushfireconnect.org/page/index/3" >FAQ/Help</a></li>					</ul>

				</div>
				<!-- / mainmenu -->
				<div id="content">
	<div class="content-bg">
		<div class="big-block">

				<?php
// read the post from PayPal system and add 'cmd'
$req = 'cmd=_notify-synch';

$tx_token = $_GET['tx'];
$auth_token = "izUfr-MQInpxcVl7RPiB7KwrpJC862ALm3ztakvQ_LNiF6TVACfAF5uFm04";
$req .= "&tx=$tx_token&at=$auth_token";

// post back to PayPal system to validate
$header .= "POST /cgi-bin/webscr HTTP/1.0\r\n";
$header .= "Content-Type: application/x-www-form-urlencoded\r\n";
$header .= "Content-Length: " . strlen($req) . "\r\n\r\n";
$fp = fsockopen ('www.paypal.com', 80, $errno, $errstr, 30);
// If possible, securely post back to paypal using HTTPS
// Your PHP server will need to be SSL enabled
// $fp = fsockopen ('ssl://www.paypal.com', 443, $errno, $errstr, 30);

if (!$fp) {
// HTTP ERROR
} else {
fputs ($fp, $header . $req);
// read the body data
$res = '';
$headerdone = false;
while (!feof($fp)) {
$line = fgets ($fp, 1024);
if (strcmp($line, "\r\n") == 0) {
// read the header
$headerdone = true;
}
else if ($headerdone)
{
// header has been read. now read the contents
$res .= $line;
}
}

// parse the data
$lines = explode("\n", $res);
$keyarray = array();
if (strcmp ($lines[0], "SUCCESS") == 0) {
for ($i=1; $i<count($lines);$i++){
list($key,$val) = explode("=", $lines[$i]);
$keyarray[urldecode($key)] = urldecode($val);
}
// check the payment_status is Completed
// check that txn_id has not been previously processed
// check that receiver_email is your Primary PayPal email
// check that payment_amount/payment_currency are correct
// process payment
$firstname = $keyarray['first_name'];
$lastname = $keyarray['last_name'];
$itemname = $keyarray['item_name'];
$amount = $keyarray['payment_gross'];

echo ("<h1>Thank you for your Donation</h1>
			<div class=\"page_text\"><p>Thank you for donating to Bushfire Connect.</p>");
echo ("<b>Donation Details</b><br>\n");
echo ("<li>Name: $firstname $lastname</li>\n");
echo ("<li>Amount: $amount</li>\n");
echo ("");

echo ("			
<p>Read the <a href=\"../../../blog\" target=\"_blank\">Bushfire Connect blog</a>&nbsp; or follow us on <a href=\"http://www.twitter.com/bushfireconnect\" target=\"_blank\">Twitter</a>.</p>

<p>More information: see <a href=\"mailto:Maurits.vandervlugt@mercuryps.com.au\"><span class=\"gI\">Maurits van der Vlugt</span></a> or <a href=\"mailto:keren.flavell@gmail.com\"> Keren Flavell</a></p></div>");

}
else if (strcmp ($lines[0], "FAIL") == 0) {
echo ("<h1>Error Page</h1><p>There was an error retrieving this page.</p>			
<p>Read the <a href=\"../../../blog\" target=\"_blank\">Bushfire Connect blog</a>&nbsp; or follow us on <a href=\"http://www.twitter.com/bushfireconnect\" target=\"_blank\">Twitter</a>.</p>

<p>More information: see <a href=\"mailto:Maurits.vandervlugt@mercuryps.com.au\"><span class=\"gI\">Maurits van der Vlugt</span></a> or <a href=\"mailto:keren.flavell@gmail.com\"> Keren Flavell</a></p></div>");
}

}

fclose ($fp);

?>

				
				
				
			
		</div>
	</div>
</div>
			</div>
		</div>
		<!-- / main body -->

	</div>
	<!-- / wrapper -->
	
	<!-- footer -->
	<div id="footer" class="clearingfix">
 
		<div id="underfooter"></div>
				
		<!-- footer content -->
		<div class="rapidxwpr floatholder">
 
			<!-- footer credits -->

			<div class="footer-credits">
				Powered by the &nbsp;<a href="http://www.ushahidi.com/"><img src="http://bushfireconnect.org//media/img/footer-logo.png" alt="Ushahidi" style="vertical-align:middle" /></a>&nbsp; Platform
			</div>
			<!-- / footer credits -->
		
			<!-- footer menu -->
			<div class="footermenu">
				<ul class="clearingfix">
					<li><a class="item1" href="http://bushfireconnect.org/">Home</a></li>

					<li><a href="http://bushfireconnect.org/reports/submit">Submit a Report</a></li>
					<li><a href="http://bushfireconnect.org/alerts">Get Alerts</a></li>
					<li><a href="http://bushfireconnect.org/contact">Contact Us</a></li>
					<li><a href="http://www.bushfireconnect.org/blog" target="_blank">Blog</a></li>
									</ul>
							</div>
			<!-- / footer menu -->

      
			<h2 class="feedback_title" style="clear:both">
				<a href="http://feedback.ushahidi.com/fillsurvey.php?sid=2">Provide Feedback</a>
			</h2>

 
		</div>
		<!-- / footer content -->
 
	</div>
	<!-- / footer -->

 
	<!-- Piwik --><script type="text/javascript">$(document).ready(function(){$('#piwik').load('http://tracker.ushahidi.com/piwik/piwik.php?idsite=12151&rec=1');});</script><div id="piwik"></div><!-- End Piwik Tag -->	<script type="text/javascript">
				var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
				document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
				</script>
				<script type="text/javascript">
				var pageTracker = _gat._getTracker("UA-16855759-1");
				pageTracker._trackPageview();
				</script>	
	<!-- Task Scheduler -->
	<img src="http://bushfireconnect.org/media/img/spacer.gif" alt="" height="1" width="1" border="0" onload="runScheduler(this)" />
 
	</body>
</html>
