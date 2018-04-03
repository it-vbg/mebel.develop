<div id="cireview-graph">
<div id="cireviewgraph" class="cireviewgraph <?php if(!$reviewgraph) { echo 'hide'; } ?>"><?php echo $cireviewgraph; ?></div>
<!-- /*new update starts*/ --><?php if ($cireview_guest) { ?>
<button type="button" class="btn btn-default" data-toggle="modal" data-target="#cireview-modal"><?php echo $button_write; ?></button>
<?php } else { ?>
<?php echo $text_login; ?>
<?php } ?><!-- /*new update ends*/ -->
</div>

<form class="form-horizontal <?php echo $journal_class; ?>" id="form-cireview">
  <div id="cireview"></div>
  <input type="hidden" name="cirating_filter" value="0">
  <div id="cireview-modal" class="modal fade <?php echo $journal_class; ?>" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><?php echo $text_write; ?></h4>
        </div>
        <div class="modal-body">
          <div class="cireview-form">
            <?php if ($cireview_guest) { ?>
            <?php if($author) { ?>
            <div class="form-group <?php if($author_require) { echo 'required'; } ?>">
              <label class="control-label col-sm-3 xl-20 xs-100" for="input-ciname"><?php echo $entry_name; ?></label>
              <div class="col-sm-9 xl-80 xs-100">
                <input type="text" name="ciname" value="<?php echo $customer_name; ?>" id="input-ciname" class="form-control" />
              </div>
            </div>
            <?php } ?>
            <?php if($email) { ?>
            <div class="form-group required">
              <label class="control-label col-sm-3 xl-20 xs-100" for="input-ciemail"><?php echo $entry_email; ?></label>
              <div class="col-sm-9 xl-80 xs-100">
                <input type="text" name="ciemail" value="<?php echo $customer_email; ?>" id="input-ciemail" class="form-control" />
              </div>
            </div>
            <?php } ?>
            <?php if($title) { ?>
            <div class="form-group <?php if($title_require) { echo 'required'; } ?>">
              <label class="control-label col-sm-3 xl-20 xs-100" for="input-cititle"><?php echo $entry_reviewtitle; ?></label>
              <div class="col-sm-9 xl-80 xs-100">
                <input type="text" name="cititle" value="" id="input-cititle" class="form-control" />
              </div>
            </div>
            <?php } ?>    
            <?php if($text) { ?>
            <div class="form-group <?php if($text_require) { echo 'required'; } ?>">
              <label class="control-label col-sm-3 xl-20 xs-100" for="input-cireview"><?php echo $entry_review; ?></label>
              <div class="col-sm-9 xl-80 xs-100">
                <textarea name="cireview" rows="5" id="input-cireview" class="form-control"></textarea>
                <div class="help-block"><?php echo $text_note; ?></div>
              </div>
            </div>
            <?php } ?>
            <?php if($rating) { ?>
            <div class="form-group required">
              <?php foreach($ratingtypes as $ratingtype) { ?>
              <div class="ciratings" id="cirating-<?php echo $ratingtype['ciratingtype_id']; ?>">
                <label class="control-label col-sm-3 xl-20 xs-100" style="text-align: left;"><?php echo $ratingtype['name']; ?>: </label>
                <div class="col-sm-9 xl-80 xs-100">
                <input type="number" name="cirating[<?php echo $ratingtype['ciratingtype_id']; ?>]" id="cirating-<?php echo $ratingtype['ciratingtype_id']; ?>" class="cirating-stars" value="" data-clearable="remove"/>
                <?php /* for($i=1; $i<=$ratingstars; $i++) { ?>
                <input type="radio" class="cirating" name="cirating[<?php echo $ratingtype['ciratingtype_id']; ?>]" value="<?php echo $i; ?>" />
                &nbsp;
                <?php } */ ?>
                </div>
              </div>
              <?php } ?>
            </div>
            <?php } ?>
            <?php if($reviewimages) { ?>
            <div class="form-group">
              <div class="ciattachupload">
              <label class="control-label col-sm-3 xl-20 xs-100"><?php echo $entry_attachimages; ?></label>
              <div class="col-sm-9 xl-80 xs-100">
              <button style="width: 40%;" type="button" id="button-ciattachupload" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="cireview_image" value="<?php echo $cireview_image; ?>" id="input-ciattachupload" />
              </div> 
              </div> 
            </div>
            <ul class="list list-inline ciattach_images" id="ciattach_images">
            <?php if($attach_images) { ?>
              <?php foreach($attach_images as $attach_image) { ?>
              <li id="ciattach_image-<?php echo $attach_image['cireview_image_id']; ?>">
                <button data-id="<?php echo $attach_image['cireview_image_id']; ?>" type="button" class="attach_image_close close" data-dismiss="alert">&times;</button>
               <a href="<?php echo $attach_image['popup']; ?>"> <img src="<?php echo $attach_image['thumb']; ?>" alt="<?php echo $heading_title; ?>" /> </a>
              </li>
              <?php } ?>  
            <?php } ?>
            </ul>
            <?php } ?>
            <div id="cicaptcha"><?php echo $captcha; ?></div>
            <div class="buttons text-right">
              <button type="button" id="button-cireview" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
            </div>
            <?php } else { ?>
            <?php echo $text_login; ?>
            <?php } ?>
          </div>
        </div>
      </div>
    </div>    
  </div>
