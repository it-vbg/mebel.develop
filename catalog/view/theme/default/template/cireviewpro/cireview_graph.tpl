<?php if($reviewgraph) { ?>
<style type="text/css">
<?php if($reviewgraph_color) { ?>
  #cireview-graph .progress .progress-bar { background-color: <?php echo $reviewgraph_color; ?>;  }
  <?php } ?>
</style>
<ul class="list-unstyled">
  <?php foreach($ratingreviews as $reviewrating => $totalreviews) {
  $ariavalue = ($review_total) ? ceil(($totalreviews * 100) / $review_total) : 0;
  ?>
  <li class="cirating-filter" data-cirating="<?php echo $reviewrating; ?>">
    <div class="n-star"><?php echo $reviewrating.' '.$text_star; ?></div>
    <div class="progress">
      <div class="progress-bar" role="progressbar" aria-valuenow="<?php echo $ariavalue; ?>"
        aria-valuemin="0" aria-valuemax="100" style="width:<?php echo $ariavalue; ?>%"></div>
      </div> 
      <div class="progress-value"><?php echo $ariavalue; ?>%</div>        
    </li>
    <?php } ?>
  </ul>
  <?php } ?>