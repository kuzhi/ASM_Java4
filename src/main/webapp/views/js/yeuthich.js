
app.controller('favCtrl', function($scope,$rootScope,$http,$routeParams,$route){
    
    $rootScope.yeuthichs =[];
    $http.get("http://localhost:3000/Subjects").then(function(response) {
        $rootScope.yeuthichs = response.data;

        $scope.pageCount = Math.ceil($rootScope.yeuthichs.length / 6);
    });
   

    $scope.begin = 0;
    $scope.index = 1;
    $scope.pageCount = Math.ceil($rootScope.yeuthichs.length / 6);
    $scope.first = function () {
        $scope.begin = 0;
        $scope.index = 1;
    }
    $scope.last = function () {
        $scope.begin = ($scope.pageCount - 1) *6;
        $scope.index = $scope.pageCount;
    }
    $scope.next = function () {
        if ($scope.begin < ($scope.pageCount - 1) * 6) {
            $scope.begin += 6;
            $scope.index++;
        }
    }
    $scope.prev = function () {
        if ($scope.begin > 0) {
            $scope.begin -= 6;
            $scope.index--;
        }
    }
    $scope.search= function(){
        
        $scope.searchPhim = $scope.phim;
        
    }
    $scope.yeuthich=false;
    $scope.fav = "Bỏ Thích";
    $scope.thich=function(){
        if($scope.yeuthich==false){
            $scope.fav = "Yêu thích";
        }
        else{
            $scope.fav = "Bỏ Thích";
        }
    }
   
})