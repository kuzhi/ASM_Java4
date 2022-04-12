
app.controller('productCtrl', function($scope,$rootScope,$http,$routeParams,$route){
    
    $rootScope.products =[];
    $http.get("http://localhost:3000/Subjects").then(function(response) {
        $rootScope.products = response.data;

        $scope.pageCount = Math.ceil($rootScope.products.length / 6);
    });
   

    $scope.begin = 0;
    $scope.index = 1;
    $scope.pageCount = Math.ceil($rootScope.products.length / 6);
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
  
    
   
})