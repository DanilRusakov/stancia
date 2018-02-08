<div class="box pattern">
	<div class="box-heading"><?php echo $heading_title; ?></div>
	<div class="strip-line"></div>
	<div class="box-content box-blog-latest container">
                <div class="row">
                    <?php foreach($news as $item){ ?>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="text-align: center;">
                            <a href="<?php echo $item['href'];?>"><img src="<?php echo $item['thumb'];?>" alt="<?php echo $item['title']; ?>"></a>
                            <h4 style="text-align: left;"><a href="<?php echo $item['href'];?>"><?php echo $item['title']; ?></a></h4>
                            <p style="text-align: left;"><?php echo $item['description'];?></p>
                        </div>
                    <?php }?>
                </div>
	</div>
</div>