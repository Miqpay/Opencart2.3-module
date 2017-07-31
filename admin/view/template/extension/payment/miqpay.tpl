<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-miqpay" input type="hidden" id="save_stay" name="save_stay" value="1" data-toggle="tooltip" title="<?php echo $text_save_and_stay; ?>" class="btn btn-success"><?php echo $text_save_and_stay; ?></button>&nbsp;
        <button type="submit" form="form-miqpay" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
    <?php if ($error_login) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_login; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($error_password1) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_password1; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-miqpay" class="form-horizontal">

          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-login"><?php echo $entry_login; ?></label>
            <div class="col-sm-10">
              <input type="text" name="miqpay_login" value="<?php echo $miqpay_login; ?>" placeholder="<?php echo $entry_login; ?>" id="input-login" class="form-control" />
            </div>
          </div>

          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-miqpay_key"><?php echo $entry_miqpay_key; ?></label>
            <div class="col-sm-10">
              <input type="text" name="miqpay_key" value="<?php echo $miqpay_key; ?>" placeholder="<?php echo $entry_miqpay_key; ?>" id="input-miqpay_key" class="form-control" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="miqpay_status" id="input-status" class="form-control">
                <?php if ($miqpay_status) { ?>
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
            <label class="col-sm-2 control-label" for="input-copy_success_url"><?php echo $text_success_url; ?></label>
            <div class="col-sm-10">
              <span> <?php echo $copy_success_url; ?> </span>
              <input type="hidden" name="miqpay_success_url" value="<?php echo $copy_success_url; ?>" id="input-copy_success_url" class="form-control" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-copy_fail_url"><?php echo $text_fail_url; ?></label>
            <div class="col-sm-10">
              <span> <?php echo $copy_fail_url; ?> </span>
              <input type="hidden" name="miqpay_fail_url" value="<?php echo $copy_fail_url; ?>" id="input-copy_fail_url" class="form-control" />
            </div>
          </div>

        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer;?> 