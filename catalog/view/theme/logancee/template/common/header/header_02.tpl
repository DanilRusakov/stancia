<?php if($theme_options->get( 'fixed_header' ) == 1) { ?>
<div class="sticky-header is-sticky fixed-header" style=" ">
     <div class="wrap">
          <div class="standard-body">
               <div class="full-width">
                    <div class="container"><div style="position: relative">
                         <div class="logo-sticky">
                              <?php if ($logo) { ?>
                              <a href="<?php echo $home; ?>"><span><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></span></a>
                              <?php } ?>
                         </div>
                         
                         <div class="sticky-icon-group">
							 <div class="add_info_menu" style="display: flex">
								 <div>
									 <span><a href="/contact-us">Интернет-магазин:</a></span><br>
									 ежедневно 10-22
								 </div>
								 <div>
									 <span><a href="/contact-us">Вейпшоп:</a></span><br>
									 ежедневно 14-22
								 </div>
								 <div class="social">
                      <a href="https://vk.com/stanciapro"><i class="fa fa-vk" aria-hidden="true"></i></a>
                      <a href="https://www.instagram.com/stanciapro/"><i class="fa fa-instagram"></i></a>
                      <a href="https://www.facebook.com/stanciapro/"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                      <br>
                  <a href="tel:<? echo $telephone; ?>"><strong><? echo $telephone; ?></strong></a><br>
                  <span style="font-size: 12px;">м. Курская, Земляной Вал, 36</span>
                  </div>
							 </div>
                              <div class="sticky-search">
                                   <i class="icon-magnifier"></i>
                                   <div class="quick-search">
                                        <div class="form-search">
                                             <input id="search2" type="text" name="q" value="" class="input-text search11" maxlength="128" placeholder="<?php echo $search; ?>" autocomplete="off">
                                             <button type="submit" title="Search" class="button-search"><span><i aria-hidden="true" class="icon_search"></i></span></button>
                                        </div>
                                        <i aria-hidden="true" class="icon_close"></i>
                                   </div>
                              </div>
                              
                              <div class="sticky-cart">
                                   <?php echo $cart; ?>
                              </div>
                              
                              <!--<div class="settings">
                                    <i class="icon-settings"></i>
                                    <div class="settings-inner">
                                         <div class="setting-content">
                                              <?php if($language != '') { ?>
                                              <div class="setting-language">
                                                   <div class="title"><? if($theme_options->get( 'select_language_text', $config->get( 'config_language_id' ) ) != '') { echo html_entity_decode($theme_options->get( 'select_language_text', $config->get( 'config_language_id' ) )); } else { echo 'Select language'; } ?></div>
                                                   <?php echo $language; ?>
                                              </div>
                                              <?php } ?>
                                              
                                              <?php if($currency != '') { ?>
                                              <div class="setting-currency">
                                                   <div class="title"><?php if($theme_options->get( 'select_currency_text', $config->get( 'config_language_id' ) ) != '') { echo html_entity_decode($theme_options->get( 'select_currency_text', $config->get( 'config_language_id' ) )); } else { echo 'Select currency'; } ?></div>
                                                   <?php echo $currency; ?>
                                              </div>
                                              <?php } ?>
                                              
                                              <div class="setting-option">
                                                   <ul>
                                                        <li><a href="<?php echo $login; ?>"><i class="icon-lock-open icons"></i><span>Вход / <?php echo $text_register; ?></span></a></li>
                                                        <li><a href="<?php echo $account; ?>"><i class="icon-user icons"></i><span><?php echo $text_account; ?></span></a></li>
                                                        <li><a href="<?php echo $wishlist; ?>"><i class="icon-heart icons"></i><span><?php echo $text_wishlist; ?></span></a></li>
                                                        <li><a href="<?php echo $shopping_cart; ?>"><i class="icon-handbag icons"></i><span><?php echo $text_shopping_cart; ?></span></a></li>
                                                        <li><a href="<?php echo $checkout; ?>"><i class="icon-note icons"></i><span><?php echo $text_checkout; ?></span></a></li>
                                                   </ul>
                                              </div>
                                         </div>
                                    </div>
                               </div>-->
                          </div>
                         
                         <div class="main-menu">
                              <?php 
                              $menu = $modules->getModules('menu');
                              if( count($menu) ) {
                              	foreach ($menu as $module) {
                              		echo $module;
                              	}
                              } elseif($categories) {
                              ?>
                              <div class="container-megamenu container horizontal">
                              	<div class="megaMenuToggle">
                              		<div class="megamenuToogle-wrapper">
                              			<div class="megamenuToogle-pattern">
                              				<div class="container">
                              					<div><span></span><span></span><span></span></div>
                              					Navigation
                              				</div>
                              			</div>
                              		</div>
                              	</div>
                              	
                              	<div class="megamenu-wrapper">
                              		<div class="megamenu-pattern">
                              			<div class="container">
                              				<ul class="megamenu shift-up">
                              					<?php foreach ($categories as $category) { ?>
                              					<?php if ($category['children']) { ?>
                              					<li class="with-sub-menu hover"><p class="close-menu"></p><p class="open-menu"></p>
                              						<a href="<?php echo $category['href'];?>"><span><strong><?php echo $category['name']; ?></strong></span></a>
                              					<?php } else { ?>
                              					<li>
                              						<a href="<?php echo $category['href']; ?>"><span><strong><?php echo $category['name']; ?></strong></span></a>
                              					<?php } ?>
                              						<?php if ($category['children']) { ?>
                              						<?php 
                              							$width = '100%';
                              							$row_fluid = 3;
                              							if($category['column'] == 1) { $width = '270px'; $row_fluid = 12; }
                              							if($category['column'] == 2) { $width = '500px'; $row_fluid = 6; }
                              							if($category['column'] == 3) { $width = '700px'; $row_fluid = 4; }
                              						?>
                              						<div class="sub-menu" style="width: <?php echo $width; ?>">
                              							<div class="content">
                              								<p class="arrow"></p>
                              								<div class="row hover-menu">
                              									<?php for ($i = 0; $i < count($category['children']);) { ?>
                              									<div class="col-sm-<?php echo $row_fluid; ?> mobile-enabled">
                              										<div class="menu">
                              											<ul>
                              											  <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                              											  <?php for (; $i < $j; $i++) { ?>
                              											  <?php if (isset($category['children'][$i])) { ?>
                              											  <li><a href="<?php echo $category['children'][$i]['href']; ?>" onclick="window.location = '<?php echo $category['children'][$i]['href']; ?>';"><?php echo $category['children'][$i]['name']; ?></a></li>
                              											  <?php } ?>
                              											  <?php } ?>
                              											</ul>
                              										</div>
                              									</div>
                              									<?php } ?>
                              								</div>
                              							</div>
                              						</div>
                              						<?php } ?>
                              					</li>
                              					<?php } ?>
                              				</ul>
                              			</div>
                              		</div>
                              	</div>
                              </div>
                              <?php
                              }
                              ?>
                              </div>
                         </div>
                    </div>
               </div>
          </div>
     </div>
</div>
<?php } ?>

