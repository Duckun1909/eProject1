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


    // Check Duplicate Data
    var checkDuplicateForm = function(inputQuery, checkContent = null, inputName = null, option) {
        let checkAlert = 0;
        let checkEmpty = 0;
        $(inputQuery).blur(function(e) {
            let nameClass = $(this).parent().children().last('div').attr('class');
            console.log(nameClass)
            if ($(inputQuery).val() != '') {
                if (nameClass != 'invalid' && nameClass != 'confirm' && nameClass != 'security') {
                    console.log(1);
                    $(this).removeClass('border').removeClass('border-invalid').addClass('border-success')
                    $(this).parent().children('.empty').remove();
                    checkEmpty = 0;
                }
                if (option == 1) {
                    $.post("register.php", { checkDuplicate: `${ $(this).val() } `, nameCheck: inputName }, function(res) {
                        $(this).removeClass('border').removeClass('border-invalid').addClass('border-success')
                        if (res == 0) {
                            if (checkAlert == 0) {
                                $(inputQuery).parent().append("<div class='invalid' style='color:#f44542; font-size:0.813rem; position:absolute;'>" + checkContent + "</div>")
                                $(inputQuery).removeClass('border').removeClass('border-success').addClass('border-invalid');
                                checkAlert = 1;
                            }
                        } else if (res == 1) {
                            $(inputQuery).removeClass('border').removeClass('border-invalid').addClass('border-success')
                            $(inputQuery).parent().children('.invalid').remove();
                            checkAlert = 0;
                        }
                    })
                }
            } else {
                if (checkEmpty == 0 && nameClass != 'confirm' && nameClass != 'security') {
                    $(this).parent().append("<div class='empty' style='color:#f44542; font-size:0.813rem; position:absolute;'>This field can not empty!</div>")
                    $(this).removeClass('border').removeClass('border-success').addClass('border-invalid');
                    checkEmpty = 1;
                }
            }
        })
    }
    checkDuplicateForm('input[name="username"]', ' Username was existed!', 'username', 1);
    checkDuplicateForm('input[name="email"]', 'Email was existed!', 'email', 1);
    checkDuplicateForm('input[name="phone"]', 'Phone was existed!', 'phone', 1);
    checkDuplicateForm('input[name="userFullname"]', 0)
    checkDuplicateForm('input[name="email"]', 0)
    checkDuplicateForm('input[name="password"]', 0)
    checkDuplicateForm('input[name="confirmPassword"]', 0)
    checkDuplicateForm('input[name="securCode"]', 0)
    checkDuplicateForm('input[name="address"]', 0)


    // Confirm Password
    let checkPass = 0;
    $('input[name="confirmPassword"]').keyup(function(e) {
        $password = $('input[name="password"]').val();
        if ($(this).val() != $password) {
            if (checkPass == 0) {
                $(this).parent().children('.empty').remove();
                $(this).parent().append("<div class='confirm' style='color:#f44542; font-size:0.813rem; position:absolute;'>Password not match!</div>")
                $(this).removeClass('border').removeClass('border-success').addClass('border-invalid');
                checkPass = 1;
            }
        } else {
            if ($password != '') {
                $(this).parent().children('.confirm').remove();
                $(this).removeClass('border').removeClass('border-invalid').addClass('border-success')
                checkPass = 0;
            }
        }
    })

    // Check Security
    let securCode = '';
    var securRand = function(securCode, securLen) {
        var securArr = '1234567890qwertyuiopasdfghjklzxcvbnmQƯERTYUIOPASDFGHJKLZXCVBNM';
        for (let i = 0; i < securLen; i++) {
            securCode += securArr[Math.ceil(Math.random() * securArr.length - 1)];
        }

        return securCode;
    }

    let x = securRand(securCode, 5)
    $('input[name="securCode"]').siblings('div').children('span')[0].innerText = x
    $('input[name="securCode"]').siblings('div').children('i').click(function(e) {
        x = securRand(securCode, 5)
        $(this).siblings('span')[0].innerText = x
    })


    let checkSecur = 0;
    $('input[name="securCode"]').keyup(function(e) {
        console.log(x);
        if ($(this).val() != x) {
            if (checkSecur == 0) {
                $(this).parent().children('.empty').remove();
                $(this).parent().append("<div class='security' style='color:#f44542; font-size:0.813rem; position:absolute;'>Security code not match!</div>")
                $(this).removeClass('border').removeClass('border-success').addClass('border-invalid');
                checkSecur = 1;
            }
        } else {
            $(this).parent().children('.security').remove();
            $(this).removeClass('border').removeClass('border-invalid').addClass('border-success')
            checkSecur = 0;
        }
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
                console.log(res)
                if (res == 1) {
                    alert('Đăng kí thành công!');
                    $('#registerForm')[0].reset();
                    x = securRand(securCode, 5)
                    $('input[name="securCode"]').siblings('div').children('span')[0].innerText = x
                    $.ajax({
                        url: './login.html',
                        type: 'GET',
                        dataType: 'html',
                        success: function(data) {
                            $('.body').html(data);
                        }
                    })
                } else {
                    alert('Đăng kí thất bại, vui lòng kiểm tra lại thông tin');
                }
            }
        })
    })
})