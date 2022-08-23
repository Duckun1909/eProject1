$(document).ready(function() {
    $('.headerAbout').css({ 'background-color': '#fff', 'position': 'unset', 'padding': '20px 0px' });
    $(window).scroll(function() {
        var scroll_top = $(this).scrollTop();
        if (scroll_top > 100) {
            $('.headerAbout').css({ 'position': 'fixed', 'padding': 'unset' });
        } else {
            $('.headerAbout').css({ 'background-color': '#fff', 'position': 'unset', 'padding': '20px 0px' });
        }
    })

    $('.toRegister').click(() => {
        $.ajax({
            url: './register.html',
            type: 'GET',
            dataType: 'html',
            success: function(data) {
                $('.body').html(data);
            }
        })
    })
})