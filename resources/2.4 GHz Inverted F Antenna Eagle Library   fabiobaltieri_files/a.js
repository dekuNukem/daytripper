/*!
	AutoResize v1.18.4 - 2014-01-11
	Automatically adjust textarea height based on user input.
	(c) 2014 Jack Moore - http://www.jacklmoore.com/autosize
	Originally altered by mdawaffe.
	Current version altered by pento.
	license: http://www.opensource.org/licenses/mit-license.php
*/
(function ($) {
	var
	defaults = {
		className: 'autosizejs',
		append: '',
		callback: false,
		resizeDelay: 10,
		placeholder: true,
		animate: true,
		animateDuration: 150,
		animateCallback: function(){},
		extraSpace: 20
	},

	// border:0 is unnecessary, but avoids a bug in Firefox on OSX
	copy = '<textarea tabindex="-1" style="position:absolute; top:-999px; left:0; right:auto; bottom:auto; border:0; padding: 0; -moz-box-sizing:content-box; -webkit-box-sizing:content-box; box-sizing:content-box; word-wrap:break-word; height:0 !important; min-height:0 !important; overflow:hidden; transition:none; -webkit-transition:none; -moz-transition:none;"/>',

	// line-height is conditionally included because IE7/IE8/old Opera do not return the correct value.
	typographyStyles = [
		'fontFamily',
		'fontSize',
		'fontWeight',
		'fontStyle',
		'letterSpacing',
		'textTransform',
		'textDecoration',
		'wordSpacing',
		'textIndent'
	],

	// to keep track which textarea is being mirrored when adjust() is called.
	mirrored,

	// the mirror element, which is used to calculate what size the mirrored element should be.
	mirror = $(copy).data('autosize', true)[0];

	// test that line-height can be accurately copied.
	mirror.style.lineHeight = '99px';
	if ($(mirror).css('lineHeight') === '99px') {
		typographyStyles.push('lineHeight');
	}
	mirror.style.lineHeight = '';

	$.fn.autoResize = function (options) {
		if (!this.length) {
			return this;
		}

		options = $.extend({}, defaults, options || {});

		if (mirror.parentNode !== this.parentNode) {
			$(mirror).insertBefore(this);
		}

		return this.each(function () {
			var
			ta = this,
			$ta = $(ta),
			maxHeight,
			minHeight,
			boxOffset = 0,
			callback = $.isFunction(options.callback),
			originalStyles = {
				height: ta.style.height,
				overflow: ta.style.overflow,
				overflowY: ta.style.overflowY,
				wordWrap: ta.style.wordWrap,
				resize: ta.style.resize
			},
			timeout,
			width = $ta.width();

			if ($ta.data('autosize')) {
				// exit if autosize has already been applied, or if the textarea is the mirror element.
				return;
			}
			$ta.data('autosize', true);

			if ($ta.css('box-sizing') === 'border-box' || $ta.css('-moz-box-sizing') === 'border-box' || $ta.css('-webkit-box-sizing') === 'border-box'){
				boxOffset = $ta.outerHeight() - $ta.height();
			}

			// IE8 and lower return 'auto', which parses to NaN, if no min-height is set.
			minHeight = Math.max(parseInt($ta.css('minHeight'), 10) - boxOffset || 0, $ta.height());

			$ta.css({
				overflow: 'hidden',
				overflowY: 'hidden',
				wordWrap: 'break-word', // horizontal overflow is hidden, so break-word is necessary for handling words longer than the textarea width
				resize: ($ta.css('resize') === 'none' || $ta.css('resize') === 'vertical') ? 'none' : 'horizontal'
			});

			// The mirror width must exactly match the textarea width, so using getBoundingClientRect because it doesn't round the sub-pixel value.
			// window.getComputedStyle, getBoundingClientRect returning a width are unsupported, but also unneeded in IE8 and lower.
			function setWidth() {
				var width;
				var style = window.getComputedStyle ? window.getComputedStyle(ta, null) : false;
				
				if (style) {

					width = ta.getBoundingClientRect().width;

					if (width === 0) {
						width = parseInt(style.width,10);
					}

					$.each(['paddingLeft', 'paddingRight', 'borderLeftWidth', 'borderRightWidth'], function(i,val){
						width -= parseInt(style[val],10);
					});
				} else {
					width = Math.max($ta.width(), 0);
				}

				mirror.style.width = width + 'px';
			}

			function initMirror() {
				var styles = {};

				mirrored = ta;
				mirror.className = options.className + " " + ta.className;
				maxHeight = parseInt($ta.css('maxHeight'), 10);

				// mirror is a duplicate textarea located off-screen that
				// is automatically updated to contain the same text as the
				// original textarea.  mirror always has a height of 0.
				// This gives a cross-browser supported way getting the actual
				// height of the text, through the scrollTop property.
				$.each(typographyStyles, function(i,val){
					styles[val] = $ta.css(val);
				});
				$(mirror).css(styles);

				setWidth();

				// Chrome-specific fix:
				// When the textarea y-overflow is hidden, Chrome doesn't reflow the text to account for the space
				// made available by removing the scrollbar. This workaround triggers the reflow for Chrome.
				if (window.chrome) {
					var width = ta.style.width;
					ta.style.width = '0px';
					var ignore = ta.offsetWidth;
					ta.style.width = width;
				}
			}

			// Using mainly bare JS in this function because it is going
			// to fire very often while typing, and needs to very efficient.
			function adjust() {
				var height, original;

				if (mirrored !== ta) {
					initMirror();
				} else {
					setWidth();
				}

				if (!ta.value && options.placeholder) {
					// If the textarea is empty, copy the placeholder text into 
					// the mirror control and use that for sizing so that we 
					// don't end up with placeholder getting trimmed.
					mirror.value = ($ta.attr("placeholder") || '') + options.append;
				} else {
					mirror.value = ta.value + options.append;
				}

				mirror.style.overflowY = ta.style.overflowY;
				original = parseInt(ta.style.height,10);

				// Setting scrollTop to zero is needed in IE8 and lower for the next step to be accurately applied
				mirror.scrollTop = 0;

				mirror.scrollTop = 9e4;

				// Using scrollTop rather than scrollHeight because scrollHeight is non-standard and includes padding.
				height = mirror.scrollTop + options.extraSpace;

				if (maxHeight && height > maxHeight) {
					ta.style.overflowY = 'scroll';
					height = maxHeight;
				} else {
					ta.style.overflowY = 'hidden';
					if (height < minHeight) {
						height = minHeight;
					}
				}

				height += boxOffset;
				height = Math.floor( height );

				if (original !== height) {
					if ( options.animate && $ta.css( 'display' ) === 'block' ) {
						$ta.stop().animate( {height: height}, options.animateDuration, options.animateCallback );
					} else {
						ta.style.height = height + 'px';
						options.animateCallback.call( this );
					}
					if (callback) {
						options.callback.call(ta,ta);
					}
				}
			}

			function resize () {
				clearTimeout(timeout);
				timeout = setTimeout(function(){
					var newWidth = $ta.width();

					if (newWidth !== width) {
						width = newWidth;
						adjust();
					}
				}, parseInt(options.resizeDelay,10));
			}

			if ('onpropertychange' in ta) {
				if ('oninput' in ta) {
					// Detects IE9.  IE9 does not fire onpropertychange or oninput for deletions,
					// so binding to onkeyup to catch most of those occasions.  There is no way that I
					// know of to detect something like 'cut' in IE9.
					$ta.on('input.autosize keyup.autosize', adjust);
				} else {
					// IE7 / IE8
					$ta.on('propertychange.autosize', function(){
						if(event.propertyName === 'value'){
							adjust();
						}
					});
				}
			} else {
				// Modern Browsers
				$ta.on('input.autosize', adjust);
			}

			// Set options.resizeDelay to false if using fixed-width textarea elements.
			// Uses a timeout and width check to reduce the amount of times adjust needs to be called after window resize.

			if (options.resizeDelay !== false) {
				$(window).on('resize.autosize', resize);
			}

			// Event for manual triggering if needed.
			// Should only be needed when the value of the textarea is changed through JavaScript rather than user input.
			$ta.on('autosize.resize', adjust);

			// Event for manual triggering that also forces the styles to update as well.
			// Should only be needed if one of typography styles of the textarea change, and the textarea is already the target of the adjust method.
			$ta.on('autosize.resizeIncludeStyle', function() {
				mirrored = null;
				adjust();
			});

			$ta.on('autosize.destroy', function(){
				mirrored = null;
				clearTimeout(timeout);
				$(window).off('resize', resize);
				$ta
					.off('autosize')
					.off('.autosize')
					.css(originalStyles)
					.removeData('autosize');
			});

			// Call adjust in case the textarea already contains text.
			adjust();
		});
	};
}(window.jQuery || window.$)); // jQuery or jQuery-like library, such as Zepto
;
var HighlanderComments = jQuery.extend( HighlanderComments, {
	autosaveInterval: false,
	commentList: null,

	initialHeight: 70,

	cookies: { facebook: 'wpc_fbc', twitter: 'wpc_tc', wordpress: 'wpc_wpc', googleplus: 'wpc_gpc' },
	popups:  { facebook: ',height=400,width=600', twitter: ',height=515,width=600', wordpress: ',height=500,width=500' },
	temp_cookie_data: '',
	currentParent: false,
	currentParentId: false,
	currentParentMargins: {},
	keyCodeReturn: 13,

	resizeCallback: function() {},

	init : function() {
		jQuery( '#respond' ).addClass( 'js' );

		HighlanderComments.commentList = jQuery( '#thecomments, .thecomments, #commentlist, #comment-list, #comments-list, .commentlist, .comment-list, .comments-list, .com-list, #comments' ).last();

		jQuery( '#comment-form-nascar a' ).click( HighlanderComments.clickService );
		jQuery( '#postas-wordpress' ).click( HighlanderComments.clickExternalTab );
		jQuery( '#postas-facebook, #labelto-facebook' ).click( HighlanderComments.clickExternalTab );
		jQuery( '#postas-twitter, #labelto-twitter' ).click( HighlanderComments.clickExternalTab );

		pm.bind( 'googlePlusButtonClick', HighlanderComments.onGooglePlusButtonClick, 'https://public-api.wordpress.com' );
		pm.bind( 'googlePlusSignIn', HighlanderComments.onGooglePlusSignIn, 'https://public-api.wordpress.com' );

		jQuery( '#labelto-wordpress' ).click( HighlanderComments.checkPostToWordPress );
		jQuery( '#comment-form-post-to-edit a' ).click( HighlanderComments.editShareText );
		jQuery( window ).resize( HighlanderComments.toggleShareLabels );

		HighlanderComments.toggleShareLabels();
		HighlanderComments.restoreComment();
//		HighlanderComments.autosaveInterval = setInterval( HighlanderComments.autosaveComment, 10000 );

		jQuery.each( jQuery( '.comment-form-field input, textarea#comment' ), function() {
			if ( jQuery(this).val() !== '' ) {
				HighlanderComments.hideLabels( jQuery(this) );
			}
		} );

		jQuery( 'div.comment-form-fields input' ).change( function() { HighlanderComments.toggleLabel( jQuery(this) ); } ).focus( function() { HighlanderComments.hideLabels( jQuery(this) ); } ).blur( function() { HighlanderComments.showLabels( jQuery(this) ); } );
		jQuery( 'div.comment-form-fields label' ).click( function() { HighlanderComments.hideLabels( jQuery(this).parent().children( '.comment-form-input input' ) ); } );

		// Identity auto-fill from Gravatar Profiles
		jQuery( '#email' ).blur( function() {
			HighlanderComments.updateAvatarWithGravatar( '#email' );

			if ( !jQuery( '#author' ).val() ) {
				Gravatar.autofill( jQuery( this ).val(), {
					'displayName':'author',
					'url':'url' // Their first available link, or profile URL if none
				} );

				var afd = Gravatar.autofill_data;
				Gravatar.autofill_data = function( hash ) {
					afd.call( Gravatar, hash );
					jQuery( 'input#url' ).change();
					jQuery( 'input#author' ).change().click();
				};
			}
		} );

		// Comment area auto-sizing and tab handling
		jQuery( 'textarea#comment' )
			.autoResize({
				animate: false,
				animateCallback: HighlanderComments.resizeCallback
			})
			.css( 'resize', 'none' )
			.trigger('change.dynSiz')
			.focus( function() { HighlanderComments.hideLabels( jQuery(this) ); } )
			.blur( function() { HighlanderComments.showLabels( jQuery(this) ); } )
			.keydown( function( e ) {
				if ( 'undefined' != typeof e.keyCode && 9 == e.keyCode ) { // TAB key
					e.preventDefault();
					if ( 'guest' == jQuery( '#hc_post_as' ).val() ) {
						if ( 1 == HighlanderComments.comment_registration ) {
							jQuery( '#postas-wordpress' ).focus();
						} else {
							jQuery( '#email' ).focus();
						}
					} else {
						jQuery( '#comment-submit' ).focus();
					}
				}
				if (
					HighlanderComments.isCommandOrControlKeyDown( e ) &&
					HighlanderComments.keyCodeReturn === e.which
				) {
					jQuery( "#comment-submit" ).click();
				}
			} )
			.keyup( function() { HighlanderComments.fillShareText( jQuery(this) ); } )
			.one( 'focus', function() {
				var googlePlusSignIn = jQuery( '#googleplus-sign-in' );
				if ( googlePlusSignIn.length < 1 ) {
					return;
				}

				pm( {
					target: googlePlusSignIn[0].contentWindow,
					type: 'googlePlusLoadJS',
					data: 0,
					url: 'https://public-api.wordpress.com'
				} );
			});

		// Client-side form validation
		jQuery( '#commentform' ).submit( function() {
			var verified = true, email, author;
			// Comment text required
			if ( '' === jQuery( 'textarea#comment' ).val() ) {
				jQuery( 'label[for="comment"]' ).fadeOut( 'fast', function() {
					jQuery(this).text( HighlanderComments.enterACommentError ).fadeIn( 'fast').addClass('error');
				} );
				jQuery( '#comment-form-comment' ).addClass('error');
				jQuery( 'textarea#comment' ).focus( function() { jQuery(this).parent( '#comment-form-comment' ).removeClass('error'); } );
				verified = false;
			}

			// Only exists if email/name are required
			if ( 'guest' == jQuery( '#hc_post_as' ).val() && ( jQuery( '#comment-form-guest label span[class="required"]' ).size() || jQuery( '#comment-form-guest label[class="error"]' ).size() ) ) {
				email = jQuery( '#email' ).val();
				if ( '' === email || !email.match( /^.*@.*\..*$/ ) ) {
					jQuery( 'label[for="email"]' ).fadeOut( 'fast', function() {
						var error;
						if ( '' == email ) {
							error = HighlanderComments.enterEmailError;
						} else {
							error = '<span class="nopublish">' + HighlanderComments.invalidEmailError + '</span>';
						}
						jQuery(this).html( error ).css( 'opacity', 1 ).fadeIn( 'fast' ).addClass( 'error' );
					});
					jQuery( 'div.comment-form-email .comment-form-input' ).addClass('error');
					jQuery( 'input#email' ).focus( function() { jQuery(this).parent().removeClass( 'error' ); } );

					verified = false;
				}

				author = jQuery( '#author' ).val();
				if ( '' === author ) {
					jQuery( 'label[for="author"]' ).fadeOut( 'fast', function() {
						jQuery(this).text( HighlanderComments.enterAuthorError ).fadeIn('fast').addClass( 'error' );
					} );
					jQuery( 'div.comment-form-author .comment-form-input' ).addClass('error');
					jQuery( 'input#author' ).focus( function() { jQuery(this).parent().removeClass( 'error' ); } );
					verified = false;
				}
			}

			// Don't allow "guest" comments if auth is required
			if ( '1' == HighlanderComments.comment_registration && 'guest' == jQuery( '#hc_post_as' ).val() ) {
				jQuery( '#comment-form-nascar > p' ).addClass( 'error' ).fadeOut( 'fast', function() {
					jQuery( this ).fadeIn( 'fast' );
				} );
				verified = false;
			}

			// Set a cookie to remember which was the last used tab
			HighlanderComments.writeCookie( 'hc_post_as', jQuery( '#hc_post_as' ).val(), 7, '.wordpress.com' );

			if ( !verified ) {
				return false;
			}

			HighlanderComments.clickSubmit();
			return true;
		} );

		// Set up the identity block based on WP options, logged in state, etc
		if ( '1' == HighlanderComments.comment_registration ) {
			// Must be logged in to comment (guest commenting not allowed)
			jQuery('#comment-form-guest').hide();
			if ( !HighlanderComments.isJetpack && !HighlanderComments.userIsLoggedIn ) {
				// Force to guest posting if they're not logged in, which should actually not allow itself
				HighlanderComments.clickGuestTab();
				jQuery( '#comment-form-wordpress' ).removeClass( 'selected' );
				jQuery( '#hc_post_as' ).val( 'guest' );
			}
		} else {
			// Guest commenting is allowed
			if ( HighlanderComments.userIsLoggedIn && jQuery( '#comment-form-wordpress.selected' ).length ) {
				// User is logged in and we're looking at the WP UI already, get rid of guest commenting
				jQuery( '#comment-form-guest' ).slideUp( 'fast' );
			}
		}
		if ( jQuery( '.comment-form-service.selected' ).not( '#comment-form-guest.selected' ).length ) {
			// Something other than Guest is selected, hide the auth strip
			jQuery( '#comment-form-nascar' ).hide();
		}

		if ( 'undefined' !== typeof addComment ) {
			HighlanderComments._moveForm = addComment.moveForm;
			addComment.moveForm = HighlanderComments.moveForm;
		}

		// Hover Tooltips
		jQuery( '#comment-form-guest .comment-form-avatar' ).hover( function() {
			pos = jQuery( this ).offset();
            if (  'rtl' === HighlanderComments.text_direction ) {
                style = 'top:' + ( pos.top - 10 ) + 'px;left:' + ( pos.left - 130 ) + 'px;';
            } else {
                style = 'top:' + ( pos.top - 10 ) + 'px;left:' + ( pos.left + 35 ) + 'px;';
            }

			jQuery( 'body' ).append( '<div id="hltt-grav" class="highlander-tooltip" style="' + style + '">' + HighlanderComments.gravatarFromEmail  + '</div>' );
		}, function() {
			jQuery( '#hltt-grav' ).fadeOut( 'fast', function() {
				jQuery( this ).remove();
				jQuery( '.highlander-tooltip' ).remove();
			} );
		} );
		jQuery( '#comment-form-nascar ul' ).hover( function() {
			pos = jQuery( this ).offset();
            if (  'rtl' === HighlanderComments.text_direction ) {
                style = 'top:' + ( pos.top - 12 ) + 'px;left:' + ( pos.left + 125 ) + 'px;';
            } else {
                style = 'top:' + ( pos.top - 12 ) + 'px;left:' + ( pos.left - 125 ) + 'px;';
            }
			jQuery( 'body' ).append( '<div id="hltt-auth" class="highlander-tooltip" style="' + style + '">' + HighlanderComments.logInToExternalAccount + '</div>' );
		}, function() {
			jQuery( '#hltt-auth' ).fadeOut( 'fast', function() {
				jQuery( this ).remove();
				jQuery( '.highlander-tooltip' ).remove();
			} );
		} );
	},

    isCommandOrControlKeyDown: function( event ) {
		// event.metaKey will be true if Command key (⌘) or Windows key is down.
		return ( event.ctrlKey || event.metaKey );
	},

	_moveForm: null,
	moveForm: function( commId, parentId, respondId, postId ) {
		if ( null === HighlanderComments._moveForm ) {
			return;
		}

		var t = this,
		    r = false,
		    respond = jQuery( '#' + respondId ).css( { marginLeft: 0, marginRight: 0 } ),
		    w, wTop, commElement, rHeight, cTop, rTop;

		if ( HighlanderComments.currentParent ) {
			if ( parentId === HighlanderComments.currentParentId ) {
				return false;
			}

			w = jQuery(window);
			wTop = w.scrollTop();
			commElement = jQuery( '#' + commId );
			cTop = commElement.offset().top;
			rTop = respond.offset().top;

			if ( rTop <= cTop ) {
				rHeight = respond.outerHeight( true );
				respond.before( jQuery( '<div id="highlander-placeholder" />' ).css( { margin: 0, padding: 0, border: 0, height: rHeight, visibility: 'hidden', position: respond.css( 'position' ) } ) );
			}

			r = HighlanderComments._moveForm.call( t, commId, parentId, respondId, postId );
			if ( false !== r ) {
				return r;
			}

			HighlanderComments.currentParent.stop( true, true ).css( HighlanderComments.currentParentMargins );

			jQuery( '#highlander-placeholder' ).remove();

			if ( rTop <= cTop ) {
				jQuery( window ).scrollTop( wTop - rHeight );
			}

			HighlanderComments.moveFormNow.call( t, commId, parentId, respondId );
		} else {
			r = HighlanderComments._moveForm.call( t, commId, parentId, respondId, postId );
			if ( false === r ) {
				HighlanderComments.moveFormNow.call( t, commId, parentId, respondId );
			}
		}

		return r;
	},

	moveFormNow: function( commId, parentId, respondId ) {
		HighlanderComments.currentParent = jQuery( '#comment-' + parentId ).parents( '.highlander-comment' ).andSelf().filter( '.highlander-comment' ).last();
		if ( !HighlanderComments.currentParent.size() ) {
			HighlanderComments.currentParent = jQuery( '#comment-' + parentId ).parents( '.comment' ).andSelf().filter( '.comment' ).last();
		}
		HighlanderComments.currentParentId = parentId;

		var respond = jQuery( '#' + respondId );

		if ( !HighlanderComments.currentParent.find( respond ).size() ) {
			var betterParent = HighlanderComments.currentParent.parents( '.children:first' );
			if ( !betterParent.size() ) {
				betterParent = HighlanderComments.currentParent.parents( '.highlander-comment:first' );
				if ( !betterParent.size() ) {
					betterParent = HighlanderComments.currentParent.parents( '.comment:first' );
				}
			}

			if ( betterParent.size() ) {
				HighlanderComments.currentParent = betterParent;
			}
		}

		HighlanderComments.currentParentMargins = {
			backgroundColor: HighlanderComments.currentParent.css( 'backgroundColor' ),
			marginLeft: HighlanderComments.currentParent.css( 'marginLeft' ),
			marginRight: HighlanderComments.currentParent.css( 'marginRight' )
		};

		var oldOff, newOff, offOrder, autoWidth = false;
		if ( 'rtl' === HighlanderComments.text_direction ) {
			offOrder = [ 'Left', 'Right' ];
		} else {
			offOrder = [ 'Right', 'Left' ];
		}

		jQuery.each( offOrder, function( i, v ) {
			if ( '0px' === HighlanderComments.currentParentMargins['margin' + v] ) {
				oldOff = HighlanderComments.currentParent.offset().left;
				if ( 'Right' === v ) {
					oldOff += HighlanderComments.currentParent.outerWidth();
				}
				HighlanderComments.currentParent.css( 'margin' + v, 0 );
				newOff = HighlanderComments.currentParent.offset().left;
				if ( 'Right' === v ) {
					newOff += HighlanderComments.currentParent.outerWidth();
				}
				if ( oldOff !== newOff ) {
					newOff = 'Right' === v ? newOff - oldOff : oldOff - newOff;
					HighlanderComments.currentParent.css( 'margin' + v, newOff );
					HighlanderComments.currentParentMargins['margin' + v] = newOff;
					autoWidth = true;
				}
			}
		} );

		if ( autoWidth ) {
			HighlanderComments.currentParent.css( 'width', 'auto' );
			HighlanderComments.currentParentMargins.width = 'auto';
		}

		var rgbaTransparent = /rgba.*,\s*0\s*\)/, cp, bg, bgi;
		if ( 'transparent' === HighlanderComments.currentParentMargins.backgroundColor || HighlanderComments.currentParentMargins.backgroundColor.match( rgbaTransparent ) ) {
			cp = HighlanderComments.currentParent.get( 0 );
			bg = 'transparent';
			bgi = HighlanderComments.currentParent.css( 'backgroundImage' );

			while ( 'none' === bgi && cp.parentNode && cp.parentNode != document && ( 'transparent' === bg || bg.match( rgbaTransparent ) ) ) {
				cp = cp.parentNode;
				bg = jQuery( cp );
				bgi = bg.css( 'backgroundImage' );
				bg = bg.css( 'backgroundColor' );
			}

			HighlanderComments.currentParent.css( 'backgroundColor', bg );
		}

		var cancel = document.getElementById( 'cancel-comment-reply-link' ),
		    listOffsetSource = HighlanderComments.commentList,
		    listOffset,
		    parentOffset = HighlanderComments.currentParent.offset(),
		    currentParentMargins = HighlanderComments.currentParentMargins,
		    redoMargins = false,
		    grandWidth;

		cp = HighlanderComments.currentParent;

		while ( !cp.is( HighlanderComments.commentList ) && !cp.is( document ) ) {
			if ( 'hidden' === cp.css( 'overflow' ) || 'hidden' === cp.css( 'overflow-x' ) ) {
				listOffsetSource = cp;
				break;
			}

			cp = cp.parent();
		}

		listOffset = listOffsetSource.offset();

		HighlanderComments._unmoveForm = cancel.onclick;
		cancel.onclick = function() { return HighlanderComments.unmoveForm.call( this ); };

		if ( -1 < currentParentMargins.marginLeft.toString().indexOf( '%' ) ) {
			grandWidth = HighlanderComments.currentParent.parent().width();
			currentParentMargins.marginLeft = parseFloat( currentParentMargins.marginLeft ) / 100 * grandWidth;
			redoMargins = true;
		}

		if ( -1 < currentParentMargins.marginRight.toString().indexOf( '%' ) ) {
			grandWidth = HighlanderComments.currentParent.parent().width();
			currentParentMargins.marginRight = parseFloat( currentParentMargins.marginRight ) / 100 * grandWidth;
			redoMargins = true;
		}

		if ( redoMargins ) {
			HighlanderComments.currentParent.css( currentParentMargins );
		}

		listOffset.right = listOffset.left + listOffsetSource.outerWidth();
		parentOffset.left -= parseInt( HighlanderComments.currentParent.css( 'margin-left' ), 10 );
		parentOffset.right = parentOffset.left + HighlanderComments.currentParent.outerWidth( true );

		respond.hide();
		HighlanderComments.currentParent.animate( {
			marginLeft: '-=' + ( parentOffset.left - listOffset.left ).toString(),
			marginRight: '-=' + ( listOffset.right - parentOffset.right ).toString()
		}, 350, function() {
			respond.slideDown( 350, function() {
				jQuery( '#' + commId + ' .comment-reply-link:first' ).focus();
				jQuery( '#comment' ).focus();
				HighlanderComments.resizeCallback();
			} );

			respond.children('form').after('<div class="clear" id="threaded-clear"></div>');
		} );
	},

	_unmoveForm: null,
	unmoveForm: function() {
		var r = HighlanderComments._unmoveForm.call( this );
		if ( false !== r ) {
			return r;
		}

		HighlanderComments.currentParent.stop( true, true ).animate( HighlanderComments.currentParentMargins, 350, function() {
			HighlanderComments.currentParent.css( HighlanderComments.currentParentMargins );
			HighlanderComments.currentParent = HighlanderComments.currentParentId = false;
		} );
		jQuery( '#respond' ).stop( true, true ).show();
		jQuery( '#respond div#threaded-clear' ).remove();
		HighlanderComments.resizeCallback();

		return r;
	},

	HTMLToText : function( string ) {
		return jQuery( '<span />' ).text( string ).html();
	},

	autosaveComment : function() {
		var oneDay = new Date();
		oneDay.setTime( oneDay.getTime() + 86400000 );
		document.cookie = 'comment-' + HighlanderComments.postID + '='  + encodeURIComponent( jQuery( '#comment' ).val() ) + '; expires=' + oneDay.toGMTString() + '; path=/';
	},

	unsaveComment : function() {
		var oneDay = new Date();
		oneDay.setTime( oneDay.getTime() - 86400000 );
		document.cookie = 'comment-' + HighlanderComments.postID + '= ; expires=' + oneDay.toGMTString() + '; path=/';
	},

	restoreComment : function() {
		var parts = document.cookie.split( ';' ), part;
		jQuery.each( parts, function(i) {
			part = parts[i].split( '=' );
			if ( 'comment-' + HighlanderComments.postID === jQuery.trim( part[0] ) ) {
				if ( 'undefined' !== typeof part[1] && 'undefined' !== part[1] && '' !== decodeURIComponent( part[1] ) ) {
					jQuery( '#comment' ).val( decodeURIComponent( part[1] ) );
				}
				return;
			}
		} );
	},

	switchAccount : function() {
		jQuery( '.comment-form-service' ).removeClass( 'selected' ).hide();
		jQuery( '#hc_post_as' ).val( 'guest' );
		jQuery( '#comment-form-nascar > p' ).removeClass( 'error' );
		if ( '1' == HighlanderComments.comment_registration ) {
			jQuery( '#comment-form-nascar' ).show();
			jQuery( '#comment-form-guest' ).hide(); // Guest commenting not allowed
			HighlanderComments.resizeCallback();
		} else {
			jQuery( '#comment-form-nascar' ).show();
			jQuery( '#comment-form-guest' ).slideDown( 'fast', HighlanderComments.resizeCallback );
			HighlanderComments.clickGuestTab();
		}
	},

	setConnectingToText : function( serviceFriendlyName ) {
		jQuery( '#comment-form-load-service p' ).text( HighlanderComments.connectingToText.replace( '%s', serviceFriendlyName ) );
	},

	updateLoadServiceVisibility : function( tab ) {
		jQuery( '.comment-form-service' )
			.css( 'visibility', 'hidden' )
			.show()
			.removeClass( 'selected' )
			.filter( tab )
				.css( 'visibility', 'visible' )
				.fadeIn( 'fast' )
			.end()
			.not( tab )
				.hide()
				.css( 'visibility', 'visible' );
	},

	clickService : function(e) {
		e.preventDefault();

//		HighlanderComments.autosaveComment();

		var tab = this.href.replace( /^.*#/, '#' ).split( ':' );

		if ( '#comment-form-load-service' === tab[0] && tab[1] ) {
			HighlanderComments.setConnectingToText( tab[1] );
		} else {
			jQuery( '#hc_post_as' ).val( tab[0].split( '-' ).pop() );
		}

		HighlanderComments.updateLoadServiceVisibility( '#comment-form-load-service' );

		jQuery( '#comment-form-nascar li.selected' ).removeClass( 'selected' );
		jQuery( this ).parent().addClass( 'selected' );
		HighlanderComments.resizeCallback();
	},

	clickGuestTab : function(e) {
		if ( '1' == HighlanderComments.comment_registration ) {
			jQuery( '#comment-form-guest' ).hide();
		}

		if ( jQuery( '#email' ).length && -1 < jQuery( '#email' ).val().indexOf( '@twitter.example.com' ) ) {
			jQuery( '#email' ).val( '' ).blur();
		}

		HighlanderComments.updateAvatarWithGravatar( '#email' );

		// Reenable subscription options
		jQuery( '#comment-form-subscribe' ).css( 'opacity', '1'  ).find( 'input' ).removeAttr( 'disabled' );
		HighlanderComments.resizeCallback();
	},

	checkPostToWordPress: function(e) {
		HighlanderComments.clickExternalTab( 'wordpress' );
		jQuery( '#wordpress-login-first' ).show();
	},

	updateAvatarWithGravatar: function(e) {
		var grav_base = ( 'https:' === location.protocol ? 'https://secure' : 'http://www' ) + '.gravatar.com/avatar/';
		// When Avatars are disabled, Gravatar can be undefined, so we check against that first
		// and fall back to an unknown gravatar if it isn't
		var gravSource = grav_base + 'ad516503a11cd5ca435acc9bb6523536?s=25&forcedefault=1';

		if ( 'undefined' !== typeof Gravatar && jQuery( e ).length ) {
			gravSource = grav_base + Gravatar.md5( jQuery.trim( jQuery( e ).val().toLowerCase() ) ) + '?s=25';
		}

		if ( 'gravatar_default' !== HighlanderComments.gravDefault ) {
			gravSource += '&d=' + encodeURIComponent( HighlanderComments.gravDefault );
		}

		jQuery( '#comment-form-guest .comment-form-avatar img' ).attr( 'src', gravSource );
	},

	getServiceData : function( service ) {
		var data = HighlanderComments.readCookie( HighlanderComments.cookies[service] );

		if ( null === data || 'undefined' === typeof data.access_token || !data.access_token ) {
			return false;
		}
		return data;
	},

	ext_win : false,
	ext_win_check : false,
	pollExternalWindow : function( service, from_tab ) {
		if ( !HighlanderComments.ext_win || HighlanderComments.ext_win.closed ) {
			// If the cookie is available, then we must have auth'd successfully
			if ( HighlanderComments.getServiceData( service ) ) {
				HighlanderComments.doExternalLoggedIn( service );
				return;
			}
			HighlanderComments.doExternalCanceled( service, from_tab );
			HighlanderComments.ext_win = false;
			clearInterval( HighlanderComments.ext_win_check );
		}
	},

	cancelExternalWindow : function() {
		if ( HighlanderComments.ext_win ) {
			HighlanderComments.ext_win.close();
		}
		HighlanderComments.doExternalCanceled( jQuery( '#hc_post_as' ).val(), true );
	},

	clickExternalTab : function( e ) {
		if ( 'undefined' == typeof e ) {
			return;
		}

		jQuery( '#comment-form-guest' ).slideUp( 'fast', function() {
			jQuery( '#comment-form-nascar' ).hide();

			HighlanderComments.resizeCallback();

			clearInterval( HighlanderComments.ext_win_check );
			jQuery( '.highlander-tooltip' ).remove();

			var from_tab = 1;
			if ( 'string' == typeof e ) {
				var service = e;
			} else {
				var service = e.currentTarget.id.split( '-' )[1];
				if ( e.currentTarget.nodeName != 'A' ) {
					from_tab = 0;
				}
			}

			if (
				// Found commenting cookies
				null != HighlanderComments.readCookie( HighlanderComments.cookies[service] )
			&&
				(
					// WordPress tab, and we're logged in
					'wordpress' == service && HighlanderComments.userIsLoggedIn
				||
					// Not WordPress tab
					'wordpress' != service
				)
			) {
				if ( from_tab ) {
					HighlanderComments.doExternalLoggedIn( service );
				}
			} else if ( 'googleplus' == service ) {
				// Nothing to do - we're already logged in at this point
			} else {
				HighlanderComments.ext_win = window.open( HighlanderComments.connectURL + '&service=' + service, 'highconn', 'status=0,toolbar=0,location=1,menubar=0,directories=0,resizable=1,scrollbars=0' + HighlanderComments.popups[service] );
				HighlanderComments.ext_win_check = setInterval( "HighlanderComments.pollExternalWindow( '" + service + "', " + from_tab + " )", 100 );
			}
		} );
	},

	doExternalLoggedIn : function( service ) {
		clearInterval( HighlanderComments.ext_win_check );

		var data = HighlanderComments.getServiceData( service );

		if ( 'object' !== typeof data ) {
			return;
		}

		if ( 'wordpress' == service ) {
			// Allow subscription options
			jQuery( '#comment-form-subscribe' ).css( 'opacity', '1'  ).find( 'input' ).removeAttr( 'disabled' );

			// Set up Gravatar and flag as logged in. Load a page to trigger cookies etc
			jQuery( '#comment-form-' + service + ' .comment-form-avatar img' ).attr( 'src', data.avatar );
			HighlanderComments.userIsLoggedIn = true;
			if ( !HighlanderComments.isJetpack ) {
				jQuery( 'body' ).append( '<iframe class="highlander-auth-init" height="1" width="1" style="display:none;" src="' + HighlanderComments.homeURL + 'highlander.login/" />' );
			}
		} else {
			if ( 'twitter' == service ) {
				// Disable subscription options for Twitter since we don't have an email
				jQuery( '#comment-form-subscribe' ).css( 'opacity', '0.5'  ).find( 'input' ).attr( 'disabled', 'disabled' ).removeAttr( 'checked' );
			}

			// Run all external avatars through ImgPress to resize them
			jQuery( '#comment-form-' + service + ' .comment-form-avatar img' )
				.attr( 'src', function() {
					var split, host, path, query, url;

					try {
						if ( data.avatar.match( /^(https?:)?\/\/i[012]\.wp\.com\// ) ) {
							return data.avatar.replace( /^https?:/, location.protocol );
						}

						if ( data.avatar.match( /^(https?:)?\/\/(.*?\.)gravatar\.com\// ) ) {
							return data.avatar.replace( /^https?:/, location.protocol );
						}

						split = data.avatar.split( '#' ); // Ignore fragment
						split = split[0].split( '?' );
						query = split[1];
						split = split[0].split( '//' ); // Ignore scheme
						split = split[1].split( '/' );
						host  = split[0];
						path  = split.slice( 1 ).join( '/' );

						url = location.protocol + '//i0.wp.com/' + host + '/' + path + '?';

						if ( 'graph.facebook.com' === host && query.length ) {
							url += 'q=' + encodeURIComponent( query ) + '&';
						}

						return url + 'resize=25%2C25';
					} catch ( error ) {
						return data.avatar;
					}
				} );
		}

		jQuery( '#email' ).val( data.email ).change();
		jQuery( '#author' ).val( data.name ).change();
		jQuery( '#url' ).val( data.link ).change().click();
		jQuery( '#' + service + '-avatar' ).val( data.avatar );
		jQuery( '#' + service + '-user_id' ).val( data.uid );
		jQuery( '#' + service + '-access_token' ).val( data.access_token );

		jQuery( '#hc_post_as' ).val( service );

		// The child of the li.selected can be a <A> (WP, FB, Twitter) or an <IFRAME> (Google+)

		var selectedLink = jQuery( '#comment-form-nascar li.selected a' );
		if ( selectedLink.length && service == selectedLink.attr( 'id' ).replace( 'postas-', '' ) ) {
			jQuery( '#comment-form-load-service' ).hide();
			jQuery( '#comment-form-' + service ).show();
			jQuery( '#comment-form-' + service + ' .comment-form-posting-as strong' ).text( data.name + ':' );
			HighlanderComments.resizeCallback();
		}

		var selectedIFrame = jQuery( '#comment-form-nascar li.selected iframe' );
		if ( selectedIFrame.length && service == "googleplus" ) {
			jQuery( '#comment-form-load-service' ).hide();
			jQuery( '#comment-form-' + service ).show();
			jQuery( '#comment-form-' + service + ' .comment-form-posting-as strong' ).text( data.name + ':' );
			HighlanderComments.resizeCallback();
		}
	},

	doExternalCanceled : function( service, from_tab ) {
		if ( from_tab ) {
			var gravSource = ( 'https:' === location.protocol ? 'https://secure' : 'http://www' ) + '.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=25';
			if ( 'gravatar_default' !== HighlanderComments.gravDefault ) {
				gravSource += '&d=' + encodeURIComponent( HighlanderComments.gravDefault );
			}
			jQuery( '#comment-form-' + service + ' .comment-form-avatar img' ).attr( 'src', gravSource );
			jQuery( '.comment-meta-' + service ).val( '' );
			jQuery( '#postas-' + service + ' span' ).html( '&nbsp; &nbsp; &nbsp;' );
			jQuery( '#comment-form-' + service ).hide();
			HighlanderComments.switchAccount();
		}

		jQuery( '#postto-' + service ).prop( 'checked', false );
	},

	doExternalLogout : function( service ) {
		var hostname;
		if ( -1 !== document.location.hostname.indexOf( '.wordpress.com' ) ) {
			hostname = 'wordpress.com';
		} else {
			hostname = document.location.hostname;
		}

		HighlanderComments.writeCookie( HighlanderComments.cookies[service], '', -10, hostname );
		HighlanderComments.doExternalCanceled( service, true );

		if ( 'wordpress' == service ) {
			HighlanderComments.userIsLoggedIn = false;
			jQuery( 'body' ).append( '<iframe height="1" width="1" style="display:none;" src="' + HighlanderComments.logoutURL + '" />' );
		}

		if ( 'googleplus' == service ) {
			jQuery( 'body' ).append( '<iframe height="1" width="1" style="display:none;" src="https://accounts.google.com/logout" />' );
		}
	},

	clickSubmit : function(e) {
		HighlanderComments.unsaveComment();
		jQuery( '#respond input#comment-submit' ).val( HighlanderComments.HTMLToText( HighlanderComments.submittingText ) ).addClass( 'disabled' ).attr( 'disabled', 'disabled' ).wrap( '<p id="comment-form-submitting" />' );
	},

	toggleLabel : function( input ) {
		if ( jQuery( window ).width() && jQuery( window ).width() <= 450 ) {
			return;
		}

		if ( !input.val().length ) {
			input.parents('div.comment-form-field').children('label').css( { opacity: 1 } );
		} else {
			input.parents('div.comment-form-field').children('label').css( { opacity: 0.05 } );
		}
	},

	hideLabels: function( input ) {
		if ( jQuery( window ).width() == 0 || jQuery( window ).width() > 450 && !input.attr( 'placeholder' ) ) {
			input.parents('div.comment-form-field').children('label').animate( { opacity: 0 }, 150, function() {
				jQuery(this).hide();
			} );
		}

		input.parent().addClass('active');
	},

	showLabels: function( input ) {
		if ( jQuery( window ).width() == 0 || jQuery( window ).width() > 450 && !input.attr( 'placeholder' ) ) {
			if ( !input.val().length ) {
				input.parents('div.comment-form-field').children('label').show().animate( { opacity: 1 }, 150 );
			}
		}

		input.parent().removeClass('active');
	},

	editShareText: function(e) {
		e.preventDefault();

		if ( jQuery( '#comment-form-edit-share-text' ).is( ':hidden' ) ) {
			jQuery( '#comment-form-edit-share-text' ).slideDown( 'fast', HighlanderComments.resizeCallback );
		} else {
			jQuery( '#comment-form-edit-share-text' ).slideUp( 'fast', HighlanderComments.resizeCallback );
		}
	},

	toggleShareLabels: function() {
		if ( jQuery( '#respond' ).outerWidth() > 450 ) {
			jQuery( '#comment-form-post-to label span' ).show().parent().css( { 'padding-right': 0 } );
		} else {
			jQuery( '#comment-form-post-to label span' ).hide().parent().css( { 'padding-right': '20px' } );
		}
		HighlanderComments.resizeCallback();
	},

	fillShareText: function( textarea ) {
		if ( !jQuery( '#comment-form-share-text-textarea' ).length ) { return; }

		var current = jQuery( '#comment-form-share-text-textarea' ).val().split( '": ' );
		var shareComment = current[0] + '": ' + jQuery(textarea).val();

		if ( shareComment.length > 280 ) {
			shareComment = shareComment.substr( 0, 276 ) + '...';
		}

		jQuery( '#comment-form-share-text-textarea' ).val( shareComment );
	},

	// Google+ Sign-in is a little different than the other services
	// It uses its own JavaScript API loaded in its own iframe
	// (public.api/connect/?googleplus-sign-in=1)
	// We listen for messages from that iframe here
	onGooglePlusSignIn: function( message ) {
		var hostname;
		if ( -1 !== document.location.hostname.indexOf( '.wordpress.com' ) ) {
			hostname = 'wordpress.com';
		} else {
			hostname = document.location.hostname;
		}

		if ( 'undefined' == typeof message.error) {
			var value = jQuery.param( message ).replace( /\+/g, '%20' );
			value.name = encodeURIComponent( value.name );
			HighlanderComments.writeCookie( 'wpc_gpc', value, 1, hostname );

			jQuery( '#comment-form-nascar li.selected' ).removeClass( 'selected' );
			jQuery( "#googleplus-sign-in" ).parent().addClass( 'selected' );

			HighlanderComments.doExternalLoggedIn( 'googleplus' );
		} else {
			HighlanderComments.doExternalLogout( 'googleplus' );
		}
	},

	onGooglePlusButtonClick: function( message ) {
		HighlanderComments.setConnectingToText( 'Google+' );
		HighlanderComments.updateLoadServiceVisibility( '#comment-form-load-service' );
		HighlanderComments.clickExternalTab( 'googleplus' );
	},

	/* Read the contents of a named cookie, assuming they are query-string-style
	delimited, and return them as a JS hash. */
	readCookie : function(c) {
		var nameEQ = c + "=",
		    cookieStrings = document.cookie.split( ';' ),
		    i, cookieString, num, chunk, pairs, pair, cookie_data;

		if( 'wpc_gpc' == c && !document.cookie ) { // Needed for IE because it doesn’t allow setting cookies in iframes from another domain, unless we send P3P headers
			cookieStrings = HighlanderComments.temp_cookie_data.split( ';' );
		}
		for ( i = 0; i < cookieStrings.length; i++ ) {
			cookieString = cookieStrings[ i ];
			while ( cookieString.charAt( 0 ) === ' ' ) {
				cookieString = cookieString.substring( 1, cookieString.length );
			}
			if ( cookieString.indexOf( nameEQ ) === 0 ) {
				chunk = cookieString.substring( nameEQ.length, cookieString.length );
				pairs = chunk.split( '&' );
				cookie_data = {};
				for ( num = pairs.length - 1; num >= 0; num-- ) {
					pair = pairs[ num ].split( '=' );
					cookie_data[ pair[0] ] = decodeURIComponent( pair[1] );
				}
				return cookie_data;
			}
		}
		return null;
	},

	writeCookie : function( name, value, days, domain ) {
		var expires;
		if ( days ) {
			var date = new Date();
			date.setTime( date.getTime() + ( days * 24 * 60 * 60 * 1000 ) );
			expires = "; expires=" + date.toGMTString();
		} else {
			expires = "";
		}

		if ( domain ) {
			domain = "; domain=" + domain;
		} else {
			domain = '';
		}

		HighlanderComments.temp_cookie_data = document.cookie = name + "=" + value + expires + "; path=/" + domain;

	}
} );

jQuery( HighlanderComments.init );
;
