<script type="text/javascript"><!--
	// 2017/10/04 // 2017/06/08 // ... // 2016/12/14

	var poip_product_custom = function(){
		poip_product_default.call(this);
	}
	poip_product_custom.prototype = Object.create(poip_product_default.prototype);
	poip_product_custom.prototype.constructor = poip_product_custom;
	
	poip_product_custom.prototype.custom_init = function(){

	}
	
	// << ITS OWN FUNCTIONS
	// >> ITS OWN FUNCTIONS
	
	// << ADDITIONAL FUNCTIONS
	// without replacing or stopping original script execution, just addition
	
	poip_product_custom.prototype.additional_makeInitActions = function() {
		var this_object = this;
		
		if ( $('div.option').find('input:radio').length && $('div.option').find('li[data-value]').length ) {
			$('div.option').find('li[data-value]').click(function(){
				$(this).parents('div.option').find('input:radio[value='+$(this).attr('data-value')+']').change();
			});
		}
		if ( $('div.option').find('select').length && $('div.option').find('li[data-value]').length ) {
			$('div.option').find('li[data-value]').click(function(){
				$(this).parents('div.option').find('select').change();
			});
		}
		
	}
	
	poip_product_custom.prototype.additional_useOldOCStyleInit = function() {
		return true;
	}
	
	// >> ADDITIONAL FUNCTIONS 
	
	// << REPLACING FUNCTIONS
	// to be called from standard function, to work instead of standard algorithm (prefixes replace_ and if_)

	
	poip_product_custom.prototype.replace_setVisibleImages = function(images, counter) {
		var this_object = this;
		
		clearTimeout(this_object.set_visible_images_timer_id);
		if (!counter) counter = 1;
		if (counter == 100) {
			this_object.set_visible_images_timer_id = false;
			return;
		}
		
		var block_gallery = $("#product-gallery");
	
		// first time - copy all images to hidden element
		if ( !$('#poip_images').length ) {
			block_gallery.parent().after("<div style='display:none!important' id='poip_images'></div>");
			this_object.getAdditionalImagesBlock().find('a').each( function(){
				$('#poip_images').append( this_object.getElementOuterHTML($(this)) );
			});
		}
		// for popup gallery
		var popup_gallery_selector = '.product-info .image-gallery';
		var popup_gallery = $(popup_gallery_selector);
		if ( !$('#poip_popup_images').length && popup_gallery.length ) {
			popup_gallery.before("<div style='display:none!important' id='poip_popup_images'></div>");
			popup_gallery.find('a').each( function(){
				$('#poip_popup_images').append( this_object.getElementOuterHTML($(this)) );
			});
		}
		
		if ( block_gallery.find('.swiper').length ) { // new slider, found in Journal2 2.8.3 
		
			var carousel_selector = '#product-gallery .swiper-container';
			var carousel_elem = $(carousel_selector);
			
			if ( carousel_elem.length ) {
				
				if ( this_object.set_visible_images_first_call ) {
					if ( document.readyState != "complete" || !carousel_elem.find('.swiper-wrapper').length || typeof(carousel_elem[0]['swiper']) == 'undefined' ) {
						this_object.set_visible_images_timer_id = setTimeout(function(){ this_object.replace_setVisibleImages(images, counter+1); }, 100);
						return;
					}
					this_object.set_visible_images_first_call = false;
				} else {
					var current_imgs = [];
					carousel_elem.find('a').each( function(){
						current_imgs.push($(this).attr('href'));
					});

					if ( current_imgs.toString() == images.toString() ) {
						this_object.set_visible_images_timer_id = false;
						return; // nothing to change
					}
				}
				
				var carousel_instance = carousel_elem[0]['swiper'];
				
				carousel_instance.removeAllSlides();
				
				for (var i in images) {
					if ( !images.hasOwnProperty(i) ) continue;
					
					var elem = $('#poip_images a[href="'+images[i]+'"]:first');
					if (elem.length) {
						carousel_instance.appendSlide(this_object.getElementOuterHTML(elem));
					}
				}
				
				block_gallery.css('height', '');
				
				
				// update the additional popup gallery
				popup_gallery.html('');
				for (var i in images) {
					if ( !images.hasOwnProperty(i) ) continue;
					
					var elem = $('#poip_popup_images a[href="'+images[i]+'"]:first');
					if (elem.length) {
						popup_gallery.append(this_object.getElementOuterHTML(elem));
					}
				}
				popup_gallery.replaceWith(this_object.getElementOuterHTML(popup_gallery));
				
				if (!$('html').hasClass('quickview')) {
					
					$('#lg-intense-zoom').off('click');
					$('.zm-viewer').off('click');
					$('#lg-intense-zoom').die('click');
					$('.zm-viewer').die('click');
					$('#image').parent().off('click');
					$('.gallery-text').off('click');
					
				}
				
				Journal.productPageGallery();
				
				
				/* additional images click */
				$('#product-gallery a').off('click');
				$('#product-gallery .swiper-wrapper a').off('click');
				$('#product-gallery a').click(function (e) {
				//$('.product-info .image-additional a').click(function (e) {
						e.preventDefault();
						var index = $('.product-info .image-additional a').index( $(this) );
						var thumb = $(this).find('img').attr('src');
						var image = $(this).attr('href');
						Journal.changeProductImage(thumb, image, index);
						//return false;
				});
				
				
				
				//images_to_mouseover();
				if (poip_settings['img_hover']) {
					$('div.image-additional').find('a').mouseover(function(){
						this_object.eventAdditionalImageMouseover(this);
					});
				}
				
			}
			
		} else {
			
			if ( block_gallery.data('owlCarousel') ) { // owlCarousel 1
				
				if ( this_object.set_visible_images_first_call ) {
					if ( document.readyState != "complete" ) {
						this_object.set_visible_images_timer_id = setTimeout(function(){ this_object.replace_setVisibleImages(images, counter+1); }, 100);
						return;
					}
					this_object.set_visible_images_first_call = false;
				}
			
				var thumbs = [];
				for (var images_i in images) {
					if ( !images.hasOwnProperty(images_i) ) continue;
					var poip_img = this_object.getImageBySrc(images[images_i], 'popup');
					thumbs.push(poip_img['thumb']);
				}
				
				// add visible images to carousel
				var pg_html = "";
				var pg_added = [];
				$('#poip_images').find('a').each( function(){
					
					var img_href = $(this).attr('href');
					var img_src = $(this).find('img').attr('src');
					if ( (img_href == '#' || !img_href) && $(this).attr('data-image') ) img_href = $(this).attr('data-image');
					
					if ($.inArray( img_href, images) != -1 || $.inArray(decodeURIComponent(img_href), images) != -1 || (img_src && $.inArray( img_src, thumbs) != -1 ) ) {
						if ($.inArray(img_href, pg_added) == -1) { // to not have double images
							// show
							pg_html = pg_html + this_object.getElementOuterHTML($(this));
							pg_added.push(img_href);
						}
					}
				});
				
				// when carousel for additional images is turned on
				if (block_gallery.data('owlCarousel')) {
					var pg_opts = block_gallery.data('owlCarousel').options;
				}
				
				if (pg_html != block_gallery.html()) {
					block_gallery.html(pg_html);
					
					// when carousel for additional images is turned on
					if (block_gallery.data('owlCarousel')) {
						block_gallery.data('owlCarousel').reinit(pg_opts);
						
						<?php if ( isset($poip_journal2_settings) && ($poip_journal2_settings['product_page_gallery_carousel_arrows'] == 'hover' || $poip_journal2_settings['product_page_gallery_carousel_arrows'] == 'always')) { ?>
							block_gallery.find('.owl-buttons').addClass('side-buttons');
						<?php } ?>
					}
					
					block_gallery.css('height', '');
					
					// journal2 may use other gallery instead of colorbox
					<?php if (isset($poip_journal2_settings) && $poip_journal2_settings['product_page_gallery'] === '1') { ?>
						var ig_added = [];
						
						// not used in quickview
						if (typeof(poip_journal2_quickview) == 'undefined' || !poip_journal2_quickview) {
							
							
							if ( $.fn.swipebox ) {
								
								$('.product-info .image-gallery a').each(function(){
									// spec symbols like space %20
									if (($.inArray( this.href, images) != -1 || $.inArray(decodeURIComponent(this.href), images) != -1) && $.inArray(this.href, ig_added) == -1) {
										// show
										$(this).attr('rel', 'poip-visible');
										ig_added.push(this.href);
									} else { // hide
										$(this).attr('rel', '');
									}
									
								});
								
								// original click event in journal2 places later. fix it with mouseover
								$('.gallery-text').off('mousedown');
								$('.gallery-text').on('mousedown', function() {
									$('.gallery-text').off('click');
									$('.gallery-text').on('click', function () {
										if ( !$('#swipebox-overlay').length ) {
											$('.product-info .image-gallery a.swipebox[rel=poip-visible][href="'+$('#image').parent().attr('href')+'"]').first().click();
											return false;
										}
									});
								});
							} else if ( $.fn.lightGallery )  { // newer gallery
								// update the additional popup gallery
								popup_gallery.html('');
								for (var i in images) {
									if ( !images.hasOwnProperty(i) ) continue;
									
									var elem = $('#poip_popup_images a[href="'+images[i]+'"]:first');
									if (elem.length) {
										popup_gallery.append(this_object.getElementOuterHTML(elem));
									}
								}
								popup_gallery.replaceWith(this_object.getElementOuterHTML(popup_gallery));
								Journal.productPageGallery();
								
							}
						}
					<?php } ?>
					/* additional images click */
					$('.product-info .image-additional a').click(function (e) {
							e.preventDefault();
							var thumb = $(this).find('img').attr('src');
							var image = $(this).attr('href');
							Journal.changeProductImage(thumb, image);
							return false;
					});
					
					//images_to_mouseover();
					if (poip_settings['img_hover']) {
						$('div.image-additional').find('a').mouseover(function(){
							this_object.eventAdditionalImageMouseover(this);
						});
					}
				}
				
			} else if ( block_gallery.is('.image-additional-grid') ) { // just images
				
				if ( !$('#poip_images').length ) {
					block_gallery.parent().parent().before('<div id="poip_images" style="display:none;"></div>');
					block_gallery.find('a').each(function(){
						$('#poip_images').append( this_object.getElementOuterHTML( $(this) ) );
					});
				}
				
				var html = '';
				for ( var i_images in images ) {
					if ( !images.hasOwnProperty(i_images) ) continue;
					var image = images[i_images];
					
					var elem_img = $('#poip_images a[href="'+image+'"]:first');
					if ( elem_img.length ) {
						html+= this_object.getElementOuterHTML(elem_img);
					}
				}
				if ( block_gallery.html() != html || this_object.set_visible_images_first_call ) {
					block_gallery.html( html );
					
					$('.product-info .image-additional a').click(function (e) {
						e.preventDefault();
						var thumb = $(this).find('img').attr('src');
						var image = $(this).attr('href');
						
						if ( image.indexOf('iproductvideo') == -1 ) {
							Journal.changeProductImage(thumb, image);
						} else {
							// comp with iVideo
							
							var $a = $('.product-info .image-additional a');
							var $image_gallery = $('.product-info .image-gallery a.swipebox').eq($a.index($(this)));
							if ($image_gallery.find('img').attr('src') != undefined && $.fn.lightGallery != undefined) { 
								thumb = image = $image_gallery.find('img').attr('src');
							}
							
							var $image = $('#image');
							var video_href = $(this).attr('href');
							
							Journal.changeProductImage(thumb, image);
							
							$image.parent().attr('href', video_href);
						}	
						
						return false;
					});
					
					popup_gallery.html('');
					for (var i_images in images) {
						if ( !images.hasOwnProperty(i_images) ) continue;
						var image = images[i_images];
						var elem = $('#poip_popup_images a[href="'+image+'"]:first');
						if (elem.length) {
							popup_gallery.append(this_object.getElementOuterHTML(elem));
						}
					}
					popup_gallery.replaceWith(this_object.getElementOuterHTML(popup_gallery));
					Journal.productPageGallery();
					
				}
				this_object.set_visible_images_first_call = false;
				
				if (poip_settings['img_hover']) {
					block_gallery.find('a').mouseover(function(){
						$(this).click();
						//this_object.eventAdditionalImageMouseover(this);
					}); 
				}
				
				block_gallery.css('height', ''); // specific for journal2
				
			} else { // probably owlCarousel 2 (but specific owlCarousel2)
			
				var carousel_selector = '#product-gallery';
				var $carousel_elem = $(carousel_selector);
				
				//$carousel_elem.css('height', ''); // specific for journal2
				
				//return;
			
				if ( $carousel_elem.length ) {
					
					if ( !$('#poip_images').length ) {
						$carousel_elem.parent().parent().before('<div id="poip_images" style="display:none;"></div>');
						$carousel_elem.find('a').each(function(){
							$('#poip_images').append( this_object.getElementOuterHTML($(this)) );
						});
					}
					
					var current_carousel = $carousel_elem.data('owl.carousel'); // specific of journal2
					//var current_carousel = $carousel_elem.data('owlCarousel');
					
					if ( this_object.set_visible_images_first_call ) {
						if ( !current_carousel || !$carousel_elem.find('.owl-item').length || document.readyState != "complete" ) {
							this_object.set_visible_images_timer_id = setTimeout(function(){ this_object.replace_setVisibleImages(images, counter+1); }, 100);
							return;
						}
						this_object.set_visible_images_first_call = false;
					} else {
						var current_imgs = [];
						$carousel_elem.find('a').each( function(){
							current_imgs.push($(this).attr('href'));
						});
						
						if ( current_imgs.toString() == images.toString() ) {
							this_object.set_visible_images_timer_id = false;
							return; // nothing to change
						}
					}
					
					var html = '';
					for (var i in images) {
						if ( !images.hasOwnProperty(i) ) continue;
						var $elem = $('#poip_images a[href="'+images[i]+'"]:first');
						if ( $elem.length ) {
							html+= this_object.getElementOuterHTML($elem);
						}
					}
					
					html = '<div id="product-gallery" class="image-additional <?php echo $this->journal2->settings->get('product_page_gallery_carousel') ? 'journal-carousel owl-carousel2' : 'image-additional-grid'; ?>">'+html+'</div>';
					
					// this version of owlCarousel2 is changable by replacing only
					$carousel_elem.replaceWith(html);
					var $carousel_elem = $(carousel_selector);
					
					jQuery("#product-gallery").owlCarousel2({
						items: parseInt('<?php echo $this->journal2->settings->get('product_page_additional_width', 5) ?>', 10),
						rtl: Journal.isRTL,
						rewind: true,
						slideBy: 'page',
						autoRefresh: false,
						autoplay: <?php echo $this->journal2->settings->get('product_page_gallery_carousel_autoplay') > 0 ? 'true' : 'false'; ?>,
						autoplayTimeout: <?php echo $this->journal2->settings->get('product_page_gallery_carousel_autoplay') > 0 ? 4000 : 'false'; ?>,
						autoplayHoverPause: <?php echo $this->journal2->settings->get('product_page_gallery_carousel_pause_on_hover') ? 'true' : 'false'; ?>,
						autoplaySpeed: 400,
						touchDrag: <?php echo $this->journal2->settings->get('product_page_gallery_carousel_touchdrag') ? 'true' : 'false'; ?>,
						nav: true,
						navContainerClass: 'owl-buttons owl-nav',
						navText: [],
						dots: false,
						margin:parseInt('<?php echo $this->journal2->settings->get('product_page_additional_spacing', 10) ?>', 10)
					});
					
					
					
					$('.product-info .image-additional a').click(function (e) {
						e.preventDefault();
						var thumb = $(this).find('img').attr('src');
						var image = $(this).attr('href');
						
						if ( image.indexOf('iproductvideo') == -1 ) {
							Journal.changeProductImage(thumb, image);
						} else {
							// comp with iVideo
							
							var $a = $('.product-info .image-additional a');
							var $image_gallery = $('.product-info .image-gallery a.swipebox').eq($a.index($(this)));
							if ($image_gallery.find('img').attr('src') != undefined && $.fn.lightGallery != undefined) { 
								thumb = image = $image_gallery.find('img').attr('src');
							}
							
							var $image = $('#image');
							var video_href = $(this).attr('href');
							
							Journal.changeProductImage(thumb, image);
							
							$image.parent().attr('href', video_href);
						}	
						
						return false;
					});
					
					// update the additional popup gallery
					popup_gallery.html('');
					for (var i in images) {
						if ( !images.hasOwnProperty(i) ) continue;
						
						var elem = $('#poip_popup_images a[href="'+images[i]+'"]:first');
						if (elem.length) {
							popup_gallery.append(this_object.getElementOuterHTML(elem));
						}
					}
					popup_gallery.replaceWith(this_object.getElementOuterHTML(popup_gallery));
					Journal.productPageGallery();
						
					if (poip_settings['img_hover']) {
						$carousel_elem.find('a').mouseover(function(){
							$(this).click();
							//this_object.eventAdditionalImageMouseover(this);
						}); 
					}
					
					$carousel_elem.css('height', ''); // specific for journal2
					
				}
			}
			
		}
		
		this_object.set_visible_images_timer_id = false;
	}
	
	poip_product_custom.prototype.if_updateZoomImage = function(img_click) {
		var this_object = this;
		
		if ( $('div.zm-viewer').length) {
			// not found in additional images, change image direclty
			for (var i in poip_images) {
				if (poip_images[i]['popup'] == img_click) {
					$('#image').data('imagezoom').changeImage(poip_images[i]['popup'], poip_images[i]['popup']);
					break;
				}
			}
			return true;
		} else {
			return false;
		}
	}
	
	poip_product_custom.prototype.if_setMainImage = function(main, popup) {
		var this_object = this;
		
		var $additional_image = $('#product-gallery a[href="'+popup+'"]:first');
		
		var index = $('#product-gallery a').index( $additional_image );
		var thumb = $('#product-gallery a').find('img').attr('src');
		var image = popup;
		
		Journal.changeProductImage(thumb, image, index);
	
		return true;
	}
	/*
	poip_product_custom.prototype.additional_endOfEventAdditionalImageMouseover = function(image_a) {
		
		var thumb = $(image_a).find('img').attr('src');
		var image = $(image_a).attr('href');
		
		Journal.changeProductImage(thumb, image, $(image_a).index());
	}
	*/
	
	poip_product_custom.prototype.replace_useColorboxRefreshing = function() {
		// poip_journal2_quickview - global
		if ( typeof(poip_journal2_quickview) !== 'undefined' && poip_journal2_quickview ) {
			return false;
		} else {
			return true;
		}
	}
	
	// >> REPLACING FUNCTIONS	

	var poip_product = new poip_product_custom();

//--></script>