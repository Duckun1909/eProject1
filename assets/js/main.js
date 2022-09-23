var myApp = angular.module("myApp", [])
myApp.controller('includePage', function($scope) {
        $scope.elementUrl = './home.html'
        $scope.includeHandle = function(index) {
            switch (index) {
                case 0:
                    $scope.elementUrl = './home.html'
                    break;
                case 1:
                    $scope.elementUrl = './aboutUs.html';
                    break;
                case 2:
                    $scope.elementUrl = './product.html';
                    break
                case 5:
                    $scope.elementUrl = './contact.html';
                    break;
                case 6:
                    $scope.elementUrl = './login.html';
                    break;
                case 7:
                    $scope.elementUrl = './register.html';
                    break;
                case 8:
                    $scope.elementUrl = './product_details.html';
            }
        }

    })
    .controller('renderPrd', function($scope) {
        let prdArr = []
        $.ajax({
            url: 'home.php',
            type: 'post',
            cache: false,
            async: false,
            data: { getPrd: true },
            success: function(res) {
                prdArr = JSON.parse(res)
            }
        })
        $scope.product = prdArr;
    })
    .controller('cateLink', function($scope) {
        $.post('home.php', { getCate: true }, function(res) {
            $scope.categories = JSON.parse(res)
        })

    })
    .filter('subCate', function() {
        return function(items, id) {
            let filtered = []
            items.forEach(elm => {
                if (elm.product_cate == id) {
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
