$(document).ready(function() {
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
    thumbnailHandle('input#uploadFile', '#addPrdForm')
    thumbnailHandle('input#uploadFileEdit', '#editForm')

    // Show add product form
    $('.btn-addprd').click(() => {
        $('#prd-form').addClass('d-none').siblings().removeClass('d-none');
    })

    $('.btn-cancle').click(() => {
        $('#prd-form').removeClass('d-none').siblings().addClass('d-none');
    })


    // Render select value
    var renderSelect = function(nameSelect, nameType) {
        $.post('prdManage.php', { renderSelect: `${nameType}` }, function(res) {
            row = JSON.parse(res);
            $(nameSelect).children().toArray().forEach((elm, index) => {
                if (index > 0) {
                    elm.remove();
                }
            })
            row.forEach(element => {
                $(nameSelect).append(`<option value=${element[0]}>${element[1]}</option>`);
            });
        })
    }
    renderSelect('#cate-fields', 'cate');
    renderSelect('#brand-fields', 'brand');
    renderSelect('#status-fields', 'status');
    renderSelect('#material-fields', 'material');
    renderSelect('#prdCate', 'cate');
    renderSelect('#prdBrand', 'brand');
    renderSelect('#prdStatus', 'status');
    renderSelect('#prdMaterial', 'material');

    // Add value select
    var addPrdSelect = function(nameClick, nameInput, nameType, nameSelect) {
        let checkAdd = 0;
        $(nameClick).click(function(e) {
            valItem = $(nameInput).val();
            if (valItem == '' && checkAdd == 0) {
                $(nameInput).parent().append('<div style="color:red;">This field can not empty!</div>')
                $(nameInput).removeAttr('style').addClass('border')
                checkAdd = 1;
            } else if (valItem != '') {
                $(nameInput).siblings('div').remove();
                $(nameInput).removeClass('border').css('border', '1px solid #7fffd4');
                checkAdd = 0;

                $.post('prdManage.php', { addPrdSelect: nameType, name: valItem }, function(res) {
                    switch (res) {
                        case 'cate':
                            alert('Add category succcesfully');
                            $(nameInput).val('');
                            break;
                        case 'brand':
                            alert('Add brand succcesfully');
                            $(nameInput).val('');
                            break;
                        case 'status':
                            alert('Add status succcesfully');
                            $(nameInput).val('');
                            break;
                        case 'material':
                            alert('Add material succcesfully');
                            $(nameInput).val('');
                            break;
                    }

                    renderSelect(nameSelect, nameType)
                })
            }
        })
    }
    addPrdSelect('button#btn-addCate', 'input[name="new_cate"]', 'cate', '#cate-fields');
    addPrdSelect('button#btn-addBrand', 'input[name="new_brand"]', 'brand', '#brand-fields')
    addPrdSelect('button#btn-addStatus', 'input[name="new_status"]', 'status', '#status-fields')
    addPrdSelect('button#btn-addMaterial', 'input[name="new_material"]', 'material', '#material-fields')

    // Add product
    $('#addPrdForm').submit(function(e) {
        e.preventDefault();
        var data = new FormData(this)
        data.append('addPrd', 'true');
        $.ajax({
            url: './prdManage.php',
            type: 'POST',
            async: false,
            data: data,
            processData: false,
            contentType: false,
            success: function(res) {
                switch (res) {
                    case '23000':
                        alert('Tên sản phẩm đã tồn tại vui lòng nhập tên khác!');
                        break;
                    case '1':
                        alert('Thêm sản phẩm thành công!');
                        $('#addPrdForm')[0].reset()
                        thumbnailHandle('', '#addPrdForm')
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

    // Remove product
    var removePrd = function() {
        $('.trash').click(function() {
            prdID = $(this).parents('tr').attr('id');
            pathImg = $(this).parents('td').siblings('.prd-img').children('img').attr('src')
            confirmDel = confirm('Are you sure you want to remove this product?');
            if (confirmDel == true) {
                $.post('prdManage.php', { delPrd: 'true', id: prdID, path: pathImg }, function(res) {
                    if (res == 1) {
                        $('.render-table table tbody').children(`tr#${prdID}`).remove()
                        pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');
                    } else if (res == 0) {
                        alert('Delete product failed!');
                    }
                })
            }
        })
    }


    // Remove product by check input
    var checkInputAll = function() {
        $('input[name="checkAll"]').click(function() {
            if ($(this).is(':checked')) {
                $('.prd-check input').each((index, val) => {
                    val.checked = true;
                })
            } else {
                $('.prd-check input').each((index, val) => {
                    val.checked = false;
                })
            }
        })
    }

    var removePrdCheck = function() {
        $('.btn-delprd').click(function() {
            let checkArr = new Array();
            let imgArr = new Array();
            $('.prd-check input').each((index, val) => {
                if ($(val).is(':checked')) {
                    checkArr.push($(val).parents('tr').attr('id'));
                    imgArr.push($(val).parent().siblings('.prd-img').children('img').attr('src'))
                }
            })

            if (checkArr.length != 0) {
                checkConfirm = confirm('Are you sure you want to remove products above?');
                if (checkConfirm) {
                    $.post('prdManage.php', { removeAll: true, removeArr: checkArr, imgArr: imgArr }, function(res) {
                        if (res == 1) {
                            $('input[name="checkAll"]')[0].checked = false;
                            $(checkArr).each((index, val) => {
                                $('.render-table table tbody').children(`tr#${val}`).remove()
                            })

                            pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');
                        } else if (res == 0) {
                            alert('Delete product failed!');
                        }
                    })
                }
            }
        })
    }
    removePrdCheck();

    // Modify product
    let oldPath;
    let prdID;
    var renderEditForm = function(prdID) {
        prdID = prdID
        $.post('prdManage.php', { getPrd: true, prdID: prdID }, function(res) {
            row = JSON.parse(res)[0];
            $('#editForm').data('id', row.id)
            $('#prdName').val(row.product_name)
            $('#prdQuantity').val(row.product_quantity)
            $('#prdQuality').val(row.product_quality)
            $('#prdCate').children().each((index, val) => {
                if ($(val).val() == row.product_cate) $(val)[0].selected = true;
            })
            $('#prdBrand').children().each((index, val) => {
                if ($(val).val() == row.product_brand) $(val)[0].selected = true;
            })
            $('#prdStatus').children().each((index, val) => {
                if ($(val).val() == row.product_status) $(val)[0].selected = true;
            })
            $('#prdMaterial').children().each((index, val) => {
                if ($(val).val() == row.product_material) $(val)[0].selected = true;
            })
            $('#prdPrice').val(row.product_price)
            $('#prdDiscount').val(row.product_discount)
            $('#editForm .thumbnail img').removeClass('d-none').attr('src', row.product_avt).siblings().removeClass('d-none')
            oldPath = $('#editForm .thumbnail img').attr('src');
            $('#prdDescribeEdit')[0].innerText = row.product_describe
        })
    }
    var getPrdToEdit = function() {
        $('button.edit').click(function() {
            let id = $(this).parents('tr').attr('id');
            renderEditForm(id)
        })
    }

    $('#editForm').submit(function(e) {
        e.preventDefault();
        var data = new FormData(this);
        let id = $(this).data('id');
        data.append('editPrd', true);
        data.append('prdID', $(this).data('id'))
        data.append('path', oldPath);
        $.ajax({
            url: './prdManage.php',
            type: 'POST',
            data: data,
            processData: false,
            contentType: false,
            success: function(res) {
                console.log(res)
                switch (res) {
                    case '0':
                        alert('Cập nhật thông tin sản phẩm thất bại!')
                        break;

                    case '2':
                        alert('Lỗi upload file ảnh do ảnh đã tồn tại, định dạng không đúng...');
                        break;
                    case '1':
                        alert('Cập nhật thông tin sản phẩm thành công!')
                        renderEditForm(id)
                        $('#uploadFileEdit').val(null)
                        pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');
                }
            }
        })
    })

    // Search product
    let searchVal = '';
    $('#admin-prdSearch').keyup(function(e) {
        searchVal = $(this).val();
        if (searchVal == '') {
            pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');
            pagingBtn(cur_page)

        } else {
            cur_page = 1;
            pagingPrd(cur_page, record_inPage, { getTotalPrdSearch: true, searchVal: searchVal }, 's');
            pagingBtn(cur_page)
        }
    })

    // Render product to table
    var renderPrd = function(nameQuery, option, data) {
        $.ajax({
            url: './prdManage.php',
            type: 'POST',
            cache: false,
            async: option,
            dataType: 'json',
            data: data,
            success: function(res) {
                row = res;
                $(nameQuery).children('tr').remove();
                row.forEach((elm, index) => {
                    $(nameQuery).append(`
                            <tr id="${elm.id}">
                                <td class="p-2 border prd-check text-center"><input type="checkbox"></td>
                                <td class="p-2 border prd-code">${elm.id}</td>
                                <td class="p-2 border prd-name">${elm.product_name}</td>
                                <td class="p-2 border prd-img"><img src="${elm.product_avt}" width="20%" alt=""></td>
                                <td class="p-2 border prd-quantity">${elm.product_quantity}</td>
                                <td class="p-2 border prd-status">
                                    <div><span>${elm.status_name}</span></div>
                                </td>
                                <td class="p-2 border prd-price">${'$' + elm.product_price}</td>
                                <td class="p-2 border prd-cate">${elm.cate_name}</td>
                                <td class="p-2 border prd-options" style="white-space:nowrap;">
                                    <button class="trash pt-1 pb-1 ps-2 pe-2 border radius-input btn--active">
                                        <i class="fa-solid fa-trash-can"></i>
                                    </button>
                                    <button class="edit pt-1 pb-1 ps-2 pe-2 border radius-input btn--active" data-bs-toggle="modal" data-bs-target="#EditPrdModal">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </button>
                                </td>
                            </tr>
                        `)
                })

            }
        })
        removePrd();
        checkInputAll();
        getPrdToEdit();
    }


    // Pagination
    let record_inPage = $('select[name="tabLength"]').val();
    let total_record;
    let total_page;
    let cur_page = 1;
    let start;
    let limit;

    var pagingPrd = function(cur_page, record_inPage, dataTotalRecord, mode) {
        $.ajax({
            url: './prdManage.php',
            type: 'POST',
            async: false,
            data: dataTotalRecord,
            dataType: 'text',
            success: function(res) {
                total_record = res
            }
        })

        total_page = Math.ceil(total_record / record_inPage);
        $('.page-lst').children().remove()
        for (let i = 1; i <= total_page; i++) {
            if (i == cur_page) {
                $('.page-lst').append(`<span class = "border-start border-end pt-2 pb-2 ps-3 pe-3 page--active" >${i}`)
            } else {
                $('.page-lst').append(`<span class = "border-start border-end pt-2 pb-2 ps-3 pe-3 hover-page" >${i}`)
            }
        }

        start = record_inPage * (cur_page - 1);
        limit = cur_page * record_inPage;
        switch (mode) {
            case 's':
                renderPrd('.render-table table tbody', false, { searchPrd: true, searchVal: searchVal, start: start, limit: limit });
                break;
            case 'n':
                renderPrd('.render-table table tbody', false, { getPrdInPage: true, start: start, limit: limit });
        }
        let countPrdInPage = $('.render-foot__view span');
        countPrdInPage[0].innerText = start + 1;
        countPrdInPage[1].innerText = total_record >= limit ? limit : total_record
        countPrdInPage[2].innerText = total_record

    }
    pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');

    $('select[name="tabLength"]').change(function(e) {
        record_inPage = $(this).val();
        if (record_inPage > total_record) {
            cur_page = 1;
        }
        if (searchVal != '') {
            pagingPrd(cur_page, record_inPage, { getTotalPrdSearch: true, searchVal: searchVal }, 's');
        } else {
            pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');
        }
        pagingBtn(cur_page)
    })

    var pagingBtn = function(cur_page) {
        if (cur_page > 1 && cur_page < total_page) {
            $('.render-page__foot__pagnigation .btn-prev, .render-page__foot__pagnigation .btn-next').addClass('hover-page').removeClass('page--disable')
        } else {
            if (cur_page == 1) {
                $('.render-page__foot__pagnigation .btn-prev').addClass('page--disable').removeClass('hover-page')
                $('.render-page__foot__pagnigation .btn-next').addClass('hover-page').removeClass('page--disable')
            }
            if (cur_page == total_page) {
                $('.render-page__foot__pagnigation .btn-next').addClass('page--disable').removeClass('hover-page')
                $('.render-page__foot__pagnigation .btn-prev').addClass('hover-page').removeClass('page--disable')
            }
            if (cur_page == 1 && cur_page == total_page) {
                $('.render-page__foot__pagnigation .btn-prev').addClass('page--disable').removeClass('hover-page')
                $('.render-page__foot__pagnigation .btn-next').addClass('page--disable').removeClass('hover-page')
            }
        }

    }
    pagingBtn(cur_page)

    var pagingHandle = function() {
        $('.render-page__foot__pagnigation .btn-next').click(function() {
            if (cur_page < total_page) {
                cur_page = $('.page-lst').find('.page--active').next()[0].innerText
                $('.page-lst').find('.page--active').removeClass('page--active').next().addClass('page--active')
                pagingBtn(cur_page);
                if (searchVal == '') {
                    pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');
                } else {
                    pagingPrd(cur_page, record_inPage, { getTotalPrdSearch: true, searchVal: searchVal }, 's');
                }
            }
        })

        $('.render-page__foot__pagnigation .btn-prev').click(function() {
            if (cur_page > 1) {
                cur_page = $('.page-lst').find('.page--active').prev()[0].innerText
                $('.page-lst').find('.page--active').removeClass('page--active').prev().addClass('page--active')
                pagingBtn(cur_page);
                if (searchVal == '') {
                    pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');
                } else {
                    pagingPrd(cur_page, record_inPage, { getTotalPrdSearch: true, searchVal: searchVal }, 's');
                }
            }
        })

        $('.page-lst').click(function(e) {
            $(e.target).addClass('page--active').removeClass('hover-page').siblings().addClass('hover-page').removeClass('page--active')
            cur_page = $(e.target)[0].innerText
            pagingBtn(cur_page);
            if (searchVal == '') {
                pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');
            } else {
                pagingPrd(cur_page, record_inPage, { getTotalPrdSearch: true, searchVal: searchVal }, 's');
            }
        })
    }
    pagingHandle()

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