</form>

<div id="cireview-abuse-<?php echo $product_id; ?>" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="<?php echo $button_cancel; ?>"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><?php echo $text_reviewreport; ?></h4>
      </div>
      <div class="modal-body">
        <ul class="list list-unstyled ciabreason-list">
        <?php foreach($ciabreasons as $ciabreason) { ?>
          <li><label><input type="radio" data-details="<?php echo $ciabreason['details']; ?>" name="ciabreason" value="<?php echo $ciabreason['ciabreason_id']; ?>"> <?php echo $ciabreason['name']; ?></label></li>
          <?php } ?>
          <li><label><input type="radio" data-details="1" name="ciabreason" value="OTHER"> <?php echo $text_other; ?></label></li>
          <li class="other_reason hide"><textarea name="ciabreason_other" class="form-control" rows="7" placeholder="<?php echo $text_other_reason; ?>"></textarea></li>
        </ul>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $button_cancel; ?></button>
        
        <button data-loading-text="<?php echo $text_loading; ?>" type="button" data-cireview_id="" data-product_id="" data-review_id="" class="btn btn-primary cireview-abuse"><?php echo $button_submit; ?></button>
        
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript"><!--

$(document).ready(function() {
  function addThisRefresh() {
    if(typeof addthis != 'undefined') {
      console.log("i am here");
      addthis.init();      
      addthis.toolbox('.addthis_toolbox');
    }
  }
  
  
    <?php if($rating) { ?>

    $('input.cirating-stars[type=number]').each(function() {
      $(this).rating({
        'min' : 1,
        'max' : <?php echo $ratingstars > 0 ? $ratingstars : 5; ?>,
        'icon-lib' : "cifa fa",
        'active-icon' : "fa-star",
        'inactive-icon' : "fa-star-o",
        'clearable' : false,
        'divclass' : 'cirating-input',
      });
    });
    <?php } ?>


  if(typeof addthis == 'undefined') {
      var addthis_config = {"data_track_clickback": true};

      var script = document.createElement('script');
      script.setAttribute('src','//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e');
      
      $('#cireview-abuse-<?php echo $product_id; ?>').before(script);
      
  }

  
  $('#cireviewgraph').on('click', '.cirating-filter', function(e) {
    var cirating = $(this).attr('data-cirating');
    $('input[name="cirating_filter"]').val(cirating);
    $('#cireview').fadeOut('slow');
    $('#cireview').load('index.php?route=cireviewpro/cireview/review&product_id=<?php echo $product_id; ?>&cirating_filter='+$('input[name="cirating_filter"]').val(), function() { addThisRefresh(); $('#cireview').fadeIn('slow'); });
  });

  var citabreview = 0;
  $('a[href="#tab-review"]').on('click', function() {
    if(citabreview==0) {
     $('#cireview').load('index.php?route=cireviewpro/cireview/review&product_id=<?php echo $product_id; ?>&cirating_filter='+$('input[name="cirating_filter"]').val(), function() { addThisRefresh(); $('#cireview').fadeIn('slow'); }); 
    }
    citabreview++;
  });
  

  $('#cireview').delegate('.pagination a', 'click', function(e) {
      e.preventDefault();

      $('#cireview').fadeOut('slow');

      $('#cireview').load(this.href, function() { addThisRefresh(); $('#cireview').fadeIn('slow'); });
      
  });

  

  $('#cireview').load('index.php?route=cireviewpro/cireview/review&product_id=<?php echo $product_id; ?>&cirating_filter='+$('input[name="cirating_filter"]').val(), function() {  addThisRefresh(); });
  

  $('#button-cireview').on('click', function() {
    $('.alert').remove();
    $('.text-danger').remove();
    var $this = $(this);

    var data = $("#form-cireview").serialize();

    if(data) {
      data += '&';
    }
    
    data += $('.cireview-form input, .cireview-form textarea').serialize();

    $.ajax({
      url: 'index.php?route=cireviewpro/cireview/write&product_id=<?php echo $product_id; ?>',
      type: 'post',
      dataType: 'json',
      data: data,
      beforeSend: function() {
        $('#button-cireview').button('loading');
      },
      complete: function() {
        $('#button-cireview').button('reset');
      },
      success: function(json) {
        $('.alert').remove();
        $('.text-danger').remove();
        $('.cireview-form .form-group').removeClass('has-error');

        if (json['error']) {
          $this.parent().after('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }

        if (json['name']) {
          $('input[name=\'ciname\']').after('<div class="text-danger"><i class="fa fa-exclamation-circle"></i> ' + json['name'] + '</div>');
        }

        if (json['email']) {
          $('input[name=\'ciemail\']').after('<div class="text-danger"><i class="fa fa-exclamation-circle"></i> ' + json['email'] + '</div>');
        }

        if (json['text']) {
          $('textarea[name=\'cireview\']').after('<div class="text-danger"><i class="fa fa-exclamation-circle"></i> ' + json['text'] + '</div>');
        }

        if (json['title']) {
          $('input[name=\'cititle\']').after('<div class="text-danger"><i class="fa fa-exclamation-circle"></i> ' + json['title'] + '</div>');
        }

        $('.cireview-form .text-danger').parent().parent().addClass('has-error');

        if (json['rating']) {
          for(var i in json['rating']) {
            $('#cirating-'+i).append('<div class="text-danger col-sm-12"><i class="fa fa-exclamation-circle"></i> ' + json['rating'][i] + '</div>');
          }
        }

        if (json['captcha']) {
          $('#cicaptcha').append('<div class="text-danger"><i class="fa fa-exclamation-circle"></i> ' + json['captcha'] + '</div>');
        }

        if (json['success']) {
          $('#cireview-modal').find('.modal-header').before('<div class="alert alert-success success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
          $('#cireview-graph').before('<div class="alert alert-success success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

          $('input[name=\'ciname\']').val('<?php echo $customer_name; ?>');
          $('input[name=\'cireview_image\']').val('');
          $('textarea[name=\'cireview\']').val('');
          $('input[name=\'cititle\']').val('');
          $('input[name=\'ciemail\']').val('<?php echo $customer_email; ?>');
          $('.cirating:checked').prop('checked', false);
          $('input.cirating-stars[type=number]').each(function() {
            $(this).rating('clear');
          });
          $('#ciattach_images').html('');
          $('#cicaptcha input').val('');

          if (json['refresh']) {
            $('#cireview').load('index.php?route=cireviewpro/cireview/review&product_id=<?php echo $product_id; ?>', function() { addThisRefresh(); $('a[href="#tab-review"]').html(json['tab_review']);  if(json['cireviewgraph']) { $('#cireviewgraph').html(json['cireviewgraph']); }  });
          }

          setTimeout(function(){
            var offset = $('.cireview-form').offset()
            var mypos = (Math.round(offset.top) - 10);
            if($(window).scrollTop() > mypos) {
              $('html, body').animate({ scrollTop: mypos }, 'slow');
            }

            
           $('#cireview-modal').find('.close').trigger('click');
            
          },500);
          
        }
      }
    });
  });

  $('.ciattach_images').each(function() {
    $(this).magnificPopup({
      type:'image',
      delegate: 'a',
      gallery: {
        enabled:true
      }
    });
  });

  $('#cireview').on('click', '.addrating', function() {
    $('#cireview-modal').modal('show'); 
  });
  

  $('#ciattach_images').on('click', '.attach_image_close', function() {
    var $this = $(this);
    var id = $this.attr('data-id');
    if(id && confirm("Are you sure?")) {

      $.ajax({
        url: 'index.php?route=cireviewpro/cireview/delete',
        type: 'post',
        data: 'id=' + id,
        dataType: 'json',
        beforeSend: function() {          
        },
        complete: function() {          
        },
        success: function(json) {
          if (json['success']) {

            $('input[name="cireview_image"]').val(json['code']);

            if(json['attach_images']) {
              var html = '';
              for(var i in json['attach_images']) {
                html += '<li id="ciattach_image-'+ json['attach_images'][i]['cireview_image_id'] +'"><button data-id="'+ json['attach_images'][i]['cireview_image_id'] +'" type="button" class="attach_image_close close" data-dismiss="alert">&times;</button><a href="'+ json['attach_images'][i]['popup'] +'"> <img src="'+ json['attach_images'][i]['thumb'] +'" alt="<?php echo $heading_title; ?>" /> </a></li>';
              }
              $('#ciattach_images').html(html);
            }
          }
          
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });

    }
  });

  $('#button-ciattachupload').on('click', function() {
    var node = this;

    $('.ciattachupload .alert').remove();

    $('#form-ciattach-upload').remove();

    $('body').prepend('<form enctype="multipart/form-data" id="form-ciattach-upload" style="display: none;"><input type="file" name="ciattachfile" /><input type="hidden" name="cireview_images" value="'+ $('input[name="cireview_image"]').val() +'"></form>');

    $('#form-ciattach-upload input[name=\'ciattachfile\']').trigger('click');

    if (typeof timer != 'undefined') {
        clearInterval(timer);
    }

    timer = setInterval(function() {
      if ($('#form-ciattach-upload input[name=\'ciattachfile\']').val() != '') {
        clearInterval(timer);

        $.ajax({
          url: 'index.php?route=cireviewpro/cireview/upload',
          type: 'post',
          dataType: 'json',
          data: new FormData($('#form-ciattach-upload')[0]),
          cache: false,
          contentType: false,
          processData: false,
          beforeSend: function() {
            $(node).button('loading');
          },
          complete: function() {
            $(node).button('reset');
          },
          success: function(json) {

            $('.ciattachupload .alert').remove();

            if (json['error']) {
              $(node).parent().append('<div class="alert alert-danger warning"><i class="fa fa-check-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
            }

            if (json['success']) {
              $(node).parent().append('<div class="alert alert-success success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

              $('input[name="cireview_image"]').val(json['code']);

              if(json['attach_images']) {
                var html = '';
                for(var i in json['attach_images']) {
                  html += '<li id="ciattach_image-'+ json['attach_images'][i]['cireview_image_id'] +'"><button data-id="'+ json['attach_images'][i]['cireview_image_id'] +'" type="button" class="attach_image_close close" data-dismiss="alert">&times;</button><a href="'+ json['attach_images'][i]['popup'] +'"> <img src="'+ json['attach_images'][i]['thumb'] +'" alt="<?php echo $heading_title; ?>" /> </a></li>';
                }              
                $('#ciattach_images').html(html);
              }
            }
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
      }
    }, 500);
  });

  $('.cireview-abuse').on('click', function() {
    var $this = $(this);
    var review_id = $this.attr('data-review_id');
    var product_id = $this.attr('data-product_id');
    var cireview_id = $this.attr('data-cireview_id');

    var modaldiv = $('#cireview-abuse-'+product_id);
    modaldiv.find('.alert').remove();
    if(review_id && product_id && cireview_id) {
      
      var data = $('#cireview-abuse-'+product_id+ ' input, #cireview-abuse-'+product_id+ ' textarea').serialize();

      if(data) {
        data += '&';
      }

      data += 'review_id='+review_id+'&product_id='+product_id+'&cireview_id='+cireview_id;

      $.ajax({
        url: 'index.php?route=cireviewpro/cireview/cireviewAbuse&product_id='+product_id,
        type: 'post',
        data: data,
        dataType: 'json',
        beforeSend: function() {
           $this.button('loading');
        },
        complete: function() {
          $this.button('reset');
        },
        success: function(json) {
          modaldiv.find('.alert').remove(); 

          if(json['error']) {
            modaldiv.find('.modal-header').before('<div class="alert alert-danger warning"><i class="fa fa-check-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>')
          }
          if (json['success']) {
            // update particular div text
            modaldiv.find('.modal-header').before('<div class="alert alert-success success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

            setTimeout(function() {
              modaldiv.find('.close').trigger('click');
            }, 1000);
            
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      }); 
    }
  });

  
  $('#cireview-modal').on('hidden.bs.modal', function (e) {
    var modal = $(this);
    modal.find('.alert').remove();
  });
  

  $('#cireview-abuse-<?php echo $product_id; ?>').on('hidden.bs.modal', function (e) {
    var modal = $(this);
    modal.find('input[name="ciabreason"]').prop("checked", false);
    modal.find('.other_reason').addClass('hide');
    modal.find('textarea').val('');
    modal.find('.alert').remove();
    modal.find('.cireview-abuse').attr({'data-product_id' : '','data-review_id' : '', 'data-cireview_id' : ''});
  });

  $('input[name="ciabreason"]').on('click', function() {
    if($(this).val() == 'OTHER' || $(this).attr('data-details')==1) {
      $('.other_reason').removeClass('hide');
    } else {
      $('.other_reason').addClass('hide');
      $('.other_reason textarea').val('');
    }
  });

  $('#cireview').off('click', '.abuse-button-action').on('click', '.abuse-button-action', function() {
      var $this = $(this);
    var review_id = $this.attr('data-review_id');
    var product_id = $this.attr('data-product_id');
    var cireview_id = $this.attr('data-cireview_id');
    if(review_id && product_id && cireview_id) {
      $('#cireview-abuse-'+product_id).find('.cireview-abuse').attr({'data-review_id' : review_id, 'data-product_id' : product_id, 'data-cireview_id' : cireview_id});
      $('#cireview-abuse-'+product_id).modal('show');
    }

  });
  $('#cireview').off('click', '.vote-button-action').on('click', '.vote-button-action', function() {
    var $this = $(this);
    var review_id = $this.attr('data-review_id');
    var action = $this.attr('data-action');
    var product_id = $this.attr('data-product_id');
    var cireview_id = $this.attr('data-cireview_id');
    $('.text-danger').remove();

    if(review_id && product_id && cireview_id) {
      $.ajax({
        url: 'index.php?route=cireviewpro/cireview/cireviewVote',
        type: 'post',
        data: 'review_id=' + encodeURIComponent(review_id) + '&action=' + encodeURIComponent(action) + '&product_id=' + encodeURIComponent(product_id) + '&cireview_id=' + encodeURIComponent(cireview_id),
        dataType: 'json',
        beforeSend: function() {          
        },
        complete: function() {          
        },
        success: function(json) {
          var parent = $('#cireview-vote-'+review_id+'-'+product_id+'-'+cireview_id);
          $('.text-danger').remove();
          if(json['error']) {
            parent.append('<div class="text-danger">'+ json['error'] +'</div>')
          }
          if (json['success']) {
            // update particular div text
            
            console.log(parent);
            parent.find('.vote-action').html(json['before_text']);
            parent.find('.vote-result').html(json['after_text']);
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      }); 
    }
  });


});
//--></script>