<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quáº£n lÃ½-ASM java 4</title>

   <!-- CSS -->
   <link rel="stylesheet" href="../asset/css/base.css">
   <link rel="stylesheet" href="../asset/css/index.css">

   <link rel="stylesheet" href="../asset/fontawesome-free-5.15.4-web/css/all.min.css" >



    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    
    <!-- Javascript -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular-route.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../asset/js/controllroute.js"></script>

    
    
    
    <style>
        .selector-for-some-widget {
            box-sizing: content-box;
        }
    </style>
</head>
       
<body ng-app="myAdmin">
    <div id="wrapper" class="container-fluid" ng-controller="myAdminCtrl">
        <header id="header" class="header">
           <div ng-include="menu"></div>
        </header>
        <!-- header wrapper -->
        <div id="main" class="container-fluid">
            <div class="row">
                <!-- full thÃ¬ 9/12 - ipad thÃ¬ 9/12 - dt thÃ¬ 12/12 -->
                <div class="col-12" ng-include = "mainbodyAdmin">
                    
                </div>
               
            </div>
        </div>
        <!-- #main -->
        <!--footer-->
        <div ng-include="footer">

        </div>
        <!-- .footer-wrapper -->
    </div>
    <!-- #wrapper -->

    
    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

    <!--AnguScript cac file-->
    <script src="../asset/js/adminControll.js"></script>
    <script src="../asset/js/admin.js"></script>
    <script src="../asset/js/adminHoSo.js"></script>
        <script src="../asset/js/tongPhim.js"></script>
    

</body>
</html>