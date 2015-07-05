(function($) {
    "use strict";

    // Sticky menu
    $(window).scroll(function () {
        var mainmenu = jQuery("#header_main.sticky", "#header");
        if (parseInt(mainmenu.attr("rel"),10) <= Math.abs(parseInt(jQuery(window).scrollTop()),10)) {
            mainmenu.addClass("fixed");
        } else {
            mainmenu.removeClass("fixed");
        }
    });
    
    // Center caption in wide slider
    $(window).resize(function () {
        centerTopLeft();
        centerLeft();
    });
    $(window).load(function () {
        centerTopLeft();
        centerLeft();
    });
    function centerTopLeft()
    {
        var container = $(".wide_slider", "#wrapper");
        var content = $(".wide_slider .slider_caption", "#wrapper");
        content.css({
          "left": ((container.width() - content.width()) / 2),
          "top": ((container.height() - content.height()) / 2)
        });
    }
    function centerLeft()
    {
        var container = $(".wide_slider", "#wrapper");
        var content = $("#wide_slider_pager", "#wrapper");
        content.css({
          "left": ((container.width() - content.width()) / 2),
          "bottom": "0"
        });
    }
    
    $(document).ready(function(){

        // Sticky menu
        $("#header_main.sticky", "#header").wrap("<div class='header_main-parent'></div>").attr("rel", $("#header_main.sticky", "#header").offset().top).parent().height($("#header_main.sticky", "#header").height());

        // Responsive top navigation
        $(".top_navigation_toggle", "#header").on( "click", function() {
            $(".top_navigation .menu", "#header").toggle();
            $(this).toggleClass("active");
            return false;
        });
        $(".top_sub_menu_toggle", "#header").on( "click", function() {
            $(this).next(".sub-menu").toggle();
            return false;
        });

        // Responsive site navigation
        $(".site_navigation_toggle", "#header").on( "click", function() {
            $(".site_navigation .menu", "#header").toggle();
            $(this).toggleClass("active");
            return false;
        });
        $(".site_sub_menu_toggle", "#header").on( "click", function() {
            $(this).next(".sub-menu").toggle();
            $(this).next(".dt_mega_menu").toggle();        
            $(this).next(".cart_content").toggle();   
            return false;     
        });

        // Accordions
        $(".accordion_content", "#wrapper").accordion({
            collapsible: true,
            heightStyle: "content",
            icons: false,
            active: false,
            animate: false
        });

        // Review animated
        $('.review_footer span', "#wrapper").viewportChecker({
            classToAdd: 'visible animated',
            classToRemove: 'hidden', 
            offset: 0
        });

        // Images animated
        $("img:not(.content_slider img, .post .entry_media img)").viewportChecker({
            classToAdd: 'visible animated',
            classToRemove: 'hidden', 
            offset: 0
        });

        // Content slider
        $(".content_slider ul", "#wrapper").bxSlider({
            adaptiveHeight: true,
            mode: "horizontal",
            auto: true,
            controls: true,
            pager: false,
            captions: false,
            prevText: "&#xf053;",
            nextText: "&#xf054;"
        });

        // Wide slider
        $(".wide_slider ul", "#wrapper").bxSlider({
            adaptiveHeight: true,
            mode: "fade",
            auto: true,
            controls: true,
            captions: false,
            prevText: "&#xf053;",
            nextText: "&#xf054;",
            pagerCustom: "#wide_slider_pager"
        });

        // Popup images
        $(".popup_link", "#wrapper").magnificPopup({
            type: "image",
            mainClass: "mfp-with-zoom",
            zoom: {
                enabled: true,
                duration: 300,
                easing: 'ease-in-out',
                opener: function (openerElement) {
                    return openerElement.is("img") ? openerElement : openerElement.find("img");
                }
            }
        });

        // Tabs
        $(".tab_content", "#wrapper").tabs();

        // Fitvids
        $(".container", "#wrapper").fitVids();

        /* Shop single add to cart spinner */
        $("#spinner", "#wrapper").spinner({
            min: 0
        });

    });

})(jQuery);



jQuery( window ).resize(function() {
    if(jQuery( window ).width() >= 993) {
        jQuery("nav.site_navigation ul.menu").css("display", "block");
        jQuery(".site_navigation_toggle").removeClass('active');
    } else {
        jQuery("nav.site_navigation ul.menu").attr("style", "");
    }
    if(jQuery( window ).width() >= 993) {
        jQuery("nav.top_navigation ul.menu").css("display", "block");
        jQuery(".site_navigation_toggle").removeClass('active');
    } else {
        jQuery("nav.top_navigation ul.menu").attr("style", "");
    }

});