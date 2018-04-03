<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-cireviews').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-product"><?php echo $entry_product; ?></label>
                <input type="text" name="filter_product" value="<?php echo $filter_product; ?>" placeholder="<?php echo $entry_product; ?>" id="input-product" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <!-- /*new update starts*/ -->
              <div class="form-group">
                <label class="control-label" for="input-store"><?php echo $entry_store; ?></label>
                <select name="filter_store_id" id="input-store" class="form-control">
                  <option value="*"></option>
                  <?php foreach($stores as $store) { ?>
                  <?php $sel = ''; ?>
                  <?php if ($store['store_id'] == $filter_store_id) { ?>
                  <?php $sel = 'selected="selected"'; ?>
                  <?php } ?>
                  <option value="<?php echo $store['store_id']; ?>" <?php echo $sel; ?> ><?php echo $store['name']; ?></option>
                  <?php } ?>
                </select>
              </div>
              <!-- /*new update ends*/ -->
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-title"><?php echo $entry_title; ?></label>
                <input type="text" name="filter_title" value="<?php echo $filter_title; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title" class="form-control review_filter" data-label="title" />
              </div>
              <div class="form-group">
                <label class="control-label" for="input-rating"><?php echo $entry_rating; ?></label>
                <select name="filter_rating" id="input-rating" class="form-control">
                  <option value="*"></option>
                  <option value="1" <?php if ($filter_rating==1) { echo 'selected="selected"'; } ?>>1</option>
                  <option value="2" <?php if ($filter_rating==2) { echo 'selected="selected"'; } ?>>2</option>
                  <option value="3" <?php if ($filter_rating==3) { echo 'selected="selected"'; } ?>>3</option>
                  <option value="4" <?php if ($filter_rating==4) { echo 'selected="selected"'; } ?>>4</option>
                  <option value="5" <?php if ($filter_rating==5) { echo 'selected="selected"'; } ?>>5</option>
                </select>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-author"><?php echo $entry_author; ?></label>
                <input type="text" name="filter_author" value="<?php echo $filter_author; ?>" placeholder="<?php echo $entry_author; ?>" id="input-author" class="form-control" data-label="author" />
              </div>
               <div class="form-group">
                <label class="control-label" for="input-vote"><?php echo $entry_vote; ?></label>
                <select name="filter_vote" id="input-vote" class="form-control">
                  <option value="*"></option>
                  <option value="1" <?php if ($filter_vote) { echo 'selected="selected"'; } ?>><?php echo $text_vote_up; ?></option>
                  <option value="0" <?php if (!$filter_vote && !is_null($filter_vote)) { echo 'selected="selected"'; } ?>><?php echo $text_vote_down; ?></option>
                </select>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                <input type="text" name="filter_email" value="<?php echo $filter_email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" data-label="email" />
              </div>
              <div class="form-group">
                <label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
                <select name="filter_status" id="input-status" class="form-control">
                  <option value="*"></option>
                  <option value="1" <?php if ($filter_status) { echo 'selected="selected"'; } ?>><?php echo $text_enabled; ?></option>
                  <option value="0" <?php if (!$filter_status && !is_null($filter_status)) { echo 'selected="selected"'; } ?>><?php echo $text_disabled; ?></option>
                </select>
              </div>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-cireviews">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left"><?php if ($sort == 'product_name') { ?>
                    <a href="<?php echo $sort_product_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_product_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_product_name; ?>"><?php echo $column_product_name; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'cr.title') { ?>
                    <a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_title; ?>"><?php echo $column_title; ?></a>
                    <?php } ?></td>
                  <!-- /*new update starts*/ --><td class="text-left"><?php if ($sort == 'cr.store_id') { ?>
                    <a href="<?php echo $sort_store_id; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_store; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_store_id; ?>"><?php echo $column_store; ?></a>
                    <?php } ?></td><!-- /*new update ends*/ -->
                  <td class="text-left"><?php if ($sort == 'r.author') { ?>
                    <a href="<?php echo $sort_author; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_author; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_author; ?>"><?php echo $column_author; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'cr.email') { ?>
                    <a href="<?php echo $sort_email; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_email; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_email; ?>"><?php echo $column_email; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'r.rating') { ?>
                    <a href="<?php echo $sort_rating; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_avgrating; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_rating; ?>"><?php echo $column_avgrating; ?></a>
                    <?php } ?></td>
                  <?php /* <td class="text-left"><?php echo $column_rating; ?></td> */ ?>
                  <td class="text-left"><?php if ($sort == 'vote_up') { ?>
                    <a href="<?php echo $sort_vote_up; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_vote_up; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_vote_up; ?>"><?php echo $column_vote_up; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'vote_down') { ?>
                    <a href="<?php echo $sort_vote_down; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_vote_down; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_vote_down; ?>"><?php echo $column_vote_down; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'r.date_added') { ?>
                    <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'r.status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($cireviews) { ?>
                <?php foreach ($cireviews as $cireview) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($cireview['review_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $cireview['review_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $cireview['review_id']; ?>" />
                    <?php } ?></td>
                  <td class="text-left" width="15%">
                    <img src="<?php echo $cireview['product_thumb']; ?>" alt="<?php echo $cireview['product_name']; ?>" />
                    <br/>
                    <?php echo $cireview['product_name']; ?>
                  </td>
                  <td class="text-left"><?php echo $cireview['title']; ?></td>
                  <!-- /*new update starts*/ --><td class="text-left"><?php echo $cireview['store']; ?></td><!-- /*new update ends*/ -->
                  <td class="text-left"><?php echo $cireview['author']; ?></td>
                  <td class="text-left"><?php echo $cireview['email']; ?></td>
                  <td class="text-left" width="15%">
                    <div class="rating">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <?php if ($cireview['rating'] < $i) { ?>
                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                    <?php } else { ?>
                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                    <?php } ?>
                    <?php } ?>
                    </div>
                  </td>
                  <?php /*<td class="text-left">
                    <?php foreach($cireview['ratings'] as $ratings) { ?>
                    <label><?php echo $ratings['ciratingtype_name']; ?> </label>
                    <div class="rating">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <?php if ($ratings['rating'] < $i) { ?>
                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                    <?php } else { ?>
                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                    <?php } ?>
                    <?php } ?>
                    </div>
                    <?php } ?>
                  </td> */ ?>
                  <td class="text-left"><?php echo $cireview['votes_up']; ?></td>
                  <td class="text-left"><?php echo $cireview['votes_down']; ?></td>
                  <td class="text-left"><?php echo $cireview['date_added']; ?></td>
                  <td class="text-left"><?php echo $cireview['status']; ?></td>

                  <td class="text-right"><a href="<?php echo $cireview['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <!-- /*new update starts*/ --><td class="text-center" colspan="14"><?php echo $text_no_results; ?></td><!-- /*new update ends*/ -->
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
  url = 'index.php?route=cireviewpro/cireviews&token=<?php echo $token; ?>';

  var filter_product = $('input[name=\'filter_product\']').val();
  if (filter_product) {
    url += '&filter_product=' + encodeURIComponent(filter_product);
  }
  /*new update starts*/
  var filter_store_id = $('select[name=\'filter_store_id\']').val();

  if (filter_store_id != '*') {
    url += '&filter_store_id=' + encodeURIComponent(filter_store_id);
  }
  /*new update ends*/

  var filter_title = $('input[name=\'filter_title\']').val();
  if (filter_title) {
    url += '&filter_title=' + encodeURIComponent(filter_title);
  }

  var filter_author = $('input[name=\'filter_author\']').val();
  if (filter_author) {
    url += '&filter_author=' + encodeURIComponent(filter_author);
  }

  var filter_email = $('input[name=\'filter_email\']').val();
  if (filter_email) {
    url += '&filter_email=' + encodeURIComponent(filter_email);
  }

  var filter_date_added = $('input[name=\'filter_date_added\']').val();
  if (filter_date_added) {
    url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
  }

  var filter_rating = $('select[name=\'filter_rating\']').val();

  if (filter_rating != '*') {
    url += '&filter_rating=' + encodeURIComponent(filter_rating);
  }

  var filter_vote = $('select[name=\'filter_vote\']').val();

  if (filter_vote != '*') {
    url += '&filter_vote=' + encodeURIComponent(filter_vote);
  }

  var filter_status = $('select[name=\'filter_status\']').val();

  if (filter_status != '*') {
    url += '&filter_status=' + encodeURIComponent(filter_status);
  }

  location = url;
});
//--></script> 
<script type="text/javascript"><!--

$('input[name=\'filter_product\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['product_id']
          }
        }));
      }
    });
  },
  'select': function(item) {
    $('input[name=\'filter_product\']').val(item['label']);
  }
});


$('.review_filter').each(function() {
  var $this = $(this);
  var filter_name = $(this).attr('name');
  var label = $(this).attr('data-label');


  $this.autocomplete({
    'source': function(request, response) {
      $.ajax({
        url: 'index.php?route=cireviewpro/cireviews/autocomplete&token=<?php echo $token; ?>&'+filter_name+'=' +  encodeURIComponent(request),
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item[label],
              value: item['review_id']
            }
          }));
        }
      });
    },
    'select': function(item) {
      $this.val(item['label']);
    }
  });
});
//--></script>

<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
  <link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
  <script type="text/javascript"><!--
$('.date').datetimepicker({
  pickTime: false
});
//--></script>
</div>
<?php echo $footer; ?>