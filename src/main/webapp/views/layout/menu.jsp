<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri = "http://java.sun.com/jstl/core_rt" prefix ="c"%>
	<%@taglib uri = "http://java.sun.com/jstl/fmt_rt" prefix ="fmt"%>    

	<c:url var = "url" value = "/home" />
<div class="header-wrapper">
    <div class="row">
        <nav  class="navbar  navbar-expand-lg bg-light">
            <div class="container-fluid">
                <!-- Logo -->
                <a class="navbar-brand"   href="${url}/index">
                    <img src="<c:url value ="/views/img/logo.png"/>" width="60px"  height="50px" alt="">
                </a>
                <button class="navbar-toggler " type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- Menu -->
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav me-auto" style="margin-left: 12px;">
                      
                        <li class="nav-item">
                            <a id="list__item" class="menu-item nav-link"  href="${url}/product" >Danh mục video</a>
                        </li>
                        <li class="nav-item">
                            <a id="list__item" class="menu-item nav-link"  href="${url}/contact" >Liên hệ</a>
                        </li>
                        <li class="nav-item">
                            <a id="list__item" class="menu-item nav-link"  href="${url}/answer" >Hỏi đáp</a>
                        </li>
                        
                    </ul>
                    <ul class="navbar-nav">
					<c:choose>
					
						<c:when test="${empty sessionScope.user}">
                        <!-- Chưa đăng nhập -->
                        <div>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#"
                                    style="color: black; font-weight: 600 !important; font-size: 1.1rem;"
                                    id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                    Tài khoản 
                                </a>
                                <ul class="dropdown-menu list-item-user" style="margin-top: -10px;"
                                    aria-labelledby="navbarDropdownMenuLink">
                                    <li><a class="dropdown-item" href="${url}/login" >Đăng nhập</a></li>
                                    <li><a class="dropdown-item" href="${url}/sign-up" >Đăng ký</a></li>
                                    <li><a class="dropdown-item" href="${url}/forgot-password">Quên mật khẩu</a>
                                    </li>
                                </ul>
                            </li>
                        </div>
                        </c:when>
                        
                        <c:otherwise>
                        <c:if test="${not (empty sessionScope.user) }">
                        <!-- Đã đăng nhập -->
                        <div >
                            <li class="nav-item dropdown d-flex">
                                    <a id="user" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    <!-- Cần thay đổi -->
                                   Xin Chào ${sessionScope.user.fullname}!
                                </a>
                                <ul class="dropdown-menu list-item-user" style="margin-top: -10px;"
                                    aria-labelledby="navbarDropdownMenuLink">
                                    <li><a class="dropdown-item" href="${url}/change-password" >Đổi mật
                                            khẩu</a></li>
                                    <li><a class="dropdown-item" href="${url}/profile" ">Hồ sơ cá
                                            nhân</a></li>
                                            <li><a class="dropdown-item" href="${url}/like" ">
                                                Yêu thích
                                            </a></li>
                                            <c:if test="${not (empty sessionScope.user.admin)}">
                                            
                                            <li><a class="dropdown-item" href="<c:url value="/admin/UsersManagement/index" />" >
                                                Quản lí
                                     </a></li>
                                            </c:if>
                                     
                                     <li><hr class="dropdown-divider"></li>
                                     
                                     
                                                    
                                    <li><a class="dropdown-item" href="${url}/logout">Đăng xuất</a>
                                    </li>
                                </ul>
                            </li>
                        </div>
                        </c:if>

                        </c:otherwise>
                        
                        </c:choose>	
                        
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <div class="row header-banner">
        <div id="carouselExampleControls" class="mb-2 carousel slide auto" data-bs-ride="carousel" width="800">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleControls" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleControls" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleControls" data-bs-slide-to="2" aria-label="Slide 3"></button>
              </div>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <div class="card bg-dark text-white text-center">
                    <img src="<c:url value ="/views/img/johnwick3.png"/>" class="card-img d-block " alt="movie"  height="800px">
                    <div class="card-img-overlay">
                        <div class="card-body position-absolute top-50 start-50 translate-middle">
                            <h5 class="card-title fw-1 fs-1">JOHN WICK</h5>
                            <p class="card-text fw-1 fs-1">PHIM CHIẾU RẠP BẢN ĐẸP</p>
                            <a href="${url}/watchVideo?idVi=M7XM597XO94"   class="btn btn-outline-primary fw-1 fs-1">Xem video</a>
                            <a href="${url}/detailVideo?idVi=M7XM597XO94"   class="btn btn-outline-primary fw-1 fs-1">Xem chi tiết</a>
                          </div>
                    </div>
                  </div>
              </div>
              <div class="carousel-item">
                <div class="card bg-dark text-white text-center">
                    <img src="<c:url value ="/views/img/mortal.png"/>" class="card-img d-block  " alt="movie"   height="800px">
                    <div class="card-img-overlay">
                        <div class="card-body position-absolute top-50 start-50 translate-middle">
                            <h5 class="card-title fw-1 fs-1">MORTAL KOMBAT</h5>
                            <p class="card-text fw-1 fs-1">PHIM CHIẾU RẠP BẢN ĐẸP.</p>
                            <a href="${url}/watchVideo?idVi=Eu9G8nO5-Ug" ng-click ="xemPhim()" class="btn btn-outline-primary fw-1 fs-1">Xem phim</a>
                            <a href="${url}/detailVideo?idVi=Eu9G8nO5-Ug"  class="btn btn-outline-primary fw-1 fs-1">Xem chi tiết</a>
                          </div>
                    </div>
                  </div>
              </div>
              <div class="carousel-item">
                <div class="card bg-dark text-white text-center">
                    <img src="<c:url value ="/views/img/spiritedaway.png"/>" class="card-img d-block " alt="anime" height="800px">
                    <div class="card-img-overlay">
                        <div class="card-body position-absolute top-50 start-50 translate-middle">
                            <h5 class="card-title fw-1 fs-1">SPIRITED AWAY</h5>
                            <p class="card-text fw-1 fs-1">PHIM CHIẾU RẠP BẢN ĐẸP</p>
                            <a href="${url}/watchVideo?idVi=QRQMNr5gQ8k" ng-click ="xemPhim()" class="btn btn-outline-primary fw-1 fs-1">Xem phim</a>
                            <a href="${url}/detailVideo?idVi=QRQMNr5gQ8k"  class="btn btn-outline-primary fw-1 fs-1">Xem chi tiết</a>
                          </div>
                    </div>
                  </div>
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>  
    </div>
    <!-- banner -->
</div>
