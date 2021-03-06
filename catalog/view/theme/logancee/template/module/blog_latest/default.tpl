<?php
if($this->registry->has('theme_options') == false) { 
 header("location: themeinstall/index.php"); 
 exit; 
}
$theme_options = $this->registry->get('theme_options');
?>
<div class="box blog-module blog-latest-posts box-no-advanced">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="strip-line"></div>
    <div class="box-content box-latest-posts">
        <?php if(!empty($articles)):?> 
        <ul class="blog-list-default">
            <?php foreach($articles as $article):?>
            <li>
                <div class="media">
                        <?php if($article['thumb']):?>
                        <div  class="thumb-holder">
                            <img alt="" src="<?php echo $article['thumb'] ?>">
                        </div>
                        <?php endif; ?>
                        <div class="media-body">
                            <div class="date-published"><?php echo date('d.m.Y', strtotime($article['date_published'])) ?></div>
                            <div class="title"><a href="<?php echo $article['href']; ?>"><?php echo $article['title'] ?></a></div>
                        </div>
                </div>
            </li>
            <?php endforeach; ?>
        </ul>
        <?php endif; ?>
    </div>
</div>