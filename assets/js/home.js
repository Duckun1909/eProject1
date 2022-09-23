var checkAnimation = function(nameQuery, nameSiblings, first_Animation, late_Animation) {
    let checkZoom = 1;
    $(nameQuery).click(function() {
        if (checkZoom == 1) {
            $(this).siblings(nameSiblings).addClass(first_Animation).removeClass(late_Animation);
            checkZoom = 0;
        } else {
            $(this).siblings(nameSiblings).addClass(late_Animation).removeClass(first_Animation);
            checkZoom = 1;
        }
    })
}

checkAnimation('.widget-group-search > i', 'div', 'search_bar--zoomIn', 'search_bar--zoomOut');
checkAnimation('.widget-group-user > i', 'div', 'user_own--flipInX', 'search_bar--zoomOut');


// Subnav Angle Icon Animation
var checkSubnavIcon = function(nameQuery, nameChildren, firstClass, lateClass) {
    $(nameQuery).mouseover(function() {
        $(this).children(nameChildren).removeClass(firstClass).addClass(lateClass);
    })
    $(nameQuery).mouseout(function() {
        $(this).children(nameChildren).removeClass(lateClass).addClass(firstClass);
    })
}

checkSubnavIcon('.header__navbar-product, .header__navbar-service, .header__navbar-library', 'i.fa-solid', 'fa-angle-down', 'fa-angle-up');
checkSubnavIcon('.subnav-support, .subnav-transfer, .subnav-image, .subnav-video', 'i.fa-solid', 'fa-angle-right', 'fa-angle-left')

// Header Nav-link Active
$('.header__navbar .nav-item').click(function() {
    $(this).addClass('nav-link--active').siblings().removeClass('nav-link--active');
})


// Header animation
$('.nav-item-home').addClass('nav-link--active')
$('.header').removeClass('headerAbout')
$('.header').removeAttr('style')