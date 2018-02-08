<?php echo $header; 
$theme_options = $this->registry->get('theme_options');
$config = $this->registry->get('config'); 
include('catalog/view/theme/' . $config->get('config_template') . '/template/new_elements/wrapper_top.tpl'); ?>
            <?php if ($news_list) { ?>
            <div class="row">
                <?php foreach ($news_list as $news_item) { ?>
                <div class="product-layout product-list col-xs-12">
                    <div class="row">
                        <?php if($news_item['thumb']) { ?>
                        <div class="image col-lg-3 col-md-3 col-sm-12"><a href="<?php echo $news_item['href']; ?>"><img src="<?php echo $news_item['thumb']; ?>" alt="<?php echo $news_item['title']; ?>" title="<?php echo $news_item['title']; ?>" class="img-responsive" /></a></div>
                        <?php }?>
                        
                            <div class="caption caption col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                <h4 style="padding-top: 0;"><a href="<?php echo $news_item['href']; ?>"><?php echo $news_item['title']; ?></a></h4>
                                <p style="margin: 0; color: #8c8c8c;"><? echo $news_item['posted']; ?></p>
                                <p><?php echo $news_item['description']; ?> ...</p>
                                <div class="button-group" >
                                <a href="<? echo $news_item['href']; ?>" class="button">Читать дальше</a>
                                </div>
                            </div>
                            
                        
                    </div>
                </div>
                <?php } ?>
            </div>
            <div class="row">

                <div class="pagination-results">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                </div>
                
                
            </div>
            <?php } else { ?>
            <p><?php echo $text_empty; ?></p>
            <div class="buttons">
                <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
            <?php } ?>
<?php include('catalog/view/theme/' . $config->get('config_template') . '/template/new_elements/wrapper_bottom.tpl'); ?>
<?php echo $footer; ?>