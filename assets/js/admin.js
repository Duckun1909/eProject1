import checkDuplicateForm from './checkDuplicate.js'

var myApp = angular.module('myApp', [])
myApp.controller('inCludePage', function($scope) {
    $scope.elementUrl = './dashboard.html'
    $scope.includeHandle = function(index) {
        switch (index) {
            case 0:
                this.elementUrl = './dashboard.html'
                break;
            case 1:
                this.elementUrl = './prdManage.html';
                break;
            case 2:
                this.elementUrl = './cusManage.html';
                break
            case 3:
                this.elementUrl = './orderManage.html';
                break;
            case 4:
                this.elementUrl = './possesManage.html';
                break;
            case 5:
                this.elementUrl = './createAdmin.html';
        }
    }
}).controller('crudUser', function($scope) {
    // Show add user form
    $('.btn-add').click(() => {
        $('#prd-form').addClass('d-none').siblings().removeClass('d-none');
    })

    $('.btn-cancle').click(() => {
        $('#prd-form').removeClass('d-none').siblings().addClass('d-none');
    })

    // thumbnail image
    thumbnailHandle('input#uploadFile', '#addForm')
    thumbnailHandle('input#uploadFileEdit', '#editForm')

    // checkFormData
    checkDuplicateForm('#addForm input[name="username"]', 'Username was existed', 'username', 1, 'register.php')
    checkDuplicateForm('#addForm input[name="email"]', 'Email was existed', 'email', 1, 'register.php')
    checkDuplicateForm('#addForm input[name="phone"]', 'Phone was existed', 'phone', 1, 'register.php')
    checkDuplicateForm('#addForm input[name="password"]', 0, "register.php")
    checkDuplicateForm('#addForm input[name="fullname"]', 0, "register.php")
    checkDuplicateForm('#addForm input[name="address"]', 0, "register.php")


    // Add user
    $('#addForm').submit(function(e) {
        e.preventDefault();
        var data = new FormData(this)
        data.append('addUser', 'true');
        console.log(data.get('username'))
        $.ajax({
            url: './cusManage.php',
            type: 'POST',
            async: false,
            data: data,
            processData: false,
            contentType: false,
            success: function(res) {
                console.log(res)
                switch (res) {
                    case '23000':
                        alert('Có giá trị đã tồn tại, vui lòng kiểm tra lại!');
                        break;
                    case '1':
                        alert('Thêm sản phẩm thành công!');
                        $('#addForm')[0].reset()
                        thumbnailHandle('', '#addForm')
                        $('#addForm input').removeClass('border-success');
                        removePrd();
                        checkInputAll();
                        getPrdToEdit();
                        pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');
                        break;
                    case '2':
                        alert('Lỗi upload file ảnh do ảnh đã tồn tại, định dạng không đúng...');
                        break;
                }
            }
        })
    })

    // remove user
    $scope.removeHandle = function(id, pathImg) {
        let check = confirm('Are you sure you want to delete this user?')
        if (check) {
            $.post('./cusManage.php', { removeUser: true, id: id, path: pathImg }, function(res) {
                if (res == 1) {
                    alert('Remove user successfully!')
                } else if (res == 0) {
                    alert('Remove user failed!')
                }
            })
        }
    }



    // Render user to table
    var renderUser = function() {
        $.ajax({
            url: './cusManage.php',
            type: 'POST',
            cache: false,
            async: false,
            dataType: 'json',
            data: { getUserInPage: true },
            success: function(res) {
                $scope.userArr = res
            }
        })

        // removePrd();
        // checkInputAll();
        // getPrdToEdit();
    }
    renderUser()

    // Pagination
    $scope.curPage = 1
    $scope.recordInPage = 10;
    $scope.start = $scope.recordInPage * ($scope.curPage - 1) + 1
    $scope.limit = $scope.curPage * $scope.recordInPage
    $scope.totalRecord = $scope.userArr.length
    let total = Math.ceil($scope.totalRecord / $scope.recordInPage)
    let range = []
    for (let i = 1; i <= total; i++) {
        range.push(i);
    }
    $scope.totalPage = range

    if ($scope.totalRecord < $scope.limit) {
        $scope.limit = $scope.totalRecord
    }

    $scope.pagingHandle = function(cur_page) {
        $scope.curPage = cur_page
        console.log(cur_page)
    }


})

$('.sidebar-body ul li').click(function() {
    $(this).addClass('sidebar-body--active ').siblings().removeClass('sidebar-body--active ');
    let index = $('.sidebar-body ul li').toArray().indexOf(this);
    if (index == 1) {
        $('#prd-form').removeClass('d-none').siblings().addClass('d-none');
    }
})

function readURL(input, thumbimage, thumbnailBtn) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $(thumbimage).removeAttr('src')
            $(thumbimage).attr('src', e.target.result);
            $(thumbimage).removeClass('d-none')
            $(thumbnailBtn).removeClass('d-none')
        }
        reader.readAsDataURL(input.files[0]);
    }
}

var thumbnailHandle = function(nameQuery, formID) {
    $(nameQuery).on('change', function() {
        readURL(this, `${formID} .thumbnail img`, `${formID} .btn-delThumbnail`)
    })
    var removeThumbnail = function(formID) {
        $(`${formID} .thumbnail img`).removeAttr('src');
        $(`${formID} .thumbnail img`).addClass('d-none');
        $(`${formID} .btn-delThumbnail`).addClass('d-none');
    }
    removeThumbnail(formID)
    $(`${formID} .btn-delThumbnail`).click(function() {
        removeThumbnail(formID);
    })
}