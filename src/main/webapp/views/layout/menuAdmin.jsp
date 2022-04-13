<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib uri = "http://java.sun.com/jstl/core_rt" prefix ="c"%>
	<%@taglib uri = "http://java.sun.com/jstl/fmt_rt" prefix ="fmt"%>    

<div class="header-wrapper">
	<c:url var ="url" value="/admin" />
    <div class="row">
            <nav  class="navbar navbar-expand-lg bg-light">
                <div class="container-fluid">
            <!-- Logo -->
                    <a class="navbar-brand"  ng-click="trangchu()"  href="#!user">
                        <img src="<c:url value ="/views/img/logo.png"/>" width="60px"  height="50px" alt="">
                    </a>
                    <button class="navbar-toggler " type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
            <!-- Menu -->
                    <div class="collapse navbar-collapse" id="navbarNavDropdown">
                        <ul class="navbar-nav me-auto" style="margin-left: 12px;">
                        
                            <li class="nav-item">
                                <a id="list__item" class="menu-item nav-link"  href="${url}/UsersManagement/index" >Người dùng</a>
                            </li>
                            <li class="nav-item">
                                <a id="list__item" class="menu-item nav-link"  href="${url}/VideoManagement/index" >Video</a>
                            </li>
                            <li class="nav-item">
                                <a id="list__item" class="menu-item nav-link"  href="${url}/Report/index" >Báo cáo</a>
                            </li>
                            
                        </ul>
                        <ul class="navbar-nav">
    
                            
                            <!-- Đã đăng nhập -->
                            <div ng-if="!clickLogin">
                                <li class="nav-item dropdown d-flex">
                                        <a id="user" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button"
                                        data-bs-toggle="dropdown" aria-expanded="false">
                                        <!-- Cần thay đổi -->
                                        Admin
                                    </a>
                                    <ul class="dropdown-menu list-item-user" style="margin-top: -10px;"
                                        aria-labelledby="navbarDropdownMenuLink">
                                            
                                        <li><a class="dropdown-item" ng-click="dangXuat()" href="../index.html">Đăng xuất</a>
                                        </li>
                                    </ul>
                                </li>
                            </div>
                        </ul>
                    </div>
                </div>
            </nav>
    </div>
</div>
