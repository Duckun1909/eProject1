$(document).ready(function() {
    $('.product-body__filter-title .hover-back-button').click(function() {
        $('.product-tool').css({ 'transform': 'translateX(0)', 'opacity': '1' });
    })
    $('.product-tool__close').click(function() {
        $('.product-tool').css('transform', 'translateX(100%)');
    })

    $('nav-item-product').addClass('nav-link--active')
    $('.header').addClass('headerAbout');
    $('.headerAbout').css({ 'background-color': '#fff', 'position': 'unset', 'padding': '20px 0px', 'z-index': '2' });
    $(window).scroll(function() {
        var scroll_top = $(this).scrollTop();
        if (scroll_top > 100) {
            $('.headerAbout').css({ 'position': 'fixed', 'padding': 'unset' });
        } else {
            $('.headerAbout').css({ 'background-color': '#fff', 'position': 'unset', 'padding': '20px 0px' });
        }
    })
})