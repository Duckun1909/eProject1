var checkDuplicateForm = function(inputQuery, checkContent = null, inputName = null, option, server = 'register.php') {
    let checkAlert = 0;
    let checkEmpty = 0;
    $(inputQuery).blur(function(e) {
        let nameClass = $(this).parent().children().last('div').attr('class');
        if ($(inputQuery).val() != '') {
            if (nameClass != 'invalid' && nameClass != 'confirm' && nameClass != 'security') {
                $(this).removeClass('border').removeClass('border-invalid').addClass('border-success')
                $(this).parent().children('.empty').remove();
                checkEmpty = 0;
            }
            if (option == 1) {
                $.post(server, { checkDuplicate: `${ $(this).val() } `, nameCheck: inputName }, function(res) {
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

export default checkDuplicateForm;