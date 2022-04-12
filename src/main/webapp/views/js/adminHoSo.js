let appadmin = angular.module("myAdmin", []);

appadmin.controller('adminHSCtrl',function($http,$rootScope,$scope){
    var data ;
	    
    $scope.insert=function(){
       		if(error = true){
	 Swal.fire({
                icon: 'success',
                title: 'Thành công!',
                text: 'Thêm username thành công',
                
            });
}
     
           
        }
    
    $scope.save=function(){
        Swal.fire({
            icon: 'success',
            title: 'Thành công!',
            text: 'Cập nhật username thành công',
            
        });
        

    }
    $scope.delete=function(){
        Swal.fire({
            icon: 'success',
            title: 'Thành công!',
            text: 'Xóa username thành công',
        });
    }
   
})

