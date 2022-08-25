$(document).ready(function() {
    $('.sidebar-body ul li').click(function() {
        $(this).addClass('sidebar-body--active ').siblings().removeClass('sidebar-body--active ');
    })
})