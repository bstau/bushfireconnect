<div id="content">
	<div class="content-bg">
		
		<!-- start block -->
		<div class="big-block">
			<h1>Get Alerts</h1>
			
	
			<!-- Mobile Alert -->
			<div class="green-box">
				<?php
				if ($alert_mobile=='')
				{  
					echo "<h3>Please enter your mobile number and SMS verification code to unsubscribe from receiving SMS alerts</h3>";
					if($err == 1){
					echo "<h3>You didn't enter any value before.</h3>";
					}
				}
				else{
					echo "<h3>A verification code has been sent to your mobile, please enter the code to unsubscribe from receiving alerts.</h3>";
				
				}
				?>
				<div class="alert_response">
					
					<div class="alert_confirm">
						<div class="label">
							Please enter your mobile number and verification code to unsubscribe. Or click on Request Verification Code to have it sent to your mobile phone.
						</div>
						<?php 
						print form::open('/alerts/verifyunsubscribe');
						print "Mobile Phone:<BR>".form::input('alert_mobile', $alert_mobile, ' class="text"')."<BR>";

						print "Verification Code:<BR>".form::input('alert_code', '', ' class="text"')."<BR>";
												print form::submit('button', 'Unsubscribe Alert', ' class="btn_submit"');
										
						print form::submit('button', 'Request Verification Code', ' class="btn_submit"');

						print form::close();
						?>
						
					</div>
				</div>
			</div>
			<!-- / Mobile Alert -->
			
			
			<!-- Return -->
			<div class="green-box">
				<div class="alert_response">
					<a href="<?php echo url::site().'alerts'?>">
					<?php echo Kohana::lang('alerts.create_more_alerts'); ?>
					</a>
				</div>
			</div>
			<!-- / Return -->
			
		</div>
		<!-- end block -->
	</div>
</div>