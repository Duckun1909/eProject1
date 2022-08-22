$(document).ready(function() {
    $.ajax({
        url: './home.html',
        type: 'GET',
        dataType: 'html',
        success: function(data) {
            $('.body').html(data)
        }
    })

    var checkAnimation = function(nameQuery, nameSiblings, first_Animation, late_Animation) {
        let checkZoom = 1;
        $(nameQuery).click(function(){
            if(checkZoom==1){
                $(this).siblings(nameSiblings).addClass(first_Animation).removeClass(late_Animation);
                checkZoom=0;
            }else{
                $(this).siblings(nameSiblings).addClass(late_Animation).removeClass(first_Animation);
                checkZoom=1;
            }
        })
    }
    
    checkAnimation('.widget-group-search > i', 'div', 'search_bar--zoomIn', 'search_bar--zoomOut');
    checkAnimation('.widget-group-user > i', 'div', 'user_own--flipInX', 'search_bar--zoomOut');
    
    
    // Subnav Angle Icon Animation
    var checkSubnavIcon = function(nameQuery, nameChildren, firstClass, lateClass) {
        $(nameQuery).mouseover(function(){
            $(this).children(nameChildren).removeClass(firstClass).addClass(lateClass);
        })
        $(nameQuery).mouseout(function(){
            $(this).children(nameChildren).removeClass(lateClass).addClass(firstClass);
        })
    }
    
    checkSubnavIcon('.header__navbar-product, .header__navbar-service, .header__navbar-library', 'i.fa-solid', 'fa-angle-down', 'fa-angle-up');
    checkSubnavIcon('.subnav-support, .subnav-transfer, .subnav-image, .subnav-video', 'i.fa-solid', 'fa-angle-right', 'fa-angle-left')
    
    // Header Nav-link Active
    $('.header__navbar .nav-item').click(function(){
        $(this).addClass('nav-link--active').siblings().removeClass('nav-link--active');
    })
    
    
    $(window).scroll(function(){
        var scroll_top = $(window).scrollTop();
        var slider_height = $('.slider').height();
        if(scroll_top > slider_height - 56){
            $('.header').css({'background-color': '#fff', 'box-shadow':'rgb(163 163 163) -1px 0px 5px'});
        }else if(scroll_top < slider_height - 56){
            $('.header').css({'background-color': 'transparent', 'box-shadow':'none'});
        }

        if(scroll_top > $('body').height()/3){
            $('.btn-gotofirst').addClass('btn-gotofirst--animation');
        }else{
            $('.btn-gotofirst').removeClass('btn-gotofirst--animation');
        }
    })
    
    // Ajax
    $('.nav-item-home').click((e)=>{
        e.preventDefault();
        $('.header').removeClass('headerAbout');
        $.ajax({
            url: './home.html',
            type: 'GET',
            dataType: 'html',
            success: function(data) {
                $('.body').html(data)
                $('.header').removeAttr('style');
            }
        })
    })



    $('.nav-item-aboutUs').click((e)=>{
        e.preventDefault();
        $('.header').addClass('headerAbout');
        $.ajax({
            url: './aboutUs.html',
            type: 'GET',
            dataType: 'html',
            success: function(data){
                // ajaxHeader(true);
                window.scrollTo(0, 0);
                $('.body').html(data);
            },
        })
    })

    $('.nav-item-product').click((e)=>{
        e.preventDefault();
        $('.header').addClass('headerAbout');
        $.ajax({
            url: './product.html',
            type: 'GET',
            dataType: 'html',
            success: function(data){
                window.scrollTo(0, 0);
                $('.body').html(data);
            }
        })
    })

})
