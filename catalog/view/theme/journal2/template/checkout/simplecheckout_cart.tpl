<div class="simplecheckout-block" id="simplecheckout_cart" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $has_error ? 'data-error="true"' : '' ?>>
<?php if ($display_header) { ?>
    <div class="checkout-heading panel-heading"><?php echo $text_cart ?></div>
<?php } ?>
<?php if ($attention) { ?>
    <div class="alert alert-danger simplecheckout-warning-block"><?php echo $attention; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
    <div class="alert alert-danger simplecheckout-warning-block"><?php echo $error_warning; ?></div>
<?php } ?>



    <div class="container simplecheckout-caption hide-on-phone hide-on-tablet">
        <label class="sm-50 lg-20 xl-20">
            Фото
        </label>
        <label class="sm-50 lg-25 xl-50">
            Наименование товара
        </label>
        <div class="sm-50 lg-20 xl-20">
            Кол-во
        </div>
        <div class="sm-50 lg-10 xl-10">Итого</div>
    </div>
<?php foreach ($products as $product) { ?>
    <div class="container">
            <div class="image xs-45 sm-50 md-20 lg-20 xl-20">
                <?php if ($product['thumb']) { ?>
                    <a href="<?php echo $product['href']; ?>"><img width="96%" class="simple-product-thumb" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                <?php } ?>
            </div>
            <div class="name xs-50 sm-50 md-30 lg-25 xl-50">
                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                <?php if (!$product['stock'] && ($config_stock_warning || !$config_stock_checkout)) { ?>
                    <span class="product-warning">***</span>
                <?php } ?>
                <div class="options">
                    <?php foreach ($product['option'] as $option) { ?>
                        &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                    <?php } ?>
                    <?php if (!empty($product['recurring'])) { ?>
                        - <small><?php echo $text_payment_profile ?>: <?php echo $product['profile_name'] ?></small>
                    <?php } ?>
                </div>
                <?php if ($product['reward']) { ?>
                    <small><?php echo $product['reward']; ?></small>
                <?php } ?>
            </div>
            <div class="quantity xs-55 sm-50 md-25 lg-20 xl-20">
                <div class="qty">
                    <button class="minus" data-onclick="decreaseProductQuantity" data-toggle="tooltip" type="submit"><i class="fa fa-minus"></i></button><input class="form-control" type="text" data-onchange="changeProductQuantity" <?php echo $quantity_step_as_minimum ? 'onfocus="$(this).blur()" data-minimum="' . $product['minimum'] . '"' : '' ?> name="quantity[<?php echo !empty($product['cart_id']) ? $product['cart_id'] : $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" /><button class="plus" data-onclick="increaseProductQuantity" data-toggle="tooltip" type="submit"><i class="fa fa-plus"></i></button>
                </div>
                <button class="danger" data-onclick="removeProduct" data-product-key="<?php echo !empty($product['cart_id']) ? $product['cart_id'] : $product['key'] ?>" data-toggle="tooltip" type="button"><i class="fa fa-times-circle"></i></button>
            </div>
            <div class="total xs-30 sm-50 md-15 lg-10 xl-10"><?php echo $product['total']; ?></div>


    </div>
<?php } ?>


<?php foreach ($totals as $total) { ?>
    <div class="simplecheckout-cart-total" id="total_<?php echo $total['code']; ?>">
        <div class="total-price">
            <span><b><?php echo $total['title']; ?>:</b></span>
            <span class="simplecheckout-cart-total-value"><?php echo $total['text']; ?></span><br>
        </div>
        <span class="simplecheckout-cart-total-remove">
            <?php if ($total['code'] == 'coupon') { ?>
                <i data-onclick="removeCoupon" title="<?php echo $button_remove; ?>" class="fa fa-times-circle"></i>
            <?php } ?>
            <?php if ($total['code'] == 'voucher') { ?>
                <i data-onclick="removeVoucher" title="<?php echo $button_remove; ?>" class="fa fa-times-circle"></i>
            <?php } ?>
            <?php if ($total['code'] == 'reward') { ?>
                <i data-onclick="removeReward" title="<?php echo $button_remove; ?>" class="fa fa-times-circle"></i>
            <?php } ?>
        </span>
    </div>
<?php } ?>
    <div class="red"><span>Внимание, сумма сборки и доставки, рассчитывается отдельно</span></div>
<?php if (isset($modules['coupon'])) { ?>
    <div class="simplecheckout-cart-total">
        <span class="inputs"><?php echo $entry_coupon; ?>&nbsp;<input class="form-control" type="text" data-onchange="reloadAll" name="coupon" value="<?php echo $coupon; ?>" /></span>
    </div>
<?php } ?>
<?php if (isset($modules['reward']) && $points > 0) { ?>
    <div class="simplecheckout-cart-total">
        <span class="inputs"><?php echo $entry_reward; ?>&nbsp;<input class="form-control" type="text" name="reward" data-onchange="reloadAll" value="<?php echo $reward; ?>" /></span>
    </div>
<?php } ?>
<?php if (isset($modules['voucher'])) { ?>
    <div class="simplecheckout-cart-total">
        <span class="inputs"><?php echo $entry_voucher; ?>&nbsp;<input class="form-control" type="text" name="voucher" data-onchange="reloadAll" value="<?php echo $voucher; ?>" /></span>
    </div>
<?php } ?>
<?php if (isset($modules['coupon']) || (isset($modules['reward']) && $points > 0) || isset($modules['voucher'])) { ?>
    <div class="simplecheckout-cart-total simplecheckout-cart-buttons">
        <span class="inputs buttons"><a id="simplecheckout_button_cart" data-onclick="reloadAll" class="button btn-buy button_oc btn"><span><?php echo $button_update; ?></span></a></span>
    </div>
<?php } ?>
<input type="hidden" name="remove" value="" id="simplecheckout_remove">
<div style="display:none;" id="simplecheckout_cart_total"><?php echo $cart_total ?></div>
<?php if ($display_weight) { ?>
    <div style="display:none;" id="simplecheckout_cart_weight"><?php echo $weight ?></div>
<?php } ?>
<?php if (!$display_model) { ?>
    <style>
    .simplecheckout-cart col.model,
    .simplecheckout-cart th.model,
    .simplecheckout-cart td.model {
        display: none;
    }
    </style>
<?php } ?>
</div>