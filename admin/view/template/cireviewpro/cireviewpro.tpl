<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-cireviewpro" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-success"><i class="fa fa-check-circle"></i> <?php echo $button_save; ?></button>
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
    <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
        <div class="pull-right">
          <select name="store_id" onchange="window.location = 'index.php?route=cireviewpro/cireviewpro&token=<?php echo $token; ?>&store_id='+ this.value;">
            <option value="0"><?php echo $text_default; ?></option>
            <?php foreach($stores as $store) { ?>
            <option value="<?php echo $store['store_id']; ?>" <?php echo ($store['store_id'] == $store_id) ? 'selected="selected"' : ''; ?>><?php echo $store['name']; ?></option>
            <?php } ?>
          </select>
        </div>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-cireviewpro" class="form-horizontal">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-general" data-toggle="tab"><i class="fa fa-cogs"></i> <?php echo $tab_general; ?></a></li>
          
          <li><a href="#tab-pageinfo" data-toggle="tab"><i class="fa fa-image"></i> <?php echo $tab_pageinfo; ?></a></li>
          <li><a href="#tab-email" data-toggle="tab"><i class="fa fa-envelope"></i> <?php echo $tab_email; ?></a></li>
          <li><a href="#tab-css" data-toggle="tab"><i class="fa fa-eye-slash"></i> <?php echo $tab_css; ?></a></li>
          <li><a href="#tab-support" data-toggle="tab"><i class="fa fa-user"></i> <?php echo $tab_support; ?></a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-general">
            <div class="row">
              <div class="col-sm-3">
                <ul class="nav nav-pills nav-stacked" id="general-option">
                  <li class="active"><a href="#tab-general-option-setting" data-toggle="tab"> <?php echo $text_reviewsetting; ?></a></li>
                  <li><a href="#tab-general-option-form" data-toggle="tab"> <?php echo $text_reviewform; ?></a></li>
                  <li><a href="#tab-general-option-image" data-toggle="tab"> <?php echo $text_reviewimage; ?></a></li>
                  <li><a href="#tab-general-option-rating" data-toggle="tab"> <?php echo $text_reviewrating; ?></a></li>
                  <li><a href="#tab-general-option-vote" data-toggle="tab"> <?php echo $text_reviewvote; ?></a></li>
                  <li><a href="#tab-general-option-abuse" data-toggle="tab"> <?php echo $text_reviewabuse; ?></a></li>
                  <li><a href="#tab-general-option-page" data-toggle="tab"> <?php echo $text_reviewpage; ?></a></li>
                  <li><a href="#tab-general-option-coupon" data-toggle="tab"> <?php echo $text_reviewcoupon; ?></a></li>
                  
                  <li><a href="#tab-general-option-reward" data-toggle="tab"> <?php echo $text_reviewreward; ?></a></li>
                  
                </ul>
              </div>
              <div class="col-sm-9">
                <div class="tab-content">
                  <div class="tab-pane active" id="tab-general-option-setting">
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-cireviewpro-status"><?php echo $entry_status; ?></label>
                      <div class="col-sm-12">
                        <select name="cireviewpro_status" id="input-cireviewpro-status" class="form-control">
                          <?php if ($cireviewpro_status) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewapprove"><?php echo $entry_reviewapprove; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewapprove=='NO') { ?>
                          <input type="radio" name="cireviewpro_reviewapprove" value="NO" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewapprove" value="NO" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewapprove=='LOGGED') { ?>
                          <input type="radio" name="cireviewpro_reviewapprove" value="LOGGED" checked="checked" />
                          <?php echo $text_onlylogged; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewapprove" value="LOGGED" />
                          <?php echo $text_onlylogged; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewapprove=='BOTH') { ?>
                          <input type="radio" name="cireviewpro_reviewapprove" value="BOTH" checked="checked" />
                          <?php echo $text_onlyboth; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewapprove" value="BOTH" />
                          <?php echo $text_onlyboth; ?>
                          <?php } ?>
                        </label>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewguest"><?php echo $entry_reviewguest; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewguest) { ?>
                          <input type="radio" name="cireviewpro_reviewguest" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewguest" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewguest) { ?>
                          <input type="radio" name="cireviewpro_reviewguest" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewguest" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>                          
                      </div>
                    </div>                    
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewmax"><?php echo $entry_reviewmax; ?></label>
                      <div class="col-sm-12">
                        <input name="cireviewpro_reviewmax" value="<?php echo $cireviewpro_reviewmax; ?>" placeholder="<?php echo $entry_reviewmax; ?>" id="input-reviewmax" class="form-control" type="text" />
                      </div>
                    </div>
                    <fieldset>
                      <legend><?php echo $legend_reviewshare; ?></legend>
                      <div class="form-group">
                        <label class="col-sm-12 control-label" for="input-reviewshare"><?php echo $entry_reviewshare; ?></label>
                        <div class="col-sm-12">
                          <label class="radio-inline">
                            <?php if ($cireviewpro_reviewshare) { ?>
                            <input type="radio" name="cireviewpro_reviewshare" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_reviewshare" value="1" />
                            <?php echo $text_yes; ?>
                            <?php } ?>
                          </label>
                          <label class="radio-inline">
                            <?php if (!$cireviewpro_reviewshare) { ?>
                            <input type="radio" name="cireviewpro_reviewshare" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_reviewshare" value="0" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                          </label>                          
                        </div>
                      </div>
                      
                      <?php /*
                      <div class="form-group">
                        <label class="col-sm-12 control-label" for="input-sharetype"><?php echo $entry_sharetype; ?></label>
                        <div class="col-sm-12">
                          <label class="radio-inline">
                            <?php if ($cireviewpro_sharetype) { ?>
                            <input type="radio" name="cireviewpro_sharetype" value="ADDTHIS" checked="checked" />
                            <?php echo $entry_shareaddthis; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_sharetype" value="ADDTHIS" />
                            <?php echo $entry_shareaddthis; ?>
                            <?php } ?>
                          </label>
                          <label class="radio-inline">
                            <?php if (!$cireviewpro_sharetype) { ?>
                            <input type="radio" name="cireviewpro_sharetype" value="SHARETHIS" checked="checked" />
                            <?php echo $entry_sharesharethis; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_sharetype" value="SHARETHIS" />
                            <?php echo $entry_sharesharethis; ?>
                            <?php } ?>
                          </label>                          
                        </div>
                      </div> */ ?>
                      
                    </fieldset>                    
                  </div>
                  <div class="tab-pane" id="tab-general-option-form">
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-cireviewpro-captcha"><?php echo $entry_captcha; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_captcha) { ?>
                          <input type="radio" name="cireviewpro_captcha" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_captcha" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_captcha) { ?>
                          <input type="radio" name="cireviewpro_captcha" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_captcha" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>
                      </div>
                    </div> 
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewreply"><span data-toggle="tooltip" title="<?php echo $help_reviewreply; ?>"><?php echo $entry_reviewreply; ?></span></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewreply) { ?>
                          <input type="radio" name="cireviewpro_reviewreply" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewreply" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewreply) { ?>
                          <input type="radio" name="cireviewpro_reviewreply" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewreply" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>                          
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewreplyauthor"><?php echo $entry_reviewreplyauthor; ?></label>
                      <div class="col-sm-12">
                        <input name="cireviewpro_reviewreplyauthor" value="<?php echo $cireviewpro_reviewreplyauthor; ?>" placeholder="<?php echo $entry_reviewreplyauthor; ?>" id="input-reviewreplyauthor" class="form-control" type="text" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewdateformat"><?php echo $entry_reviewdateformat; ?></label>
                      <div class="col-sm-12">
                        <input name="cireviewpro_reviewdateformat" value="<?php echo $cireviewpro_reviewdateformat; ?>" placeholder="<?php echo $entry_reviewdateformat; ?>" id="input-reviewdateformat" class="form-control" type="text" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewlimit"><?php echo $entry_reviewlimit; ?></label>
                      <div class="col-sm-12">
                        <input type="text" name="cireviewpro_reviewlimit" value="<?php echo $cireviewpro_reviewlimit; ?>" placeholder="<?php echo $entry_reviewlimit; ?>" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewemail"><span data-toggle="tooltip" title="<?php echo $help_reviewemail; ?>"><?php echo $entry_reviewemail; ?></span></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewemail) { ?>
                          <input type="radio" name="cireviewpro_reviewemail" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewemail" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewemail) { ?>
                          <input type="radio" name="cireviewpro_reviewemail" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewemail" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm-6">
                        <div class="form-group">
                          <label class="col-sm-12 control-label" for="input-reviewauthor"><span data-toggle="tooltip" title="<?php echo $help_reviewauthor; ?>"><?php echo $entry_reviewauthor; ?></span></label>
                          <div class="col-sm-12">
                            <label class="radio-inline">
                              <?php if ($cireviewpro_reviewauthor) { ?>
                              <input type="radio" name="cireviewpro_reviewauthor" value="1" checked="checked" />
                              <?php echo $text_yes; ?>
                              <?php } else { ?>
                              <input type="radio" name="cireviewpro_reviewauthor" value="1" />
                              <?php echo $text_yes; ?>
                              <?php } ?>
                            </label>
                            <label class="radio-inline">
                              <?php if (!$cireviewpro_reviewauthor) { ?>
                              <input type="radio" name="cireviewpro_reviewauthor" value="0" checked="checked" />
                              <?php echo $text_no; ?>
                              <?php } else { ?>
                              <input type="radio" name="cireviewpro_reviewauthor" value="0" />
                              <?php echo $text_no; ?>
                              <?php } ?>
                            </label>
                          </div>
                        </div>    
                      </div>
                      <div class="col-sm-6">
                        <div class="form-group">
                          <label class="col-sm-12 control-label" for="input-reviewauthor_require"><?php echo $entry_reviewauthor_require; ?></label>
                          <div class="col-sm-12">
                            <label class="radio-inline">
                              <?php if ($cireviewpro_reviewauthor_require) { ?>
                              <input type="radio" name="cireviewpro_reviewauthor_require" value="1" checked="checked" />
                              <?php echo $text_yes; ?>
                              <?php } else { ?>
                              <input type="radio" name="cireviewpro_reviewauthor_require" value="1" />
                              <?php echo $text_yes; ?>
                              <?php } ?>
                            </label>
                            <label class="radio-inline">
                              <?php if (!$cireviewpro_reviewauthor_require) { ?>
                              <input type="radio" name="cireviewpro_reviewauthor_require" value="0" checked="checked" />
                              <?php echo $text_no; ?>
                              <?php } else { ?>
                              <input type="radio" name="cireviewpro_reviewauthor_require" value="0" />
                              <?php echo $text_no; ?>
                              <?php } ?>
                            </label>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm-6">
                        <div class="form-group">
                          <label class="col-sm-12 control-label" for="input-reviewtitle"><?php echo $entry_reviewtitle; ?></label>
                          <div class="col-sm-12">
                            <label class="radio-inline">
                              <?php if ($cireviewpro_reviewtitle) { ?>
                              <input type="radio" name="cireviewpro_reviewtitle" value="1" checked="checked" />
                              <?php echo $text_yes; ?>
                              <?php } else { ?>
                              <input type="radio" name="cireviewpro_reviewtitle" value="1" />
                              <?php echo $text_yes; ?>
                              <?php } ?>
                            </label>
                            <label class="radio-inline">
                              <?php if (!$cireviewpro_reviewtitle) { ?>
                              <input type="radio" name="cireviewpro_reviewtitle" value="0" checked="checked" />
                              <?php echo $text_no; ?>
                              <?php } else { ?>
                              <input type="radio" name="cireviewpro_reviewtitle" value="0" />
                              <?php echo $text_no; ?>
                              <?php } ?>
                            </label>                          
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-6">
                        <div class="form-group">
                          <label class="col-sm-12 control-label" for="input-reviewtitle_require"><?php echo $entry_reviewtitle_require; ?></label>
                          <div class="col-sm-12">
                            <label class="radio-inline">
                              <?php if ($cireviewpro_reviewtitle_require) { ?>
                              <input type="radio" name="cireviewpro_reviewtitle_require" value="1" checked="checked" />
                              <?php echo $text_yes; ?>
                              <?php } else { ?>
                              <input type="radio" name="cireviewpro_reviewtitle_require" value="1" />
                              <?php echo $text_yes; ?>
                              <?php } ?>
                            </label>
                            <label class="radio-inline">
                              <?php if (!$cireviewpro_reviewtitle_require) { ?>
                              <input type="radio" name="cireviewpro_reviewtitle_require" value="0" checked="checked" />
                              <?php echo $text_no; ?>
                              <?php } else { ?>
                              <input type="radio" name="cireviewpro_reviewtitle_require" value="0" />
                              <?php echo $text_no; ?>
                              <?php } ?>
                            </label>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm-6">
                        <div class="form-group">
                          <label class="col-sm-12 control-label" for="input-reviewtext"><span data-toggle="tooltip" title="<?php echo $help_reviewtext; ?>"><?php echo $entry_reviewtext; ?></span></label>
                          <div class="col-sm-12">
                            <label class="radio-inline">
                              <?php if ($cireviewpro_reviewtext) { ?>
                              <input type="radio" name="cireviewpro_reviewtext" value="1" checked="checked" />
                              <?php echo $text_yes; ?>
                              <?php } else { ?>
                              <input type="radio" name="cireviewpro_reviewtext" value="1" />
                              <?php echo $text_yes; ?>
                              <?php } ?>
                            </label>
                            <label class="radio-inline">
                              <?php if (!$cireviewpro_reviewtext) { ?>
                              <input type="radio" name="cireviewpro_reviewtext" value="0" checked="checked" />
                              <?php echo $text_no; ?>
                              <?php } else { ?>
                              <input type="radio" name="cireviewpro_reviewtext" value="0" />
                              <?php echo $text_no; ?>
                              <?php } ?>
                            </label>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-6">
                        <div class="form-group">
                          <label class="col-sm-12 control-label" for="input-reviewtext_require"><?php echo $entry_reviewtext_require; ?></label>
                          <div class="col-sm-12">
                            <label class="radio-inline">
                              <?php if ($cireviewpro_reviewtext_require) { ?>
                              <input type="radio" name="cireviewpro_reviewtext_require" value="1" checked="checked" />
                              <?php echo $text_yes; ?>
                              <?php } else { ?>
                              <input type="radio" name="cireviewpro_reviewtext_require" value="1" />
                              <?php echo $text_yes; ?>
                              <?php } ?>
                            </label>
                            <label class="radio-inline">
                              <?php if (!$cireviewpro_reviewtext_require) { ?>
                              <input type="radio" name="cireviewpro_reviewtext_require" value="0" checked="checked" />
                              <?php echo $text_no; ?>
                              <?php } else { ?>
                              <input type="radio" name="cireviewpro_reviewtext_require" value="0" />
                              <?php echo $text_no; ?>
                              <?php } ?>
                            </label>
                          </div>
                        </div>
                      </div>
                    </div>                   
                    
                  </div>
                  <div class="tab-pane" id="tab-general-option-image">
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewimages"><?php echo $entry_reviewimages; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewimages) { ?>
                          <input type="radio" name="cireviewpro_reviewimages" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewimages" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewimages) { ?>
                          <input type="radio" name="cireviewpro_reviewimages" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewimages" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>                          
                      </div>
                    </div>
                    <div class="form-group required">
                      <label class="col-sm-12 control-label" for="input-reviewimageslimit"><?php echo $entry_reviewimageslimit; ?></label>
                      <div class="col-sm-12">
                        <input type="text" name="cireviewpro_reviewimageslimit" value="<?php echo $cireviewpro_reviewimageslimit; ?>" placeholder="<?php echo $entry_reviewimageslimit; ?>" id="input-reviewimageslimit" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewimagesthumb"><?php echo $entry_reviewimagesthumb; ?></label>
                      <div class="col-sm-12">
                        <div class="row">
                          <div class="col-sm-6">
                            <div class="input-group">
                            <input type="text" name="cireviewpro_reviewimagesthumb_width" value="<?php echo $cireviewpro_reviewimagesthumb_width; ?>" placeholder="<?php echo $text_width; ?>" id="input-reviewimagesthumb-width" class="form-control" />
                            <span class="input-group-btn">
                              <button type="button" class="btn btn-primary"><i class="fa fa-arrows-h"></i></button>
                            </span>
                            </div>
                          </div>
                          <div class="col-sm-6">
                            <div class="input-group">
                            <input type="text" name="cireviewpro_reviewimagesthumb_height" value="<?php echo $cireviewpro_reviewimagesthumb_height; ?>" placeholder="<?php echo $text_height; ?>"  id="input-reviewimagesthumb-height" class="form-control" />
                            <span class="input-group-btn">
                              <button type="button" class="btn btn-primary"><i class="fa fa-arrows-v"></i></button>
                            </span>
                            </div>
                          </div>
                        </div>                                           
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewimagespopup"><?php echo $entry_reviewimagespopup; ?></label>
                      <div class="col-sm-12">
                        <div class="row">
                          <div class="col-sm-6">
                            <div class="input-group">
                            <input type="text" name="cireviewpro_reviewimagespopup_width" value="<?php echo $cireviewpro_reviewimagespopup_width; ?>" placeholder="<?php echo $text_width; ?>" id="input-reviewimagespopup-width" class="form-control" />
                            <span class="input-group-btn">
                              <button type="button" class="btn btn-primary"><i class="fa fa-arrows-h"></i></button>
                            </span>
                            </div>
                          </div>
                          <div class="col-sm-6">
                            <div class="input-group">
                            <input type="text" name="cireviewpro_reviewimagespopup_height" value="<?php echo $cireviewpro_reviewimagespopup_height; ?>" placeholder="<?php echo $text_height; ?>"  id="input-reviewimagespopup-height" class="form-control" />
                            <span class="input-group-btn">
                              <button type="button" class="btn btn-primary"><i class="fa fa-arrows-v"></i></button>
                            </span>
                            </div>
                          </div>
                        </div>                                           
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-file-ext-allowed"><span data-toggle="tooltip" title="<?php echo $help_file_ext_allowed; ?>"><?php echo $entry_file_ext_allowed; ?></span></label>
                      <div class="col-sm-12">
                        <textarea name="cireviewpro_file_ext_allowed" rows="5" placeholder="<?php echo $entry_file_ext_allowed; ?>" id="input-file-ext-allowed" class="form-control"><?php echo $cireviewpro_file_ext_allowed; ?></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-file-mime-allowed"><span data-toggle="tooltip" title="<?php echo $help_file_mime_allowed; ?>"><?php echo $entry_file_mime_allowed; ?></span></label>
                      <div class="col-sm-12">
                        <textarea name="cireviewpro_file_mime_allowed" rows="5" placeholder="<?php echo $entry_file_mime_allowed; ?>" id="input-file-mime-allowed" class="form-control"><?php echo $cireviewpro_file_mime_allowed; ?></textarea>
                      </div>
                    </div>
                  </div>                  
                  <div class="tab-pane" id="tab-general-option-rating">
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-ratingstars"><?php echo $entry_ratingstars; ?></label>
                      <div class="col-sm-12">
                        <?php for($i=1;$i<=5;$i++) { ?>
                        <label class="radio-inline">
                          <?php if ($cireviewpro_ratingstars==$i) { ?>
                          <input type="radio" name="cireviewpro_ratingstars" value="<?php echo $i; ?>" checked="checked" />
                          <?php echo $i; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_ratingstars" value="<?php echo $i; ?>" />
                          <?php echo $i; ?>
                          <?php } ?>
                        </label>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-rating"><?php echo $entry_rating; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_rating) { ?>
                          <input type="radio" name="cireviewpro_rating" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_rating" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_rating) { ?>
                          <input type="radio" name="cireviewpro_rating" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_rating" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>                          
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewrating"><?php echo $entry_reviewrating; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewrating) { ?>
                          <input type="radio" name="cireviewpro_reviewrating" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewrating" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewrating) { ?>
                          <input type="radio" name="cireviewpro_reviewrating" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewrating" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>                          
                      </div>
                    </div>
                    <!-- /*new update starts*/ --><div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewratingcount"><?php echo $entry_reviewratingcount; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewratingcount) { ?>
                          <input type="radio" name="cireviewpro_reviewratingcount" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewratingcount" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewratingcount) { ?>
                          <input type="radio" name="cireviewpro_reviewratingcount" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewratingcount" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>                          
                      </div>
                    </div><!-- /*new update ends*/ -->
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewgraph"><?php echo $entry_reviewgraph; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewgraph) { ?>
                          <input type="radio" name="cireviewpro_reviewgraph" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewgraph" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewgraph) { ?>
                          <input type="radio" name="cireviewpro_reviewgraph" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewgraph" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>                          
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label"><?php echo $entry_reviewgraph_color; ?></label>
                      <div class="col-sm-4">
                        <div class="input-group colorpicker colorpicker-component"> 
                          <input type="text" name="cireviewpro_reviewgraph_color" value="<?php echo $cireviewpro_reviewgraph_color; ?>" class="form-control" />
                          <span class="input-group-addon"><i></i></span> 
                        </div>
                      </div>
                    </div>
                    
                  </div>
                  <div class="tab-pane" id="tab-general-option-vote">
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewgetvote"><?php echo $entry_reviewgetvote; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewgetvote) { ?>
                          <input type="radio" name="cireviewpro_reviewgetvote" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewgetvote" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewgetvote) { ?>
                          <input type="radio" name="cireviewpro_reviewgetvote" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewgetvote" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>                          
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewvoteguest"><?php echo $entry_reviewvoteguest; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewvoteguest) { ?>
                          <input type="radio" name="cireviewpro_reviewvoteguest" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewvoteguest" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewvoteguest) { ?>
                          <input type="radio" name="cireviewpro_reviewvoteguest" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewvoteguest" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>
                      </div>
                    </div>

                    <ul class="nav nav-tabs" id="cireview_votelanguage">
                      <?php foreach ($languages as $language) { ?>
                        <li><a href="#cireview_votelanguage<?php echo $language['language_id']; ?>" data-toggle="tab"><?php if(VERSION >= '2.2.0.0') { ?>
                          <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
                        <?php } else{ ?>
                          <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                        <?php } ?> <?php echo $language['name']; ?></a></li>
                      <?php } ?>
                    </ul>                    
                    <div class="tab-content">
                      <?php foreach ($languages as $language) { ?>
                      <div class="tab-pane" id="cireview_votelanguage<?php echo $language['language_id']; ?>">

                        <!-- Was this review is helpful? Yes / No 100% found this review helpful.

                        In your opinion is useful. 100% found this review helpful.

                        In your opinion is useless. 0% found this review helpful. -->

                        <div class="form-group">
                          <label class="col-sm-12 control-label" for="input-reviewvote<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_reviewvotebefore; ?>"><?php echo $entry_reviewvotebefore; ?></span></label>
                          <div class="col-sm-12">
                            <input id="input-reviewvote<?php echo $language['language_id']; ?>" type="text" name="cireviewpro_reviewvote[<?php echo $language['language_id']; ?>][before]" value="<?php echo isset($cireviewpro_reviewvote[$language['language_id']]['before']) ? $cireviewpro_reviewvote[$language['language_id']]['before']: ''; ?>" class="form-control" />
                            <?php if (isset($error_cireviewpro_reviewvote['before'][$language['language_id']])) { ?>
                            <div class="text-danger"><?php echo $error_cireviewpro_reviewvote['before'][$language['language_id']]; ?></div>
                            <?php } ?>
                          </div>
                        </div>

                        <div class="form-group">
                          <label class="col-sm-12 control-label" for="input-reviewvoteyes<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_reviewvoteyes; ?>"><?php echo $entry_reviewvoteyes; ?></span></label>
                          <div class="col-sm-12">
                            <input id="input-reviewvoteyes<?php echo $language['language_id']; ?>" type="text" name="cireviewpro_reviewvote[<?php echo $language['language_id']; ?>][yes]" value="<?php echo isset($cireviewpro_reviewvote[$language['language_id']]['yes']) ? $cireviewpro_reviewvote[$language['language_id']]['yes']: ''; ?>" class="form-control" />
                            <?php if (isset($error_cireviewpro_reviewvote['yes'][$language['language_id']])) { ?>
                            <div class="text-danger"><?php echo $error_cireviewpro_reviewvote['yes'][$language['language_id']]; ?></div>
                            <?php } ?>
                          </div>
                        </div>

                        <div class="form-group">
                          <label class="col-sm-12 control-label" for="input-reviewvoteno<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_reviewvoteno; ?>"><?php echo $entry_reviewvoteno; ?></span></label>
                          <div class="col-sm-12">
                            <input id="input-reviewvoteno<?php echo $language['language_id']; ?>" type="text" name="cireviewpro_reviewvote[<?php echo $language['language_id']; ?>][no]" value="<?php echo isset($cireviewpro_reviewvote[$language['language_id']]['no']) ? $cireviewpro_reviewvote[$language['language_id']]['no']: ''; ?>" class="form-control" />
                            <?php if (isset($error_cireviewpro_reviewvote['no'][$language['language_id']])) { ?>
                            <div class="text-danger"><?php echo $error_cireviewpro_reviewvote['no'][$language['language_id']]; ?></div>
                            <?php } ?>
                          </div>
                        </div>

                        <div class="form-group">
                          <label class="col-sm-12 control-label" for="input-reviewvoteoutof<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_reviewvoteoutof; ?>"><?php echo $entry_reviewvoteoutof; ?></span></label>
                          <div class="col-sm-12">
                            <input id="input-reviewvoteoutof<?php echo $language['language_id']; ?>" type="text" name="cireviewpro_reviewvote[<?php echo $language['language_id']; ?>][outof]" value="<?php echo isset($cireviewpro_reviewvote[$language['language_id']]['outof']) ? $cireviewpro_reviewvote[$language['language_id']]['outof']: ''; ?>" class="form-control" />
                            <?php if (isset($error_cireviewpro_reviewvote['outof'][$language['language_id']])) { ?>
                            <div class="text-danger"><?php echo $error_cireviewpro_reviewvote['outof'][$language['language_id']]; ?></div>
                            <?php } ?>
                          </div>
                        </div>

                        <div class="form-group">
                          <label class="col-sm-12 control-label" for="input-reviewvotepercent<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_reviewvotepercent; ?>"><?php echo $entry_reviewvotepercent; ?></span></label>
                          <div class="col-sm-12">
                            <input id="input-reviewvotepercent<?php echo $language['language_id']; ?>" type="text" name="cireviewpro_reviewvote[<?php echo $language['language_id']; ?>][percent]" value="<?php echo isset($cireviewpro_reviewvote[$language['language_id']]['percent']) ? $cireviewpro_reviewvote[$language['language_id']]['percent']: ''; ?>" class="form-control" />
                            <?php if (isset($error_cireviewpro_reviewvote['percent'][$language['language_id']])) { ?>
                            <div class="text-danger"><?php echo $error_cireviewpro_reviewvote['percent'][$language['language_id']]; ?></div>
                            <?php } ?>
                          </div>
                        </div>


                      </div>
                      <?php } ?>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewvotetype"><?php echo $entry_reviewvotetype; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewvotetype) { ?>
                          <input type="radio" name="cireviewpro_reviewvotetype" value="PERCENT" checked="checked" />
                          <?php echo $text_percent_find_usefull; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewvotetype" value="PERCENT" />
                          <?php echo $text_percent_find_usefull; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewvotetype) { ?>
                          <input type="radio" name="cireviewpro_reviewvotetype" value="OUTOF" checked="checked" />
                          <?php echo $text_outof_find_usefull; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewvotetype" value="OUTOF" />
                          <?php echo $text_outof_find_usefull; ?>
                          <?php } ?>
                        </label>
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane" id="tab-general-option-abuse">
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewabuse"><?php echo $entry_reviewabuse; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewabuse) { ?>
                          <input type="radio" name="cireviewpro_reviewabuse" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewabuse" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewabuse) { ?>
                          <input type="radio" name="cireviewpro_reviewabuse" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewabuse" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>                          
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewabuseguest"><?php echo $entry_reviewabuseguest; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewabuseguest) { ?>
                          <input type="radio" name="cireviewpro_reviewabuseguest" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewabuseguest" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewabuseguest) { ?>
                          <input type="radio" name="cireviewpro_reviewabuseguest" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewabuseguest" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>                          
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane" id="tab-general-option-page">
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewview"><?php echo $entry_reviewview; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewview=='LIST') { ?>
                          <input type="radio" name="cireviewpro_reviewview" value="LIST" checked="checked" />
                          <?php echo $text_list; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewview" value="LIST" />
                          <?php echo $text_list; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewview=='GRID') { ?>
                          <input type="radio" name="cireviewpro_reviewview" value="GRID" checked="checked" />
                          <?php echo $text_grid; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewview" value="GRID" />
                          <?php echo $text_grid; ?>
                          <?php } ?>
                        </label>                          
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewperrow"><?php echo $entry_reviewperrow; ?></label>
                      <div class="col-sm-12">
                        <?php for($i=1;$i<=6;$i++) { if($i==5) { continue; } ?>
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewperrow==$i) { ?>
                          <input type="radio" name="cireviewpro_reviewperrow" value="<?php echo $i; ?>" checked="checked" />
                          <?php echo $i; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewperrow" value="<?php echo $i; ?>" />
                          <?php echo $i; ?>
                          <?php } ?>
                        </label>
                        <?php } ?>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewpageimagesthumb"><?php echo $entry_reviewpageimagesthumb; ?></label>
                      <div class="col-sm-12">
                        <div class="row">
                          <div class="col-sm-6">
                            <div class="input-group">
                            <input type="text" name="cireviewpro_reviewpageimagesthumb_width" value="<?php echo $cireviewpro_reviewpageimagesthumb_width; ?>" placeholder="<?php echo $text_width; ?>" id="input-reviewpageimagesthumb-width" class="form-control" />
                            <span class="input-group-btn">
                              <button type="button" class="btn btn-primary"><i class="fa fa-arrows-h"></i></button>
                            </span>
                            </div>
                          </div>
                          <div class="col-sm-6">
                            <div class="input-group">
                            <input type="text" name="cireviewpro_reviewpageimagesthumb_height" value="<?php echo $cireviewpro_reviewpageimagesthumb_height; ?>" placeholder="<?php echo $text_height; ?>"  id="input-reviewpageimagesthumb-height" class="form-control" />
                            <span class="input-group-btn">
                              <button type="button" class="btn btn-primary"><i class="fa fa-arrows-v"></i></button>
                            </span>
                            </div>
                          </div>
                        </div>                                           
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewpageimagespopup"><?php echo $entry_reviewpageimagespopup; ?></label>
                      <div class="col-sm-12">
                        <div class="row">
                          <div class="col-sm-6">
                            <div class="input-group">
                            <input type="text" name="cireviewpro_reviewpageimagespopup_width" value="<?php echo $cireviewpro_reviewpageimagespopup_width; ?>" placeholder="<?php echo $text_width; ?>" id="input-reviewpageimagespopup-width" class="form-control" />
                            <span class="input-group-btn">
                              <button type="button" class="btn btn-primary"><i class="fa fa-arrows-h"></i></button>
                            </span>
                            </div>
                          </div>
                          <div class="col-sm-6">
                            <div class="input-group">
                            <input type="text" name="cireviewpro_reviewpageimagespopup_height" value="<?php echo $cireviewpro_reviewpageimagespopup_height; ?>" placeholder="<?php echo $text_height; ?>"  id="input-reviewpageimagespopup-height" class="form-control" />
                            <span class="input-group-btn">
                              <button type="button" class="btn btn-primary"><i class="fa fa-arrows-v"></i></button>
                            </span>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewpageproductthumb"><?php echo $entry_reviewpageproductthumb; ?></label>
                      <div class="col-sm-12">
                        <div class="row">
                          <div class="col-sm-6">
                            <div class="input-group">
                            <input type="text" name="cireviewpro_reviewpageproductthumb_width" value="<?php echo $cireviewpro_reviewpageproductthumb_width; ?>" placeholder="<?php echo $text_width; ?>" id="input-reviewpageproductthumb-width" class="form-control" />
                            <span class="input-group-btn">
                              <button type="button" class="btn btn-primary"><i class="fa fa-arrows-h"></i></button>
                            </span>
                            </div>
                          </div>
                          <div class="col-sm-6">
                            <div class="input-group">
                            <input type="text" name="cireviewpro_reviewpageproductthumb_height" value="<?php echo $cireviewpro_reviewpageproductthumb_height; ?>" placeholder="<?php echo $text_height; ?>"  id="input-reviewpageproductthumb-height" class="form-control" />
                            <span class="input-group-btn">
                              <button type="button" class="btn btn-primary"><i class="fa fa-arrows-v"></i></button>
                            </span>
                            </div>
                          </div>
                        </div>                                           
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewpagedateformat"><?php echo $entry_reviewpagedateformat; ?></label>
                      <div class="col-sm-12">
                        <input name="cireviewpro_reviewpagedateformat" value="<?php echo $cireviewpro_reviewpagedateformat; ?>" placeholder="<?php echo $entry_reviewpagedateformat; ?>" id="input-reviewpagedateformat" class="form-control" type="text" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewpagelimit"><?php echo $entry_reviewpagelimit; ?></label>
                      <div class="col-sm-12">
                        <input type="text" name="cireviewpro_reviewpagelimit" value="<?php echo $cireviewpro_reviewpagelimit; ?>" placeholder="<?php echo $entry_reviewpagelimit; ?>" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewpagetitleshow"><?php echo $entry_reviewpagetitleshow; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewpagetitleshow) { ?>
                          <input type="radio" name="cireviewpro_reviewpagetitleshow" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewpagetitleshow" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewpagetitleshow) { ?>
                          <input type="radio" name="cireviewpro_reviewpagetitleshow" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewpagetitleshow" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>                          
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewsortshow"><?php echo $entry_reviewsortshow; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewsortshow) { ?>
                          <input type="radio" name="cireviewpro_reviewsortshow" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewsortshow" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewsortshow) { ?>
                          <input type="radio" name="cireviewpro_reviewsortshow" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewsortshow" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>                          
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewsortdefault"><?php echo $entry_reviewsortdefault; ?></label>
                      <div class="col-sm-12">                      
                        <select name="cireviewpro_reviewsortdefault" class="form-control">
                          <option value="r.cireview_id-ASC" <?php if($cireviewpro_reviewsortdefault=='r.cireview_id-ASC') { echo 'selected="selected"'; } ?>><?php echo $text_sort_default; ?></option>
                          <option value="r.rating-DESC" <?php if($cireviewpro_reviewsortdefault=='r.rating-DESC') { echo 'selected="selected"'; } ?>><?php echo $text_sort_rating_desc; ?></option>
                          <option value="r.rating-ASC" <?php if($cireviewpro_reviewsortdefault=='r.rating-ASC') { echo 'selected="selected"'; } ?>><?php echo $text_sort_rating_asc; ?></option>
                          <option value="p.date_added-DESC" <?php if($cireviewpro_reviewsortdefault=='p.date_added-DESC') { echo 'selected="selected"'; } ?>><?php echo $text_sort_dateadd_desc; ?></option>
                          <option value="p.date_added-ASC" <?php if($cireviewpro_reviewsortdefault=='p.date_added-ASC') { echo 'selected="selected"'; } ?>><?php echo $text_sort_dateadd_asc; ?></option>
                        </select>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewsearch"><?php echo $entry_reviewsearch; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewsearch) { ?>
                          <input type="radio" name="cireviewpro_reviewsearch" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewsearch" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewsearch) { ?>
                          <input type="radio" name="cireviewpro_reviewsearch" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewsearch" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>                          
                      </div>
                    </div>
                    
                    <fieldset>
                      <legend><?php echo $legend_promo; ?></legend>

                      <div class="form-group">
                        <label class="col-sm-12 control-label" for="input-reviewpromoshow"><?php echo $entry_reviewpromoshow; ?></label>
                        <div class="col-sm-12">
                          <label class="radio-inline">
                            <?php if ($cireviewpro_reviewpromoshow) { ?>
                            <input type="radio" name="cireviewpro_reviewpromoshow" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_reviewpromoshow" value="1" />
                            <?php echo $text_yes; ?>
                            <?php } ?>
                          </label>
                          <label class="radio-inline">
                            <?php if (!$cireviewpro_reviewpromoshow) { ?>
                            <input type="radio" name="cireviewpro_reviewpromoshow" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_reviewpromoshow" value="0" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                          </label>                          
                        </div>
                      </div>  
                      <div class="form-group">
                        <label class="col-sm-12 control-label" for="input-reviewpromoalign"><?php echo $entry_reviewpromoalign; ?></label>
                        <div class="col-sm-12">
                          <label class="radio-inline">
                            <?php if ($cireviewpro_reviewpromoalign=='LEFT') { ?>
                            <input type="radio" name="cireviewpro_reviewpromoalign" value="LEFT" checked="checked" />
                            <?php echo $text_align_left; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_reviewpromoalign" value="LEFT" />
                            <?php echo $text_align_left; ?>
                            <?php } ?>
                          </label>
                          <label class="radio-inline">
                            <?php if ($cireviewpro_reviewpromoalign=='CENTER') { ?>
                            <input type="radio" name="cireviewpro_reviewpromoalign" value="CENTER" checked="checked" />
                            <?php echo $text_align_center; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_reviewpromoalign" value="CENTER" />
                            <?php echo $text_align_center; ?>
                            <?php } ?>
                          </label>
                          <label class="radio-inline">
                            <?php if ($cireviewpro_reviewpromoalign=='RIGHT') { ?>
                            <input type="radio" name="cireviewpro_reviewpromoalign" value="RIGHT" checked="checked" />
                            <?php echo $text_align_right; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_reviewpromoalign" value="RIGHT" />
                            <?php echo $text_align_right; ?>
                            <?php } ?>
                          </label>                          
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-12 control-label" for="input-reviewpromoproductnameshow"><?php echo $entry_reviewpromoproductnameshow; ?></label>
                        <div class="col-sm-12">
                          <label class="radio-inline">
                            <?php if ($cireviewpro_reviewpromoproductnameshow) { ?>
                            <input type="radio" name="cireviewpro_reviewpromoproductnameshow" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_reviewpromoproductnameshow" value="1" />
                            <?php echo $text_yes; ?>
                            <?php } ?>
                          </label>
                          <label class="radio-inline">
                            <?php if (!$cireviewpro_reviewpromoproductnameshow) { ?>
                            <input type="radio" name="cireviewpro_reviewpromoproductnameshow" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_reviewpromoproductnameshow" value="0" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                          </label>                          
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-12 control-label" for="input-reviewpromoproductpriceshow"><?php echo $entry_reviewpromoproductpriceshow; ?></label>
                        <div class="col-sm-12">
                          <label class="radio-inline">
                            <?php if ($cireviewpro_reviewpromoproductpriceshow) { ?>
                            <input type="radio" name="cireviewpro_reviewpromoproductpriceshow" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_reviewpromoproductpriceshow" value="1" />
                            <?php echo $text_yes; ?>
                            <?php } ?>
                          </label>
                          <label class="radio-inline">
                            <?php if (!$cireviewpro_reviewpromoproductpriceshow) { ?>
                            <input type="radio" name="cireviewpro_reviewpromoproductpriceshow" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_reviewpromoproductpriceshow" value="0" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                          </label>                          
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-12 control-label" for="input-reviewpromoproductratingshow"><?php echo $entry_reviewpromoproductratingshow; ?></label>
                        <div class="col-sm-12">
                          <label class="radio-inline">
                            <?php if ($cireviewpro_reviewpromoproductratingshow) { ?>
                            <input type="radio" name="cireviewpro_reviewpromoproductratingshow" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_reviewpromoproductratingshow" value="1" />
                            <?php echo $text_yes; ?>
                            <?php } ?>
                          </label>
                          <label class="radio-inline">
                            <?php if (!$cireviewpro_reviewpromoproductratingshow) { ?>
                            <input type="radio" name="cireviewpro_reviewpromoproductratingshow" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_reviewpromoproductratingshow" value="0" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                          </label>                          
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-12 control-label" for="input-reviewpromocategorynameshow"><?php echo $entry_reviewpromocategorynameshow; ?></label>
                        <div class="col-sm-12">
                          <label class="radio-inline">
                            <?php if ($cireviewpro_reviewpromocategorynameshow) { ?>
                            <input type="radio" name="cireviewpro_reviewpromocategorynameshow" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_reviewpromocategorynameshow" value="1" />
                            <?php echo $text_yes; ?>
                            <?php } ?>
                          </label>
                          <label class="radio-inline">
                            <?php if (!$cireviewpro_reviewpromocategorynameshow) { ?>
                            <input type="radio" name="cireviewpro_reviewpromocategorynameshow" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_reviewpromocategorynameshow" value="0" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                          </label>                          
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-12 control-label" for="input-reviewpromomanufacturernameshow"><?php echo $entry_reviewpromomanufacturernameshow; ?></label>
                        <div class="col-sm-12">
                          <label class="radio-inline">
                            <?php if ($cireviewpro_reviewpromomanufacturernameshow) { ?>
                            <input type="radio" name="cireviewpro_reviewpromomanufacturernameshow" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_reviewpromomanufacturernameshow" value="1" />
                            <?php echo $text_yes; ?>
                            <?php } ?>
                          </label>
                          <label class="radio-inline">
                            <?php if (!$cireviewpro_reviewpromomanufacturernameshow) { ?>
                            <input type="radio" name="cireviewpro_reviewpromomanufacturernameshow" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="cireviewpro_reviewpromomanufacturernameshow" value="0" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                          </label>                          
                        </div>
                      </div>

                      <ul class="nav nav-tabs" id="cireview_reviewpromolanguage">
                        <?php foreach ($languages as $language) { ?>
                        <li><a href="#cireview_reviewpromolanguage<?php echo $language['language_id']; ?>" data-toggle="tab">
                          <?php if(VERSION >= '2.2.0.0') { ?>
                            <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
                          <?php } else{ ?>
                            <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                          <?php } ?> <?php echo $language['name']; ?></a></li>
                        <?php } ?>
                      </ul>

                      <div class="tab-content">
                        <?php foreach ($languages as $language) { ?>
                        <div class="tab-pane" id="cireview_reviewpromolanguage<?php echo $language['language_id']; ?>">

                          <div class="form-group ">
                            <label class="col-sm-12 control-label" for="input-reviewpromoproduct<?php echo $language['language_id']; ?>"><?php echo $entry_reviewpromotextproduct; ?></label>
                            <div class="col-sm-12">
                              <input id="input-reviewpromoproduct<?php echo $language['language_id']; ?>" type="text" name="cireviewpro_reviewpromo[<?php echo $language['language_id']; ?>][product]" value="<?php echo isset($cireviewpro_reviewpromo[$language['language_id']]['product']) ? $cireviewpro_reviewpromo[$language['language_id']]['product']: ''; ?>" class="form-control" />
                            </div>
                          </div>

                          <div class="form-group ">
                            <label class="col-sm-12 control-label" for="input-reviewpromocategory<?php echo $language['language_id']; ?>"><?php echo $entry_reviewpromotextcategory; ?></label>
                            <div class="col-sm-12">
                              <input id="input-reviewpromocategory<?php echo $language['language_id']; ?>" type="text" name="cireviewpro_reviewpromo[<?php echo $language['language_id']; ?>][category]" value="<?php echo isset($cireviewpro_reviewpromo[$language['language_id']]['category']) ? $cireviewpro_reviewpromo[$language['language_id']]['category']: ''; ?>" class="form-control" />
                            </div>
                          </div>

                          <div class="form-group ">
                            <label class="col-sm-12 control-label" for="input-reviewpromomanufacturer<?php echo $language['language_id']; ?>"><?php echo $entry_reviewpromotextmanufacturer; ?></label>
                            <div class="col-sm-12">
                              <input id="input-reviewpromomanufacturer<?php echo $language['language_id']; ?>" type="text" name="cireviewpro_reviewpromo[<?php echo $language['language_id']; ?>][manufacturer]" value="<?php echo isset($cireviewpro_reviewpromo[$language['language_id']]['manufacturer']) ? $cireviewpro_reviewpromo[$language['language_id']]['manufacturer']: ''; ?>" class="form-control" />
                            </div>
                          </div>

                        </div>
                        <?php } ?>
                      </div>

                      <h4><?php echo $text_promoproduct; ?></h4>
                      <div class="form-group">
                        <label class="col-sm-12 control-label" for="input-reviewpromoproduct"><?php echo $entry_reviewpromoproduct; ?></label>
                        <div class="col-sm-12">
                          <div class="row">
                            <div class="col-sm-6">
                              <div class="input-group">
                              <input type="text" name="cireviewpro_reviewpromoproduct_width" value="<?php echo $cireviewpro_reviewpromoproduct_width; ?>" placeholder="<?php echo $text_width; ?>" id="input-reviewpromoproduct-width" class="form-control" />
                              <span class="input-group-btn">
                                <button type="button" class="btn btn-primary"><i class="fa fa-arrows-h"></i></button>
                              </span>
                              </div>
                            </div>
                            <div class="col-sm-6">
                              <div class="input-group">
                              <input type="text" name="cireviewpro_reviewpromoproduct_height" value="<?php echo $cireviewpro_reviewpromoproduct_height; ?>" placeholder="<?php echo $text_height; ?>"  id="input-reviewpromoproduct-height" class="form-control" />
                              <span class="input-group-btn">
                                <button type="button" class="btn btn-primary"><i class="fa fa-arrows-v"></i></button>
                              </span>
                              </div>
                            </div>
                          </div>                                           
                        </div>
                      </div>
                      <h4><?php echo $text_promocategory; ?></h4>
                      <div class="form-group">
                        <label class="col-sm-12 control-label" for="input-reviewpromocategory"><?php echo $entry_reviewpromocategory; ?></label>
                        <div class="col-sm-12">
                          <div class="row">
                            <div class="col-sm-6">
                              <div class="input-group">
                              <input type="text" name="cireviewpro_reviewpromocategory_width" value="<?php echo $cireviewpro_reviewpromocategory_width; ?>" placeholder="<?php echo $text_width; ?>" id="input-reviewpromocategory-width" class="form-control" />
                              <span class="input-group-btn">
                                <button type="button" class="btn btn-primary"><i class="fa fa-arrows-h"></i></button>
                              </span>
                              </div>
                            </div>
                            <div class="col-sm-6">
                              <div class="input-group">
                              <input type="text" name="cireviewpro_reviewpromocategory_height" value="<?php echo $cireviewpro_reviewpromocategory_height; ?>" placeholder="<?php echo $text_height; ?>"  id="input-reviewpromocategory-height" class="form-control" />
                              <span class="input-group-btn">
                                <button type="button" class="btn btn-primary"><i class="fa fa-arrows-v"></i></button>
                              </span>
                              </div>
                            </div>
                          </div>                                           
                        </div>
                      </div>
                      <h4><?php echo $text_promomanufacturer; ?></h4>
                      <div class="form-group">
                        <label class="col-sm-12 control-label" for="input-reviewpromomanufacturer"><?php echo $entry_reviewpromomanufacturer; ?></label>
                        <div class="col-sm-12">
                          <div class="row">
                            <div class="col-sm-6">
                              <div class="input-group">
                              <input type="text" name="cireviewpro_reviewpromomanufacturer_width" value="<?php echo $cireviewpro_reviewpromomanufacturer_width; ?>" placeholder="<?php echo $text_width; ?>" id="input-reviewpromomanufacturer-width" class="form-control" />
                              <span class="input-group-btn">
                                <button type="button" class="btn btn-primary"><i class="fa fa-arrows-h"></i></button>
                              </span>
                              </div>
                            </div>
                            <div class="col-sm-6">
                              <div class="input-group">
                              <input type="text" name="cireviewpro_reviewpromomanufacturer_height" value="<?php echo $cireviewpro_reviewpromomanufacturer_height; ?>" placeholder="<?php echo $text_height; ?>"  id="input-reviewpromomanufacturer-height" class="form-control" />
                              <span class="input-group-btn">
                                <button type="button" class="btn btn-primary"><i class="fa fa-arrows-v"></i></button>
                              </span>
                              </div>
                            </div>
                          </div>                                           
                        </div>
                      </div>
                    </fieldset>
                    
                  </div>
                  <div class="tab-pane" id="tab-general-option-coupon">
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewcoupon"><?php echo $entry_reviewcoupon; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewcoupon) { ?>
                          <input type="radio" name="cireviewpro_reviewcoupon" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewcoupon" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewcoupon) { ?>
                          <input type="radio" name="cireviewpro_reviewcoupon" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewcoupon" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>                          
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewcouponguest"><?php echo $entry_reviewcouponguest; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewcouponguest) { ?>
                          <input type="radio" name="cireviewpro_reviewcouponguest" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewcouponguest" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewcouponguest) { ?>
                          <input type="radio" name="cireviewpro_reviewcouponguest" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewcouponguest" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>                          
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewcoupontype"><span data-toggle="tooltip" title="<?php echo $help_reviewcoupontype; ?>"><?php echo $entry_reviewcoupontype; ?></span></label>
                      <div class="col-sm-12">
                        <select name="cireviewpro_reviewcoupontype" id="input-reviewcoupontype" class="form-control">
                          <?php if ($cireviewpro_reviewcoupontype == 'P') { ?>
                          <option value="P" selected="selected"><?php echo $text_percent; ?></option>
                          <?php } else { ?>
                          <option value="P"><?php echo $text_percent; ?></option>
                          <?php } ?>
                          <?php if ($cireviewpro_reviewcoupontype == 'F') { ?>
                          <option value="F" selected="selected"><?php echo $text_amount; ?></option>
                          <?php } else { ?>
                          <option value="F"><?php echo $text_amount; ?></option>
                          <?php } ?>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewcoupondiscount"><?php echo $entry_reviewcoupondiscount; ?></label>
                      <div class="col-sm-12">
                        <input type="text" name="cireviewpro_reviewcoupondiscount" value="<?php echo $cireviewpro_reviewcoupondiscount; ?>" placeholder="<?php echo $entry_reviewcoupondiscount; ?>" id="input-reviewcoupondiscount" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewcoupondays"><span data-toggle="tooltip" title="<?php echo $help_reviewcoupondays; ?>"><?php echo $entry_reviewcoupondays; ?></span></label>
                      <div class="col-sm-12">
                        <input type="text" name="cireviewpro_reviewcoupondays" value="<?php echo $cireviewpro_reviewcoupondays; ?>" placeholder="<?php echo $entry_reviewcoupondays; ?>" id="input-reviewcoupondays" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewcoupontotal"><span data-toggle="tooltip" title="<?php echo $help_reviewcoupontotal; ?>"><?php echo $entry_reviewcoupontotal; ?></span></label>
                      <div class="col-sm-12">
                        <input type="text" name="cireviewpro_reviewcoupontotal" value="<?php echo $cireviewpro_reviewcoupontotal; ?>" placeholder="<?php echo $entry_reviewcoupontotal; ?>" id="input-reviewcoupontotal" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label"><span data-toggle="tooltip" title="<?php echo $help_reviewcouponlogged; ?>"><?php echo $entry_reviewcouponlogged; ?></span></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewcouponlogged) { ?>
                          <input type="radio" name="cireviewpro_reviewcouponlogged" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewcouponlogged" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewcouponlogged) { ?>
                          <input type="radio" name="cireviewpro_reviewcouponlogged" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewcouponlogged" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label"><?php echo $entry_reviewcouponshipping; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewcouponshipping) { ?>
                          <input type="radio" name="cireviewpro_reviewcouponshipping" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewcouponshipping" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewcouponshipping) { ?>
                          <input type="radio" name="cireviewpro_reviewcouponshipping" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewcouponshipping" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewcouponproduct"><span data-toggle="tooltip" title="<?php echo $help_reviewcouponproduct; ?>"><?php echo $entry_reviewcouponproduct; ?></span></label>
                      <div class="col-sm-12">
                        <input type="text" name="cireviewpro_reviewcouponproduct" value="" placeholder="<?php echo $entry_reviewcouponproduct; ?>" id="input-reviewcouponproduct" class="form-control" />
                        <div id="reviewcouponproduct" class="well well-sm" style="height: 150px; overflow: auto;">
                          <?php foreach ($cireviewpro_reviewcoupon_products as $cireviewpro_reviewcoupon_product) { ?>
                          <div id="reviewcouponproduct<?php echo $cireviewpro_reviewcoupon_product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $cireviewpro_reviewcoupon_product['name']; ?>
                            <input type="hidden" name="cireviewpro_reviewcoupon_product[]" value="<?php echo $cireviewpro_reviewcoupon_product['product_id']; ?>" />
                          </div>
                          <?php } ?>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewcouponcategory"><span data-toggle="tooltip" title="<?php echo $help_reviewcouponcategory; ?>"><?php echo $entry_reviewcouponcategory; ?></span></label>
                      <div class="col-sm-12">
                        <input type="text" name="cireviewpro_reviewcouponcategory" value="" placeholder="<?php echo $entry_reviewcouponcategory; ?>" id="input-reviewcouponcategory" class="form-control" />
                        <div id="reviewcouponcategory" class="well well-sm" style="height: 150px; overflow: auto;">
                          <?php foreach ($cireviewpro_reviewcoupon_categories as $cireviewpro_reviewcoupon_category) { ?>
                          <div id="reviewcouponcategory<?php echo $cireviewpro_reviewcoupon_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $cireviewpro_reviewcoupon_category['name']; ?>
                            <input type="hidden" name="cireviewpro_reviewcoupon_category[]" value="<?php echo $cireviewpro_reviewcoupon_category['category_id']; ?>" />
                          </div>
                          <?php } ?>
                        </div>
                      </div>
                    </div>            
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewcouponuses-total"><span data-toggle="tooltip" title="<?php echo $help_reviewcouponuses_total; ?>"><?php echo $entry_reviewcouponuses_total; ?></span></label>
                      <div class="col-sm-12">
                        <input type="text" name="cireviewpro_reviewcouponuses_total" value="<?php echo $cireviewpro_reviewcouponuses_total; ?>" placeholder="<?php echo $entry_reviewcouponuses_total; ?>" id="input-reviewcouponuses-total" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewcouponuses-customer"><span data-toggle="tooltip" title="<?php echo $help_reviewcouponuses_customer; ?>"><?php echo $entry_reviewcouponuses_customer; ?></span></label>
                      <div class="col-sm-12">
                        <input type="text" name="cireviewpro_reviewcouponuses_customer" value="<?php echo $cireviewpro_reviewcouponuses_customer; ?>" placeholder="<?php echo $entry_reviewcouponuses_customer; ?>" id="input-reviewcouponuses-customer" class="form-control" />
                      </div>
                    </div> 
                  </div>
                  
                  <div class="tab-pane" id="tab-general-option-reward">
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-reviewreward"><?php echo $entry_reviewreward; ?></label>
                      <div class="col-sm-12">
                        <label class="radio-inline">
                          <?php if ($cireviewpro_reviewreward) { ?>
                          <input type="radio" name="cireviewpro_reviewreward" value="1" checked="checked" />
                          <?php echo $text_yes; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewreward" value="1" />
                          <?php echo $text_yes; ?>
                          <?php } ?>
                        </label>
                        <label class="radio-inline">
                          <?php if (!$cireviewpro_reviewreward) { ?>
                          <input type="radio" name="cireviewpro_reviewreward" value="0" checked="checked" />
                          <?php echo $text_no; ?>
                          <?php } else { ?>
                          <input type="radio" name="cireviewpro_reviewreward" value="0" />
                          <?php echo $text_no; ?>
                          <?php } ?>
                        </label>                          
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-rewardpoints"><?php echo $entry_rewardpoints; ?></label>
                      <div class="col-sm-12">
                        <input name="cireviewpro_rewardpoints" value="<?php echo $cireviewpro_rewardpoints; ?>" placeholder="<?php echo $entry_rewardpoints; ?>" id="input-rewardpoints" class="form-control" type="text" />
                        <?php if ($error_cireviewpro_rewardpoints) { ?>
                        <div class="text-danger"><?php echo $error_cireviewpro_rewardpoints; ?></div>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label" for="input-rewarddesc"><?php echo $entry_rewarddesc; ?></label>
                      <div class="col-sm-12">
                        <input name="cireviewpro_rewarddesc" value="<?php echo $cireviewpro_rewarddesc; ?>" placeholder="<?php echo $entry_rewarddesc; ?>" id="input-rewardpoints" class="form-control" type="text" />
                      </div>
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>    

                
                
                
                
                
                
                
                
                
                  

                
                
                
              
            </div>
            <div class="tab-pane" id="tab-pageinfo">
              <div class="row">
                <div class="col-sm-9">
                  <ul class="nav nav-tabs" id="pageinfo">
                    <li class="active"><a href="#review-list" data-toggle="tab"><?php echo $tab_review_list; ?></a></li>
                    <li><a href="#tab-promotion" data-toggle="tab"><?php echo $tab_promotion; ?></a></li>
                  </ul>
                  <div class="tab-content">
   
                    <div class="tab-pane active" id="review-list">
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-review-list-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
                        <div class="col-sm-10">
                          <input type="text" name="cireviewpro_reviewlistpage_keyword" value="<?php echo $cireviewpro_reviewlistpage_keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-review-list-keyword" class="form-control" />
                          <?php if ($error_cireviewpro_reviewlistpage_keyword) { ?>
                          <div class="text-danger"><?php echo $error_cireviewpro_reviewlistpage_keyword; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <ul class="nav nav-tabs" id="review-list-language">
                        <?php foreach ($languages as $language) { ?>
                        <li><a href="#review-list-language<?php echo $language['language_id']; ?>" data-toggle="tab"><?php if(VERSION >= '2.2.0.0') { ?>
                          <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
                        <?php } else { ?> 
                          <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><?php } ?> <?php echo $language['name']; ?></a></li>
                        <?php } ?>
                      </ul>
                      <div class="tab-content">
                        <?php foreach ($languages as $language) { ?>
                        <div class="tab-pane" id="review-list-language<?php echo $language['language_id']; ?>">
                          <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-review-list-title<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
                            <div class="col-sm-10">
                              <input type="text" name="cireviewpro_reviewlistpage[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($cireviewpro_reviewlistpage[$language['language_id']]) ? $cireviewpro_reviewlistpage[$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" id="input-review-list-title<?php echo $language['language_id']; ?>" class="form-control" />
                              <?php if (isset($error_cireviewpro_reviewlistpage['title'][$language['language_id']])) { ?>
                              <div class="text-danger"><?php echo $error_cireviewpro_reviewlistpage['title'][$language['language_id']]; ?></div>
                              <?php } ?>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-review-list-message<?php echo $language['language_id']; ?>"><?php echo $entry_message; ?></label>
                            <div class="col-sm-10">
                              <textarea name="cireviewpro_reviewlistpage[<?php echo $language['language_id']; ?>][message]" rows="5" placeholder="<?php echo $entry_message; ?>" id="input-review-list-message<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($cireviewpro_reviewlistpage[$language['language_id']]) ? $cireviewpro_reviewlistpage[$language['language_id']]['message'] : ''; ?></textarea>
                            </div>
                          </div> 
                          <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-review-list-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
                            <div class="col-sm-10">
                              <input type="text" name="cireviewpro_reviewlistpage[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($cireviewpro_reviewlistpage[$language['language_id']]) ? $cireviewpro_reviewlistpage[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-review-list-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
                              <?php if (isset($error_cireviewpro_reviewlistpage['meta_title'][$language['language_id']])) { ?>
                              <div class="text-danger"><?php echo $error_cireviewpro_reviewlistpage['meta_title'][$language['language_id']]; ?></div>
                              <?php } ?>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-review-list-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                            <div class="col-sm-10">
                              <textarea name="cireviewpro_reviewlistpage[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-review-list-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($cireviewpro_reviewlistpage[$language['language_id']]) ? $cireviewpro_reviewlistpage[$language['language_id']]['meta_description'] : ''; ?></textarea>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-review-list-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                            <div class="col-sm-10">
                              <textarea name="cireviewpro_reviewlistpage[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-review-list-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($cireviewpro_reviewlistpage[$language['language_id']]) ? $cireviewpro_reviewlistpage[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                            </div>
                          </div>                          
                        </div>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="tab-pane" id="tab-promotion">
                      <fieldset>
                        <legend><?php echo $legend_product; ?></legend>
                        <div class="form-group">
                          <label class="col-sm-2 control-label" for="input-product"><span data-toggle="tooltip" title="<?php echo $help_product; ?>"><?php echo $entry_product; ?></span></label>
                          <div class="col-sm-10">
                            <input type="text" name="product" value="" placeholder="<?php echo $entry_product; ?>" id="input-product" class="form-control" />
                            <div id="cireviewpropage-product" class="well well-sm" style="height: 150px; overflow: auto;">
                              <?php foreach ($cireviewpro_products as $cireviewpro_product) { ?>
                              <div id="cireviewpropage-product<?php echo $cireviewpro_product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $cireviewpro_product['name']; ?>
                                <input type="hidden" name="cireviewpro_product[]" value="<?php echo $cireviewpro_product['product_id']; ?>" />
                              </div>
                              <?php } ?>
                            </div>
                          </div>
                        </div>
                      </fieldset>
                      <fieldset>
                        <legend><?php echo $legend_category; ?></legend>
                        <div class="form-group">
                          <label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
                          <div class="col-sm-10">
                            <input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
                            <div id="cireviewpropage-category" class="well well-sm" style="height: 150px; overflow: auto;">
                              <?php foreach ($cireviewpro_categories as $cireviewpro_category) { ?>
                              <div id="cireviewpropage-category<?php echo $cireviewpro_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $cireviewpro_category['name']; ?>
                                <input type="hidden" name="cireviewpro_category[]" value="<?php echo $cireviewpro_category['category_id']; ?>" />
                              </div>
                              <?php } ?>
                            </div>
                          </div>
                        </div>
                      </fieldset>
                      <fieldset>
                        <legend><?php echo $legend_manufacturer; ?></legend>
                        <div class="form-group">
                          <label class="col-sm-2 control-label" for="input-manufacturer"><span data-toggle="tooltip" title="<?php echo $help_manufacturer; ?>"><?php echo $entry_manufacturer; ?></span></label>
                          <div class="col-sm-10">
                            <input type="text" name="manufacturer" value="" placeholder="<?php echo $entry_manufacturer; ?>" id="input-manufacturer" class="form-control" />
                            <div id="cireviewpropage-manufacturer" class="well well-sm" style="height: 150px; overflow: auto;">
                              <?php foreach ($cireviewpro_manufacturers as $cireviewpro_manufacturer) { ?>
                              <div id="cireviewpropage-manufacturer<?php echo $cireviewpro_manufacturer['manufacturer_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $cireviewpro_manufacturer['name']; ?>
                                <input type="hidden" name="cireviewpro_manufacturer[]" value="<?php echo $cireviewpro_manufacturer['manufacturer_id']; ?>" />
                              </div>
                              <?php } ?>
                            </div>
                          </div>
                        </div>
                      </fieldset>
                    </div>
                  </div>

                </div>
                <div class="col-sm-3">
                  <br>
                  <table class="table table-bordered">
                    <thead>
                      <tr><td><?php echo $const_names; ?></td><td><?php echo $const_short_codes; ?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><?php echo $const_product_name; ?></td><td>{PRODUCT_NAME}</td>
                      </tr>
                      <tr>
                        <td><?php echo $const_product_image; ?></td><td>{PRODUCT_IMAGE}</td>
                      </tr>
                      <tr>
                        <td><?php echo $const_product_description; ?></td><td>{PRODUCT_DESCRIPTION}</td>
                      </tr>
                      <tr>
                        <td><?php echo $const_product_link; ?></td><td>{PRODUCT_LINK}</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
   
            <div class="tab-pane" id="tab-email">
              <div class="row">
                <div class="col-sm-9">
                  
                  <div class="form-group">
                    <label class="col-sm-12 control-label" for="input-mailproductimagethumb"><?php echo $entry_mailproductimagethumb; ?></label>
                    <div class="col-sm-12">
                      <div class="row">
                        <div class="col-sm-6">
                          <div class="input-group">
                          <input type="text" name="cireviewpro_mailproductimagethumb_width" value="<?php echo $cireviewpro_mailproductimagethumb_width; ?>" placeholder="<?php echo $text_width; ?>" id="input-mailproductimagethumb-width" class="form-control" />
                          <span class="input-group-btn">
                            <button type="button" class="btn btn-primary"><i class="fa fa-arrows-h"></i></button>
                          </span>
                          </div>
                        </div>
                        <div class="col-sm-6">
                          <div class="input-group">
                          <input type="text" name="cireviewpro_mailproductimagethumb_height" value="<?php echo $cireviewpro_mailproductimagethumb_height; ?>" placeholder="<?php echo $text_height; ?>"  id="input-mailproductimagethumb-height" class="form-control" />
                          <span class="input-group-btn">
                            <button type="button" class="btn btn-primary"><i class="fa fa-arrows-v"></i></button>
                          </span>
                          </div>
                        </div>
                      </div>                                           
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-12 control-label" for="input-maillogoimagethumb"><?php echo $entry_maillogoimagethumb; ?></label>
                    <div class="col-sm-12">
                      <div class="row">
                        <div class="col-sm-6">
                          <div class="input-group">
                          <input type="text" name="cireviewpro_maillogoimagethumb_width" value="<?php echo $cireviewpro_maillogoimagethumb_width; ?>" placeholder="<?php echo $text_width; ?>" id="input-maillogoimagethumb-width" class="form-control" />
                          <span class="input-group-btn">
                            <button type="button" class="btn btn-primary"><i class="fa fa-arrows-h"></i></button>
                          </span>
                          </div>
                        </div>
                        <div class="col-sm-6">
                          <div class="input-group">
                          <input type="text" name="cireviewpro_maillogoimagethumb_height" value="<?php echo $cireviewpro_maillogoimagethumb_height; ?>" placeholder="<?php echo $text_height; ?>"  id="input-maillogoimagethumb-height" class="form-control" />
                          <span class="input-group-btn">
                            <button type="button" class="btn btn-primary"><i class="fa fa-arrows-v"></i></button>
                          </span>
                          </div>
                        </div>
                      </div>                                           
                    </div>
                  </div>
                  
                  <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab-customer-email" data-toggle="tab"><i class="fa fa-user"></i> <?php echo $tab_customeremail; ?></a></li>
                     <li><a href="#tab-admin-email" data-toggle="tab"><i class="fa fa-envelope-square"></i> <?php echo $tab_adminemail; ?></a></li>
                     <li><a href="#tab-mail-promotion" data-toggle="tab"><?php echo $tab_mail_promotion; ?></a></li>
                  </ul>  
                  <div class="tab-content">
                      <div class="tab-pane active" id="tab-customer-email">
                        <div class="form-group">
                          <label class="col-sm-4 control-label"><?php echo $entry_customersend; ?></label>
                            <div class="col-sm-8">
                              <label class="radio-inline">
                                <?php if ($cireviewpro_customersend) { ?>
                                <input type="radio" name="cireviewpro_customersend" value="1" checked="checked" />
                                <?php echo $text_yes; ?>
                                <?php } else { ?>
                                <input type="radio" name="cireviewpro_customersend" value="1" />
                                <?php echo $text_yes; ?>
                                <?php } ?>
                              </label>
                              <label class="radio-inline">
                                <?php if (!$cireviewpro_customersend) { ?>
                                <input type="radio" name="cireviewpro_customersend" value="0" checked="checked" />
                                <?php echo $text_no; ?>
                                <?php } else { ?>
                                <input type="radio" name="cireviewpro_customersend" value="0" />
                                <?php echo $text_no; ?>
                                <?php } ?>
                              </label>
                            </div>
                        </div>
                        <div class="customeremail" style="<?php if (!$cireviewpro_customersend) { echo 'display: none;'; } ?>" >
                          <ul class="nav nav-tabs" id="customeremail">
                            <?php foreach ($languages as $language) { ?>
                            <li><a href="#customeremail<?php echo $language['language_id']; ?>" data-toggle="tab">
                            <?php if(VERSION >= '2.2.0.0') { ?>
                              <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
                            <?php } else{ ?>
                              <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                            <?php } ?> <?php echo $language['name']; ?></a></li>
                            <?php } ?>
                          </ul>
                          <div class="tab-content">
                            <?php foreach ($languages as $language) { ?>
                            <div class="tab-pane" id="customeremail<?php echo $language['language_id']; ?>">
                              <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-customertitle<?php echo $language['language_id']; ?>"><?php echo $entry_customertitle; ?></label>
                                <div class="col-sm-10">
                                  <input type="text" name="cireviewpro_customer[<?php echo $language['language_id']; ?>][customertitle]" rows="5" placeholder="<?php echo $entry_customertitle; ?>" id="input-customertitle<?php echo $language['language_id']; ?>" class="form-control" value="<?php echo isset($cireviewpro_customer[$language['language_id']]) ? $cireviewpro_customer[$language['language_id']]['customertitle'] : ''; ?>" />
                                  <?php if (isset($error_customertitle[$language['language_id']])) { ?>
                                  <div class="text-danger"><?php echo $error_customertitle[$language['language_id']]; ?></div>
                                  <?php } ?>
                                </div>
                              </div>
                              <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-customermessage<?php echo $language['language_id']; ?>"><?php echo $entry_customermessage; ?></label>
                                <div class="col-sm-10">
                                  <textarea name="cireviewpro_customer[<?php echo $language['language_id']; ?>][customermessage]" rows="5" placeholder="<?php echo $entry_customermessage; ?>" id="input-customermessage<?php echo $language['language_id']; ?>" class="form-control summernote
                                  "><?php echo isset($cireviewpro_customer[$language['language_id']]) ? $cireviewpro_customer[$language['language_id']]['customermessage'] : ''; ?></textarea>
                                  <?php if (isset($error_customermessage[$language['language_id']])) { ?>
                                  <div class="text-danger"><?php echo $error_customermessage[$language['language_id']]; ?></div>
                                  <?php } ?>
                                </div>
                              </div>
                            </div>
                            <?php } ?>
                          </div>
                        </div>
                      </div>
                      <div class="tab-pane" id="tab-mail-promotion">
                        <fieldset>
                          <legend><?php echo $legend_product; ?></legend>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-mailproduct"><span data-toggle="tooltip" title="<?php echo $help_product; ?>"><?php echo $entry_product; ?></span></label>
                            <div class="col-sm-10">
                              <input type="text" name="mailproduct" value="" placeholder="<?php echo $entry_product; ?>" id="input-mailproduct" class="form-control" />
                              <div id="cireviewpropage-mailproduct" class="well well-sm" style="height: 150px; overflow: auto;">
                                <?php foreach ($cireviewpro_mailproducts as $cireviewpro_mailproduct) { ?>
                                <div id="cireviewpropage-mailproduct<?php echo $cireviewpro_mailproduct['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $cireviewpro_mailproduct['name']; ?>
                                  <input type="hidden" name="cireviewpro_mailproduct[]" value="<?php echo $cireviewpro_mailproduct['product_id']; ?>" />
                                </div>
                                <?php } ?>
                              </div>
                            </div>
                          </div>
                        </fieldset>
                        <fieldset>
                          <legend><?php echo $legend_category; ?></legend>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-mailcategory"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
                            <div class="col-sm-10">
                              <input type="text" name="mailcategory" value="" placeholder="<?php echo $entry_category; ?>" id="input-mailcategory" class="form-control" />
                              <div id="cireviewpropage-mailcategory" class="well well-sm" style="height: 150px; overflow: auto;">
                                <?php foreach ($cireviewpro_mailcategories as $cireviewpro_mailcategory) { ?>
                                <div id="cireviewpropage-mailcategory<?php echo $cireviewpro_mailcategory['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $cireviewpro_mailcategory['name']; ?>
                                  <input type="hidden" name="cireviewpro_mailcategory[]" value="<?php echo $cireviewpro_mailcategory['category_id']; ?>" />
                                </div>
                                <?php } ?>
                              </div>
                            </div>
                          </div>
                        </fieldset>
                        <fieldset>
                          <legend><?php echo $legend_manufacturer; ?></legend>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-mailmanufacturer"><span data-toggle="tooltip" title="<?php echo $help_manufacturer; ?>"><?php echo $entry_manufacturer; ?></span></label>
                            <div class="col-sm-10">
                              <input type="text" name="mailmanufacturer" value="" placeholder="<?php echo $entry_manufacturer; ?>" id="input-mailmanufacturer" class="form-control" />
                              <div id="cireviewpropage-mailmanufacturer" class="well well-sm" style="height: 150px; overflow: auto;">
                                <?php foreach ($cireviewpro_mailmanufacturers as $cireviewpro_mailmanufacturer) { ?>
                                <div id="cireviewpropage-mailmanufacturer<?php echo $cireviewpro_mailmanufacturer['manufacturer_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $cireviewpro_mailmanufacturer['name']; ?>
                                  <input type="hidden" name="cireviewpro_mailmanufacturer[]" value="<?php echo $cireviewpro_mailmanufacturer['manufacturer_id']; ?>" />
                                </div>
                                <?php } ?>
                              </div>
                            </div>
                          </div>
                        </fieldset>
                      </div>
                      <div class="tab-pane" id="tab-admin-email">
                        <div class="form-group">
                          <label class="col-sm-2 control-label"><?php echo $entry_adminsend; ?></label>
                            <div class="col-sm-10">
                              <label class="radio-inline">
                                <?php if ($cireviewpro_adminsend) { ?>
                                <input type="radio" name="cireviewpro_adminsend" value="1" checked="checked" />
                                <?php echo $text_yes; ?>
                                <?php } else { ?>
                                <input type="radio" name="cireviewpro_adminsend" value="1" />
                                <?php echo $text_yes; ?>
                                <?php } ?>
                              </label>
                              <label class="radio-inline">
                                <?php if (!$cireviewpro_adminsend) { ?>
                                <input type="radio" name="cireviewpro_adminsend" value="0" checked="checked" />
                                <?php echo $text_no; ?>
                                <?php } else { ?>
                                <input type="radio" name="cireviewpro_adminsend" value="0" />
                                <?php echo $text_no; ?>
                                <?php } ?>
                              </label>
                            </div>
                        </div>
                        <div class="adminemail" style="<?php if (!$cireviewpro_adminsend) { echo 'display: none;'; } ?>">
                          
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-adminmail"><?php echo $entry_adminmail; ?></label>
                            <div class="col-sm-10">
                              <input type="text" name="cireviewpro_adminmail" placeholder="<?php echo $entry_adminmail; ?>" id="input-adminmail" class="form-control" value="<?php echo $cireviewpro_adminmail; ?>" />
                            </div>
                          </div>
                          
                          <ul class="nav nav-tabs" id="adminemail">
                            <?php foreach ($languages as $language) { ?>
                            <li><a href="#adminemail<?php echo $language['language_id']; ?>" data-toggle="tab">
                              <?php if(VERSION >= '2.2.0.0') { ?>
                              <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
                            <?php } else{ ?>
                              <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
                            <?php } ?> <?php echo $language['name']; ?></a></li>
                            <?php } ?>
                          </ul>
                          <div class="tab-content">
                            <?php foreach ($languages as $language) { ?>
                            <div class="tab-pane" id="adminemail<?php echo $language['language_id']; ?>">
                              <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-admintitle<?php echo $language['language_id']; ?>"><?php echo $entry_admintitle; ?></label>
                                <div class="col-sm-10">
                                  <input type="text" name="cireviewpro_admin[<?php echo $language['language_id']; ?>][admintitle]" rows="5" placeholder="<?php echo $entry_admintitle; ?>" id="input-admintitle<?php echo $language['language_id']; ?>" class="form-control" value="<?php echo isset($cireviewpro_admin[$language['language_id']]) ? $cireviewpro_admin[$language['language_id']]['admintitle'] : ''; ?>" />
                                  <?php if (isset($error_admintitle[$language['language_id']])) { ?>
                                  <div class="text-danger"><?php echo $error_admintitle[$language['language_id']]; ?></div>
                                  <?php } ?>
                                </div>
                              </div>
                              <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-adminmessage<?php echo $language['language_id']; ?>"><?php echo $entry_adminmessage; ?></label>
                                <div class="col-sm-10">
                                  <textarea name="cireviewpro_admin[<?php echo $language['language_id']; ?>][adminmessage]" rows="5" placeholder="<?php echo $entry_adminmessage; ?>" id="input-adminmessage<?php echo $language['language_id']; ?>" class="form-control summernote
                                  "><?php echo isset($cireviewpro_admin[$language['language_id']]) ? $cireviewpro_admin[$language['language_id']]['adminmessage'] : ''; ?></textarea>
                                  <?php if (isset($error_adminmessage[$language['language_id']])) { ?>
                                  <div class="text-danger"><?php echo $error_adminmessage[$language['language_id']]; ?></div>
                                  <?php } ?>
                                </div>
                              </div>
                            </div>
                            <?php } ?>
                          </div>
                        </div>
                      </div>
                  </div> 
                </div>
                <div class="col-sm-3">
                  <br>
                  <table class="table table-bordered">
                    <thead>
                      <tr><td><?php echo $const_names; ?></td><td><?php echo $const_short_codes; ?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><?php echo $const_product_name; ?></td><td>{PRODUCT_NAME}</td>
                      </tr>
                      <tr>
                        <td><?php echo $const_product_image; ?></td><td>{PRODUCT_IMAGE}</td>
                      </tr>
                      <tr>
                        <td><?php echo $const_product_description; ?></td><td>{PRODUCT_DESCRIPTION}</td>
                      </tr>
                      <tr>
                        <td><?php echo $const_product_link; ?></td><td>{PRODUCT_LINK}</td>
                      </tr>
                    </tbody>
                    <thead>
                      <tr><td><?php echo $const_names; ?></td><td><?php echo $const_short_codes; ?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><?php echo $const_logo; ?></td><td>{LOGO}</td>
                      </tr>
                      <tr>
                        <td><?php echo $const_store_name; ?></td><td>{STORE_NAME}</td>
                      </tr>
                      <tr>
                        <td><?php echo $const_store_link; ?></td><td>{STORE_LINK}</td>
                      </tr>
                    </tbody>
                    <thead>
                      <tr><td><?php echo $const_names; ?></td><td><?php echo $const_short_codes; ?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><?php echo $const_review_author; ?></td><td>{REVIEW_AUTHOR}</td>
                      </tr>
                      <tr>
                        <td><?php echo $const_review_email; ?></td><td>{REVIEW_EMAIL}</td>
                      </tr>
                      <tr>
                        <td><?php echo $const_review_text; ?></td><td>{REVIEW_TITLE}</td>
                      </tr>
                      <tr>
                        <td><?php echo $const_review_text; ?></td><td>{REVIEW_TEXT}</td>
                      </tr>
                      <tr>
                        <td><?php echo $const_review_rating; ?></td><td>{REVIEW_RATING}</td>
                      </tr>
                      <tr>
                        <td><?php echo $const_review_ratings; ?></td><td>{REVIEW_ALL_RATING}</td>
                      </tr>
                      <tr>
                        <td><?php echo $const_review_attachment; ?></td><td>{REVIEW_ATTACHMENT}</td>
                      </tr>
                      <tr>
                        <td><?php echo $const_review_link; ?></td><td>{REVIEW_LINK}</td>
                      </tr>
                    </tbody>
                    <thead>
                      <tr><td><?php echo $const_names; ?></td><td><?php echo $const_short_codes; ?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><?php echo $const_promo_product; ?></td><td>{PROMO_PRODUCT}</td>
                      </tr>
                      <tr>
                        <td><?php echo $const_promo_category; ?></td><td>{PROMO_CATEGORY}</td>
                      </tr>
                      <tr>
                        <td><?php echo $const_promo_manufacturer; ?></td><td>{PROMO_MANUFACTURER}</td>
                      </tr>
                    </tbody>
                    <thead>
                      <tr><td><?php echo $const_names; ?></td><td><?php echo $const_short_codes; ?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><?php echo $const_coupon_code; ?></td><td>{COUPON_CODE}</td>
                      </tr>
                      
                      <tr>
                        <td><?php echo $const_reward_points; ?></td><td>{REWARD_POINTS}</td>
                      </tr>
                      
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-css">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-cireviewpro-custom"><span data-toggle="tooltip" title="<?php echo $help_customcss; ?>"><?php echo $entry_customcss; ?></span></label>
                  <div class="col-sm-10">
                    <textarea name="cireviewpro_customcss" rows="10" placeholder="<?php echo $entry_customcss; ?>" id="input-cireviewpro-custom" class="form-control"><?php echo $cireviewpro_customcss; ?></textarea>
                  </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-support">
              <h4 class="text-center">For Support and Enquiry Please Feel Free To Contact</h4>
              <h4 class="text-center"><strong>codinginspect@gmail.com</strong></h4>
              <div class="buttons text-center"><a target="_blank" href="https://www.opencart.com/index.php?route=marketplace/extension&filter_member=CodingInspect" class="btn btn-primary"><i class="fa fa-puzzle-piece fw"></i> View More Extensions</a></div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

<?php if(VERSION <= '2.2.0.0') { ?>
<script type="text/javascript"><!--

<?php foreach ($languages as $language) { ?>
$('#input-review-page-message<?php echo $language['language_id']; ?>').summernote({ height: 300 });
$('#input-review-success-message<?php echo $language['language_id']; ?>').summernote({ height: 300 });
$('#input-customermessage<?php echo $language['language_id']; ?>').summernote({ height: 300 });
$('#input-adminmessage<?php echo $language['language_id']; ?>').summernote({ height: 300 });
<?php } ?>
//--></script>
<?php } else { ?>
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
<?php } ?>

<style>
.table {
  word-wrap: break-word;
  word-break: break-all;
}
</style>
<script type="text/javascript"><!--
// Product
$('input[name=\'product\']').autocomplete({
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
    $('input[name=\'product\']').val('');

    $('#cireviewpropage-product' + item['value']).remove();

    $('#cireviewpropage-product').append('<div id="cireviewpropage-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="cireviewpro_product[]" value="' + item['value'] + '" /></div>');
  }
});

$('#cireviewpropage-product').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});

// Category
$('input[name=\'category\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['category_id']
          }
        }));
      }
    });
  },
  'select': function(item) {
    $('input[name=\'category\']').val('');

    $('#cireviewpropage-category' + item['value']).remove();

    $('#cireviewpropage-category').append('<div id="cireviewpropage-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="cireviewpro_category[]" value="' + item['value'] + '" /></div>');
  }
});

