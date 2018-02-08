<?php echo $header; 
if(isset($mfilter_json)) {
	if(!empty($mfilter_json)) { 
		echo '<div id="mfilter-json" style="display:none">' . base64_encode( $mfilter_json ) . '</div>'; 
	} 
}

$theme_options = $this->registry->get('theme_options');
$config = $this->registry->get('config'); 
include('catalog/view/theme/'.$config->get('config_template').'/template/new_elements/wrapper_top.tpl'); ?>
<div id="mfilter-content-container">
  <?php if ($thumb || $description) { ?>
  <!--<div class="category-info clearfix">
    <?php if (false) { ?>
    <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
    <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>-->
  <?php } ?>
  <?php if ($categories && $theme_options->get('refine_search_style') != '2') { ?>
  <h2 class="refine_search"><?php echo $text_refine; ?></h2>
  <div class="category-list<?php if ($theme_options->get('refine_search_style') == '1') { echo ' category-list-text-only'; } ?>">
  	<div class="row">
  	  <?php 
  	  $class = 3; 
  	  $row = 4; 
  	  
  	  if($theme_options->get( 'refine_search_number' ) == 2) { $class = 62; }
  	  if($theme_options->get( 'refine_search_number' ) == 5) { $class = 25; }
  	  if($theme_options->get( 'refine_search_number' ) == 3) { $class = 4; }
  	  if($theme_options->get( 'refine_search_number' ) == 6) { $class = 2; }
  	  
  	  if($theme_options->get( 'refine_search_number' ) > 1) { $row = $theme_options->get( 'refine_search_number' ); } 
  	  ?>
	  <?php $row_fluid = 0; foreach ($theme_options->refineSearch() as $category) { $row_fluid++; ?>
	  	<?php 
	  	if ($theme_options->get('refine_search_style') != '1') {
	  		$width = 250;
	  		$height = 250;
	  		if($theme_options->get( 'refine_image_width' ) > 20) $width = $theme_options->get( 'refine_image_width' );
	  		if($theme_options->get( 'refine_image_height' ) > 20) $height = $theme_options->get( 'refine_image_height' );
	  		$model_tool_image = $this->registry->get('model_tool_image');
		  	if($category['thumb'] != '') { 
		  		$image = $model_tool_image->resize($category['thumb'], $width, $height); 
		  	} else { 
		  		$image = $model_tool_image->resize('no_image.jpg', $width, $height); 
		  	} 
	  	}
	  	?>
	  	<?php $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } ?>
	  	<div class="col-sm-<?php echo $class; ?> col-xs-6">
	  		<?php if ($theme_options->get('refine_search_style') != '1') { ?>
		  	<a href="<?php echo $category['href']; ?>"><img src="<?php echo $image; ?>" alt="<?php echo $category['name']; ?>" /></a>
		  	<?php } ?>
		  	<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
	  	</div>
	  <?php } ?>
	</div>
  </div>
  <?php } ?>
  <?php if ($products) { ?>
  <!-- Filter -->
  <div class="product-filter clearfix">
    <div class="options"><!-- 
  		<div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div> -->
  		
  		<div class="button-group display" data-toggle="buttons-radio">
  			<button id="grid" <?php if($theme_options->get('default_list_grid') == '1') { echo 'class="active"'; } ?> rel="tooltip" title="Grid" onclick="display('grid');"><i class="fa fa-th-large"></i></button>
  			<button id="list" <?php if($theme_options->get('default_list_grid') != '1') { echo 'class="active"'; } ?> rel="tooltip" title="List" onclick="display('list');"><i class="fa fa-th-list"></i></button>
  		</div>
  	</div>
  	
  	<div class="list-options">
  		<div class="sort hidden-sm hidden-xs">
  			<?php echo $text_sort; ?>
  			<select onchange="location = this.value;">
  			  <?php foreach ($sorts as $sorts) { ?>
  			  <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
  			  <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
  			  <?php } else { ?>
  			  <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
  			  <?php } ?>
  			  <?php } ?>
  			</select>  
  		</div>
      <div class="mob_sort visible-sm visible-xs"> 
        <div id="adaptive_filter" onClick="showFilter()">
          <!-- <a id="filter_opener" ><i></i><span>Фильтр</span></a> -->
        </div>
        <a href="<? echo $mob_sorts['name']['href']; if($mob_sorts['name']['value']=='DESC'){echo'&order=ASC';}?>" class = "NAME">
          <i class="icon" style="<? if($mob_sorts['name']['value']!=''){echo 'background-position: -2px -95px;';}?>"></i>
          <i class="<? if($mob_sorts['name']['value']=='DESC'){echo 'arr_down';}elseif($mob_sorts['name']['value']=='ASC'){echo 'arr_up';} else{echo 'arr';} ?>"></i>
        </a>  
        <a href="<? echo $mob_sorts['price']['href']; if($mob_sorts['price']['value']=='DESC'){echo'&order=ASC';}?>" class = "PRICE">
          <i class="icon" style="<? if($mob_sorts['price']['value']!=''){echo 'background-position: -2px -114px;';}?>"></i>
          <i class="<? if($mob_sorts['price']['value']=='DESC'){echo 'arr_down';}elseif($mob_sorts['price']['value']=='ASC'){echo 'arr_up';} else{echo 'arr';} ?>"></i>
        </a> 
        <a href="<? echo $mob_sorts['rating']['href']; if($mob_sorts['rating']['value']=='DESC'){echo'&order=ASC';}?>" class = "RATING">
          <i class="icon" style="<? if($mob_sorts['rating']['value']!=''){echo 'background-position: -2px -77px;';}?>"></i>
          <i class="<? if($mob_sorts['rating']['value']=='DESC'){echo 'arr_down';}elseif($mob_sorts['rating']['value']=='ASC'){echo 'arr_up';} else{echo 'arr';} ?>"></i>
        </a> 
        <a href="<? echo $mob_sorts['model']['href']; if($mob_sorts['model']['value']=='DESC'){echo'&order=ASC';} ?>" class = "MODEL">
          <i class="icon" style="<? if($mob_sorts['model']['value']!=''){echo 'background-position: 2px 3px;';}?>"></i>
          <i class="<? if($mob_sorts['model']['value']=='DESC'){echo 'arr_down';}elseif($mob_sorts['model']['value']=='ASC'){echo 'arr_up';} else{echo 'arr';} ?>"></i>
        </a> 
      </div>
  		
  		<div class="limit  hidden-sm hidden-xs">
  			<?php echo $text_limit; ?>
  			<select onchange="location = this.value;">
  			  <?php foreach ($limits as $limits) { ?>
  			  <?php if ($limits['value'] == $limit) { ?>
  			  <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
  			  <?php } else { ?>
  			  <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
  			  <?php } ?>
  			  <?php } ?>
  			</select>
  		</div>
  	</div>
  </div>
  
  <!-- Products list -->
  <div class="product-list"<?php if(!($theme_options->get('default_list_grid') == '1')) { echo ' class="active"'; } ?>>
    <?php foreach ($products as $product) {
  	$product_detail = $theme_options->getDataProduct( $product['product_id'] );
  	$text_new = 'New';
  	if($theme_options->get( 'latest_text', $config->get( 'config_language_id' ) ) != '') {
  	    $text_new = $theme_options->get( 'latest_text', $config->get( 'config_language_id' ) );
  	} ?>
  	<div class="row">
  	     <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
  	          <div class="product-list-img">
  	               <div class="product-show">
  	               	<?php if($product['special'] && $theme_options->get( 'display_text_sale' ) != '0') { ?>
  	               		<?php $text_sale = 'Sale';
  	               		if($theme_options->get( 'sale_text', $config->get( 'config_language_id' ) ) != '') {
  	               			$text_sale = $theme_options->get( 'sale_text', $config->get( 'config_language_id' ) );
  	               		} ?>
  	               		<?php if($theme_options->get( 'type_sale' ) == '1') { ?>
  	               		<?php $product_detail = $theme_options->getDataProduct( $product['product_id'] );
  	               		$roznica_ceny = $product_detail['price']-$product_detail['special'];
  	               		$procent = ($roznica_ceny*100)/$product_detail['price']; ?>
  	               		<div class="sale">-<?php echo round($procent); ?>%</div>
  	               		<?php } else { ?>
  	               		<div class="sale"><?php echo $text_sale; ?></div>
  	               		<?php } ?>
  	               	<?php } ?>
  	               	
  	               	<?php if($product_detail['is_latest'] && $theme_options->get( 'display_text_latest' ) != '0'):?>
  	               	    <div class="new-label"><span><?php echo $text_new; ?></span></div>
  	               	<?php endif; ?>


  	               	
  	                    <a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>" class="product-image">
  	                         <span class="front margin-image">
                                 <?php if ($product['quantity'] <= 0) { ?>
                                    <span style="color: red;     position: absolute;    right: 0;    z-index: 1;    top: 5%;">Нет в наличии</span>
                                 <?php } ?>
                                 <?php if($product['thumb']) { ?>
  	                         		<?php if($theme_options->get( 'lazy_loading_images' ) != '0') { ?>
  	                         		<img src="image/catalog/blank.gif" data-echo="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
  	                         		<?php } else { ?>
  	                         		<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
  	                         		<?php } ?>
  	                         	<?php } else { ?>
  	                         	<img src="image/no_image.jpg" alt="<?php echo $product['name']; ?>" />
  	                         	<?php } ?>
  	                         </span>
  	                         
  	                         <?php if($theme_options->get( 'product_image_effect' ) == '1') {
  	                         	$nthumb = str_replace(' ', "%20", ($product['thumb']));
  	                         	$nthumb = str_replace(HTTP_SERVER, "", $nthumb);
  	                         	$image_size = getimagesize($nthumb);
  	                         	$image_swap = $theme_options->productImageSwap($product['product_id'], $image_size[0], $image_size[1]);
  	                         	if($image_swap != '') echo '<span class="product-img-additional back margin-image"><img src="' . $image_swap . '" alt="' . $product['name'] . '" class="swap-image" /></span>';
  	                         } ?> 
  	                    </a>
  	                    
  	                    <?php if($theme_options->get( 'quick_view' ) == 1) { ?>
  	                    <div class="category-over product-show-box">
  	                         <div class="main-quickview quickview">  	                              
  	                              <a class="btn show-quickview" href="index.php?route=product/quickview&product_id=<?php echo $product['product_id']; ?>" title="<?php echo $product['name']; ?>"><span><i aria-hidden="true" class="arrow_expand"></i></span></a>
  	                         </div>
  	                    </div>`
  	                    <?php } ?>
  	               </div>
  	          </div>
  	     </div>
  	     
  	     <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
  	          <div class="product-shop">
  	               <h2 class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
  	               <div class="product-value">
  	                    <div class="price-box">
  	                    	<?php if (!$product['special']) { ?>
  	                    	<span class="regular-price"><span class="price"><?php echo $product['price']; ?></span></span>
  	                    	<?php } else { ?>
  	                    	<p class="old-price">
  	                    	     <span class="price"><?php echo $product['price']; ?></span>
  	                    	</p>
  	                    	
  	                    	<p class="special-price">
  	                    	     <span class="price"><?php echo $product['special']; ?></span>
  	                    	</p>
  	                    	<?php } ?>
  	                    </div>
  	                    
  	                    <?php if ($product['rating']) { ?>
  	                    <div class="rating-reviews clearfix">
  	                         <div class="rating"><i class="fa fa-star<?php if($product['rating'] >= 1) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($product['rating'] >= 2) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($product['rating'] >= 3) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($product['rating'] >= 4) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($product['rating'] >= 5) { echo ' active'; } ?>"></i></div>
  	                    </div>
  	                    <?php } ?>
  	               </div>
  	               
  	               <div class="desc std"><?php echo $product['description']; ?></div>
  	               <div class="typo-actions clearfix">
  	                    <div class="addtocart">
  	                           <?php $enquiry = false; if($config->get( 'product_blocks_module' ) != '') { $enquiry = $theme_options->productIsEnquiry($product['product_id']); }
  	                           if(is_array($enquiry)) { ?>
  	                           <a href="javascript:openPopup('<?php echo $enquiry['popup_module']; ?>', '<?php echo $product['product_id']; ?>')" class="button button-enquiry">
  	                                <?php if($enquiry['icon'] != '' && $enquiry['icon_position'] == 'left') { echo '<img src="image/' . $enquiry['icon']. '" align="left" class="icon-enquiry" alt="Icon">'; } ?>
  	                                <span class="text-enquiry"><?php echo $enquiry['block_name']; ?></span>
  	                                <?php if($enquiry['icon'] != '' && $enquiry['icon_position'] == 'right') { echo '<img src="image/' . $enquiry['icon']. '" align="right" class="icon-enquiry" alt="Icon">'; } ?>
  	                           </a>
  	                           <?php } else { ?>
  	                           <a onclick="cart.add('<?php echo $product['product_id']; ?>');" class="button"><?php echo $button_cart; ?></a>
  	                           <?php } ?>
  	                    </div>

  	                    <div class="addtolist">
  	                         <div class="add-to-links" style="display: none;">
  	                              <div class="wishlist">
  	                                   <a onclick="wishlist.add('<?php echo $product['product_id']; ?>');" title="" data-toggle="tooltip" data-placement="top" class="link-wishlist" data-original-title="<?php if($theme_options->get( 'add_to_wishlist_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'add_to_wishlist_text', $config->get( 'config_language_id' ) ); } else { echo 'Добавить в список желаний'; } ?>"><i aria-hidden="true" class="icon_heart_alt"></i></a>
  	                              </div>
  	                              
  	                              <div class="compare" style="display: none;">
  	                                   <a rel="nofollow" onclick="compare.add('<?php echo $product['product_id']; ?>');" title="" data-toggle="tooltip" data-placement="top" class="link-compare" data-original-title="<?php if($theme_options->get( 'add_to_compare_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'add_to_compare_text', $config->get( 'config_language_id' ) ); } else { echo 'Добавить в сравнение'; } ?>"><i aria-hidden="true" class="icon_piechart"></i></a>
  	                              </div>
  	                         </div>
  	                    </div>
  	               </div>
  	          </div>
  	     </div>
  	</div>
  	<?php } ?>
  </div>
  
  <!-- Products grid -->
  <?php 
  $class = 3; 
  $row = 4; 
  
  if($theme_options->get( 'product_per_pow2' ) == 6) { $class = 2; }
  if($theme_options->get( 'product_per_pow2' ) == 5) { $class = 25; }
  if($theme_options->get( 'product_per_pow2' ) == 3) { $class = 4; }
  
  if($theme_options->get( 'product_per_pow2' ) > 1) { $row = $theme_options->get( 'product_per_pow2' ); } 
  ?>
  <div class="product-grid"<?php if($theme_options->get('default_list_grid') == '1') { echo ' class="active"'; } ?>>
  	<div class="row">
	  	<?php $row_fluid = 0; foreach ($products as $product) { $row_fluid++; ?>
		  	<?php $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } ?>
		  	<div class="col-sm-<?php echo $class; ?> col-xs-6">
                <?php include('catalog/view/theme/'.$config->get('config_template').'/template/new_elements/product.tpl'); ?>
		  	</div>
	    <?php } ?>
    </div>
  </div>
  
  <div class="row pagination-results">
    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
  </div>
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <p style="padding-top: 6px"><?php echo $text_empty; ?></p>
  <div class="buttons">
    <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
<div class="description_category">
    <div id="tabs" class="htabs">
      <a href="#tab-description" class="selected">Описание <!-- <? echo $tab_description;?> --></a>
      <a href="#tab-comment" class="">Отзывы</a>
      <a href="#tab-review">Обзор</a>
    </div>
    
    <div id="tab-description" class="tab-content" itemprop="description" style="display: block;">
      <?=$description?>
    </div>
    <div id="tab-comment" class="tab-content" style="display: none;">
        <!-- Put this script tag to the <head> of your page -->
        <script type="text/javascript" src="//vk.com/js/api/openapi.js?150"></script>

        <script type="text/javascript">
          VK.init({apiId: 6266907, onlyWidgets: true});
        </script>

        <!-- Put this div tag to the place, where the Comments block will be -->
        <div id="vk_comments"></div>
        <script type="text/javascript">
        VK.Widgets.Comments("vk_comments", {limit: 10, attach: "*"});
        </script>

    </div>
    <div id="tab-review">
      <br>
      <? echo $tab_review;?>
    </div>


	
</div>
<script type="text/javascript"><!--
function display(view) {

	if (view == 'list') {
		$('.product-grid').removeClass("active");
		$('.product-list').addClass("active");

		$('.display').html('<button id="grid" rel="tooltip" title="Grid" onclick="display(\'grid\');"><i class="fa fa-th-large"></i></button> <button class="active" id="list" rel="tooltip" title="List" onclick="display(\'list\');"><i class="fa fa-th-list"></i></button>');
		
		localStorage.setItem('display', 'list');
	} else {
	
		$('.product-grid').addClass("active");
		$('.product-list').removeClass("active");
					
		$('.display').html('<button class="active" id="grid" rel="tooltip" title="Grid" onclick="display(\'grid\');"><i class="fa fa-th-large"></i></button> <button id="list" rel="tooltip" title="List" onclick="display(\'list\');"><i class="fa fa-th-list"></i></button>');
		
		localStorage.setItem('display', 'grid');
	}
}

if (localStorage.getItem('display') == 'list') {
	display('list');
} else {
	display('grid');
}
//--></script> 
</div>
<?php include('catalog/view/theme/'.$config->get('config_template').'/template/new_elements/wrapper_bottom.tpl'); ?>
<script type="text/javascript">
    $(document).ready(function () {
        $("#carousel1").css("margin-top"," 25px"); 
    })
</script>


<script type="text/javascript">
    $.fn.tabs = function() {
        var selector = this;

        this.each(function() {
            var obj = $(this);

            $(obj.attr('href')).hide();

            $(obj).click(function() {
                $(selector).removeClass('selected');

                $(selector).each(function(i, element) {
                    $($(element).attr('href')).hide();
                });

                $(this).addClass('selected');

                $($(this).attr('href')).show();

                return false;
            });
        });

        $(this).show();

        $(this).first().click();
    };
</script>

<script type="text/javascript"><!--
    $('#tabs a').tabs();


  function showFilter(){
    $("#adaptive_filter").css("background-position"," -1px -62px "); 
    $("#mfilter-box-1").css("display"," inline");
    $("#adaptive_filter").attr("onclick","hideFilter()");
    $('html, body').animate({scrollTop: 500},500);
  }
  function hideFilter(){
    $("#adaptive_filter").css("background-position"," -19px -62px ");  
    $("#mfilter-box-1").css("display"," none");
    $("#adaptive_filter").attr("onclick","showFilter()");
    $('html, body').animate({scrollTop: 0},500);
  }

 
    //--></script>


<?php echo $footer; ?>