<!-- main body -->
<div id="main" class="clearingfix">
	<div id="mainmiddle" class="floatbox withright">

	<?php if($site_message != '') { ?>
		<div class="green-box">
			<h3><?php echo $site_message; ?></h3>
		</div>
	<?php } ?>

		<!-- / right column -->
	
		<!-- content column -->
		<div id="content" class="clearingfix">
			<div class="floatbox">
			 <h1>Please <a href="contact"><?php echo Kohana::lang('ui_main.feedback'); ?></a> to help improve this service.</h1>
			 <br/>
				<!-- / filters -->
			    <iframe src="/ushahidi/embed/" style="width:100%; height: 600px; "></iframe>	
				<?php								
				// Map and Timeline Blocks
				echo $div_timeline;
				?>
			</div>
		</div>
		<!-- / content column -->

	</div>
</div>
<!-- / main body -->

<!-- content -->
<div class="content-container">

	<!-- content blocks -->
	<div class="content-blocks clearingfix">

		<!-- left content block -->
		<div class="content-block-left">
			<h5><?php echo Kohana::lang('ui_main.incidents_listed'); ?></h5>
			<table class="table-list">
				<thead>
					<tr>
						<th scope="col" class="title"><?php echo Kohana::lang('ui_main.title'); ?></th>
						<th scope="col" class="location"><?php echo Kohana::lang('ui_main.location'); ?></th>
						<th scope="col" class="date"><?php echo Kohana::lang('ui_main.date'); ?></th>
					</tr>
				</thead>
				<tbody>
					<?php
						if ($total_items == 0)
					{
					?>
					<tr><td colspan="3"><?php echo Kohana::lang('ui_main.no_reports'); ?></td></tr>

					<?php
					}
					foreach ($incidents as $incident)
					{
						$incident_id = $incident->id;
						$incident_title = text::limit_chars($incident->incident_title, 40, '...', True);
						$incident_date = $incident->incident_date;
						$incident_date = date('M j Y', strtotime($incident->incident_date));
						$incident_location = $incident->location->location_name;
					?>
					<tr>
						<td><a href="<?php echo url::site() . 'reports/view/' . $incident_id; ?>"> <?php echo $incident_title ?></a></td>
						<td><?php echo $incident_location ?></td>
						<td><?php echo $incident_date; ?></td>
					</tr>
					<?php
					}
					?>

				</tbody>
			</table>
			<a class="more" href="<?php echo url::site() . 'reports/' ?>"><?php echo Kohana::lang('ui_main.view_more'); ?></a>
		</div>
		<!-- / left content block -->

		<!-- right content block -->
		<div class="content-block-right">
			<h5><?php echo Kohana::lang('ui_main.official_news'); ?></h5>
			<table class="table-list">
				<thead>
					<tr>
						<th scope="col"><?php echo Kohana::lang('ui_main.title'); ?></th>
						<th scope="col"><?php echo Kohana::lang('ui_main.source'); ?></th>
						<th scope="col"><?php echo Kohana::lang('ui_main.date'); ?></th>
					</tr>
				</thead>
					<?php
                                        if ($feeds->count() != 0)
                                        {
                                            echo '<tbody>';
                                            foreach ($feeds as $feed)
                                            {
                                                    $feed_id = $feed->id;
                                                    $feed_title = text::limit_chars($feed->item_title, 40, '...', True);
                                                    $feed_link = $feed->item_link;
                                                    $feed_date = date('M j Y', strtotime($feed->item_date));
                                                    $feed_source = text::limit_chars($feed->feed->feed_name, 15, "...");
                                            ?>
                                            <tr>
                                                    <td><a href="<?php echo $feed_link; ?>" target="_blank"><?php echo $feed_title ?></a></td>
                                                    <td><?php echo $feed_source; ?></td>
                                                    <td><?php echo $feed_date; ?></td>
                                            </tr>
                                            <?php
                                            }
                                            echo '</tbody>';
                                        }
                                        else
                                        {
                                            echo '<tbody><tr><td></td><td></td><td></td></tr></tbody>';
                                        }
					?>
			</table>
			<a class="more" href="<?php echo url::site() . 'feeds' ?>"><?php echo Kohana::lang('ui_main.view_more'); ?></a>
		</div>
		<!-- / right content block -->

	</div>
	<!-- /content blocks -->

</div>
<!-- content -->
