<?php echo $header; 
$theme_options = $this->registry->get('theme_options');
$config = $this->registry->get('config'); 
include('catalog/view/theme/' . $config->get('config_template') . '/template/new_elements/wrapper_top.tpl'); ?>
<style type="text/css">
#content > #title-page{
    display: none;
}
</style>
			<div class="row" style="margin-top: 15px;">
				<?php if ($thumb) { ?>
				<div class="col-sm-4" style="text-align: center;">
					<div class="thumbnail" style="display: inline-block;">
						<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" style="display: block;"/></a>
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
			</div>
    <script type="text/javascript"><!--
        $(document).ready(function () {
            $('.thumbnail').magnificPopup({
                type: 'image',
                delegate: 'a',
            });
        });
    //--></script>
<?php include('catalog/view/theme/' . $config->get('config_template') . '/template/new_elements/wrapper_bottom.tpl'); ?>
<?php echo $footer; ?>