$('#cireviewpropage-category').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});

// Manufacturer
$('input[name=\'manufacturer\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['manufacturer_id']
          }
        }));
      }
    });
  },
  'select': function(item) {
    $('input[name=\'manufacturer\']').val('');

    $('#cireviewpropage-manufacturer' + item['value']).remove();

    $('#cireviewpropage-manufacturer').append('<div id="cireviewpropage-manufacturer' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="cireviewpro_manufacturer[]" value="' + item['value'] + '" /></div>');
  }
});

$('#cireviewpropage-manufacturer').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});
//--></script>
<script type="text/javascript"><!--
$('input[name=\'cireviewpro_reviewcouponproduct\']').autocomplete({
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
    $('input[name=\'cireviewpro_reviewcouponproduct\']').val('');
    
    $('#reviewcouponproduct' + item['value']).remove();
    
    $('#reviewcouponproduct').append('<div id="reviewcouponproduct' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="cireviewpro_reviewcoupon_product[]" value="' + item['value'] + '" /></div>'); 
  }
});

$('#reviewcouponproduct').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});

// Category
$('input[name=\'cireviewpro_reviewcouponcategory\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['category_id']
          }
        }));
      }
    });
  },
  'select': function(item) {
    $('input[name=\'cireviewpro_reviewcouponcategory\']').val('');
    
    $('#reviewcouponcategory' + item['value']).remove();
    
    $('#reviewcouponcategory').append('<div id="reviewcouponcategory' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="cireviewpro_reviewcoupon_category[]" value="' + item['value'] + '" /></div>');
  } 
});

