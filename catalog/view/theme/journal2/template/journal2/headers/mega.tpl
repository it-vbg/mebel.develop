<?php $device = Journal2Utils::getDevice(); ?>
<header class="journal-header-center journal-header-mega">
    <div class="header">
    <div class="journal-top-header j-min z-1"></div>
    <div class="journal-menu-bg z-0"> </div>
    <div class="journal-center-bg j-100 z-0"> </div>

    <div id="header" class="journal-header z-2">

        <div class="header-assets top-bar">
            <div class="journal-links j-min xs-100 sm-100 md-50 lg-50 xl-50">
                <div class="links j-min">
                    <ul class="top-menu">
                    <?php echo $this->journal2->settings->get('config_primary_menu'); ?>
                    </ul>
                </div>
            </div>

            <?php if ($language): ?>
            <div class="journal-language j-min">
                <?php echo $language; ?>
            </div>
            <?php endif; ?>

            <?php if ($currency): ?>
            <div class="journal-currency j-min">
                <?php echo $currency; ?>
            </div>
            <?php endif; ?>

            <div class="journal-secondary j-min xs-100 sm-100 md-50 lg-50 xl-50">
                <div class="links j-min">
                    <ul class="top-menu">
                    <?php echo $this->journal2->settings->get('config_secondary_menu'); ?>
                    </ul>
                </div>
            </div>
        </div>

        <div class="header-assets">
            <div class="journal-logo j-100 xs-40 sm-45 md-20 lg-20 xl-20">
                <?php if ($logo) { ?>
                    <div id="logo">
                        <a href="<?php echo str_replace('index.php?route=common/home', '', $home); ?>">
                            <?php echo Journal2Utils::getLogo($this->config); ?>
                        </a>
                    </div>
                <?php } ?>
            </div>
            <div class="journal-search j-min xs-45 sm-50 md-30 lg-30 xl-30">
                <?php if (version_compare(VERSION, '2', '>=')): ?>
                    <?php echo $search; ?>
                <?php else: ?>
                    <div id="search" class="j-min">
                        <div class="button-search j-min"><i></i></div>
                        <?php if (isset($filter_name)): /* v1541 compatibility */ ?>
                            <?php if ($filter_name) { ?>
                                <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" autocomplete="off" />
                            <?php } else { ?>
                                <input type="text" name="filter_name" value="<?php echo $text_search; ?>" autocomplete="off" onclick="this.value = '';" onkeydown="this.style.color = '#000000';" />
                            <?php } ?>
                        <?php else: ?>
                            <input type="text" name="search" placeholder="<?php echo $this->journal2->settings->get('search_placeholder_text'); ?>" value="<?php echo $search; ?>" autocomplete="off" />
                        <?php endif; /* end v1541 compatibility */ ?>
                    </div>
                <?php endif; ?>
            </div>

            <?php if ($device === 'phone'){ ?>
                <a href="/login"><i class="fa fa-sign-in" aria-hidden="true"></i></a>
                <div class="header-contact xs-50 sm-50">
                    <a class="header-contact-zvonok" href="tel:88043330885">8 (804) 333 08 85</a>
                    <span class="header-contact-text">По России бесплатно!</span>
                </div>
            <?php } else { ?>
                <div class="header-contact xs-50 sm-50 md-25 lg-25 xl-25 hidden-760">
                    <div class="header-contact-inf">
                        <span class="header-contact-text">По России - бесплатно:</span>
                        <a href="tel:88043330885"><span class="header-contact-phone">8 (804) 333-08-85</span></a>
                        <span class="header-contact-text">В СПб:</span> <span class="ya-phone"><a href="tel:+78129217880">+7 (812) 921-78-80</a></span><br>
                    </div>
                </div>
            <?php } ?>
            <div class="journal-cart j-min xs-100 sm-100 md-25 lg-25 xl-25">
                <?php echo $cart; ?>
            </div>
        </div>

        <div class="journal-menu j-min xs-100 sm-100 md-100 lg-100 xl-100">
            <?php echo $this->journal2->settings->get('config_mega_menu'); ?>
        </div>
    </div>
    </div>
</header>