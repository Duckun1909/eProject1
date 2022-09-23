$(document).ready(function() {
    $('nav-item-aboutUs').addClass('nav-link--active')
    $('.header').addClass('headerAbout');
    $('.headerAbout').css({ 'background-color': '#fff', 'position': 'unset', 'padding': '20px 0px', 'z-index': '1' });
    $(window).scroll(function() {
        var scroll_top = $(this).scrollTop();
        if (scroll_top > 100) {
            $('.headerAbout').css({ 'position': 'fixed', 'padding': 'unset' });
        } else {
            $('.headerAbout').css({ 'background-color': '#fff', 'position': 'unset', 'padding': '20px 0px' });
        }
    })
})