<!-- HEADER
	================================================== -->
<header class="header header-layout-2">
	<div class="background-header"></div>
	<div class="slider-header">
		<!-- Top Bar -->
		<div id="top-bar" class="<?php if($theme_options->get( 'top_bar_layout' ) == 2) { echo 'fixed'; } else { echo 'full-width'; } ?>">
			<div class="background-top-bar"></div>
			<div class="background">
				<div class="shadow"></div>
				<div class="pattern">
					<div class="container">
						<!--<div class="header-top-inner">
						     <div class="row">
						          <div class="col-xs-10 col-sm-10 col-md-6 col-lg-6">
									  <div class="home2-block-phone-email">
										  <span class="icon_phone">&nbsp;&nbsp;</span>Номер: <strong><?php echo $telephone; ?></strong> &nbsp;&nbsp;|&nbsp;&nbsp;
										  <span class="icon_mail">&nbsp;&nbsp;</span>Email: <?php echo $email_me; ?>
									  </div>
						               <?php $top_blocks = $modules->getModules('top_block'); ?>
						               <?php  if(count($top_blocks)) { ?>
						                    <?php foreach($top_blocks as $module) { ?>
						               	<?php echo $module; ?>
						               	<?php } ?>
						               <?php } ?>
						          </div>
						          
						          <div class="hidden-xs hidden-sm col-xs-12 col-sm-12 col-md-6 col-lg-6">
						               <div class="top-bar">
						                    <div class="inner-top-bar">
						                         <?php if ($logged) { ?>
						                         <div class="register-topbar">
						                              <a href="<?php echo $logout; ?>"><span><i aria-hidden="true" class="icon_lock">&nbsp;</i> <?php echo $text_logout; ?></span></a>
						                         </div>
						                         <?php } else { ?>
						                         <div class="register-topbar">
						                              <a href="<?php echo $login; ?>"><span><i aria-hidden="true" class="icon_lock">&nbsp;</i> Вход</span></a>
						                         </div>
						                         <?php } ?>
						                         
						                         <?php if($currency != '') { ?><span class="delimiter"></span><?php } ?>
     						                    <?php echo $currency; ?>
						                         <?php if($language != '') { ?><span class="delimiter"></span><?php } ?>
     						                    <?php echo $language; ?>
						                    </div>
						               </div>
						          </div>
						          
						          <div class="settings-topbar visible-sm-block visible-xs-block col-xs-2">
						               <div class="settings">
						                    <i class="icon-settings"></i>
						                    <div class="settings-inner">
						                         <div class="setting-content">
						                              <?php if($language != '') { ?>
						                              <div class="setting-language">
						                                   <div class="title"><?php if($theme_options->get( 'select_language_text', $config->get( 'config_language_id' ) ) != '') { echo html_entity_decode($theme_options->get( 'select_language_text', $config->get( 'config_language_id' ) )); } else { echo 'Select language'; } ?></div>
						                                   <?php echo $language; ?>
						                              </div>
						                              <?php } ?>
						                              
						                              <?php if($currency != '') { ?>
						                              <div class="setting-currency">
						                                   <div class="title"><?php if($theme_options->get( 'select_currency_text', $config->get( 'config_language_id' ) ) != '') { echo html_entity_decode($theme_options->get( 'select_currency_text', $config->get( 'config_language_id' ) )); } else { echo 'Select currency'; } ?></div>
						                                   <?php echo $currency; ?>
						                              </div>
						                              <?php } ?>
						                              
						                              <div class="setting-option">
						                                   <ul>
						                                        <li><a href="<?php echo $login; ?>"><i class="icon-lock-open icons"></i><span>Вход  / <?php echo $text_register; ?></span></a></li>
						                                        <li><a href="<?php echo $account; ?>"><i class="icon-user icons"></i><span><?php echo $text_account; ?></span></a></li>
						                                        <li><a href="<?php echo $wishlist; ?>"><i class="icon-heart icons"></i><span><?php echo $text_wishlist; ?></span></a></li>
						                                        <li><a href="<?php echo $shopping_cart; ?>"><i class="icon-handbag icons"></i><span><?php echo $text_shopping_cart; ?></span></a></li>
						                                        <li><a href="<?php echo $checkout; ?>"><i class="icon-note icons"></i><span><?php echo $text_checkout; ?></span></a></li>
						                                   </ul>
						                              </div>
						                         </div>
						                    </div>
						               </div>
						          </div>
						     </div>
						</div>-->
					</div>
				</div>
			</div>
		</div>
		
		<!-- Top of pages -->
		<div id="top" class="<?php if($theme_options->get( 'header_layout' ) == 2) { echo 'fixed'; } else { echo 'full-width'; } ?>">
			<div class="background-top"></div>
			<div class="background">
				<div class="shadow"></div>
				<div class="pattern" >
					<div class="container">
					     <div class="sticky-header is-sticky">
					          <div class="logo-sticky">
					               <?php if ($logo) { ?>
					               <a href="<?php echo $home; ?>"><span><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></span></a>
					               <?php } ?>
								  <div class="add_info_pod_logo" style="padding-top: 10px;">
                    <span class="work_time">
                    <span style="font-weight: 700;">Интернет-магазин:</span>
                    ЕЖЕДНЕВНО 10-00 - 22-00</span><br>
                     <span class="work_time">
                    <span style="font-weight: 700 ">Вейпшоп:</span>
                    ЕЖЕДНЕВНО 14-00 - 22-00</span><br>
                    <div class="social_mob" style="font-size: 25px;margin-bottom: -20px;">
                      <a href="https://vk.com/stanciapro" style="padding: 0 5px;"><i class="fa fa-vk" aria-hidden="true"></i></a>
                      <a href="https://www.instagram.com/stanciapro/" style="padding: 0 5px;"><i class="fa fa-instagram"></i></a>
                      <a href="https://www.facebook.com/stanciapro/" style="padding: 0 5px;"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                    </div><br>
                                      <div><a href="tel:<? echo $telephone; ?>"><strong style="font-size: 20px;"><? echo $telephone; ?></strong></a></div>
									  <div><span style="font-size: 12px;">м. Курская, Земляной Вал, 36</span></div>
								  </div>
					          </div>
					          <div class="sticky-icon-group">
								  <div class="add_info_menu" style="display: flex">
									  <div>
										  <span><a href="/contact-us/">Интернет-магазин:</a></span><br>
										  ежедневно 10-22
									  </div>
									  <div>
										  <span><a href="/contact-us/">Вейпшоп:</a></span><br>
										  ежедневно 14-22
									  </div>
									  <div class="social">
                      <a href="https://vk.com/stanciapro"><i class="fa fa-vk" aria-hidden="true"></i></a>
                      <a href="https://www.instagram.com/stanciapro/"><i class="fa fa-instagram"></i></a>
                      <a href="https://www.facebook.com/stanciapro/"><i class="fa fa-facebook" aria-hidden="true"></i></a><br>
                      <a href="tel:<? echo $telephone; ?>"><strong><? echo $telephone; ?></strong></a>
                      <br>
                  <span style="font-size: 12px;">м. Курская, Земляной Вал, 36</span>
                    </div>
								  </div>
					               <div class="sticky-search">
					                    <i class="icon-magnifier"></i>
					                    <div class="quick-search">
					                         <div class="form-search">
					                              <input id="search2" type="text" name="search" value="" class="input-text search22" maxlength="128" placeholder="<?php echo $search; ?>" autocomplete="off">
					                              <button type="submit" title="Search" class="button-search"><span><i aria-hidden="true" class="icon_search"></i></span></button>
					                         </div>
					                         <i aria-hidden="true" class="icon_close"></i>
					                    </div>
					               </div>
					               
					               <div class="sticky-cart">
					                    <?php echo $cart; ?>
					               </div>
					               
					               <!--<div class="settings">
					                     <i class="icon-settings"></i>
					                     <div class="settings-inner">
					                          <div class="setting-content">
					                               <?php if($language != '') { ?>
					                               <div class="setting-language">
					                                    <div class="title"><?php if($theme_options->get( 'select_language_text', $config->get( 'config_language_id' ) ) != '') { echo html_entity_decode($theme_options->get( 'select_language_text', $config->get( 'config_language_id' ) )); } else { echo 'Select language'; } ?></div>
					                                    <?php echo $language; ?>
					                               </div>
					                               <?php } ?>
					                               
					                               <?php if($currency != '') { ?>
					                               <div class="setting-currency">
					                                    <div class="title"><?php if($theme_options->get( 'select_currency_text', $config->get( 'config_language_id' ) ) != '') { echo html_entity_decode($theme_options->get( 'select_currency_text', $config->get( 'config_language_id' ) )); } else { echo 'Select currency'; } ?></div>
					                                    <?php echo $currency; ?>
					                               </div>
					                               <?php } ?>
					                               
					                               <div class="setting-option">
					                                    <ul>
					                                         <li><a href="<?php echo $login; ?>"><i class="icon-lock-open icons"></i><span>Вход / <?php echo $text_register; ?></span></a></li>
					                                         <li><a href="<?php echo $account; ?>"><i class="icon-user icons"></i><span><?php echo $text_account; ?></span></a></li>
					                                         <li><a href="<?php echo $wishlist; ?>"><i class="icon-heart icons"></i><span><?php echo $text_wishlist; ?></span></a></li>
					                                         <li><a href="<?php echo $shopping_cart; ?>"><i class="icon-handbag icons"></i><span><?php echo $text_shopping_cart; ?></span></a></li>
					                                         <li><a href="<?php echo $checkout; ?>"><i class="icon-note icons"></i><span><?php echo $text_checkout; ?></span></a></li>
					                                    </ul>
					                               </div>
					                          </div>
					                     </div>
					                </div>-->
					           </div>
					          
					          <div class="main-menu">
					               <?php 
					               $menu = $modules->getModules('menu');
					               if( count($menu) ) {
					               	foreach ($menu as $module) {
					               		echo $module;
					               	}
					               } elseif($categories) {
					               ?>
					               <div class="container-megamenu container horizontal">
					               	<div class="megaMenuToggle">
					               		<div class="megamenuToogle-wrapper">
					               			<div class="megamenuToogle-pattern">
					               				<div class="container">
					               					<div><span></span><span></span><span></span></div>
					               					Navigation
					               				</div>
					               			</div>
					               		</div>
					               	</div>
					               	
					               	<div class="megamenu-wrapper">
					               		<div class="megamenu-pattern">
					               			<div class="container">
					               				<ul class="megamenu shift-up">
					               					<?php foreach ($categories as $category) { ?>
					               					<?php if ($category['children']) { ?>
					               					<li class="with-sub-menu hover"><p class="close-menu"></p><p class="open-menu"></p>
					               						<a href="<?php echo $category['href'];?>"><span><strong><?php echo $category['name']; ?></strong></span></a>
					               					<?php } else { ?>
					               					<li>
					               						<a href="<?php echo $category['href']; ?>"><span><strong><?php echo $category['name']; ?></strong></span></a>
					               					<?php } ?>
					               						<?php if ($category['children']) { ?>
					               						<?php 
					               							$width = '100%';
					               							$row_fluid = 3;
					               							if($category['column'] == 1) { $width = '270px'; $row_fluid = 12; }
					               							if($category['column'] == 2) { $width = '500px'; $row_fluid = 6; }
					               							if($category['column'] == 3) { $width = '700px'; $row_fluid = 4; }
					               						?>
					               						<div class="sub-menu" style="width: <?php echo $width; ?>">
					               							<div class="content">
					               								<p class="arrow"></p>
					               								<div class="row hover-menu">
					               									<?php for ($i = 0; $i < count($category['children']);) { ?>
					               									<div class="col-sm-<?php echo $row_fluid; ?> mobile-enabled">
					               										<div class="menu">
					               											<ul>
					               											  <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
					               											  <?php for (; $i < $j; $i++) { ?>
					               											  <?php if (isset($category['children'][$i])) { ?>
					               											  <li><a href="<?php echo $category['children'][$i]['href']; ?>" onclick="window.location = '<?php echo $category['children'][$i]['href']; ?>';"><?php echo $category['children'][$i]['name']; ?></a></li>
					               											  <?php } ?>
					               											  <?php } ?>
					               											</ul>
					               										</div>
					               									</div>
					               									<?php } ?>
					               								</div>
					               							</div>
					               						</div>
					               						<?php } ?>
					               					</li>
					               					<?php } ?>
					               				</ul>
					               			</div>
					               		</div>
					               	</div>
					               </div>
					               <?php
					               }
					               ?>
					          </div>
					     </div>
					</div>
				</div>
			</div>
		</div>
		<div class="line_separator" style=" box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24); height: 3px; margin-bottom: 3px; margin-top: -25px;"></div>
	</div>
	
	<?php $slideshow = $modules->getModules('slideshow'); ?>
	<?php  if(count($slideshow)) { ?>
	<!-- Slider -->
	<div id="slider" class="<?php if($theme_options->get( 'slideshow_layout' ) == 2) { echo 'fixed'; } else { echo 'full-width'; } ?>">
		<div class="background-slider"></div>
		<div class="background">
			<div class="shadow"></div>
			<div class="pattern">
				<?php foreach($slideshow as $module) { ?>
				<?php echo $module; ?>
				<?php } ?>
			</div>
		</div>
	</div>
	<?php } ?>

	<script type="text/javascript">
		$(document).ready(function () {
            $('.sticky-search').click(function() {
                $(this).children('.quick-search').children('.form-search').children('#search2').focus();
            });
        })
	</script>
</header>