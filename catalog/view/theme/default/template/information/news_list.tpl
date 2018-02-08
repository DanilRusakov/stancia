<?php echo $header; 
$theme_options = $this->registry->get('theme_options');
$config = $this->registry->get('config'); 
include('catalog/view/theme/' . $config->get('config_template') . '/template/new_elements/wrapper_top_news.tpl'); 
?>
<div class="container">
	
	<div class="row">
		<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
			
			<div class="breadcrumb full-width">
				<div class="background with-other-image" style="background-color: #ffffff;">
					<div class="pattern">
						<div class="container">
							<div class="clearfix">
							<ul class="new_breadcrumb" style="margin-left: 0 !important">
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
												left: 0px"></div>
							</div>
					</div>
				</div>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<?php if ($news_list) { ?>
			<!--<div class="row">
				<div class="col-md-3">
					<div class="btn-group hidden-xs">
						<button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
						<button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
					</div> 
				</div>
				<div class="col-md-2 text-right">
					<label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
				</div>
				<div class="col-md-3 text-right">
					<select id="input-sort" class="form-control" onchange="location = this.value;">
						<?php foreach ($sorts as $sorts) { ?>
						<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
						<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
				</div>
				 <div class="col-md-2 text-right">
					<label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
				</div>
				<div class="col-md-2 text-right">
					<select id="input-limit" class="form-control" onchange="location = this.value;">
						<?php foreach ($limits as $limits) { ?>
						<?php if ($limits['value'] == $limit) { ?>
						<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
				</div> 
			</div>-->
			<div class="row">
				<?php foreach ($news_list as $news_item) { ?>
				<div class="product-layout product-list col-xs-12" style="min-height: 280px;">
					<div class="product-thumb">
						<?php if($news_item['thumb']) { ?>
						<div class="image col-lg-3 col-md-3 col-sm-12"><a href="<?php echo $news_item['href']; ?>"><img src="<?php echo $news_item['thumb']; ?>" alt="<?php echo $news_item['title']; ?>" title="<?php echo $news_item['title']; ?>" class="img-responsive" /></a></div>
						<?php }?>
						
							<div class="caption caption col-lg-9 col-md-9 col-sm-12 col-xs-12">
								<h4><a href="<?php echo $news_item['href']; ?>"><?php echo $news_item['title']; ?></a></h4>
								<p><?php echo $news_item['description']; ?> ...</p>
								<div class="button-group" >
								<button type="button" onclick="location.href = ('<?php echo $news_item['href']; ?>');" data-toggle="tooltip" title="">Читать дальше</i>&nbsp;<span class="hidden-xs hidden-sm hidden-md"></span></button>
								<!-- <button type="button" data-toggle="tooltip" title="<?php echo $news_item['posted']; ?>"><i class="fa fa-clock-o"></i></button> -->
								<!-- <button type="button" data-toggle="tooltip" title="<?php echo $news_item['viewed']; ?>"><i class="fa fa-eye"></i></button> -->
							</div>
							</div>
							
						
					</div>
				</div>
				<?php } ?>
			</div>
			<div class="row">

				<div class="pagination-results">
					<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
					<!-- <div class="col-sm-6 text-right"><?php echo $results; ?></div> -->
				</div>
				
				
			</div>
			<?php } else { ?>
			<p><?php echo $text_empty; ?></p>
			<div class="buttons">
				<div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
			</div>
			<?php } ?>
		<?php echo $content_bottom; ?></div>
	<?php //echo $column_right; ?></div>
</div>
<?php echo $footer; ?>