<?php echo $header; 
$theme_options = $this->registry->get('theme_options');
$config = $this->registry->get('config'); 
include('catalog/view/theme/' . $config->get('config_template') . '/template/new_elements/wrapper_top_news.tpl'); ?>
<div class="container">
<div class="breadcrumb full-width">
				<div class="background with-other-image" style="background-color: #ffffff;">
					<div class="pattern">
						<div class="container">
							<div class="clearfix">
							<ul class="new_breadcrumb">
									<?php foreach ($breadcrumbs as $breadcrumb) { ?>
										<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
									<?php } ?>
							</ul>
							</div>
							<div class="line_separator_2" style="    background: #eaeaea;
												height: 1px;
												top: 13px;
												position: inherit;
												width: 75%;
												left:300px"></div>
							</div>
					</div>
				</div>
			</div>
	<div class="row" ><? echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
		<?php $class = 'col-sm-6'; ?>
		<?php } elseif ($column_left || $column_right) { ?>
		<?php $class = 'col-sm-9'; ?>
		<?php } else { ?>
		<?php $class = 'col-sm-12'; ?>
		<?php } ?><div class="col-sm-3"><?php echo $content_top; ?></div>
		<div id="content" class="<?php echo $class; ?>">
			<div class="row" style="width: 78%; float: right;">
				<?php if ($thumb) { ?>
				<div class="col-sm-4">
					<div class="thumbnail">
						<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/></a>
					</div>
				</div>
				<?php } ?>
				<div class="<?php echo $thumb ? 'col-sm-8' : 'col-sm-12'; ?>">
					<h1><?php echo $heading_title; ?></h1>
					<div class="tab-content">
						<div class="description">
							<?php echo $description; ?>
						</div>
						<div class="col-sm-4"><i class="fa fa-clock-o"></i>&nbsp;<?php echo $posted; ?></div>
						<div class="col-sm-4"><i class="fa fa-eye"></i>&nbsp;<?php echo $viewed; ?></div>
						<?php if($news_share) { ?>
						<div class="col-sm-4">
							<div class="addthis">
								<!-- AddThis Button BEGIN -->
								<div class="addthis_toolbox addthis_default_style ">
									<a class="addthis_button_email"></a>
									<a class="addthis_button_print"></a>
									<a class="addthis_button_preferred_1"></a>
									<a class="addthis_button_preferred_2"></a>
									<a class="addthis_button_preferred_3"></a>
									<a class="addthis_button_preferred_4"></a>
									<a class="addthis_button_compact"></a>
									<a class="addthis_counter addthis_bubble_style"></a>
								</div>
								<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js"></script>
							</div>
						</div>
						<?php } ?>
					</div>
				</div>
				<div class="col-sm-12">
					
					<!-- <div class="buttons">
						<div class="pull-left">
							<a class="btn btn-primary" href="<?php echo $news_list; ?>"><?php echo $button_news; ?></a>
						</div>
						<div class="pull-right">
							<a class="btn btn-primary" href="<?php echo $continue; ?>"><?php echo $button_continue; ?></a>
						</div>
					</div> -->
				</div>
			</div>
		<?php echo $content_bottom; ?></div>
	<?php //echo $column_right; ?></div>
	<script type="text/javascript"><!--
		$(document).ready(function () {
			$('.thumbnail').magnificPopup({
				type: 'image',
				delegate: 'a',
			});
		});
	//--></script>
</div>
<?php echo $footer; ?>