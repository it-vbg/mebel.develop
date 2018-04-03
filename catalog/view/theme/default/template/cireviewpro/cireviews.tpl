<div class="cireview-wrap">
  <div class="cireview-aggerate cireviews">    
    <div class="row">
        <?php /* ?>
      <h3 class="cireview-aggerate-title"><a href="<?php echo $href_review; ?>"><?php echo $text_reviewover; ?></a></h3>
  <?php */ ?>
      <div class="col-sm-7 col-xs-12 xl-70 xs-100 sm-100 j-margin">
        <ul class="list-unstyled average rating">
          <li><label class="control-label"><?php echo $text_rating; ?></label> 
            <?php for ($i = 1; $i <= 5; $i++) { ?>
            <?php if ($avg_rating < $i) { ?>
            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
            <?php } else { ?>
            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
            <?php } ?>
            <?php } ?>
            <!-- /*new update starts*/ --><?php if ($reviewratingcount) { ?><span class="ciratingcount"> (<?php echo $show_avg_rating; ?>) </span><?php } ?><!-- /*new update ends*/ -->
          </li>
        </ul>
        <p><?php echo $text_total_reviews; ?></p>
      </div>
      <div class="col-sm-5 col-xs-12 all-rating xl-30 xs-100 sm-100 j-margin">
        
        <?php if($cireview_ratings && count($cireview_ratings) > 1) { ?>
        
        <ul class="list-unstyled">
          <?php foreach($cireview_ratings as $cireview_rating) { ?>
          <li class="cireview_avgrating-<?php echo $cireview_rating['ciratingtype_id']; ?> ">
            <label class="control-label"><?php echo $cireview_rating['ciratingtype_name']; ?> : </label>
            <div class="stars rating">
              <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($cireview_rating['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } ?>
              <?php } ?>
              <!-- /*new update starts*/ --><?php if ($reviewratingcount) { ?><span class="ciratingcount"> (<?php echo $cireview_rating['show_rating']; ?>) </span><?php } ?><!-- /*new update ends*/ -->
            </div>
          </li>
          <?php } ?>
        </ul>
        <?php } ?>
        </div>
    </div>
  </div>

  <?php if ($reviews) { ?>
  <?php foreach ($reviews as $review) { ?>
  <div class="cireview-list cireviews">
    <div class="row">
      <div class="col-sm-7 col-xs-12 xl-70 xs-100 sm-100">
        <?php if(!empty($review['author'])) { ?>
        <h3><?php echo $text_author; ?><?php echo $review['author']; ?></h3>
        <?php } ?>
        <?php if(!empty($review['reviewtitle'])) { ?>
        <h4><label class="control-label"><?php echo $text_title; ?></label> <?php echo $review['reviewtitle']; ?></h4>
        <?php } ?>
        <ul class="list-unstyled average rating">
          <li><label class="control-label"><?php echo $text_date_added; ?></label> <?php echo $review['date_added']; ?></li>
          <?php if ($review['rating']) { ?>
          <li> <label class="control-label"><?php echo $text_rating; ?> </label>
            <?php for ($i = 1; $i <= 5; $i++) { ?>
            <?php if ($review['rating'] < $i) { ?>
            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
            <?php } else { ?>
            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
            <?php } ?>
            <?php } ?>
            <!-- /*new update starts*/ --><?php if ($reviewratingcount) { ?><span class="ciratingcount"> (<?php echo $review['show_rating']; ?>) </span><?php } ?><!-- /*new update ends*/ -->
          </li>
          <?php } ?>
        </ul>
        <p><?php echo $review['text']; ?></p>
      </div>
      <div class="col-sm-5 col-xs-12 all-rating xl-30 xs-100 sm-100">
        <?php if($review['cireview_ratings'] && count($review['cireview_ratings']) > 1) { ?>
        <ul class="list-unstyled">
          <?php foreach($review['cireview_ratings'] as $cireview_rating) { ?>
          <li class="cireview_rating-<?php echo $review['review_id']; ?>-<?php echo $cireview_rating['cireview_rating_id']; ?> ">
            <label class="control-label"><?php echo $cireview_rating['ciratingtype_name']; ?> : </label>
            <div class="stars rating">
              <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($cireview_rating['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } ?>
              <?php } ?>
              <!-- /*new update starts*/ --><?php if ($reviewratingcount) { ?><span class="ciratingcount"> (<?php echo $cireview_rating['show_rating']; ?>) </span><?php } ?><!-- /*new update ends*/ -->
            </div>
          </li>
          <?php } ?>
        </ul>
        <?php } ?>

        <?php if($reviewshare) { ?>
        <!-- AddThis Button BEGIN -->
        <div class="addthis_toolbox addthis_default_style addthis_16x16_style" data-url="<?php echo $review['share']; ?>" addthis:url="<?php echo $review['share']; ?>" data-title="<?php echo $review['author']; ?>" addthis:title="<?php echo $review['author']; ?>" data-description="<?php echo $review['text']; ?>" addthis:description="<?php echo $review['text']; ?>">
        <a class="addthis_button_facebook"></a> 
        <a class="addthis_button_tweet"></a>
        <a class="addthis_button_google_plusone_share"></a> 
        <a class="addthis_button_email"></a>  
        <a class="addthis_button_compact"></a>
        <!--
        <a class="addthis_counter addthis_pill_style"></a>
        <a class="addthis_button_facebook_like"></a>         
        <a class="addthis_button_pinterest_pinit"></a>        
         -->
        </div>
        <!-- AddThis Button END -->
        <?php } ?>
        </div>
        <div class="col-sm-12 col-xs-12 xl-100 xs-100">
            <?php if($review['attach_images']) { ?>
              <ul class="list list-inline cireviewattach_images" id="cireviewattach_images-<?php echo $review['review_id']; ?>">
                <?php foreach($review['attach_images'] as $attach_image) { ?>
                <li id="cireviewattach_image-<?php echo $attach_image['cireview_image_id']; ?>">
                <a href="<?php echo $attach_image['popup']; ?>"> <img src="<?php echo $attach_image['thumb']; ?>" alt="<?php echo $heading_title; ?>" /> </a>
                </li>
                <?php } ?>
              </ul>
            <?php } ?>
        </div>
        <?php if($review['comment']) { ?>
        <div class="col-sm-12 col-xs-12 xl-100 xs-100">
          <div class="cireviewcomment">
            <label class="control-label"><?php echo $text_replyby; ?>: <?php echo $reviewreplyauthor; ?></label> <br/> 
            <?php echo $review['comment']; ?>
          </div>
        </div>
        <?php } ?>
        <?php if($reviewvote) { ?>
        <div class="col-sm-9 xl-80 xs-100 cireview-vote" id="cireview-vote-<?php echo $review['review_id']; ?>-<?php echo $product_id; ?>-<?php echo $review['cireview_id']; ?>">

          <span class="vote-action"> 
            <?php echo $review['votes']['before_text']; ?>  
            <a data-review_id="<?php echo $review['review_id']; ?>" data-product_id="<?php echo $product_id; ?>" data-cireview_id="<?php echo $review['cireview_id']; ?>" data-action="1" class="btn btn-xs vote-button-action yes-btn"><i class="fa fa-thumbs-up" aria-hidden="true"></i> <?php /*<span class="hidden-xs"><?php echo $text_yes; ?></span>*/ ?></a> 
            <a data-review_id="<?php echo $review['review_id']; ?>" data-product_id="<?php echo $product_id; ?>" data-cireview_id="<?php echo $review['cireview_id']; ?>" data-action="0" class="btn btn-xs vote-button-action no-btn"><i class="fa fa-thumbs-down" aria-hidden="true"></i> <?php /*<span class="hidden-xs"><?php echo $text_no; ?></span>*/?></a> 
          </span>
          <span class="vote-result"> 
            <?php echo $review['votes']['after_text']; ?> 
          </span>
          
        </div>
        <?php } ?>
        <?php if($reviewabuse) { ?>
        <div class="col-sm-3 xl-20 xs-100 pull-right cireview-abuse" id="cireview-abuse-<?php echo $review['review_id']; ?>-<?php echo $product_id; ?>-<?php echo $review['cireview_id']; ?>">
          <a data-review_id="<?php echo $review['review_id']; ?>" data-product_id="<?php echo $product_id; ?>" data-cireview_id="<?php echo $review['cireview_id']; ?>" data-action="1" class="abuse-button-action"><?php echo $text_reviewabuse; ?></a>
        </div>
        <?php } ?>
    </div>
  </div>
  <?php } ?>
  <div class="row">
    <div class="col-md-6 col-sm-12 xl-60 xs-100">
      <div class="text-left"><?php echo $results; ?></div>
    </div>
    <div class="col-md-6 col-sm-12 xl-60 xs-100">
      <div class="text-right"><?php echo $pagination; ?></div>
    </div>
  </div>

  <script type="text/javascript">
    $('.cireviewattach_images').each(function() {
      $(this).magnificPopup({
        type:'image',
        delegate: 'a',
        gallery: {
          enabled:true
        }
      });
    });

  </script>


  <?php } else { ?>
  <div class="row">
    <div class="col-sm-12 xl-100 xs-100">
      <h4 class="text-center"><?php echo $text_no_reviews; ?></h4> 
    </div>
  </div>
  <?php } ?>

</div>