$(document).ready(function() {
    $('#registerForm .toLogin').click(() => {
        $.ajax({
            url: '../'
        })
    })

    $('.headerAbout').css({ 'background-color': '#fff', 'position': 'unset', 'padding': '20px 0px' });
    $(window).scroll(function() {
        var scroll_top = $(this).scrollTop();
        if (scroll_top > 100) {
            $('.headerAbout').css({ 'position': 'fixed', 'padding': 'unset' });
        } else {
            $('.headerAbout').css({ 'background-color': '#fff', 'position': 'unset', 'padding': '20px 0px' });
        }
    })

    $('.toLogin').click(() => {
        $.ajax({
            url: './login.html',
            type: 'GET',
            dataType: 'html',
            success: function(data) {
                $('.body').html(data);
            }
        })
    })


    $('#registerForm').submit(function(e) {
        e.preventDefault();
        var form = new FormData(this);
        form.append('register', 'true');


        var text = form.get('username');
        $.ajax({
            url: './register.php',
            type: 'POST',
            dataType: 'text',
            data: form,
            cache: false,
            processData: false,
            contentType: false,
            success: function(res) {
                console.log(res);
            }
        })
    })
})