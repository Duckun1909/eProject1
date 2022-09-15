$(document).ready(function() {
    $.post('./profile.php', {}, function(res) {
        var userInfor = JSON.parse(res);
        var inputLst = $('#editUserForm input');
        $(inputLst[0]).val(userInfor.user_name);
        $(inputLst[1]).val(userInfor.user_email);
        $(inputLst[2]).val(userInfor.user_fullname);
        $(inputLst[3]).val(userInfor.user_phone);
        $(inputLst[4]).val(userInfor.user_address);
    })

    $('.profile-body__sidebar-body .hover_link').click(function(e) {
        var sideBarLst = $('.profile-body__sidebar-body .hover_link').toArray()
        sideBarLst.forEach(element => {
            $(element).removeClass('nav-link--active')
        });

        $(this).addClass('nav-link--active')
        var renderIndex = sideBarLst.indexOf(this)

        var profileTem = $('.profile-body__content-body .render-form')
        $(profileTem[renderIndex]).addClass('render-form--active').siblings().removeClass('render-form--active')

        switch (renderIndex) {
            case 0:
                $('.profile-body__content-header h1')[0].innerText = 'Transaction management';
                break;
            case 1:
                $('.profile-body__content-header h1')[0].innerText = 'Viewed products';
                break;
            case 2:
                $('.profile-body__content-header h1')[0].innerText = 'Favorites list';
                break;
            case 3:
                $('.profile-body__content-header h1')[0].innerText = 'Account information';
                break;
            case 4:
                $('.profile-body__content-header h1')[0].innerText = 'Change password';
                break;

        }
    })
})