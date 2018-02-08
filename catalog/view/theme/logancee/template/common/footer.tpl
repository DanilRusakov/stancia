<?php 
if($this->registry->has('theme_options') == true) { 
	$theme_options = $this->registry->get('theme_options');
	$config = $this->registry->get('config');
	
	require_once( DIR_TEMPLATE.$config->get('config_template')."/lib/module.php" );
	$modules = new Modules($this->registry);
	
	// Pobranie zmiennych
	$language_id = $config->get( 'config_language_id' );
	$customfooter = $theme_options->get( 'customfooter' );
	if(!isset($customfooter[$language_id])) {
		$customfooter[$language_id] = array(
			'aboutus_status' => 0,
			'twitter_status' => 0,
			'facebook_status' => 0,
			'contact_status' => 0,
			'customblock_status' => 0
		);
	}
	
	if(!isset($customfooter[$language_id]['customblock_status'])) $customfooter[$language_id]['customblock_status'] = 0;
	
	$customfooter_top = $modules->getModules('customfooter_top');
	$customfooter_bottom = $modules->getModules('customfooter_bottom');
	$customfooter_center = $modules->getModules('customfooter');
	$footer_center = $modules->getModules('footer');
	
	// Sprawdzanie czy panele są włączone
	if(isset($customfooter[$language_id]) || count($customfooter_top) || count($customfooter_bottom) || count($customfooter_center)) { 
		if($customfooter[$language_id]['twitter_status'] == '1' || $customfooter[$language_id]['contact_status'] == '1' || $customfooter[$language_id]['aboutus_status'] == '1' || $customfooter[$language_id]['facebook_status'] == '1' || count($customfooter_top) || count($customfooter_bottom) || count($customfooter_center)) { 
			
			// Ustalanie szerokości paneli
			$grids = 12; $test = 0;  
			if($customfooter[$language_id]['aboutus_status'] == '1') { $test++; } 
			if($customfooter[$language_id]['twitter_status'] == '1') { $test++; } 
			if($customfooter[$language_id]['facebook_status'] == '1') { $test++; } 
			if($customfooter[$language_id]['contact_status'] == '1') { $test++; } 
			if($customfooter[$language_id]['customblock_status'] == '1') { $test++; } 
			if($test == 0) { $test = 1; }
			$grids = 12/$test; 
			if($test == 5) $grids = 25;
	
	?>
	<!-- CUSTOM FOOTER
		================================================== -->
	<div class="custom-footer <?php if($theme_options->get( 'custom_footer_layout' ) == 2) { echo 'fixed'; } else { echo 'full-width'; } ?>">
		<div class="background-custom-footer"></div>
		<div class="background">
			<div class="shadow"></div>
			<div class="pattern">
				<div class="container">
					<?php 
					if( count($customfooter_top) ) { 
						foreach ($customfooter_top as $module) {
							echo $module;
						}
					} ?>
					
					<?php 
					if( count($customfooter_center) ) { 
						foreach ($customfooter_center as $module) {
							echo $module;
						}
					} else { ?>
     					<div class="row">
     						<?php if($customfooter[$language_id]['aboutus_status'] == '1') { ?>
     						<!-- About us -->
     						<div class="col-sm-<?php echo $grids; ?>">
     							<?php if($customfooter[$language_id]['aboutus_title'] != '') { ?>
     							<h4><i class="fa fa-info-circle"></i> <?php echo $customfooter[$language_id]['aboutus_title']; ?></h4>
     							<?php } ?>
     							<div class="custom-footer-text"><?php echo html_entity_decode($customfooter[$language_id]['aboutus_text']); ?></div>
     						</div>
     						<?php } ?>
     						
     						<?php if($customfooter[$language_id]['contact_status'] == '1') { ?>
     						<!-- Contact -->
     						<div class="col-sm-<?php echo $grids; ?>">
     							<?php if($customfooter[$language_id]['contact_title'] != '') { ?>
     							<h4><i class="fa fa-envelope"></i> <?php echo $customfooter[$language_id]['contact_title']; ?></h4>
     							<?php } ?>
     							<ul class="contact-us clearfix">
     								<?php if($customfooter[$language_id]['contact_phone'] != '' || $customfooter[$language_id]['contact_phone2'] != '') { ?>
     								<!-- Phone -->
     								<li>
     									<i class="fa fa-mobile-phone"></i>
     									<p>
     										<?php if($customfooter[$language_id]['contact_phone'] != '') { ?>
     											<?php echo $customfooter[$language_id]['contact_phone']; ?><br>
     										<?php } ?>
     										<?php if($customfooter[$language_id]['contact_phone2'] != '') { ?>
     											<?php echo $customfooter[$language_id]['contact_phone2']; ?>
     										<?php } ?>
     									</p>
     								</li>
     								<?php } ?>
     								<?php if($customfooter[$language_id]['contact_email'] != '' || $customfooter[$language_id]['contact_email2'] != '') { ?>
     								<!-- Email -->
     								<li>
     									<i class="fa fa-envelope"></i>
     									<p>
     										<?php if($customfooter[$language_id]['contact_email'] != '') { ?>
     											<span><?php echo $customfooter[$language_id]['contact_email']; ?></span><br>
     										<?php } ?>
     										<?php if($customfooter[$language_id]['contact_email2'] != '') { ?>
     											<span><?php echo $customfooter[$language_id]['contact_email2']; ?></span>
     										<?php } ?>
     									</p>
     								</li>
     								<?php } ?>
     								<?php if($customfooter[$language_id]['contact_skype'] != '' || $customfooter[$language_id]['contact_skype2'] != '') { ?>
     								<!-- Phone -->
     								<li>
     									<i class="fa fa-skype"></i>
     									<p>
     										<?php if($customfooter[$language_id]['contact_skype'] != '') { ?>
     											<?php echo $customfooter[$language_id]['contact_skype']; ?><br>
     										<?php } ?>
     										<?php if($customfooter[$language_id]['contact_skype2'] != '') { ?>
     											<?php echo $customfooter[$language_id]['contact_skype2']; ?>
     										<?php } ?>
     									</p>
     								</li>
     								<?php } ?>
     							</ul>
     						</div>
     						<?php } ?>
     						
     						<?php if($customfooter[$language_id]['twitter_status'] == '1') { ?>
     						<!-- Twitter -->
     						<div class="col-sm-<?php echo $grids; ?>">
     							<?php if($customfooter[$language_id]['twitter_title'] != '') { ?>
     							<h4><i class="fa fa-twitter"></i> <?php echo $customfooter[$language_id]['twitter_title']; ?></h4>
     							<?php } ?>
     							
     							<div class="twitter-feed">
     							    <div class="twitter-wrapper"><div class="tweets clearfix" id="twitterFeed"><small>Please wait whilst our latest tweets load.</small></div></div>
     							    <script type="text/javascript">
     							        $(window).load(function(){
     							            twitterFetcher.fetch('<?php echo $customfooter[$language_id]['twitter_widget_id'] ; ?>', 'twitterFeed', 2, true, false);
     							        });
     							    </script>
     							</div>  
     						</div>
     						<?php } ?>
     						
     						<?php if($customfooter[$language_id]['facebook_status'] == '1') { ?>
     						<!-- Facebook -->
     						<div class="col-sm-<?php echo $grids; ?>">
     							<?php if($customfooter[$language_id]['facebook_title'] != '') { ?>
     							<h4><i class="fa fa-facebook"></i> <?php echo $customfooter[$language_id]['facebook_title']; ?></h4>
     							<?php } ?>
     							
     							<div id="fb-root"></div>
     							<script>(function(d, s, id) {
     							  var js, fjs = d.getElementsByTagName(s)[0];
     							  if (d.getElementById(id)) return;
     							  js = d.createElement(s); js.id = id;
     							  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
     							  fjs.parentNode.insertBefore(js, fjs);
     							}(document, 'script', 'facebook-jssdk'));</script>
     														
     							<div id="facebook">
     								<?php if(!isset($customfooter[$language_id]['color_scheme'])) { $customfooter[$language_id]['color_scheme'] = false; } ?>
     								<div class="fb-like-box fb_iframe_widget" profile_id="<?php echo $customfooter[$language_id]['facebook_id']; ?>" data-show-border="false"
     								 data-width="260" data-height="<?php if($customfooter[$language_id]['facebook_height'] > 0) { echo $customfooter[$language_id]['facebook_height']; } else { echo '210'; } ?>" <?php if($customfooter[$language_id]['show_faces'] != '1') { ?>data-connections="<?php if($customfooter[$language_id]['facebook_faces'] > 0) { echo $customfooter[$language_id]['facebook_faces']; } else { echo '8'; } ?>"<?php } ?> data-colorscheme="<?php if($customfooter[$language_id]['color_scheme'] != '1') { echo 'light'; } else { echo 'dark'; } ?>" data-stream="false" data-header="false" data-show-faces="<?php if($customfooter[$language_id]['show_faces'] == '1') { echo 'false'; } else { echo 'true'; } ?>" fb-xfbml-state="rendered"></div>
     							</div>
     						</div>
     						<?php } ?>
     						
     						<?php if($customfooter[$language_id]['customblock_status'] == '1') { ?>
     						<!-- Custom block -->
     						<div class="col-sm-<?php echo $grids; ?>">
     							<?php if($customfooter[$language_id]['customblock_title'] != '') { ?>
     							<h4><?php echo $customfooter[$language_id]['customblock_title']; ?></h4>
     							<?php } ?>
     							<div class="custom-footer-text"><?php echo html_entity_decode($customfooter[$language_id]['customblock_text']); ?></div>
     						</div>
     						<?php } ?>
     					</div>
					<?php } ?>
					
					<?php 
					if( count($customfooter_bottom) ) { 
						foreach ($customfooter_bottom as $module) {
							echo $module;
						}
					} ?>
				</div>
			</div>
		</div>
	</div>
	<?php } } ?>
	
	<?php 
	$footer2 = $modules->getModules('footer2');
	if( count($footer2) ) { 
		foreach ($footer2 as $module) {
			echo $module;
		}
	} else { ?>
	
	<!-- FOOTER
		================================================== -->
	<div class="footer <?php if($theme_options->get( 'footer_layout' ) == 2) { echo 'fixed'; } else { echo 'full-width'; } ?>">
		<div class="background-footer"></div>
		<div class="background footer-main-part" ><!-- style="width: 1230px; max-width: none; margin:auto;" -->
			<div class="shadow"></div>
			<div class="pattern">
				<div class="">
					<?php 
					$footer_top = $modules->getModules('footer_top');
					if( count($footer_top) ) { 
						foreach ($footer_top as $module) {
							echo $module;
						}
					} ?>
					
					<?php 
					if( count($footer_center) ) { 
						foreach ($footer_center as $module) {
							echo $module;
						}
					} else { ?>
     					<div class="row">
     						<?php 
     						$footer_left = $modules->getModules('footer_left');
     						$footer_right = $modules->getModules('footer_right');
     						
     						$span = 3;
     						if( count($footer_left) && count($footer_right) ) {
     							$span = 2;
     						} elseif( count($footer_left) || count($footer_right) ) {
     							$span = 25;
     						} ?>
     						
     						<?php if( count($footer_left) ) { ?>
     						<div class="col-sm-<?php echo $span; ?>">
     						<?php foreach ($footer_left as $module) {
     								echo $module;
     							} ?>
     						</div>
     						<?php } ?>

							<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
								<div class="information-logo text-center">
									<div class="footer-static">
										<a class="logo-bottom" href="#"><img class="img-responsive" style="margin-top: -31px; max-height: 170px;" alt="Logo" src="image/vape-shop-stancia-logo.png"></a>
										<p style="font-size: 0.98em;">Интернет-магазин электронных сигарет. Вейпшоп "СТАНЦИЯ"</p>
									</div>
								</div>
							</div>
 								<!-- <div class="center_footer"> -->
									<!-- Information -->
									<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
		                                <h4>ИНФО</h4>
		                                <div class="strip-line"></div>
		                                <ul>
											<!-- <li><a href="<?php echo $informations[0]['href']; ?>"><?php echo $informations[0]['title']; ?></a></li> -->
											<li><a href="<?php echo $dostavka; ?>">Оплата и доставка</a></li>
											<li><a href="<? echo $contact_us ?>"><? echo $text_contact;?></a></li>
		                                </ul>
		                            </div>

									<!-- My Account -->
									<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
										<h4>Каталог</h4>
										<div class="strip-line"></div>
										<ul>
											<? foreach ($categories as $category) { ?>
											<li><a href="<? echo $category['href']; ?>"> <? echo $category['name']; ?></a></li>
											<? } ?>
										</ul>
									</div>
									
									<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
										<h4>Наши координаты</h4><div class="strip-line"></div><div class="clearfix" style="clear:both"><ul class="clearfix address-footer">
												<li class="item"><a><span class="icon_house_alt">&nbsp;</span>Земляной Вал,  36
														<br> м.Курская/Чкаловская</a></li>
												<!--<li class="item"><a><span class="icon_mobile">&nbsp;</span></a></li>-->
												<li class="item"><a><span class="icon_mail_alt">&nbsp;</span>welcome@stancia.pro</a></li>
											</ul></div>
									</div>
								<!-- </div> -->

							<div class="col-lg-2 col-md-2 col-sm-6 col-xs-12" style="   margin-left: -20px;">
								<script type="text/javascript" src="//vk.com/js/api/openapi.js?146"></script>
								<!-- VK Widget -->
								<div id="vk_groups" style=" margin:auto;"></div>
								<script type="text/javascript">
                                    VK.Widgets.Group("vk_groups", {mode: 3, color3: '000000'}, 130852286);
								</script>
							</div>
     						
     						<!-- Extras -->
     						<!--<div class="col-sm-<?php echo $span; ?>">
     							<h4><?php echo $text_extra; ?></h4>
     							<div class="strip-line"></div>
     							<ul>
     								<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
     								<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
     								<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
     								<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?> </a></li>
     							</ul>
     						</div>-->
     						
     						<?php if( count($footer_right) ) { ?>
     						<div class="col-sm-<?php echo $span; ?>">
     						<?php foreach ($footer_right as $module) {
     								echo $module;
     							} ?>
     						</div>
     						<?php } ?>
     					</div>
					<?php } ?>
					
					<?php 
					$footer_bottom = $modules->getModules('footer_bottom');
					if( count($footer_bottom) ) { 
						foreach ($footer_bottom as $module) {
							echo $module;
						}
					} ?>
				</div>
			</div>
		</div>
	</div>
	
	<!-- COPYRIGHT
		================================================== -->
	<div class="copyright <?php if($theme_options->get( 'footer_layout' ) == 2) { echo 'fixed'; } else { echo 'full-width'; } ?>">
		<div class="background-copyright"></div>
		<div class="background">
			<div class="shadow"></div>
			<div class="pattern">
				<div class="container">
					<div class="line"></div>
					<?php if(is_array($theme_options->get( 'payment' ))) { if($theme_options->get( 'payment_status' ) != '0') { ?>
					<ul>
						<?php foreach($theme_options->get( 'payment' ) as $payment) { 
							echo '<li>';
							if($payment['link'] != '') {
								$new_tab = false;
								if($payment['new_tab'] == 1) {
									$new_tab = ' target="_blank"';
								}
								echo '<a href="' .$payment['link']. '"'.$new_tab.'>';
							}
							echo '<img src="image/' .$payment['img']. '" alt="' .$payment['name']. '">';
							if($payment['link'] != '') {
								echo '</a>';
							}
							echo '</li>'; 
						} ?>
					</ul>
					<?php } } ?>
					<p>Вейпшоп "СТАНЦИЯ" @ <? echo date('Y');?></p>
					<?php 
					$bottom = $modules->getModules('bottom');
					if( count($bottom) ) { 
						foreach ($bottom as $module) {
							echo $module;
						}
					} ?>
				</div>
			</div>
		</div>
	</div>
	<?php } ?>
	<script type="text/javascript" src="catalog/view/theme/<?php echo $config->get( 'config_template' ); ?>/js/megamenu.js"></script>
</div>

<a href="#" class="scrollup"><i class="fa fa-angle-up"></i></a>
</div>
<?php } ?>




<!-- Yandex.Metrika counter -->
<script type="text/javascript">
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter41789964 = new Ya.Metrika({
                    id:41789964,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true,
                    webvisor:true
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/41789964" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->

<!-- BEGIN JIVOSITE CODE {literal} -->
<script type='text/javascript'>
(function(){ var widget_id = 'oV8Jb5OTBn';var d=document;var w=window;function l(){
var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);}if(d.readyState=='complete'){l();}else{if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})();</script>
<!-- {/literal} END JIVOSITE CODE -->

</body>
</html>