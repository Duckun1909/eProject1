var myApp = angular.module("myApp", [])
myApp
    .controller('adjustTitle', function($rootScope) {
        $rootScope.titelPage = 'Home';
    })
    .controller('includePage', function($scope, $rootScope, $compile) {
        let timestamp = new Date()
        $rootScope.date = `${timestamp.getFullYear()}/${timestamp.getMonth()+1}/${timestamp.getDate()}`;
        $rootScope.loader = function() {
            window.scrollTo(0, 0)
            $('.user_own').removeClass('user_own--flipInX').addClass('search_bar--zoomOut')
            $('.loader').removeClass('d-none');
            setTimeout(function() {
                $('.loader').addClass('d-none');
            }, 2000)
        }
        $('.btn-gotofirst').click(() => {
            window.scrollTo(0, 0)
        })
        $rootScope.elementUrl = './home.html'
        $rootScope.includeHandle = function(index, cateID = null) {
            switch (index) {
                case 0:
                    $rootScope.elementUrl = './home.html'
                    $rootScope.checkLogin()
                    $rootScope.titelPage = 'Home'
                    $rootScope.loader()
                    $rootScope.getCart()
                    break;
                case 1:
                    $rootScope.elementUrl = './aboutUs.html';
                    $rootScope.checkLogin()
                    $rootScope.titelPage = 'About Us'
                    $rootScope.loader()
                    $rootScope.getCart()
                    break;
                case 2:
                    $rootScope.elementUrl = './product.html';
                    $rootScope.checkLogin()
                    $rootScope.titelPage = 'Product'
                    $rootScope.loader()
                    $rootScope.getCart()
                    if (cateID != null) {
                        $rootScope.cateID = cateID
                    }
                    break
                case 5:
                    $rootScope.elementUrl = './contact.html';
                    $rootScope.checkLogin()
                    $rootScope.titelPage = 'Contact Us'
                    $rootScope.loader()
                    $rootScope.getCart()
                    break;
                case 6:
                    $rootScope.elementUrl = './login.html';
                    $rootScope.checkLogin()
                    $rootScope.titelPage = 'Login'
                    $rootScope.loader()
                    $rootScope.getCart()
                    break;
                case 7:
                    $rootScope.elementUrl = './register.html';
                    $rootScope.checkLogin()
                    $rootScope.titelPage = 'Register'
                    $rootScope.loader()
                    $rootScope.getCart()
                    break;
                case 8:
                    $rootScope.elementUrl = './profile.html';
                    $rootScope.checkLogin()
                    $rootScope.titelPage = 'Profile'
                    $rootScope.loader()
                    $rootScope.getCart()
                    break;
                case 9:
                    $rootScope.checkLogin()
                    $rootScope.getCart()
                    if ($rootScope.check) {
                        $rootScope.elementUrl = './cart.html';
                        $rootScope.titelPage = 'Cart'
                        $rootScope.loader()
                    } else {
                        alert('Please login to use this function!')
                    }
                    break;
                case 10:
                    $rootScope.elementUrl = './product_details.html';
                    $rootScope.checkLogin()
                    $rootScope.titelPage = 'Product'
                    $rootScope.loader()
                    $rootScope.getCart()
                    break;
                case 11:
                    $rootScope.elementUrl = './checkout.html';
                    $rootScope.checkLogin()
                    $rootScope.titelPage = 'Checkout'
                    $rootScope.loader()
                    $rootScope.getCart()
                    break;
            }
        }

        $rootScope.checkLogin = function() {
            $rootScope.check = false
            $rootScope.userid = null
            $rootScope.user = null
            $.ajax({
                url: './login.php',
                type: 'post',
                cache: false,
                async: false,
                dataType: 'json',
                data: { checkLogin: true },
                success: function(res) {
                    if (res != null) {
                        $rootScope.userid = res.user[1]
                        $rootScope.user = res.user[0]
                        $rootScope.check = res.login
                    }
                }
            })
            console.log($rootScope.userid)


            if ($rootScope.check) {
                $('.user_own').html($compile(`
                <ul class="text-center">
                    <li class="mb-2" ng-click="includeHandle(8)"><a class="ps-5 pe-5 hover_link btn-profile">Profile</a></li>
                    <li class="mb-2" ng-click="includeHandle(8)"><a class="ps-5 pe-5 hover_link btn-favourite">Favourite</a></li>
                    <li  ng-click="logoutHandle()"><a class="ps-5 pe-5 hover_link btn-logout">Log out</a></li>
                </ul>
                `)($scope))
            } else {
                $('.user_own').html($compile(`
                <ul class="text-center">
                    <li class="mb-2" ng-click="includeHandle(6)"><a class="ps-5 pe-5 hover_link btn-login">Login</a></li>
                    <li class="mb-2" ng-click="includeHandle(7)"><a class="ps-5 pe-5 hover_link btn-register">Register</a></li>
                    <li ng-click="includeHandle(6)"><a class="ps-5 pe-5 hover_link btn-favourite">Favourite</a></li>
                </ul>
                `)($scope))
            }
        }
        $rootScope.checkLogin()

        $scope.logoutHandle = function() {
            $.ajax({
                url: './login.php',
                type: 'post',
                cache: false,
                async: false,
                dataType: 'text',
                data: { logout: true },
                success: function(res) {
                    if (res == 1) {
                        $rootScope.includeHandle(6)
                    }
                }
            })
            $rootScope.checkLogin()
            $rootScope.loader()
        }
    })
    .controller('renderPrd', function($scope, $rootScope) {
        $rootScope.cateID
        let prdArr = []
        $.ajax({
            url: './home.php',
            type: 'post',
            cache: false,
            async: false,
            data: { getPrd: true },
            success: function(res) {
                prdArr = JSON.parse(res)
            }
        })
        $scope.product = prdArr;


        // Render product details
        $scope.prdDetailHandle = function(id, mode = null) {
            $rootScope.prdQuanCart = 1
            $rootScope.detaidID = id
            $rootScope.prdDetail = prdArr.filter(function(item) {
                if (item.id == id) {
                    return item;
                }
            })

            $.ajax({
                url: './home.php',
                type: 'post',
                cache: false,
                async: false,
                data: { getGallery: true, prdID: id },
                success: function(res) {
                    $rootScope.gallery = JSON.parse(res)
                }
            })

            if (mode == 'gotodetail') {
                $rootScope.includeHandle(10)
                $rootScope.loader()
            }
        }
    })
    .controller('cateLink', function($scope) {
        $.post('./home.php', { getCate: true }, function(res) {

            $scope.categories = JSON.parse(res)
        })
    })
    .controller('login', function($scope, $rootScope) {
        $scope.username
        $scope.password
        $scope.loginSubmit = function() {
            var form = new FormData();
            form.append('username', $scope.username)
            form.append('password', $scope.password)
            form.append('login', 'true');
            $.ajax({
                url: './login.php',
                type: 'POST',
                data: form,
                cache: false,
                processData: false,
                contentType: false,
                success: function(res) {
                    if (res == 1) {
                        $rootScope.checkLogin()
                        alert('Đăng nhập thành công!');
                        $('#loginForm')[0].reset();
                        $rootScope.includeHandle(8)
                        $rootScope.loader()
                    } else {
                        alert('Đăng nhập thất bại, vui lòng kiểm tra lại thông tin');
                    }
                }
            })
        }
    })
    .controller('comment', function($scope, $rootScope, $compile) {
        $scope.sortDate = '-cmt_date'

        // Get Comment
        var getComment = function() {
            $.ajax({
                url: './home.php',
                type: 'post',
                cache: false,
                dataType: 'json',
                async: false,
                data: { getComment: true },
                success: function(res) {
                    $scope.cmtArr = res;
                    $rootScope.cmtQuan = $scope.cmtArr.length
                }
            })
        }
        getComment()

        // Add Comment
        $scope.content
        $scope.addComment = function() {
            console.log(1)
            console.log($rootScope.check)
            if ($rootScope.check == true) {
                $.ajax({
                    url: './home.php',
                    type: 'post',
                    cache: false,
                    async: false,
                    data: { addComment: true, userid: $rootScope.userid, content: $scope.content, date: $rootScope.date, prdID: $rootScope.detaidID },
                    success: function(res) {
                        if (res == 1) {
                            $('#contentCmt').val('')
                            getComment()
                        }
                    }
                })
            } else {
                alert('Please login to use this function!')
            }
        }

        // Remove comment
        $scope.removeCmt = function(cmtID, userID) {
            console.log(cmtID, userID)
            if (userID == $rootScope.userid && $rootScope.check == true) {
                $.ajax({
                    url: './home.php',
                    type: 'post',
                    cache: false,
                    async: false,
                    data: { removeCmt: cmtID },
                    success: function(res) {
                        if (res == 1) {
                            getComment()
                        }
                    }
                })
            }
        }

        // Update comment
        $scope.updateCmt = function(cmtID, userID) {
            $scope.cmtID = cmtID
            $scope.contentEdit
            if (userID == $rootScope.userid && $rootScope.check == true) {
                $scope.selectCmt = `#cmt${cmtID}`;
                $scope.contentEdit = $($scope.selectCmt).find('p')[0].innerText
                $($scope.selectCmt).html($compile(`
                <textarea class="border outline-unset ps-2 pe-2 w-100" name="contentCmt" id="contentCmt" cols="137" rows="5" ng-model="contentEdit"></textarea>
                <div class="w-100 bg-light p-2 text-end border border-top-0 d-block">
                    <button class="cmtPublic btn btn-primary btn-sm" ng-click="cancleEdit()">Cancle</button>
                    <button class="cmtPublic btn btn-primary btn-sm" ng-click="saveEdit()">Save</button>
                </div>
                `)($scope))
            }
        }

        $scope.cancleEdit = function() {
            $($scope.selectCmt).html($compile(`
            <div class="d-flex justify-content-between">
                <span class="text-primary fw-semibold">{{val.user_name}}</span>
                <label for="{{val.id}}" class="position-relative bg-white ps-2 pe-2" ng-show="{{userid!=val.user_id?false:true}}">
                    <i class="fa-solid fa-ellipsis-vertical"></i>
                    <input type="checkbox" hidden class="adjustCmt"  id="{{val.id}}">
                    <div class="cmtTool position-absolute end-0 border" style="z-index: 1;">
                        <ul>
                            <li class="cmtTool--hover text-center" ng-click="updateCmt(val.id, val.user_id)">Edit comment</li>
                            <li class="cmtTool--hover text-center" ng-click="removeCmt(val.id, val.user_id)">Delete comment</li>
                        </ul>
                    </div>
                </label>
            </div>
            <p class="text-break">{{val.content}}</p>
            `)($scope))
            getComment()
        }

        $scope.saveEdit = function() {
            $.ajax({
                url: './home.php',
                type: 'post',
                cache: false,
                async: false,
                data: { updateCmt: $scope.cmtID, contentEdit: $scope.contentEdit, date: $rootScope.date },
                success: function(res) {
                    if (res == 1) {
                        $scope.cancleEdit()
                    }
                }
            })
        }

    })
    .controller('cart', function($scope, $rootScope) {
        $rootScope.getCart = function() {
            $rootScope.totalCart = 0
            if ($rootScope.check) {
                $.ajax({
                    url: './cart.php',
                    type: 'post',
                    cache: false,
                    async: false,
                    data: { getCart: true, userid: $rootScope.userid },
                    success: function(res) {
                        $rootScope.prdCart = JSON.parse(res)
                        $rootScope.totalCart = $scope.prdCart.length
                        $rootScope.totalPrice = 0
                        $rootScope.prdCart.map(function(val) {
                            $rootScope.totalPrice += (val.quantity * val.product_price)
                        })
                    }
                })
            }
            console.log($rootScope.totalCart)
        }
        $rootScope.getCart()

        // Adjust quantity
        $rootScope.prdQuanCart = 1
        $scope.decreased = function(prdQuanCart) {
            if (prdQuanCart > 1) {
                $rootScope.prdQuanCart -= 1
            }
        }
        $scope.increased = function(total, prdQuanCart) {
            if (prdQuanCart < total) {
                $rootScope.prdQuanCart += 1
            }
        }

        // Adjust cart
        $scope.cartHandle = function(prdid, quantity, total) {
            if ($rootScope.check) {
                console.log(prdid, quantity)
                $.ajax({
                    url: './cart.php',
                    type: 'post',
                    cache: false,
                    async: false,
                    data: { addCart: true, prdid: prdid, quantity: quantity, userid: $rootScope.userid, total: total },
                    success: function(res) {
                        if (res == 1) {
                            alert('Add to cart successfully!')
                            $rootScope.prdQuanCart = 1
                            $scope.getCart()
                        } else if (res == 0) {
                            alert('The number of products purchased exceeds the quantity available')
                        }
                    }
                })
            } else {
                alert('Please login to use this function!')
            }
        }

        $scope.modifyCart = function(cartID, oldQuanCart, total, mode) {
            let newQuanCart = $(`#prdCart${cartID}`).val()
            if (mode == 'decreased') {
                $(`#prdCart${cartID}`).val(--newQuanCart)
            } else if (mode == 'increased') {
                $(`#prdCart${cartID}`).val(++newQuanCart)
            }
            if (newQuanCart != oldQuanCart && newQuanCart != '') {
                $.ajax({
                    url: './cart.php',
                    type: 'post',
                    cache: false,
                    async: false,
                    data: { modifyCart: true, newQuanCart: newQuanCart, cartID: cartID, total: total },
                    success: function(res) {
                        if (res == 1) {
                            alert('Update cart succesfully');
                            $scope.getCart()
                        } else if (res == 0) {
                            alert('The number of products purchased exceeds the quantity available')
                            $(`#prdCart${cartID}`).val(oldQuanCart)
                        }
                    }
                })
            } else {
                $(`#prdCart${cartID}`).val(oldQuanCart)
            }
        }


        // Remove cart
        $scope.removeCart = function(cartID) {
            $.ajax({
                url: './cart.php',
                type: 'post',
                cache: false,
                async: false,
                data: { removeCart: true, cartID: cartID },
                success: function(res) {
                    if (res == 1) {
                        $scope.getCart()
                    }
                }
            })
        }

        // Payment cart
        $scope.paymentCart = function() {

        }
    })
    .controller('product', function($scope, $rootScope) {
        $rootScope.limitPrd = 12
        $rootScope.searchName
        $rootScope.search
        $rootScope.sortPrd = '+product_name'
        $scope.getSomething = function(thing) {
            $.ajax({
                url: './home.php',
                type: 'post',
                cache: false,
                async: false,
                data: { getSomething: true, thing: thing },
                success: function(res) {
                    switch (thing) {
                        case 'brand':
                            $rootScope.brandArr = JSON.parse(res)
                            break;
                        case 'material':
                            $rootScope.mateArr = JSON.parse(res)
                    }
                }
            })
        }
        $scope.getSomething('brand')
        $scope.getSomething('material')

    })
    .controller('checkout', function($scope, $rootScope) {
        let checkoutDate = new Date();
        $scope.getUser = function(id) {
            $.ajax({
                url: './home.php',
                type: 'post',
                cache: false,
                async: false,
                data: { getUser: true, userid: id },
                success: function(res) {
                    $rootScope.user = JSON.parse(res)
                    console.log($rootScope.user)
                }
            })
        }
        $scope.getUser($rootScope.userid)

        $scope.copyInforUser = function(username, phone) {
            $scope.shippingName = username
            $scope.shippingPhone = phone
        }
        $scope.shippingAddress
        $scope.shippingNote = null
        $scope.showShippingFee = false
        $scope.checkAddress = function(address) {
            console.log(address)
            if (address == undefined || address == '') {
                $scope.showShippingFee = false
                $scope.shippingFee = null
            } else {
                $scope.showShippingFee = true
                $scope.shippingFee = 0
            }
        }

        $scope.addOrder = function(shippingName, shippingAddress, shippingPhone, shippingNote, userid) {
            $scope.shippingDate = `${$rootScope.date} ${checkoutDate.getHours()}:${checkoutDate.getMinutes()}:${checkoutDate.getSeconds()}`
            console.log($scope.shippingDate )
            $.ajax({
                url: './home.php',
                type: 'post',
                cache: false,
                async: false,
                data: { addOrder: true, shippingPhone: shippingPhone, shippingAddress: shippingAddress, shippingName: shippingName, shippingDate: $scope.shippingDate, shippingNote: shippingNote, user_id: userid },
                success: function(res) {
                    console.log(res)
                    if (res == 1) {
                        $scope.addOrderDetails(userid, $scope.shippingDate )
                        alert('Thank you for buying our product!')
                        includeHandle(0)
                    } else if (res === 0) {
                        alert('Please check your information!');
                    }
                }
            })
        }

        $scope.addOrderDetails = function(user_id, date) {
            $.ajax({
                url: './home.php',
                type: 'post',
                cache: false,
                async: false,
                data: { addOrderDetails: true, userid: user_id, date: date },
                success: function(res) {
                    console.log(res)
                    if (res == 1) {
                        $rootScope.getCart()
                        alert('Thank you for your purchase, please go to your profile to check your order information')
                        $rootScope.includeHandle(0)
                    }
                }
            })
        }

    })
    .filter('cmtFilter', function($rootScope) {
        return function(items, prdid) {
            let filtered = []
            items.forEach(elm => {
                if (elm.product_id == $rootScope.detaidID) {
                    filtered.push(elm);
                }
            })
            $rootScope.cmtQuan = filtered.length
            return filtered;
        }
    })
    .filter('cateFilter', function($rootScope) {
        return function(items, id) {
            let filtered = []
            items.forEach(elm => {
                if (id == '*') {
                    filtered.push(elm)
                } else if (elm.product_cate == id) {
                    filtered.push(elm);
                }
            });

            return filtered
        }
    })
angular.element(window).on('scroll', function() {
    var scroll_top = $(window).scrollTop();
    var slider_height = $('.slider').height();
    if (scroll_top > slider_height - 56) {
        $('.header').css({
            'background-color': '#fff',
            'box-shadow': 'rgb(163 163 163) -1px 0px 5px'
        });
    } else if (scroll_top < slider_height - 56) {
        $('.header').css({
            'background-color': 'transparent',
            'box-shadow': 'none'
        });
    }

    if (scroll_top > $('body').height() / 3) {
        $('.btn-gotofirst').addClass('btn-gotofirst--animation');
    } else {
        $('.btn-gotofirst').removeClass('btn-gotofirst--animation');
    }
});
