app.controller("myCtrl", function($scope, $http, $rootScope) {
    $scope.tenTam = "Danh mục phim";
    $scope.trangchu = function() {
        $scope.tenTam = "Danh mục phim";
    }
    
    $scope.lienHe = function() {
        $scope.tenTam = "Liên hệ";
    }
    
    $scope.hoiDap = function() {
        $scope.tenTam = "Hỏi đáp";
    }
    $scope.changePassword = function() {
        $scope.tenTam = "Đổi mật khẩu";
    }
    $scope.hsCaNhan = function() {
        $scope.tenTam = "Hồ sơ cá nhân";
    }
    $scope.login = function() {
        $scope.tenTam = "Đăng nhập";
    }
    $scope.signup = function() {
        $scope.tenTam = "Đăng ký";
    }
    $scope.forgetPassword = function() {
        $scope.tenTam = "Quên mật khẩu";
    }
    $scope.chiTiet = function() {
        $scope.tenTam = "Phim chiếu rạp";
    }
    $scope.xemPhim = function() {
        $scope.tenTam = "Phim đang chiếu";
    }
    $scope.favorite = function() {
        $scope.tenTam = "Yêu thích";
    }
    $scope.dangXuat = function() {
        $rootScope.clickLogin = true;
        $scope.tenTam = "Danh mục phim";
        $rootScope.student= null;
        $rootScope.indexStudent = -1;
        
       
    }

    

    $scope.menu = 'Layout/menu.html';
    $scope.mainbody = 'Layout/mainbody.html';
    $scope.footer = 'Layout/footer.html';
    $rootScope.clickLogin = true;
    
});