$('#reviewcouponcategory').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});
//--></script>
<script type="text/javascript"><!--
// MailProduct
$('input[name=\'mailproduct\']').autocomplete({
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
    $('input[name=\'mailproduct\']').val('');

    $('#cireviewpropage-mailproduct' + item['value']).remove();

    $('#cireviewpropage-mailproduct').append('<div id="cireviewpropage-mailproduct' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="cireviewpro_mailproduct[]" value="' + item['value'] + '" /></div>');
  }
});

$('#cireviewpropage-mailproduct').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});

// MailCategory
$('input[name=\'mailcategory\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['category_id']
          }
        }));
      }
    });
  },
  'select': function(item) {
    $('input[name=\'mailcategory\']').val('');

    $('#cireviewpropage-mailcategory' + item['value']).remove();

    $('#cireviewpropage-mailcategory').append('<div id="cireviewpropage-mailcategory' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="cireviewpro_mailcategory[]" value="' + item['value'] + '" /></div>');
  }
});

$('#cireviewpropage-mailcategory').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});

// MailManufacturer
$('input[name=\'mailmanufacturer\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['manufacturer_id']
          }
        }));
      }
    });
  },
  'select': function(item) {
    $('input[name=\'mailmanufacturer\']').val('');

    $('#cireviewpropage-mailmanufacturer' + item['value']).remove();

    $('#cireviewpropage-mailmanufacturer').append('<div id="cireviewpropage-mailmanufacturer' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="cireviewpro_mailmanufacturer[]" value="' + item['value'] + '" /></div>');
  }
});

$('#cireviewpropage-mailmanufacturer').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});
//--></script>

<script type="text/javascript"><!--
$('#review-list-language a:first').tab('show');
$('#customeremail a:first').tab('show');
$('#adminemail a:first').tab('show');
$('#cireview_votelanguage a:first').tab('show');
$('#cireview_reviewpromolanguage a:first').tab('show');

$('input[name="cireviewpro_customersend"]').on('click', function() {
  
  if($(this).val()==1) { 
    $('.customeremail').show(); 
  } else { 
    $('.customeremail').hide(); 
  }
});
$('input[name="cireviewpro_customersend"]:checked').trigger('click');

$('input[name="cireviewpro_adminsend"]').on('click', function() {
  
  if($(this).val()==1) { 
    $('.adminemail').show(); 
  } else { 
    $('.adminemail').hide(); 
  }
});
$('input[name="cireviewpro_adminsend"]:checked').trigger('click');


// Color Picker
$('.colorpicker').colorpicker();

//--></script>
<style type="text/css">
.form-group .col-sm-12.control-label{
  text-align: left;  
  padding-bottom: 2px;
}  
</style>
</div>
<?php echo $footer; ?>