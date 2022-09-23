// // Remove user
// var removePrd = function() {
//     $('.trash').click(function() {
//         prdID = $(this).parents('tr').attr('id');
//         pathImg = $(this).parents('td').siblings('.prd-img').children('img').attr('src')
//         confirmDel = confirm('Are you sure you want to remove this product?');
//         if (confirmDel == true) {
//             $.post('cusManage.php', { delPrd: 'true', id: prdID, path: pathImg }, function(res) {
//                 if (res == 1) {
//                     $('.render-table table tbody').children(`tr#${prdID}`).remove()
//                 } else if (res == 0) {
//                     alert('Delete product failed!');
//                 }
//             })
//         }
//     })
// }


// // Remove user by check input
// var checkInputAll = function() {
//     $('input[name="checkAll"]').click(function() {
//         if ($(this).is(':checked')) {
//             $('.prd-check input').each((index, val) => {
//                 val.checked = true;
//             })
//         } else {
//             $('.prd-check input').each((index, val) => {
//                 val.checked = false;
//             })
//         }
//     })
// }

// var removePrdCheck = function() {
//     $('.btn-delprd').click(function() {
//         let checkArr = new Array();
//         let imgArr = new Array();
//         $('.prd-check input').each((index, val) => {
//             if ($(val).is(':checked')) {
//                 checkArr.push($(val).parents('tr').attr('id'));
//                 imgArr.push($(val).parent().siblings('.prd-img').children('img').attr('src'))
//             }
//         })

//         if (checkArr.length != 0) {
//             checkConfirm = confirm('Are you sure you want to remove products above?');
//             if (checkConfirm) {
//                 $.post('cusManage.php', { removeAll: true, removeArr: checkArr, imgArr: imgArr }, function(res) {
//                     if (res == 1) {
//                         $('input[name="checkAll"]')[0].checked = false;
//                         $(checkArr).each((index, val) => {
//                             $('.render-table table tbody').children(`tr#${val}`).remove()
//                         })

//                         pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');
//                     } else if (res == 0) {
//                         alert('Delete product failed!');
//                     }
//                 })
//             }
//         }
//     })
// }
// removePrdCheck();

// // Modify user
// let oldPath;
// let prdID;
// var rendereditForm = function(prdID) {
//     prdID = prdID
//     $.post('cusManage.php', { getPrd: true, prdID: prdID }, function(res) {
//         row = JSON.parse(res)[0];
//         $('#editForm').data('id', row.id)
//         $('#prdName').val(row.product_name)
//         $('#prdQuantity').val(row.product_quantity)
//         $('#prdQuality').val(row.product_quality)
//         $('#prdCate').children().each((index, val) => {
//             if ($(val).val() == row.product_cate) $(val)[0].selected = true;
//         })
//         $('#prdBrand').children().each((index, val) => {
//             if ($(val).val() == row.product_brand) $(val)[0].selected = true;
//         })
//         $('#prdStatus').children().each((index, val) => {
//             if ($(val).val() == row.product_status) $(val)[0].selected = true;
//         })
//         $('#prdMaterial').children().each((index, val) => {
//             if ($(val).val() == row.product_material) $(val)[0].selected = true;
//         })
//         $('#prdPrice').val(row.product_price)
//         $('#prdDiscount').val(row.product_discount)
//         $('#editForm .thumbnail img').removeClass('d-none').attr('src', row.product_avt).siblings().removeClass('d-none')
//         oldPath = $('#editForm .thumbnail img').attr('src');
//         $('#editForm .nicEdit-main')[0].innerText = row.product_describe
//         $('#prdDescribeEdit').val(row.product_describe)
//     })
// }
// var getPrdToEdit = function() {
//     $('button.edit').click(function() {
//         let id = $(this).parents('tr').attr('id');
//         rendereditForm(id)
//     })
// }

// $('#editForm').submit(function(e) {
//     e.preventDefault();
//     var data = new FormData(this);
//     let id = $(this).data('id');
//     data.append('editPrd', true);
//     data.append('prdID', $(this).data('id'))
//     data.append('path', oldPath);
//     $.ajax({
//         url: './cusManage.php',
//         type: 'POST',
//         data: data,
//         processData: false,
//         contentType: false,
//         success: function(res) {
//             if (res == 0) {
//                 alert('Cập nhật thông tin sản phẩm thất bại!')
//             } else if (res == 2) {
//                 alert('Lỗi upload file ảnh do ảnh đã tồn tại, định dạng không đúng...');
//             } else {
//                 alert('Cập nhật thông tin sản phẩm thành công!')
//                 rendereditForm(id)
//                 $('#uploadFileEdit').val(null)
//                 pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');
//             }
//         }
//     })
// })

// // Search user
// let searchVal = '';
// $('#admin-prdSearch').keyup(function(e) {
//     searchVal = $(this).val();
//     if (searchVal == '') {
//         pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');
//         pagingBtn(cur_page)

