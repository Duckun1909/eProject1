$(document).ready(function() {
    $('.sidebar-body ul li').click(function() {
        $(this).addClass('sidebar-body--active ').siblings().removeClass('sidebar-body--active ');
    })

    $('input#uploadFile').on('change', function() {
        readURL(this, '.thumbnail img')
    })

    $('.btn-delThumbnail').click(function() {
        $('.thumbnail img').removeAttr('src');
        $('.thumbnail img').addClass('d-none');
        $(this).addClass('d-none');
    })

    $('#addPrdForm').submit(function(e) {
        e.preventDefault();
        console.log(1);
        var data = new FormData(this)
        data.append('addPrd', 'true');

        $.ajax({
            url: './admin.php',
            type: 'GET',
            processData: false,
            cache: false,
            dataType: 'json',
            data: data,
            success: function(res) {
                console.log(res);
                console.log(1);
            }

        })
    })
})
console.log(1);


function readURL(input, thumbimage) {
    if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
        var reader = new FileReader();
        reader.onload = function(e) {
            $(thumbimage).attr('src', e.target.result);
            $(thumbimage).removeClass('d-none')
            $('.btn-delThumbnail').removeClass('d-none')
        }
        reader.readAsDataURL(input.files[0]);
    }
}