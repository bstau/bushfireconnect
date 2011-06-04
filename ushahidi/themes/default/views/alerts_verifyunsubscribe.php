<div id="content">
	<div class="content-bg">
		<!-- start block -->
		<div class="big-block">
			<h1>Get Alerts</h1>
			<!-- green-box/ red-box depending on verification result -->
			<?php
			// SWITCH based on the value of the $errno
			switch ($errno)
			{
				// IF the code provided was not found ...
				case ER_CODE_NOT_FOUND:
				?>
					<div class="red-box">
						<div class="alert_response">
            			    The mobile number wasn't found in our database.  Please enter the right mobile number.
						</div>
					</div>
					<?php
					break;
				// IF the code provided means the alert has already been verified ...
				case ER_CODE_ALREADY_UNSUBSCRIBED:
				?>
					<div class="red-box">
						<div class="alert_response" align="center">
							<?php echo "This mobile number was already unsubscribed"; ?>
						</div>
					</div>
					<?php
					break;
				// IF the code provided means the code is now verified ...
				case ER_CODE_UNSUBSCRIBED:
				?>
					<div class="green-box">
						<div class="alert_response" align="center">
							<?php echo "You have been unsubscribed from receiving alerts." ?>
						</div>
					</div>
					<?php
					break;
			} // End switch
			?>
      </div>
	<!-- end block -->
	</div>
</div>