
appadmin.controller('phimCtrl', function($scope,$rootScope,$http,$routeParams,$route){
    
    
    $scope.insert=function(){
        
       
        
      
            Swal.fire({
                icon: 'success',
                title: 'Thành công!',
                text: 'Thêm phim thành công',
                
            });
        
        $scope.clear();
    }
    $scope.save=function(){
        Swal.fire({
            icon: 'success',
            title: 'Thành công!',
            text: 'Cập nhật phim thành công',
            
        });
        

    }
    $scope.delete=function(){
       $scope.clear();
        Swal.fire({
            icon: 'success',
            title: 'Thành công!',
            text: 'Xóa phim thành công',
        });
    }
    $scope.reset=function(){
        if ($scope.index == -1){
            $scope.clear();
        }else{
            $scope.edit($scope.index);
        }
    }
    $scope.edit=function(index){
        $scope.index = index;
        $scope.student = angular.copy($scope.students[index]);
    }
  
    
   
})