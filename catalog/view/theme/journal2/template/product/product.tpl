<?php $device = Journal2Utils::getDevice(); ?>
<?php $price_percent = 100 - ($special_value / ($price_value / 100)); ?>

<?php foreach ($attribute_groups as $attribute_group) { ?>
    <?php if ($attribute_group['attribute_group_id'] == 13) { ?>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
            <?php if (($attribute['attribute_id'] == 43) && ($attribute['text'] == 'Да')) { ?>
                <?php $akcii_class = 'black-pyatnica'; ?>
            <?php } ?>
            <?php if (($attribute['attribute_id'] == 44) && ($attribute['text'] == 'Да')) { ?>
                <?php $akcii_class = 'new-year'; ?>
            <?php } ?>
        <?php } ?>
    <?php } ?>
<?php } ?>
<?php echo $header; ?>
<div id="container" class="container j-container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
                <a href="<?php echo $breadcrumb['href']; ?>" itemprop="url">
                    <span itemprop="title"><?php echo $breadcrumb['text']; ?></span>
                </a>
            </li>
        <?php } ?>
    </ul>
    <div class="row xl-90 product"><?php echo $column_left; ?>
        <div id="content" class="product-page-content" itemscope itemtype="http://schema.org/Product">
            <?php if ($this->journal2->settings->get('product_page_title_position', 'top') === 'top'): ?>
                <h1 class="heading-title" itemprop="name"><?php echo $heading_title; ?></h1>
            <?php endif; ?>
            <div class="product-subheading">
                <?php if ($review_status) { ?>
                    <div class="rating">
                        <p>
                            <?php for ($i = 1; $i <= 5; $i++) { ?>
                                <?php if ($rating < $i) { ?>
                                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                                <?php } else { ?>
                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i
                                                class="fa fa-star-o fa-stack-1x"></i></span>
                                <?php } ?>
                            <?php } ?>
                            <a href="<?php echo $_SERVER['REQUEST_URI'];?>#otzivy"><?php echo $reviews; ?></a>
                            / <a href="" data-toggle="modal" data-target="#cireview-modal"><?php echo $text_write; ?></a>
                        </p>
                    </div>
                <?php } ?>
                <?php if ($sku) { ?>
                    <span class="sku"><?php echo $text_sku; ?> <span class="p-sku"
                                                                     itemprop="sku"><?php echo $sku; ?></span></span>
                <?php } ?>
            </div>
            <?php echo $content_top; ?>
            <div class="row product-info <?php echo $this->journal2->settings->get('split_ratio'); ?>">
                <div class="left" id="getPosition">
                    <?php if ($thumb) { ?>
                        <div class="image">
                            <?php if (isset($labels) && is_array($labels)): ?>
                                <?php foreach ($labels as $label => $name): ?>
                                    <span class="label-<?php echo $label; ?>"><b><?php echo $name; ?></b></span>
                                <?php endforeach; ?>
                            <?php endif; ?>
                            <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img
                                        src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>"
                                        alt="<?php echo $heading_title; ?>" id="image"
                                        data-largeimg="<?php echo $popup; ?>" itemprop="image"/></a>
                        </div>
                        <div class="image-bottom">
                        <?php if ($this->journal2->settings->get('product_page_gallery')): ?>
                            <div class="gallery-text"></div>
                        <?php endif; ?>
                        <a id="wish-options-<?php echo $product_id; ?>"
                           onclick="addToWishList('<?php echo $product_id; ?>'); clicked(id);"><i
                                    class="fa fa-heart-o"></i></a>
                        <a id="comp-options-<?php echo $product_id; ?>"
                           onclick="addToCompare('<?php echo $product_id; ?>'); clicked(id);"><i
                                    class="fa fa-refresh"></i></a>
                        </div>
                    <?php } ?>
                    <?php if ($images) { ?>
                        <div id="product-gallery"
                             class="image-additional <?php echo $this->journal2->settings->get('product_page_gallery_carousel') ? 'journal-carousel' : 'image-additional-grid'; ?>">
                            <?php if ($this->journal2->settings->get('product_page_gallery_carousel')): ?>
                            <div class="swiper">
                                <div class="swiper-container" <?php echo $this->journal2->settings->get('rtl') ? 'dir="rtl"' : ''; ?>>
                                    <div class="swiper-wrapper">
                                        <?php endif; ?>
                                        <?php if ($thumb) { ?>
                                            <a class="swiper-slide"
                                               style="<?php echo $this->journal2->settings->get('product_page_gallery_carousel') ? ('width: ' . 100 / $this->journal2->settings->get('product_page_additional_width', 5) . '%') : ''; ?>"
                                               href="<?php echo isset($popup_fixed) ? $popup_fixed : $popup; ?>"
                                               title="<?php echo $heading_title; ?>"><img
                                                        src="<?php echo isset($thumb_fixed) ? $thumb_fixed : $thumb; ?>"
                                                        title="<?php echo $heading_title; ?>"
                                                        alt="<?php echo $heading_title; ?>"/></a>
                                        <?php } ?>
                                        <?php foreach ($images as $image) { ?>
                                            <a class="swiper-slide"
                                               style="<?php echo $this->journal2->settings->get('product_page_gallery_carousel') ? ('width: ' . 100 / $this->journal2->settings->get('product_page_additional_width', 5) . '%') : ''; ?>"
                                               href="<?php echo $image['popup']; ?>"
                                               title="<?php echo $heading_title; ?>"><img
                                                        src="<?php echo $image['thumb']; ?>"
                                                        title="<?php echo $heading_title; ?>"
                                                        alt="<?php echo $heading_title; ?>" itemprop="image"/></a>
                                        <?php } ?>
                                        <?php if ($this->journal2->settings->get('product_page_gallery_carousel')): ?>
                                    </div>
                                </div>
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
                            </div>
                        <?php endif; ?>
                        </div>
                    <?php if ($this->journal2->settings->get('product_page_gallery_carousel')): ?>
                        <script>
                            (function () {
                                var opts = {
                                    slidesPerView: parseInt('<?php echo $this->journal2->settings->get('product_page_additional_width', 5) ?>', 10),
                                    slidesPerGroup: parseInt('<?php echo $this->journal2->settings->get('product_page_additional_width', 5) ?>', 10),
                                    spaceBetween: parseInt('<?php echo $this->journal2->settings->get('product_page_additional_spacing', 10) ?>', 10),
                                    nextButton: $('#product-gallery .swiper-button-next'),
                                    prevButton: $('#product-gallery .swiper-button-prev'),
                                    autoplay: <?php echo $this->journal2->settings->get('product_page_gallery_carousel_autoplay') ? (int)$this->journal2->settings->get('product_page_gallery_carousel_transition_delay', 4000) : 'false'; ?>,
                                    speed: <?php echo (int)$this->journal2->settings->get('product_page_gallery_carousel_transition_speed', 400); ?>,
                                    touchEventsTarget: <?php echo $this->journal2->settings->get('product_page_gallery_carousel_touchdrag') ? '\'container\'' : 'false'; ?>,
                                };

                                $('#product-gallery .swiper-container').swiper(opts);
                            })();
                        </script>
                    <?php endif; ?>
                    <?php } ?>
                    <?php foreach ($this->journal2->settings->get('additional_product_description_image', array()) as $tab): ?>
                        <div class="journal-custom-tab">
                            <?php if ($tab['has_icon']): ?>
                                <div class="block-icon block-icon-left"
                                     style="<?php echo $tab['icon_css']; ?>"><?php echo $tab['icon']; ?></div>
                            <?php endif; ?>
                            <?php if ($tab['name']): ?>
                                <h3><?php echo $tab['name']; ?></h3>
                            <?php endif; ?>
                            <?php echo $tab['content']; ?>
                        </div>
                    <?php endforeach; ?>
                    <div class="image-gallery" style="display: none !important;">
                        <?php if ($thumb) { ?>
                            <a href="<?php echo $popup; ?>"
                               data-original="<?php echo isset($original) ? $original : $popup; ?>"
                               title="<?php echo $heading_title; ?>" class="swipebox"><img src="<?php echo $thumb; ?>"
                                                                                           title="<?php echo $heading_title; ?>"
                                                                                           alt="<?php echo $heading_title; ?>"/></a>
                        <?php } ?>
                        <?php if ($images) { ?>
                            <?php foreach ($images as $image) { ?>
                                <a href="<?php echo $image['popup']; ?>"
                                   data-original="<?php echo isset($image['original']) ? $image['original'] : $image['popup']; ?>"
                                   title="<?php echo $heading_title; ?>" class="swipebox"><img
                                            src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>"
                                            alt="<?php echo $heading_title; ?>"/></a>
                            <?php } ?>
                        <?php } ?>
                    </div>
                    <meta itemprop="description"
                          content="<?php echo $this->journal2->settings->get('product_description'); ?>"/>


                    <?php if ($device != 'phone') : ?>
                    <div class="tabs-content">
                        <?php $is_active = true; ?>
                        <?php if (trim($description) && !$this->journal2->settings->get('hide_product_description')) { ?>
                            <div class="svernuto tab-pane tab-content <?php if ($is_active) {
                                echo 'active';
                                $is_active = false;
                            }; ?>" id="tab-description">
                                <div class="description-content"><?php echo $description; ?></div>
                                <button class="button btn-primary button_description_1 btn">Читать далее...</button>
                                <button class="button btn-primary button_description_2 btn svernuto">Свернуть</button>
                            </div>
                        <?php } ?>
                    </div>
                    <?php endif; ?>

                </div>
                <div class="right">
                    <?php if ($this->journal2->settings->get('product_page_title_position', 'top') === 'right'): ?>
                        <h1 class="heading-title" itemprop="name"><?php echo $heading_title; ?></h1>
                    <?php endif; ?>
                    <div id="product" class="product-options">


                        <?php if (isset($date_end) && $date_end && $this->journal2->settings->get('show_countdown_product_page', 'on') == 'on'): ?>
                            <div class="countdown-wrapper <?php echo $akcii_class; ?>">
                                <div class="expire-text"><?php echo $this->journal2->settings->get('countdown_product_page_title'); ?></div>
                                <div class="countdown"></div>
                            </div>
                            <script>Journal.countdown($('.right .countdown'), '<?php echo $date_end; ?>');</script>
                        <?php endif; ?>


                        <?php if ($element != 1) { ?>
                            <div class="row product-row">
                                    <?php if ($price) { ?>
                                        <ul class="list-unstyled price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                            <meta itemprop="itemCondition" content="http://schema.org/NewCondition">
                                            <meta itemprop="priceCurrency" content="<?php echo $this->journal2->settings->get('product_price_currency'); ?>"/>
                                            <meta itemprop="price" content="<?php echo number_format($this->journal2->settings->get('product_price')); ?>"/>
                                         <?php if ($this->journal2->settings->get('product_in_stock') === 'yes'): ?>
                                            <link itemprop="availability" href="http://schema.org/InStock"/>
                                         <?php else: ?>
                                            <link itemprop="availability" href="http://schema.org/PreOrder"/>
                                         <?php endif; ?>

                                            <?php if ($device === 'phone'){?>
                                                <div class="row product-row">
                                                    <?php if ($price) { ?>
                                                        <div class="list-unstyled price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                                            <meta itemprop="priceCurrency" content="<?php echo $this->journal2->settings->get('product_price_currency'); ?>"/>
                                                            <meta itemprop="price" content="<?php echo number_format($this->journal2->settings->get('product_price'), '2', '.', ''); ?>"/>
                                                            <meta itemprop="itemCondition" content="http://schema.org/NewCondition">
                                                            <?php if ($this->journal2->settings->get('product_in_stock') === 'yes'): ?>
                                                                <link itemprop="availability" href="http://schema.org/InStock"/>
                                                            <?php else: ?>
                                                                <link itemprop="availability" href="http://schema.org/PreOrder"/>
                                                            <?php endif; ?>
                                                            <?php if (!$special) { ?>
                                                                <!-- Мобильный блок цены со скидкой -->
                                                                <div class="row">
                                                                    <div class="sm-50">

                                                                            <?php if ($this->journal2->settings->get('product_price') > 0) { ?>
                                                                            <div class="product-price">
                                                                                <?php echo $price; ?>
                                                                            </div>
                                                                            <?php } else { ?>
                                                                        <div class="product-noprice">
                                                                                Цена по запросу
                                                                        </div>
                                                                            <?php } ?>

                                                                    </div>
                                                                    <div class="sm-50">
                                            <span class="qty">
                                                <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" data-min-value="<?php echo $minimum; ?>" id="input-quantity" class="form-control"/>
                                                <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
                                            </span>
                                                                        <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-buy width100"><i class="fa fa-shopping-basket" aria-hidden="true"></i> <?php echo $button_cart; ?></button>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <button type="button" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-oneclick-spec width100 btn-lg btn-block order" data-remodal-target="modal" data-product="<?php echo $heading_title; ?>"><i class="fa fa-thumbs-up" aria-hidden="true"></i> Купить в 1 клик</button>
                                                                </div>
                                                            <?php } else { ?>
                                                                <!-- Мобильный блок цены со скидкой -->
                                                                <div class="row">
                                                                    <div class="sm-50">
                                                                        <div class="price-old"><?php echo $price; ?></div>
                                                                        <div class="price-percent">- <?php echo round($price_percent);?> %</div>
                                                                    </div>
                                                                    <div class="sm-50">
                                            <span class="qty">
                                                <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" data-min-value="<?php echo $minimum; ?>" id="input-quantity" class="form-control"/>
                                                <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
                                            </span>
                                                                        <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-buy width100"><i class="fa fa-shopping-basket" aria-hidden="true"></i> <?php echo $button_cart; ?></button>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="sm-50">
                                                                        <div class="price-new"><?php echo $special; ?></div>
                                                                    </div>
                                                                    <div class="sm-50">
                                                                        <button type="button" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-oneclick-spec width100 btn-lg btn-block order" data-remodal-target="modal" data-product="<?php echo $heading_title; ?>"><i class="fa fa-thumbs-up" aria-hidden="true"></i> Купить в 1 клик</button>
                                                                    </div>
                                                                </div>
                                                            <?php } ?>
                                                        </div>
                                                    <?php } ?>
                                                </div>
                                            <?php }else{ ?>
                                            <!-- начало блока цены для декстопа -->
                                            <?php if (!$special) { ?>
                                                <div class="row-1 no-special">

                                                        <?php if ($this->journal2->settings->get('product_price') > 0) { ?>
                                                    <li class="product-price">
                                                            <?php echo $price; ?>
                                                    </li>
                                                        <?php } else { ?>
                                                    <li class="product-noprice">
                                                            Цена по запросу
                                                    </li>
                                                        <?php } ?>

                                                    <div class="form-group cart">
                                        <span class="qty">
                                              <input type="text" name="quantity" value="<?php echo $minimum; ?>"
                                                     size="2" data-min-value="<?php echo $minimum; ?>"
                                                     id="input-quantity" class="form-control"/>
                                              <input type="hidden" name="product_id"
                                                     value="<?php echo $product_id; ?>"/>
                                        </span>
                                                    </div>
                                                    <button type="button" id="button-cart"
                                                            data-loading-text="<?php echo $text_loading; ?>"
                                                            class="btn btn-buy"><i class="fa fa-shopping-basket"
                                                                                   aria-hidden="true"></i> <?php echo $button_cart; ?>
                                                    </button>
                                                </div>
                                                <div class="row-2 no-special">
                                                    <button type="button"
                                                            data-loading-text="<?php echo $text_loading; ?>"
                                                            class="btn btn-oneclick-spec btn-lg btn-block order"
                                                            data-remodal-target="modal"
                                                            data-product="<?php echo $heading_title; ?>"><i
                                                                class="fa fa-thumbs-up" aria-hidden="true"></i> Купить в
                                                        1 клик
                                                    </button>
                                                </div>
                                            <?php } else { ?>
                                                <div class="row-1 special">
                                                    <li class="price-new"><?php echo $special; ?></li>
                                                    <div class="form-group cart">
                                        <span class="qty">
                                              <input type="text" name="quantity" value="<?php echo $minimum; ?>"
                                                     size="2" data-min-value="<?php echo $minimum; ?>"
                                                     id="input-quantity" class="form-control"/>
                                              <input type="hidden" name="product_id"
                                                     value="<?php echo $product_id; ?>"/>
                                        </span>
                                                    </div>
                                                    <button type="button" id="button-cart"
                                                            data-loading-text="<?php echo $text_loading; ?>"
                                                            class="btn btn-buy"><i class="fa fa-shopping-basket"
                                                                                   aria-hidden="true"></i> <?php echo $button_cart; ?>
                                                    </button>
                                                </div>
                                                <div class="row-2 special">
                                                    <div class="special-price">
                                                        <li class="price-old"><?php echo $price; ?></li>
                                                        <li class="price-percent">- <?php echo round($price_percent); ?>
                                                            %
                                                        </li>
                                                    </div>
                                                    <button type="button"
                                                            data-loading-text="<?php echo $text_loading; ?>"
                                                            class="btn btn-oneclick-spec btn-lg btn-block order"
                                                            data-remodal-target="modal"
                                                            data-product="<?php echo $heading_title; ?>"><i
                                                                class="fa fa-thumbs-up" aria-hidden="true"></i> Купить в
                                                        1 клик
                                                    </button>


                                                </div>


                                            <?php } ?>
                                            <!-- конец блока цены для декстопа -->
                                            <?php } ?>



                                        </ul>
                                    <?php } ?>


                                </div>
                                <!-- конец обертки товара элемента-->
                        <?php } ?>

                        <?php if ($options) { ?>

                            <div class="options <?php echo $this->journal2->settings->get('product_page_options_push_classes'); ?>">


                                <?php foreach ($options as $option) { ?>
                                    <?php if (($option['type'] == 'select') && ($option['option_id'] != 29)) { ?>
                                        <div class="option form-group<?php echo($option['required'] ? ' required' : ''); ?> option-<?php echo $option['type']; ?>">
                                            <label class="control-label"
                                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                            <select name="option[<?php echo $option['product_option_id']; ?>]"
                                                    id="input-option<?php echo $option['product_option_id']; ?>"
                                                    class="form-control">
                                                <option value=""><?php echo $text_select; ?></option>
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                    <option value="<?php echo $option_value['product_option_value_id']; ?>"
                                                            data-points="<?php echo(isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>"
                                                            data-prefix="<?php echo $option_value['price_prefix']; ?>"
                                                            data-price="<?php echo $option_value['price_value']; ?>"><?php echo $option_value['name']; ?>
                                                        <?php if ($option_value['price']) { ?>
                                                            (<?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>)
                                                        <?php } ?>
                                                    </option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    <?php } ?>
                                <?php } ?>


                                <?php // Верх ?>
                                <?php foreach ($options as $option) { ?>

                                    <?php if (($option['type'] == 'radio') && ($option['option_id'] == 13) || ($option['option_id'] == 14)) { ?>
                                        <div class="xl-49 sm-50 xs-50 option form-group<?php echo($option['required'] ? ' required' : ''); ?> option-<?php echo $option['type']; ?> optionid-<?php echo $option['option_id']; ?>">
                                            <select name="option[<?php echo $option['product_option_id']; ?>]"
                                                    id="input-option<?php echo $option['product_option_id']; ?>"
                                                    class="form-control show-tick selectpicker" required="required"
                                                    data-style="btn-imageselect">
                                                <option value=""><?php echo $option['name']; ?></option>
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                    <option value="<?php echo $option_value['product_option_value_id']; ?>"
                                                            data-points="<?php echo(isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>"
                                                            data-prefix="<?php echo $option_value['price_prefix']; ?>"
                                                            data-price="<?php echo $option_value['price_value']; ?>"
                                                            data-content="<img src='<?php echo $option_value['image']; ?>'><div class='product-option-name'><?php echo $option_value['name']; ?></div>
                                              <?php if ($option_value['price']) { ?>
                                                   <span class='red'>(<?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>)</span>
                                              <?php } ?>
                                        ">
                                                    </option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    <?php } ?>
                                <?php } ?>
                                <?php // Низ ?>
                                <?php foreach ($options as $option) { ?>
                                    <?php if (($option['type'] == 'radio') && ($option['option_id'] == 15) || ($option['option_id'] == 16)) { ?>
                                        <div class="xl-49 sm-50 xs-50 option form-group<?php echo($option['required'] ? ' required' : ''); ?> option-<?php echo $option['type']; ?> optionid-<?php echo $option['option_id']; ?>">
                                            <select name="option[<?php echo $option['product_option_id']; ?>]"
                                                    id="input-option<?php echo $option['product_option_id']; ?>"
                                                    class="form-control show-tick selectpicker" required="required"
                                                    data-style="btn-imageselect">
                                                <option value=""><?php echo $option['name']; ?></option>
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                    <option value="<?php echo $option_value['product_option_value_id']; ?>"
                                                            data-points="<?php echo(isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>"
                                                            data-prefix="<?php echo $option_value['price_prefix']; ?>"
                                                            data-price="<?php echo $option_value['price_value']; ?>"
                                                            data-content="<img src='<?php echo $option_value['image']; ?>'><div class='product-option-name'><?php echo $option_value['name']; ?></div>
                                              <?php if ($option_value['price']) { ?>
                                                   <span class='red'>(<?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>)</span>
                                              <?php } ?>
                                          ">
                                                    </option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    <?php } ?>
                                <?php } ?>

                                <!-- 1 картинка -->
                                <?php foreach ($options as $option) { ?>
                                    <?php if (($option['type'] == 'radio') && ($option['option_id'] == 27)) { ?>
                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                            <label class="optionid-<?php echo $option['option_id']; ?>">Палитра</label>
                                            <img src='<?php echo $option_value['image']; ?>' width="150"
                                                 class="palitra">
                                        <?php } ?>
                                    <?php } ?>
                                <?php } ?>

                                <!-- Опции картинками -->
                                <?php foreach ($options as $option) { ?>
                                    <?php if (($option['type'] == 'radio') && ($option['option_id'] != 13) && ($option['option_id'] != 14) && ($option['option_id'] != 15) && ($option['option_id'] != 16) && ($option['option_id'] != 27)) { ?>
                                        <div class="option form-group<?php echo($option['required'] ? ' required' : ''); ?> option-<?php echo $option['type']; ?> optionid-<?php echo $option['option_id']; ?>">
                                            <select name="option[<?php echo $option['product_option_id']; ?>]"
                                                    id="input-option<?php echo $option['product_option_id']; ?>"
                                                    class="form-control show-tick selectpicker" required="required"
                                                    data-style="btn-imageselect">
                                                <option value=""><?php echo $option['name']; ?></option>
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                    <option value="<?php echo $option_value['product_option_value_id']; ?>"
                                                            data-points="<?php echo(isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>"
                                                            data-prefix="<?php echo $option_value['price_prefix']; ?>"
                                                            data-price="<?php echo $option_value['price_value']; ?>"
                                                            data-content="<img src='<?php echo $option_value['image']; ?>'><div class='product-option-name'><?php echo $option_value['name']; ?></div>"></option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    <?php } ?>
                                <?php } ?>


                                <?php foreach ($options as $option) { ?>
                                    <?php if ($option['type'] == 'checkbox') { ?>
                                        <div class="option form-group<?php echo($option['required'] ? ' required' : ''); ?> option-<?php echo $option['type']; ?>">
                                            <label class="control-label"><?php echo $option['name']; ?></label>
                                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox"
                                                                   name="option[<?php echo $option['product_option_id']; ?>][]"
                                                                   value="<?php echo $option_value['product_option_value_id']; ?>"
                                                                   data-points="<?php echo(isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>"
                                                                   data-prefix="<?php echo $option_value['price_prefix']; ?>"
                                                                   data-price="<?php echo $option_value['price_value']; ?>"/>
                                                            <?php if (version_compare(VERSION, '2.2', '>=') && $option_value['image']) { ?>
                                                                <img src="<?php echo $option_value['image']; ?>"
                                                                     alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                                                     class="img-thumbnail"/>
                                                            <?php } ?>
                                                            <?php echo $option_value['name']; ?>
                                                            <?php if ($option_value['price']) { ?>
                                                                (<?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>)
                                                            <?php } ?>
                                                        </label>
                                                    </div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    <?php } ?>
                                <?php } ?>

                                <?php if (version_compare(VERSION, '2.3', '<')): ?>

                                    <?php if ($option['type'] == 'image') { ?>
                                        <div class="option form-group<?php echo($option['required'] ? ' required' : ''); ?> option-<?php echo $option['type']; ?>">
                                            <label class="control-label"><?php echo $option['name']; ?></label>
                                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                    <div class="radio">
                                                        <label>
                                                            <input type="radio"
                                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                                   value="<?php echo $option_value['product_option_value_id']; ?>"
                                                                   data-points="<?php echo(isset($option_value['points_value']) ? $option_value['points_value'] : 0); ?>"
                                                                   data-prefix="<?php echo $option_value['price_prefix']; ?>"
                                                                   data-price="<?php echo $option_value['price_value']; ?>"/>
                                                            <img src="<?php echo $option_value['image']; ?>"
                                                                 alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                                                 class="img-thumbnail"/> <?php echo $option_value['name']; ?>
                                                            <?php if ($option_value['price']) { ?>
                                                                (<?php echo ($option_value['price_prefix'] == '+' || $option_value['price_prefix'] == '-' ? $option_value['price_prefix'] : '') . $option_value['price']; ?>)
                                                            <?php } ?>
                                                        </label>
                                                    </div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    <?php } ?>
                                <?php endif; ?>

                                <?php foreach ($options as $option) { ?>
                                    <?php if ($option['type'] == 'text') { ?>

                                        <div class="option form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                            <label class="control-label"
                                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                            <input type="text"
                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                   value="<?php echo $option['value']; ?>"
                                                   placeholder="<?php echo $option['name']; ?>"
                                                   id="input-option<?php echo $option['product_option_id']; ?>"
                                                   class="form-control"/>
                                        </div>
                                    <?php } ?>
                                    <?php if ($option['type'] == 'textarea') { ?>
                                        <div class="option form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                            <label class="control-label"
                                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                            <textarea name="option[<?php echo $option['product_option_id']; ?>]"
                                                      rows="5" placeholder="<?php echo $option['name']; ?>"
                                                      id="input-option<?php echo $option['product_option_id']; ?>"
                                                      class="form-control"><?php echo $option['value']; ?></textarea>
                                        </div>
                                    <?php } ?>
                                    <?php if ($option['type'] == 'file') { ?>
                                        <div class="option form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                            <label class="control-label"><?php echo $option['name']; ?></label>
                                            <button type="button"
                                                    id="button-upload<?php echo $option['product_option_id']; ?>"
                                                    data-loading-text="<?php echo $text_loading; ?>"
                                                    class="btn btn-default btn-block btn-upload"><i
                                                        class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                                            <input type="hidden"
                                                   name="option[<?php echo $option['product_option_id']; ?>]" value=""
                                                   id="input-option<?php echo $option['product_option_id']; ?>"/>
                                        </div>
                                    <?php } ?>
                                    <?php if ($option['type'] == 'date') { ?>
                                        <div class="option form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                            <label class="control-label"
                                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                            <div class="input-group date">
                                                <input type="text"
                                                       name="option[<?php echo $option['product_option_id']; ?>]"
                                                       value="<?php echo $option['value']; ?>"
                                                       data-date-format="YYYY-MM-DD"
                                                       id="input-option<?php echo $option['product_option_id']; ?>"
                                                       class="form-control"/>
                                                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
                                        </div>
                                    <?php } ?>
                                    <?php if ($option['type'] == 'datetime') { ?>
                                        <div class="option form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                            <label class="control-label"
                                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                            <div class="input-group datetime">
                                                <input type="text"
                                                       name="option[<?php echo $option['product_option_id']; ?>]"
                                                       value="<?php echo $option['value']; ?>"
                                                       data-date-format="YYYY-MM-DD HH:mm"
                                                       id="input-option<?php echo $option['product_option_id']; ?>"
                                                       class="form-control"/>
                                                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                        </div>
                                    <?php } ?>
                                    <?php if ($option['type'] == 'time') { ?>
                                        <div class="option form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                            <label class="control-label"
                                                   for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                                            <div class="input-group time">
                                                <input type="text"
                                                       name="option[<?php echo $option['product_option_id']; ?>]"
                                                       value="<?php echo $option['value']; ?>" data-date-format="HH:mm"
                                                       id="input-option<?php echo $option['product_option_id']; ?>"
                                                       class="form-control"/>
                                                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                                        </div>
                                    <?php } ?>
                                <?php } ?>
                                <span class="red">*поля, обязательные для выбора</span>
                            </div>



                            <script>Journal.enableSelectOptionAsButtonsList();</script>
                        <?php } ?>
                        <?php if ($recurrings) { ?>
                            <hr>
                            <h3><?php echo $text_payment_recurring ?></h3>
                            <div class="form-group required">
                                <select name="recurring_id" class="form-control">
                                    <option value=""><?php echo $text_select; ?></option>
                                    <?php foreach ($recurrings as $recurring) { ?>
                                        <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                                    <?php } ?>
                                </select>
                                <div class="help-block" id="recurring-description"></div>
                            </div>
                        <?php } ?>

                        <?php if ($minimum > 1) { ?>
                            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?>
                            </div>
                        <?php } ?>



                        <div class="panel-group" id="accordion-product-tab">

                            <?php if($device === 'phone'): ?>
                            <div class="panel panel-default panel1">
                                <!-- Заголовок 3 панели -->
                                <a data-toggle="collapse" data-parent="#accordion-product-tab" href="#collapse1">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <i class="fa fa-bars" aria-hidden="true"></i>
                                            <span>Описание</span><i class="fa fa-chevron-right" aria-hidden="true"></i>
                                        </h4>
                                    </div>
                                </a>
                                <div id="collapse1" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <?php echo $description; ?>
                                    </div>
                                </div>
                            </div>
                            <?php endif; ?>


                            <?php if ($attribute_groups) { ?>
                                <div class="panel panel-default panel2">
                                    <a data-toggle="collapse" data-parent="#accordion-product-tab" href="#collapse2">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <i class="fa fa-map-o" aria-hidden="true"></i>
                                                <span>Характеристики</span><i class="fa fa-chevron-right fa-rotate-90"
                                                                              aria-hidden="true"></i>
                                            </h4>
                                        </div>
                                    </a>
                                    <div id="collapse2" class="panel-collapse collapse <?php if($device != 'phone'){ ?>in<?php } ?>">

                                        <div class="panel-body">
                                            <table class="table table-bordered attribute">
                                                <?php foreach ($attribute_groups as $attribute_group) { ?>
                                                    <?php if ($attribute_group['attribute_group_id'] != 13) { ?>
                                                    <thead>
                                                    <tr>
                                                        <td colspan="2">
                                                            <strong><?php echo $attribute_group['name']; ?></strong>
                                                        </td>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                                        <tr>
                                                            <td><?php echo $attribute['name']; ?></td>
                                                            <td><?php echo $attribute['text']; ?></td>
                                                        </tr>
                                                    <?php } ?>
                                                    </tbody>
                                                    <?php } ?>
                                                <?php } ?>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            <?php } ?>
                            <div class="panel panel-default panel3">
                                <a data-toggle="collapse" data-parent="#accordion-product-tab" href="#collapse3">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <i class="fa fa-truck" aria-hidden="true"></i>
                                            <span>Доставка</span><i class="fa fa-chevron-right" aria-hidden="true"></i>
                                        </h4>
                                    </div>
                                </a>
                                <div id="collapse3" class="panel-collapse collapse">

                                    <div class="panel-body">
                                        <!--noindex-->
                                        <h3>Мы осуществляем доставку, как по городу, так и на территории РФ.</h3>
                                        <p>По Санкт-Петербургу мы доставляем заказы с помощью собственного транспортного
                                            отдела.</p>
                                        <p>Доставку по территории РФ выполняем через наших партнеров, лидеров в сфере
                                            транспортных перевозок «ПЭК» и «Деловые линии».</p>
                                        <h3>Стоимость доставки:</h3>
                                        <ul>
                                            <li>Корпусной мебель: по СПБ в пределах КАД – 1100 руб.</li>
                                            <li>за пределами КАД +30 руб./км.</li>
                                        </ul>
                                        <p>*доставка осуществляется до парадной при возможности беспрепятственного
                                            проезда</p>
                                        <!--/noindex-->
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default panel4">
                                <!-- Заголовок 3 панели -->
                                <a data-toggle="collapse" data-parent="#accordion-product-tab" href="#collapse4">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <i class="fa fa-cc-visa" aria-hidden="true"></i>
                                            <span>Оплата</span><i class="fa fa-chevron-right" aria-hidden="true"></i>
                                        </h4>
                                    </div>
                                </a>
                                <div id="collapse4" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <!--noindex-->
                                        <h2>Способы оплаты</h2>
                                        <ul>
                                            <li>Наличными, при доставке или самовывозе</li>
                                            <li>Оплата банковской картой</li>
                                            <li>Оплата путем безналичного расчета</li>
                                            <li>Система электронных денег Яндекс или Webmoney</li>
                                            <li>Удобный и быстрый кредит</li>
                                            <li>Рассрочка</li>
                                        </ul>
                                        <!--/noindex-->
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>




                    <div id="otzivy" name="otzivy">
                        <h3 class="cireview-aggerate-title">Отзывы о: <?php echo $heading_title; ?></h3>
                        <?php if ($rating): ?>
                            <meta itemprop="ratingValue" content="<?php echo $rating; ?>"/>
                            <meta itemprop="reviewCount" content="<?php echo $this->journal2->settings->get('product_num_reviews'); ?>"/>
                            <meta itemprop="bestRating" content="5"/>
                            <meta itemprop="worstRating" content="1"/>
                        <?php endif; ?>
                        <form class="form-horizontal" id="form-review">
                            <div id="review"></div>
                            <h2 id="review-title"><?php echo $text_write; ?></h2>
                            <?php if ($review_guest) { ?>
                                <div class="form-group required">
                                    <div class="col-sm-12">
                                        <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                                        <input type="text" name="name" value="<?php echo version_compare(VERSION, '2.2', '<') ? '' : $customer_name; ?>" id="input-name" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <div class="col-sm-12">
                                        <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                                        <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                                        <div class="help-block"><?php echo $text_note; ?></div>
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <div class="col-sm-12">
                                        <label class="control-label"><?php echo $entry_rating; ?></label>
                                        &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                                        <input type="radio" name="rating" value="1"/>
                                        &nbsp;
                                        <input type="radio" name="rating" value="2"/>
                                        &nbsp;
                                        <input type="radio" name="rating" value="3"/>
                                        &nbsp;
                                        <input type="radio" name="rating" value="4"/>
                                        &nbsp;
                                        <input type="radio" name="rating" value="5"/>
                                        &nbsp;<?php echo $entry_good; ?></div>
                                </div>
                                <br/>
                                <?php if (version_compare(VERSION, '2.0.2', '<')): ?>
                                    <div class="form-group required">
                                        <div class="col-sm-12">
                                            <label class="control-label"
                                                   for="input-captcha"><?php echo $entry_captcha; ?></label>
                                            <input type="text" name="captcha" value=""
                                                   id="input-captcha" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <img src="index.php?route=tool/captcha" alt="" id="captcha"/>
                                        </div>
                                    </div>
                                <?php elseif (version_compare(VERSION, '2.1', '<')): ?>
                                    <?php if ($site_key) { ?>
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                                            </div>
                                        </div>
                                    <?php } ?>
                                <?php else: ?>
                                    <?php echo $captcha; ?>
                                <?php endif; ?>
                                <div class="buttons">
                                    <div class="pull-right">
                                        <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary button"><?php echo $button_continue; ?></button>
                                    </div>
                                </div>
                            <?php } else { ?>
                                <?php echo $text_login; ?>
                            <?php } ?>
                        </form>
                    </div>




            <!--Начало элементов-->
            <?php if ($products1) { ?>
            <div class="box related-products1 related-products <?php echo $this->journal2->settings->get('related_products_carousel') ? 'journal-carousel' : ''; ?> <?php echo $this->journal2->settings->get('related_products_carousel') && $this->journal2->settings->get('related_products_carousel_arrows') === 'top' ? 'arrows-top' : ''; ?> <?php echo $this->journal2->settings->get('related_products_carousel') && $this->journal2->settings->get('related_products_carousel_bullets') ? 'bullets-on' : ''; ?>">
                <div>
                    <div class="box-heading">Элементы:</div>
                    <div class="box-product box-content">
                        <?php if ($this->journal2->settings->get('related_products_carousel')): ?>
                        <div class="swiper">
                            <div class="swiper-container" <?php echo $this->journal2->settings->get('rtl') ? 'dir="rtl"' : ''; ?>>
                                <div class="swiper-wrapper">
                                    <?php endif; ?>
                                    <?php foreach ($products1 as $product) { ?>
                                        <div class="product-grid-item swiper-slide <?php echo $this->journal2->settings->get('related_products_grid_classes'); ?> display-<?php echo $this->journal2->settings->get('product_grid_wishlist_icon_display'); ?> <?php echo $this->journal2->settings->get('product_grid_button_block_button'); ?>">
                                            <div class="product-thumb product-wrapper <?php echo isset($product['labels']) && is_array($product['labels']) && isset($product['labels']['outofstock']) ? 'outofstock' : ''; ?>">
                                                <div class="image <?php echo $this->journal2->settings->get('show_countdown', 'never') !== 'never' && isset($product['date_end']) && $product['date_end'] ? 'has-countdown' : ''; ?>">
                                                    <img class="first-image" src="<?php echo $product['thumb']; ?>"
                                                         title="<?php echo $product['name']; ?>"
                                                         alt="<?php echo $product['name']; ?>"/>
                                                </div>
                                                <div class="product-details">
                                                    <div class="caption">
                                                        <h4 class="name"><?php echo $product['name']; ?></h4>
                                                        <p class="description"><?php echo $product['description']; ?></p>
                                                        <?php if ($product['rating']) { ?>
                                                            <div class="rating">
                                                                <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                                    <?php if ($product['rating'] < $i) { ?>
                                                                        <span class="fa fa-stack"><i
                                                                                    class="fa fa-star-o fa-stack-2x"></i></span>
                                                                    <?php } else { ?>
                                                                        <span class="fa fa-stack"><i
                                                                                    class="fa fa-star fa-stack-2x"></i><i
                                                                                    class="fa fa-star-o fa-stack-2x"></i></span>
                                                                    <?php } ?>
                                                                <?php } ?>
                                                            </div>
                                                        <?php } ?>
                                                        <?php if ($product['price']) { ?>
                                                            <p class="price">
                                                                <?php if (!$product['special']) { ?>
                                                                    <?php if ($product['price'] > 0) { ?>
                                                                        <?php echo $product['price']; ?>
                                                                    <?php } else { ?>
                                                                        По запросу
                                                                    <?php } ?>
                                                                <?php } else { ?>
                                                                    <span class="price-old"><?php echo $product['price']; ?></span>
                                                                    <span class="price-new" <?php echo isset($product['date_end']) && $product['date_end'] ? "data-end-date='{$product['date_end']}'" : ""; ?>><?php echo $product['special']; ?></span>
                                                                <?php } ?>
                                                                <?php if ($product['tax']) { ?>
                                                                    <span class="price-tax"><?php echo $text_tax; ?><?php echo $product['tax']; ?></span>
                                                                <?php } ?>
                                                            </p>
                                                        <?php } ?>
                                                    </div>
                                                    <div class="button-group" style="display: none">
                                                        <?php if (Journal2Utils::isEnquiryProduct($this, $product)): ?>
                                                            <div class="cart enquiry-button">
                                                                <a href="javascript:Journal.openPopup('<?php echo $this->journal2->settings->get('enquiry_popup_code'); ?>', '<?php echo $product['product_id']; ?>');"
                                                                   data-clk="addToCart('<?php echo $product['product_id']; ?>');"
                                                                   class="button hint--top"
                                                                   data-hint="<?php echo $this->journal2->settings->get('enquiry_button_text'); ?>"><?php echo $this->journal2->settings->get('enquiry_button_icon') . '<span class="button-cart-text">' . $this->journal2->settings->get('enquiry_button_text') . '</span>'; ?></a>
                                                            </div>
                                                        <?php else: ?>

                                                            <div class="cart <?php echo isset($product['labels']) && is_array($product['labels']) && isset($product['labels']['outofstock']) ? 'outofstock' : ''; ?>">
                                                                <a onclick="addToCart('<?php echo $product['product_id']; ?>',document.getElementById('quantity_<?php echo $product['product_id']; ?>').value);"
                                                                   class="button hint--top"
                                                                   data-hint="<?php echo $button_cart; ?>"><i
                                                                            class="button-left-icon"></i><span
                                                                            class="button-cart-text"><?php echo $button_cart; ?></span><i
                                                                            class="button-right-icon"></i></a>
                                                            </div>
                                                        <?php endif; ?>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                            <?php if ($this->journal2->settings->get('related_products_carousel') && $this->journal2->settings->get('related_products_carousel_arrows') !== 'none'): ?>
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
                            <?php endif; ?>
                        </div>
                        <?php if ($this->journal2->settings->get('related_products_carousel') && $this->journal2->settings->get('related_products_carousel_bullets')): ?>
                            <div class="swiper-pagination"></div>
                        <?php endif; ?>
                    </div>
                    <?php /* enable countdown */ ?>
                    <?php if ($this->journal2->settings->get('show_countdown', 'never') !== 'never'): ?>
                        <script>
                            $('.related-products .product-grid-item > div').each(function () {
                                var $new = $(this).find('.price-new');
                                if ($new.length && $new.attr('data-end-date')) {
                                    $(this).find('.image').append('<div class="countdown"></div>');
                                }
                                Journal.countdown($(this).find('.countdown'), $new.attr('data-end-date'));
                            });
                        </script>
                    <?php endif; ?>
                    <?php if ($this->journal2->settings->get('related_products_carousel')): ?>
                        <?php
                        $grid = Journal2Utils::getItemGrid($this->journal2->settings->get('related_products_items_per_row'), $this->journal2->settings->get('site_width', 1024), $this->journal2->settings->get('config_columns_count'));
                        $grid = array(
                            array(0, (int)$grid['xs']),
                            array(470, (int)$grid['sm']),
                            array(760, (int)$grid['md']),
                            array(980, (int)$grid['lg']),
                            array(1100, (int)$grid['xl']),
                        );
                        ?>
                        <script>
                            (function () {
                                var grid = $.parseJSON('<?php echo json_encode($grid); ?>');

                                var breakpoints = {
                                    470: {
                                        slidesPerView: grid[0][1],
                                        slidesPerGroup: grid[0][1]
                                    },
                                    760: {
                                        slidesPerView: grid[1][1],
                                        slidesPerGroup: grid[1][1]
                                    },
                                    980: {
                                        slidesPerView: grid[2][1],
                                        slidesPerGroup: grid[2][1]
                                    },
                                    1220: {
                                        slidesPerView: grid[3][1],
                                        slidesPerGroup: grid[3][1]
                                    }
                                };

                                var opts = {
                                    slidesPerView: grid[4][1],
                                    slidesPerGroup: grid[4][1],
                                    breakpoints: breakpoints,
                                    spaceBetween: parseInt('<?php echo $this->journal2->settings->get('product_grid_item_spacing', '20'); ?>', 10),
                                    pagination: <?php echo $this->journal2->settings->get('related_products_carousel_bullets') ? '$(\'.related-products .swiper-pagination\')' : 'false'; ?>,
                                    paginationClickable: true,
                                    nextButton: <?php echo $this->journal2->settings->get('related_products_carousel_arrows') !== 'none' ? '$(\'.related-products .swiper-button-next\')' : 'false'; ?>,
                                    prevButton: <?php echo $this->journal2->settings->get('related_products_carousel_arrows') !== 'none' ? '$(\'.related-products .swiper-button-prev\')' : 'false'; ?>,
                                    autoplay: <?php echo $this->journal2->settings->get('related_products_carousel_autoplay') > 0 ? 4000 : 'false'; ?>,
                                    autoplayStopOnHover: <?php echo $this->journal2->settings->get('related_products_carousel_pause_on_hover') ? 'true' : 'false'; ?>,
                                    speed: 400,
                                    touchEventsTarget: <?php echo $this->journal2->settings->get('related_products_carousel_touchdrag') ? '\'container\'' : 'false'; ?>,
                                };

                                $('.related-products .swiper-container').swiper(opts);
                            })();
                        </script>
                    <?php endif; ?>
                    <?php } ?>
                    <!-- Конец элементов -->


                    <!--Начало комплектов-->
                    <?php if ($products3) { ?>
                    <div class="box related-products1 related-products <?php echo $this->journal2->settings->get('related_products_carousel') ? 'journal-carousel' : ''; ?> <?php echo $this->journal2->settings->get('related_products_carousel') && $this->journal2->settings->get('related_products_carousel_arrows') === 'top' ? 'arrows-top' : ''; ?> <?php echo $this->journal2->settings->get('related_products_carousel') && $this->journal2->settings->get('related_products_carousel_bullets') ? 'bullets-on' : ''; ?>">
                        <div>
                            <div class="box-heading">
                                Комплект <?php if ($products2) { ?>из коллекции: <?php foreach ($products2 as $product) { ?>
                                    <a
                                    href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a><?php } ?><?php } ?>
                            </div>
                            <div class="box-product box-content">
                                <?php if ($this->journal2->settings->get('related_products_carousel')): ?>
                                <div class="swiper">
                                    <div class="swiper-container" <?php echo $this->journal2->settings->get('rtl') ? 'dir="rtl"' : ''; ?>>
                                        <div class="swiper-wrapper">
                                            <?php endif; ?>
                                            <?php foreach ($products3 as $product) { ?>
                                                <div class="product-grid-item swiper-slide <?php echo $this->journal2->settings->get('related_products_grid_classes'); ?> display-<?php echo $this->journal2->settings->get('product_grid_wishlist_icon_display'); ?> <?php echo $this->journal2->settings->get('product_grid_button_block_button'); ?>">
                                                    <div class="product-thumb product-wrapper <?php echo isset($product['labels']) && is_array($product['labels']) && isset($product['labels']['outofstock']) ? 'outofstock' : ''; ?>">
                                                        <div class="image <?php echo $this->journal2->settings->get('show_countdown', 'never') !== 'never' && isset($product['date_end']) && $product['date_end'] ? 'has-countdown' : ''; ?>">
                                                            <a href="<?php echo $product['href']; ?>" <?php if (isset($product['thumb2']) && $product['thumb2']): ?> class="has-second-image" style="background: url('<?php echo $product['thumb2']; ?>') no-repeat;" <?php endif; ?>>
                                                                <img class="first-image"
                                                                     src="<?php echo $product['thumb']; ?>"
                                                                     title="<?php echo $product['name']; ?>"
                                                                     alt="<?php echo $product['name']; ?>"/>
                                                            </a>
                                                        </div>
                                                        <div class="product-details">
                                                            <div class="caption">
                                                                <h4 class="name"><?php echo $product['name']; ?></h4>
                                                                <p class="description"><?php echo $product['description']; ?></p>
                                                                <?php if ($product['rating']) { ?>
                                                                    <div class="rating">
                                                                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                                            <?php if ($product['rating'] < $i) { ?>
                                                                                <span class="fa fa-stack"><i
                                                                                            class="fa fa-star-o fa-stack-2x"></i></span>
                                                                            <?php } else { ?>
                                                                                <span class="fa fa-stack"><i
                                                                                            class="fa fa-star fa-stack-2x"></i><i
                                                                                            class="fa fa-star-o fa-stack-2x"></i></span>
                                                                            <?php } ?>
                                                                        <?php } ?>
                                                                    </div>
                                                                <?php } ?>
                                                                <?php if ($product['price']) { ?>
                                                                    <p class="price">
                                                                        <?php if (!$product['special']) { ?>
                                                                            <?php if ($product['price'] > 0) { ?>
                                                                                <?php echo $product['price']; ?>
                                                                            <?php } else { ?>
                                                                                По запросу
                                                                            <?php } ?>
                                                                        <?php } else { ?>
                                                                            <span class="price-old"><?php echo $product['price']; ?></span>
                                                                            <span class="price-new" <?php echo isset($product['date_end']) && $product['date_end'] ? "data-end-date='{$product['date_end']}'" : ""; ?>><?php echo $product['special']; ?></span>
                                                                        <?php } ?>
                                                                        <?php if ($product['tax']) { ?>
                                                                            <span class="price-tax"><?php echo $text_tax; ?><?php echo $product['tax']; ?></span>
                                                                        <?php } ?>
                                                                    </p>
                                                                <?php } ?>
                                                            </div>
                                                            <div class="button-group" style="display: none">
                                                                <?php if (Journal2Utils::isEnquiryProduct($this, $product)): ?>
                                                                    <div class="cart enquiry-button">
                                                                        <a href="javascript:Journal.openPopup('<?php echo $this->journal2->settings->get('enquiry_popup_code'); ?>', '<?php echo $product['product_id']; ?>');"
                                                                           data-clk="addToCart('<?php echo $product['product_id']; ?>');"
                                                                           class="button hint--top"
                                                                           data-hint="<?php echo $this->journal2->settings->get('enquiry_button_text'); ?>"><?php echo $this->journal2->settings->get('enquiry_button_icon') . '<span class="button-cart-text">' . $this->journal2->settings->get('enquiry_button_text') . '</span>'; ?></a>
                                                                    </div>
                                                                <?php else: ?>

                                                                    <div class="cart <?php echo isset($product['labels']) && is_array($product['labels']) && isset($product['labels']['outofstock']) ? 'outofstock' : ''; ?>">
                                                                        <a onclick="addToCart('<?php echo $product['product_id']; ?>',document.getElementById('quantity_<?php echo $product['product_id']; ?>').value);"
                                                                           class="button hint--top"
                                                                           data-hint="<?php echo $button_cart; ?>"><i
                                                                                    class="button-left-icon"></i><span
                                                                                    class="button-cart-text"><?php echo $button_cart; ?></span><i
                                                                                    class="button-right-icon"></i></a>
                                                                    </div>
                                                                <?php endif; ?>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <?php if ($this->journal2->settings->get('related_products_carousel') && $this->journal2->settings->get('related_products_carousel_arrows') !== 'none'): ?>
                                        <div class="swiper-button-next"></div>
                                        <div class="swiper-button-prev"></div>
                                    <?php endif; ?>
                                </div>
                                <?php if ($this->journal2->settings->get('related_products_carousel') && $this->journal2->settings->get('related_products_carousel_bullets')): ?>
                                    <div class="swiper-pagination"></div>
                                <?php endif; ?>
                            </div>
                            <?php /* enable countdown */ ?>
                            <?php if ($this->journal2->settings->get('show_countdown', 'never') !== 'never'): ?>
                                <script>
                                    $('.related-products .product-grid-item > div').each(function () {
                                        var $new = $(this).find('.price-new');
                                        if ($new.length && $new.attr('data-end-date')) {
                                            $(this).find('.image').append('<div class="countdown"></div>');
                                        }
                                        Journal.countdown($(this).find('.countdown'), $new.attr('data-end-date'));
                                    });
                                </script>
                            <?php endif; ?>
                            <?php if ($this->journal2->settings->get('related_products_carousel')): ?>
                                <?php
                                $grid = Journal2Utils::getItemGrid($this->journal2->settings->get('related_products_items_per_row'), $this->journal2->settings->get('site_width', 1024), $this->journal2->settings->get('config_columns_count'));
                                $grid = array(
                                    array(0, (int)$grid['xs']),
                                    array(470, (int)$grid['sm']),
                                    array(760, (int)$grid['md']),
                                    array(980, (int)$grid['lg']),
                                    array(1100, (int)$grid['xl']),
                                );
                                ?>
                                <script>
                                    (function () {
                                        var grid = $.parseJSON('<?php echo json_encode($grid); ?>');

                                        var breakpoints = {
                                            470: {
                                                slidesPerView: grid[0][1],
                                                slidesPerGroup: grid[0][1]
                                            },
                                            760: {
                                                slidesPerView: grid[1][1],
                                                slidesPerGroup: grid[1][1]
                                            },
                                            980: {
                                                slidesPerView: grid[2][1],
                                                slidesPerGroup: grid[2][1]
                                            },
                                            1220: {
                                                slidesPerView: grid[3][1],
                                                slidesPerGroup: grid[3][1]
                                            }
                                        };

                                        var opts = {
                                            slidesPerView: grid[4][1],
                                            slidesPerGroup: grid[4][1],
                                            breakpoints: breakpoints,
                                            spaceBetween: parseInt('<?php echo $this->journal2->settings->get('product_grid_item_spacing', '20'); ?>', 10),
                                            pagination: <?php echo $this->journal2->settings->get('related_products_carousel_bullets') ? '$(\'.related-products .swiper-pagination\')' : 'false'; ?>,
                                            paginationClickable: true,
                                            nextButton: <?php echo $this->journal2->settings->get('related_products_carousel_arrows') !== 'none' ? '$(\'.related-products .swiper-button-next\')' : 'false'; ?>,
                                            prevButton: <?php echo $this->journal2->settings->get('related_products_carousel_arrows') !== 'none' ? '$(\'.related-products .swiper-button-prev\')' : 'false'; ?>,
                                            autoplay: <?php echo $this->journal2->settings->get('related_products_carousel_autoplay') > 0 ? 4000 : 'false'; ?>,
                                            autoplayStopOnHover: <?php echo $this->journal2->settings->get('related_products_carousel_pause_on_hover') ? 'true' : 'false'; ?>,
                                            speed: 400,
                                            touchEventsTarget: <?php echo $this->journal2->settings->get('related_products_carousel_touchdrag') ? '\'container\'' : 'false'; ?>,
                                        };

                                        $('.related-products .swiper-container').swiper(opts);
                                    })();
                                </script>
                            <?php endif; ?>
                            <?php } ?>
                            <!-- Конец комплектов -->

                            <?php if ($products && $this->journal2->settings->get('related_products_status')) { ?>
                                <div class="box related-products <?php echo $this->journal2->settings->get('related_products_carousel') ? 'journal-carousel' : ''; ?> <?php echo $this->journal2->settings->get('related_products_carousel') && $this->journal2->settings->get('related_products_carousel_arrows') === 'top' ? 'arrows-top' : ''; ?> <?php echo $this->journal2->settings->get('related_products_carousel') && $this->journal2->settings->get('related_products_carousel_bullets') ? 'bullets-on' : ''; ?>">
                                    <div>
                                        <div class="box-heading">Сопутствующий товар</div>
                                        <div class="box-product box-content">
                                            <?php if ($this->journal2->settings->get('related_products_carousel')): ?>
                                            <div class="swiper">
                                                <div class="swiper-container" <?php echo $this->journal2->settings->get('rtl') ? 'dir="rtl"' : ''; ?>>
                                                    <div class="swiper-wrapper">
                                                        <?php endif; ?>
                                                        <?php foreach ($products as $product) { ?>
                                                            <div class="product-grid-item swiper-slide <?php echo $this->journal2->settings->get('related_products_grid_classes'); ?> display-<?php echo $this->journal2->settings->get('product_grid_wishlist_icon_display'); ?> <?php echo $this->journal2->settings->get('product_grid_button_block_button'); ?>">
                                                                <div class="product-thumb product-wrapper <?php echo isset($product['labels']) && is_array($product['labels']) && isset($product['labels']['outofstock']) ? 'outofstock' : ''; ?>">
                                                                    <div class="image <?php echo $this->journal2->settings->get('show_countdown', 'never') !== 'never' && isset($product['date_end']) && $product['date_end'] ? 'has-countdown' : ''; ?>">
                                                                        <a href="<?php echo $product['href']; ?>" <?php if (isset($product['thumb2']) && $product['thumb2']): ?> class="has-second-image" style="background: url('<?php echo $product['thumb2']; ?>') no-repeat;" <?php endif; ?>>
                                                                            <img class="first-image"
                                                                                 src="<?php echo $product['thumb']; ?>"
                                                                                 title="<?php echo $product['name']; ?>"
                                                                                 alt="<?php echo $product['name']; ?>"/>
                                                                        </a>
                                                                        <?php if (isset($product['labels']) && is_array($product['labels'])): ?>
                                                                            <?php foreach ($product['labels'] as $label => $name): ?>
                                                                                <span class="label-<?php echo $label; ?>"><b><?php echo $name; ?></b></span>
                                                                            <?php endforeach; ?>
                                                                        <?php endif; ?>
                                                                        <?php if ($this->journal2->settings->get('product_grid_wishlist_icon_position') === 'image' && $this->journal2->settings->get('product_grid_wishlist_icon_display', '') === 'icon'): ?>
                                                                            <div class="wishlist">
                                                                                <a id="wish-related-<?php echo $product['product_id']; ?>"
                                                                                   onclick="addToWishList('<?php echo $product['product_id']; ?>'); clicked(id);"
                                                                                   class="hint--top"
                                                                                   data-hint="<?php echo $button_wishlist; ?>"><i
                                                                                            class="wishlist-icon"></i><span
                                                                                            class="button-wishlist-text"><?php echo $button_wishlist; ?></span></a>
                                                                            </div>
                                                                            <div class="compare">
                                                                                <a id="comp-related-<?php echo $product['product_id']; ?>"
                                                                                   onclick="addToCompare('<?php echo $product['product_id']; ?>'); clicked(id);"
                                                                                   class="hint--top"
                                                                                   data-hint="<?php echo $button_compare; ?>"><i
                                                                                            class="compare-icon"></i><span
                                                                                            class="button-compare-text"><?php echo $button_compare; ?></span></a>
                                                                            </div>
                                                                        <?php endif; ?>
                                                                    </div>
                                                                    <div class="product-details">
                                                                        <div class="caption">
                                                                            <h4 class="name"><a
                                                                                        href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                                                            </h4>
                                                                            <p class="description"><?php echo $product['description']; ?></p>
                                                                            <?php if ($product['rating']) { ?>
                                                                                <div class="rating">
                                                                                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                                                        <?php if ($product['rating'] < $i) { ?>
                                                                                            <span class="fa fa-stack"><i
                                                                                                        class="fa fa-star-o fa-stack-2x"></i></span>
                                                                                        <?php } else { ?>
                                                                                            <span class="fa fa-stack"><i
                                                                                                        class="fa fa-star fa-stack-2x"></i><i
                                                                                                        class="fa fa-star-o fa-stack-2x"></i></span>
                                                                                        <?php } ?>
                                                                                    <?php } ?>
                                                                                </div>
                                                                            <?php } ?>
                                                                            <?php if ($product['price']) { ?>
                                                                                <p class="price">
                                                                                    <?php if (!$product['special']) { ?>
                                                                                        <?php echo $product['price']; ?>
                                                                                    <?php } else { ?>
                                                                                        <span class="price-old"><?php echo $product['price']; ?></span>
                                                                                        <span class="price-new" <?php echo isset($product['date_end']) && $product['date_end'] ? "data-end-date='{$product['date_end']}'" : ""; ?>><?php echo $product['special']; ?></span>
                                                                                    <?php } ?>
                                                                                    <?php if ($product['tax']) { ?>
                                                                                        <span class="price-tax"><?php echo $text_tax; ?><?php echo $product['tax']; ?></span>
                                                                                    <?php } ?>
                                                                                </p>
                                                                            <?php } ?>
                                                                        </div>
                                                                        <div class="button-group">
                                                                            <?php if (Journal2Utils::isEnquiryProduct($this, $product)): ?>
                                                                                <div class="cart enquiry-button">
                                                                                    <a href="javascript:Journal.openPopup('<?php echo $this->journal2->settings->get('enquiry_popup_code'); ?>', '<?php echo $product['product_id']; ?>');"
                                                                                       data-clk="addToCart('<?php echo $product['product_id']; ?>');"
                                                                                       class="button hint--top"
                                                                                       data-hint="<?php echo $this->journal2->settings->get('enquiry_button_text'); ?>"><?php echo $this->journal2->settings->get('enquiry_button_icon') . '<span class="button-cart-text">' . $this->journal2->settings->get('enquiry_button_text') . '</span>'; ?></a>
                                                                                </div>
                                                                            <?php else: ?>
                                                                                <div class="cart <?php echo isset($product['labels']) && is_array($product['labels']) && isset($product['labels']['outofstock']) ? 'outofstock' : ''; ?>">
                                                                                    <a onclick="addToCart('<?php echo $product['product_id']; ?>');"
                                                                                       class="button hint--top"
                                                                                       data-hint="<?php echo $button_cart; ?>"><i
                                                                                                class="button-left-icon"></i><span
                                                                                                class="button-cart-text"><?php echo $button_cart; ?></span><i
                                                                                                class="button-right-icon"></i></a>
                                                                                </div>
                                                                            <?php endif; ?>
                                                                            <div class="wishlist"><a
                                                                                        onclick="addToWishList('<?php echo $product['product_id']; ?>');"
                                                                                        class="hint--top"
                                                                                        data-hint="<?php echo $button_wishlist; ?>"><i
                                                                                            class="wishlist-icon"></i><span
                                                                                            class="button-wishlist-text"><?php echo $button_wishlist; ?></span></a>
                                                                            </div>
                                                                            <div class="compare"><a
                                                                                        onclick="addToCompare('<?php echo $product['product_id']; ?>');"
                                                                                        class="hint--top"
                                                                                        data-hint="<?php echo $button_compare; ?>"><i
                                                                                            class="compare-icon"></i><span
                                                                                            class="button-compare-text"><?php echo $button_compare; ?></span></a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                                <?php if ($this->journal2->settings->get('related_products_carousel') && $this->journal2->settings->get('related_products_carousel_arrows') !== 'none'): ?>
                                                    <div class="swiper-button-next"></div>
                                                    <div class="swiper-button-prev"></div>
                                                <?php endif; ?>
                                            </div>
                                            <?php if ($this->journal2->settings->get('related_products_carousel') && $this->journal2->settings->get('related_products_carousel_bullets')): ?>
                                                <div class="swiper-pagination"></div>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                </div>
                            <?php /* enable countdown */ ?>
                            <?php if ($this->journal2->settings->get('show_countdown', 'never') !== 'never'): ?>
                                <script>
                                    $('.related-products .product-grid-item > div').each(function () {
                                        var $new = $(this).find('.price-new');
                                        if ($new.length && $new.attr('data-end-date')) {
                                            $(this).find('.image').append('<div class="countdown"></div>');
                                        }
                                        Journal.countdown($(this).find('.countdown'), $new.attr('data-end-date'));
                                    });
                                </script>
                            <?php endif; ?>
                            <?php if ($this->journal2->settings->get('related_products_carousel')): ?>
                            <?php
                            $grid = Journal2Utils::getItemGrid($this->journal2->settings->get('related_products_items_per_row'), $this->journal2->settings->get('site_width', 1024), $this->journal2->settings->get('config_columns_count'));
                            $grid = array(
                                array(0, (int)$grid['xs']),
                                array(470, (int)$grid['sm']),
                                array(760, (int)$grid['md']),
                                array(980, (int)$grid['lg']),
                                array(1100, (int)$grid['xl']),
                            );
                            ?>
                                <script>
                                    (function () {
                                        var grid = $.parseJSON('<?php echo json_encode($grid); ?>');

                                        var breakpoints = {
                                            470: {
                                                slidesPerView: grid[0][1],
                                                slidesPerGroup: grid[0][1]
                                            },
                                            760: {
                                                slidesPerView: grid[1][1],
                                                slidesPerGroup: grid[1][1]
                                            },
                                            980: {
                                                slidesPerView: grid[2][1],
                                                slidesPerGroup: grid[2][1]
                                            },
                                            1220: {
                                                slidesPerView: grid[3][1],
                                                slidesPerGroup: grid[3][1]
                                            }
                                        };

                                        var opts = {
                                            slidesPerView: grid[4][1],
                                            slidesPerGroup: grid[4][1],
                                            breakpoints: breakpoints,
                                            spaceBetween: parseInt('<?php echo $this->journal2->settings->get('product_grid_item_spacing', '20'); ?>', 10),
                                            pagination: <?php echo $this->journal2->settings->get('related_products_carousel_bullets') ? '$(\'.related-products .swiper-pagination\')' : 'false'; ?>,
                                            paginationClickable: true,
                                            nextButton: <?php echo $this->journal2->settings->get('related_products_carousel_arrows') !== 'none' ? '$(\'.related-products .swiper-button-next\')' : 'false'; ?>,
                                            prevButton: <?php echo $this->journal2->settings->get('related_products_carousel_arrows') !== 'none' ? '$(\'.related-products .swiper-button-prev\')' : 'false'; ?>,
                                            autoplay: <?php echo $this->journal2->settings->get('related_products_carousel_autoplay') > 0 ? 4000 : 'false'; ?>,
                                            autoplayStopOnHover: <?php echo $this->journal2->settings->get('related_products_carousel_pause_on_hover') ? 'true' : 'false'; ?>,
                                            speed: 400,
                                            touchEventsTarget: <?php echo $this->journal2->settings->get('related_products_carousel_touchdrag') ? '\'container\'' : 'false'; ?>,
                                        };

                                        $('.related-products .swiper-container').swiper(opts);
                                    })();
                                </script>
                            <?php endif; ?>
                            <?php } ?>
                            <?php echo $content_bottom; ?></div>
                    </div>
                </div>
                <script type="text/javascript"><!--
                    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
                        $.ajax({
                            url: 'index.php?route=product/product/getRecurringDescription',
                            type: 'post',
                            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
                            dataType: 'json',
                            beforeSend: function () {
                                $('#recurring-description').html('');
                            },
                            success: function (json) {
                                $('.alert, .text-danger').remove();

                                if (json['success']) {
                                    $('#recurring-description').html(json['success']);
                                }
                            }
                        });
                    });
                    //--></script>
                <script type="text/javascript"><!--
                    $('#button-cart').on('click', function () {
                        $.ajax({
                            url: 'index.php?route=checkout/cart/add',
                            type: 'post',
                            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
                            dataType: 'json',
                            beforeSend: function () {
                                $('#button-cart').button('loading');
                            },
                            complete: function () {
                                $('#button-cart').button('reset');
                            },
                            success: function (json) {
                                $('.alert, .text-danger').remove();
                                $('.form-group').removeClass('has-error');

                                if (json['error']) {
                                    if (json['error']['option']) {
                                        for (i in json['error']['option']) {
                                            var element = $('#input-option' + i.replace('_', '-'));

                                            if (element.parent().hasClass('input-group')) {
                                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                                            } else {
                                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                                            }
                                        }
                                    }

                                    if (json['error']['recurring']) {
                                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                                    }

                                    // Highlight any found errors
                                    $('.text-danger').parent().addClass('has-error');
                                }

                                if (json['success']) {
                                    if (!Journal.showNotification(json['success'], json['image'], true)) {
                                        $('.breadcrumb').after('<div class="alert alert-success success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                                    }

                                    $('#cart-total').html(json['total']);

                                    if (Journal.scrollToTop) {
                                        $('html, body').animate({scrollTop: 0}, 'slow');
                                    }

                                    $('#cart ul').load('index.php?route=common/cart/info ul li');
                                }
                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                            }
                        });
                    });
                    //--></script>
                <script type="text/javascript"><!--
                    $('.date').datetimepicker({
                        pickTime: false
                    });

                    $('.datetime').datetimepicker({
                        pickDate: true,
                        pickTime: true
                    });

                    $('.time').datetimepicker({
                        pickDate: false
                    });

                    $('button[id^=\'button-upload\']').on('click', function () {
                        var node = this;

                        $('#form-upload').remove();

                        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

                        $('#form-upload input[name=\'file\']').trigger('click');

                        timer = setInterval(function () {
                            if ($('#form-upload input[name=\'file\']').val() != '') {
                                clearInterval(timer);

                                $.ajax({
                                    url: 'index.php?route=tool/upload',
                                    type: 'post',
                                    dataType: 'json',
                                    data: new FormData($('#form-upload')[0]),
                                    cache: false,
                                    contentType: false,
                                    processData: false,
                                    beforeSend: function () {
                                        $(node).button('loading');
                                    },
                                    complete: function () {
                                        $(node).button('reset');
                                    },
                                    success: function (json) {
                                        $('.text-danger').remove();

                                        if (json['error']) {
                                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                                        }

                                        if (json['success']) {
                                            alert(json['success']);

                                            $(node).parent().find('input').attr('value', json['code']);
                                        }
                                    },
                                    error: function (xhr, ajaxOptions, thrownError) {
                                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                    }
                                });
                            }
                        }, 500);
                    });
                    //--></script>
                <script type="text/javascript"><!--
                    $('#review').delegate('.pagination a', 'click', function (e) {
                        e.preventDefault();

                        $('#review').fadeOut('slow');

                        $('#review').load(this.href);

                        $('#review').fadeIn('slow');
                    });

                    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

                    $('#button-review').on('click', function () {
                        $.ajax({
                            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
                            type: 'post',
                            dataType: 'json',
                            <?php if (version_compare(VERSION, '2.0.2', '<')): ?>
                            data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
                            <?php else: ?>
                            data: $("#form-review").serialize(),
                            <?php endif; ?>
                            beforeSend: function () {
                                $('#button-review').button('loading');
                            },
                            complete: function () {
                                $('#button-review').button('reset');
                                <?php if (version_compare(VERSION, '2.0.2', '<')): ?>
                                $('#captcha').attr('src', 'index.php?route=tool/captcha#' + new Date().getTime());
                                $('input[name=\'captcha\']').val('');
                                <?php endif; ?>
                            },
                            success: function (json) {
                                $('.alert-success, .alert-danger').remove();

                                if (json['error']) {
                                    $('#review').after('<div class="alert alert-danger warning"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                                }

                                if (json['success']) {
                                    $('#review').after('<div class="alert alert-success success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                                    $('input[name=\'name\']').val('');
                                    $('textarea[name=\'text\']').val('');
                                    $('input[name=\'rating\']:checked').prop('checked', false);
                                    <?php if (version_compare(VERSION, '2.0.2', '<')): ?>
                                    $('input[name=\'captcha\']').val('');
                                    <?php endif; ?>
                                }
                            }
                        });
                    });

                    $(document).ready(function () {
                        $('.thumbnails').magnificPopup({
                            type: 'image',
                            delegate: 'a',
                            gallery: {
                                enabled: true
                            }
                        });
                    });
                    //--></script>
                <?php /*
                if ($device === 'phone') {
                    echo "<script type=\"text/javascript\">
                          $('#accordion-product-tab').appendTo('.product-info');
                      </script>";
                }
                 */ ?>
                <script>
                    $(document).ready(function () {
                        // Добавить иконку поворота при раскрытии акордеона
                        $(".collapse.in").each(function () {
                            $(this).siblings(".panel-heading").find(".fa-chevron-right").addClass("fa-rotate-90");
                        });

                        // Toggle plus minus icon on show hide of collapse element
                        $(".collapse").on('show.bs.collapse', function () {
                            $(this).parent().find(".fa-chevron-right").addClass("fa-rotate-90");
                        }).on('hide.bs.collapse', function () {
                            $(this).parent().find(".fa-chevron-right").removeClass("fa-rotate-90");
                        });
                    });
                </script>
                <!-- Скрипт + - для цены  -->
                <script>
                    /* quantity buttons */
                    var $input = $('.cart input[name="quantity"]');
                    function up() {
                        var val = parseInt($input.val(), 10) + 1 || parseInt($input.attr('data-min-value'), 10);
                        $input.val(val);
                    }
                    function down() {
                        var val = parseInt($input.val(), 10) - 1 || 0;
                        var min = parseInt($input.attr('data-min-value'), 10) || 1;
                        $input.val(Math.max(val, min));
                    }
                    $('<a href="javascript:;" class="journal-stepper">-</a>').insertBefore($input).click(down);
                    $('<a href="javascript:;" class="journal-stepper">+</a>').insertAfter($input).click(up);
                    $input.keydown(function (e) {
                        if (e.which === 38) {
                            up();
                            return false;
                        }
                        if (e.which === 40) {
                            down();
                            return false;
                        }
                    });
                </script>
                <!-- Добавить - удалить класс по клику (свернуть-разврнуть дескрипшен -->
                <script type="text/javascript">
                    $(function () {
                        $('.button_description_1').click(function () {
                            $('#tab-description, .button_description_2, .button_description_1').toggleClass('svernuto');
                        });
                        $('.button_description_2').click(function () {
                            $('#tab-description, .button_description_1, .button_description_2').toggleClass('svernuto');
                        });
                    });
                </script>
                <script>
                    /*
                     Хак позиционирования блока с картинками опций
                     */
                    $(function () {
                        $(".xl-49.option.form-group.required.option-radio").click(function () {
                            //Вычисляем ширину рабочей области
                            var w = window.innerWidth;
                            if (w >= 982) {
                                //Обарачиваем весь костыль еще в 1 костыль (если уже расчитано не расчитываем)
                                if ($(this).hasClass("calculated") == false) {
                                    //Гетаем позицию
                                    function getPosition(element) {
                                        //Гетаем позицию правой граници левого блока
                                        var leftb = $("#getPosition")[0].getBoundingClientRect();
                                        //Гетаем позицию виновника торжества (селектор опции)
                                        var optionb = $(element).children("div").children("div.open")[0].getBoundingClientRect();
                                        //Заносим правый офсет левого блока в переменную
                                        var posLeft = leftb.right;
                                        //Заносим левый офсет виновника
                                        var posOption = optionb.left;
                                        //Смотрим в консоль
                                        console.log("Отступ справа: " + posLeft);
                                        console.log("Отступ слева: " + posOption);
                                        //Вычисляем позицию с разницей относительно левого блока + добавляем паддинг в 20 пикселей
                                        var result = posLeft - posOption + 20;
                                        console.log("Результат вычислений: " + result);
                                        //Двигаем виновника но нужную позицию
                                        $(element).children("div").children("div.open").css({
                                            "left": result,
                                        });
                                    }

                                    //Костыль для костыля) Выполняем расчет после отработки функции дисплея дропдауна
                                    elem = $(this);
                                    setTimeout(getPosition, 0, elem);
                                    //Добавляем к расчитанному блоку класс (поможет не расчитывать скрытый блок, офсет которого будет = 0) костыль, а что делать)
                                    $(this).addClass("calculated");
                                }
                            }
                            //if(w < 982 && w > 361){
                            if (w < 982) {
                                //Обарачиваем весь костыль еще в 1 костыль (если уже расчитано не расчитываем)
                                if ($(this).hasClass("calculated") == false) {
                                    //Гетаем позицию
                                    function getPosition(element) {
                                        //Гетаем позицию правой граници контентного блока
                                        var leftb = $("#content")[0].getBoundingClientRect();
                                        //Гетаем позицию виновника торжества (селектор опции)
                                        var optionb = $(element).children("div").children("div.open")[0].getBoundingClientRect();
                                        //Заносим правый офсет левого блока в переменную
                                        var posLeft = leftb.left;
                                        //Заносим левый офсет виновника
                                        var posOption = optionb.left;
                                        //Смотрим в консоль
                                        console.log("Отступ справа m: " + posLeft);
                                        console.log("Отступ слева m: " + posOption);
                                        //Вычисляем позицию с разницей относительно левого блока + добавляем паддинг в 0 пикселей
                                        var result = posLeft - posOption + 0;
                                        console.log("Результат вычислений m: " + result);
                                        //Двигаем виновника но нужную позицию
                                        $(element).children("div").children("div.open").css({
                                            "left": result,
                                        });
                                    }

                                    //Костыль для костыля) Выполняем расчет после отработки функции дисплея дропдауна
                                    elem = $(this);
                                    setTimeout(getPosition, 0, elem);
                                    //Добавляем к расчитанному блоку класс (поможет не расчитывать скрытый блок, офсет которого будет = 0) костыль, а что делать)
                                    $(this).addClass("calculated");
                                }
                            }
                        });
                    });
                </script>

                <?php include_once 'custom/block/modal-form.php' ?>
                <?php echo $footer; ?>