//     } else {
//         cur_page = 1;
//         pagingPrd(cur_page, record_inPage, { getTotalPrdSearch: true, searchVal: searchVal }, 's');
//         pagingBtn(cur_page)
//     }
// })




// // Pagination
// let record_inPage = $('select[name="tabLength"]').val();
// let total_record;
// let total_page;
// let cur_page = 1;
// let start;
// let limit;

// var pagingPrd = function(cur_page, record_inPage, dataTotalRecord, mode) {
//     $.ajax({
//         url: './cusManage.php',
//         type: 'POST',
//         async: false,
//         data: dataTotalRecord,
//         dataType: 'text',
//         success: function(res) {
//             total_record = res
//         }
//     })

//     total_page = Math.ceil(total_record / record_inPage);
//     $('.page-lst').children().remove()
//     for (let i = 1; i <= total_page; i++) {
//         if (i == cur_page) {
//             $('.page-lst').append(`<span class = "border-start border-end pt-2 pb-2 ps-3 pe-3 page--active" >${i}`)
//         } else {
//             $('.page-lst').append(`<span class = "border-start border-end pt-2 pb-2 ps-3 pe-3 hover-page" >${i}`)
//         }
//     }

//     start = record_inPage * (cur_page - 1);
//     limit = cur_page * record_inPage;
//     switch (mode) {
//         case 's':
//             renderPrd('.render-table table tbody', false, { searchPrd: true, searchVal: searchVal, start: start, limit: limit });
//             break;
//         case 'n':
//             renderPrd('.render-table table tbody', false, { getPrdInPage: true, start: start, limit: limit });
//     }
//     let countPrdInPage = $('.render-foot__view span');
//     countPrdInPage[0].innerText = start + 1;
//     countPrdInPage[1].innerText = total_record >= limit ? limit : total_record
//     countPrdInPage[2].innerText = total_record

// }
// pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');

// $('select[name="tabLength"]').change(function(e) {
//     record_inPage = $(this).val();
//     if (record_inPage > total_record) {
//         cur_page = 1;
//     }
//     if (searchVal != '') {
//         pagingPrd(cur_page, record_inPage, { getTotalPrdSearch: true, searchVal: searchVal }, 's');
//     } else {
//         pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');
//     }
//     pagingBtn(cur_page)
// })

// var pagingBtn = function(cur_page) {
//     if (cur_page > 1 && cur_page < total_page) {
//         $('.render-page__foot__pagnigation .btn-prev, .render-page__foot__pagnigation .btn-next').addClass('hover-page').removeClass('page--disable')
//     } else {
//         if (cur_page == 1) {
//             $('.render-page__foot__pagnigation .btn-prev').addClass('page--disable').removeClass('hover-page')
//             $('.render-page__foot__pagnigation .btn-next').addClass('hover-page').removeClass('page--disable')
//         }
//         if (cur_page == total_page) {
//             $('.render-page__foot__pagnigation .btn-next').addClass('page--disable').removeClass('hover-page')
//             $('.render-page__foot__pagnigation .btn-prev').addClass('hover-page').removeClass('page--disable')
//         }
//         if (cur_page == 1 && cur_page == total_page) {
//             $('.render-page__foot__pagnigation .btn-prev').addClass('page--disable').removeClass('hover-page')
//             $('.render-page__foot__pagnigation .btn-next').addClass('page--disable').removeClass('hover-page')
//         }
//     }

// }
// pagingBtn(cur_page)

// var pagingHandle = function() {
//     $('.render-page__foot__pagnigation .btn-next').click(function() {
//         if (cur_page < total_page) {
//             cur_page = $('.page-lst').find('.page--active').next()[0].innerText
//             $('.page-lst').find('.page--active').removeClass('page--active').next().addClass('page--active')
//             pagingBtn(cur_page);
//             if (searchVal == '') {
//                 pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');
//             } else {
//                 pagingPrd(cur_page, record_inPage, { getTotalPrdSearch: true, searchVal: searchVal }, 's');
//             }
//         }
//     })

//     $('.render-page__foot__pagnigation .btn-prev').click(function() {
//         if (cur_page > 1) {
//             cur_page = $('.page-lst').find('.page--active').prev()[0].innerText
//             $('.page-lst').find('.page--active').removeClass('page--active').prev().addClass('page--active')
//             pagingBtn(cur_page);
//             if (searchVal == '') {
//                 pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');
//             } else {
//                 pagingPrd(cur_page, record_inPage, { getTotalPrdSearch: true, searchVal: searchVal }, 's');
//             }
//         }
//     })

//     $('.page-lst').click(function(e) {
//         $(e.target).addClass('page--active').removeClass('hover-page').siblings().addClass('hover-page').removeClass('page--active')
//         cur_page = $(e.target)[0].innerText
//         pagingBtn(cur_page);
//         if (searchVal == '') {
//             pagingPrd(cur_page, record_inPage, { getTotalPrd: true }, 'n');
//         } else {
//             pagingPrd(cur_page, record_inPage, { getTotalPrdSearch: true, searchVal: searchVal }, 's');
//         }
//     })
// }
// pagingHandle()