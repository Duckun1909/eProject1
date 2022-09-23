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

    $('#loginForm').submit(function(e) {
        e.preventDefault();
        var form = new FormData(this);
        form.append('login', 'true');

        $.ajax({
            url: './login.php',
            type: 'POST',
            dataType: 'text',
            data: form,
            cache: false,
            processData: false,
            contentType: false,
            success: function(res) {
                if (res == 1) {
                    alert('Đăng nhập thành công!');
                    $('#loginForm')[0].reset();
                    $.ajax({
                        url: './profile.html',
                        type: 'GET',
                        dataType: 'html',
                        success: function(data) {
                            $('.body').html(data);
                        }
                    })
                } else {
                    alert('Đăng nhập thất bại, vui lòng kiểm tra lại thông tin');
                }
            }
        })
    })
})