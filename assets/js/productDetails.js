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

    // Slideshow
    let x = 1;
    let width = 636
    let sliderArr = $('.slider').children().toArray();
    console.log(sliderArr)
    $('.bullets .btn-prev').click(function() {
        let translate = x * width;
        let totalImg = $('.slider').children().length
        $('.slider').css('transform', `translateX(-${translate}px)`)
        x++;
        console.log(x)
        if (x == totalImg + 1) {
            x = 0
            translate = x * width
            $('.slider').css('transform', `translateX(-${translate}px)`)
            $('.slider').children().remove()
            x = 1
            setTimeout(function() {
                sliderArr.forEach(element => {
                    $('.slider').append(element)
                });
            }, 700 * x)
        }
    })
})