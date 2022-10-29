$(document).ready(function() {
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

    // Slideshow
    let totalSlide = $('.slider').children().length
    if (totalSlide > 1) {
        $('.slider-nav').slick({
            slidesToShow: totalSlide - 1,
            slidesToScroll: 1,
            arrows: false,
            asNavFor: '.slider',
            focusOnSelect: true
        })
    } else if (totalSlide > 4) {
        totalSlide = 4
        $('.slider-nav').slick({
            slidesToShow: totalSlide - 1,
            slidesToScroll: 1,
            arrows: false,
            asNavFor: '.slider',
            focusOnSelect: true
        })
    }

    $('.slider').slick({
        draggable: true,
        autoplay: true,
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: true,
        asNavFor: '.slider-nav'
    })

    $('.slick-prev').html(`<i class="fa-solid fa-arrow-left"></i>`).addClass('p-2 rounded-circle ')
    $('.slick-next').html(`<i class="fa-solid fa-arrow-right"></i>`).addClass('p-2 rounded-circle ').css('right', '0')


    // Comment
    $('.content').click(function() { $(this).children('div').css('display', 'block') })
    $('body').click(function(e) {
        if ($('.content').has(e.target).length == 0) {
            $('.content').children('div').removeAttr('style')
        }
    })
})