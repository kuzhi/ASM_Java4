let app = angular.module("myApp", ['ngRoute']);
app.config(function($routeProvider,$locationProvider){

    $routeProvider.when("/intro",{
        templateUrl:"Views/GT.html" 
    })
    .when("/contact",{
        templateUrl:"Views/lienHe.html"
    })
    
    .when("/hoidap",{
        templateUrl:"Views/hoiDap.html"
    })
    
    .when("/hsCanhan",{
        templateUrl:"Views/hoSoCaNhan.html",
        controller: "updateHSCtrl"

    })
    .when("/adminHsCanhan",{
        templateUrl:"Views/TongHoSoCaNhan.html",
        controller: "adminHSCtrl"

    })
    .when("/product",{
        templateUrl:"Views/product.html",
        controller: "productCtrl"
    })
    
    .when("/signup", {
        templateUrl: "Views/DangKy.html",
        controller: "dangkyCtrl"
    })
    .when("/login", {
        templateUrl: "Views/DangNhap.html",
        controller: "loginCtrl"
    })
    .when("/changePassword", {
        templateUrl: "Views/DoiMatKhau.html",
        controller: "dmkCtrl"
    })
    .when("/forgetPassword", {
        templateUrl: "Views/QuenMatKhau.html",
        controller: "qmkCtrl"
    })
    .when("/detailFilm", {
        templateUrl: "Views/ChiTietPhim.html",
    })
    .when("/watchFilm", {
        templateUrl: "Views/XemPhim.html",
        controller: "watchCtrl"
    }).when("/fav", {
        templateUrl: "Views/YeuThich.html",
        controller: "favCtrl"
    })
   
    .otherwise({
        redirectTo: "/product"
    })
    

});


app.run(function($rootScope, $http, $timeout,$window) {

    $http.get("http://localhost:3000/Subjects").then(function(response) {
        $rootScope.products = response.data;
    });

    $http.get("http://localhost:3000/Students").then(function(response) {
        $rootScope.students = response.data;
    });
    
    
    $rootScope.student= null;
    $rootScope.product = null;

    

});