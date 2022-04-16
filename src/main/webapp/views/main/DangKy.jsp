<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@taglib uri = "http://java.sun.com/jstl/core_rt" prefix ="c"%>
	<%@taglib uri = "http://java.sun.com/jstl/fmt_rt" prefix ="fmt"%>      
        	<c:url var = "url" value = "/home" />
        
 <div class="row g-0 bg-light ">
                <!-- Hình -->
                <div class="col-lg-5 ps-0">
                     <img src="<c:url value="/views/img/background_formdk.jpg" />" alt="logo" class="img-fluid ">
                </div>
                <!-- ////-->
                <div class="col-lg-7 px-5 pt-2">
                    <div class="row">
						<c:if test="${not empty message}">
							<div class="alert alert-success">${message}</div>
						</c:if>
						<c:if test="${not empty error}">
						
						<div class="alert alert-danger">${error}</div>
						</c:if>
					</div>
							
                            <h1 class="fs-2  fw-bold my-1 text-center">
                                ĐĂNG KÝ
                            </h1>
                            <h5 class="fs-5 text-center"></h5>
                           <form name="frmDK" action="${url}/sign-up" method="post">
                           
                                <div class=" offset-1 col-lg-10" >
                                    <div class="input-group ">
                                    
                                    <span class="input-group-text" >
                                        
                                        <i class="fas fa-user" style="width:16px; height:16px;"> </i>
                                    </span>
                                    
                                    <input type="text"  name="id"  class="form-control "  placeholder="Tên đăng nhập" required >
                                    
                                    </div>
                                    <!--
                                    <small ng-show="frmDK.txtUsername.$error.required" class="form-text text-danger">Vui lòng nhập tên đăng nhập</small>
                                    <small ng-show="frmDK.txtUsername.$error.minlength" class="form-text text-danger">Tên đăng nhập phải hơn hoặc bằng5 kí tự</small>
                                     -->
                                </div>
                            
                                <div class="offset-1 col-lg-10">
                                    <div class="input-group mt-3">
                                        <span class="input-group-text " >
                                            <i class="fas fa-envelope" style="width:16px; height:16px;"> </i>
                                                            
                                        </span>
                                        <input type="email"  name="email"  class="form-control " placeholder="VD: khoa@gmail.com" required pattern="[a-z0-9]+@[a-z0-9.-]+\.[a-z]{2,}$">
                                        
                                        
                                    </div>
                                    <!--
                                    <small ng-show="frmDK.txtEmail.$error.required" class="form-text text-danger">Vui lòng nhập email</small>
                                    <small ng-show="frmDK.txtEmail.$error.pattern" class="form-text text-danger">Vui lòng nhập đúng định dạng email</small>
                                    -->
                                </div>
                           
                                <div class="offset-1 col-lg-10">
                                    <div class="input-group mt-3">
                                        <span class="input-group-text " >
                                            <i class="fas fa-user" style="width:16px; height:16px;"> </i>
                                                            
                                        </span>
                                        <input type="text"  name="fullname"  class="form-control " placeholder="Họ và tên" required pattern="\D{2,}">
                                        
                                        
                                    </div>
                                    <!--
                                    <small ng-show="frmDK.txtFullname.$error.required" class="form-text text-danger">Vui lòng nhập Họ và tên</small>
                                    <small ng-show="frmDK.txtFullname.$error.pattern" class="form-text text-danger">Họ và tên phải là chữ và trên  hoặc bằng 2 kí tự</small>
                                    -->
                                </div>
                            
                                <div class="offset-1 col-lg-10">
                                    <div class="input-group mt-3">
                                        <span class="input-group-text " >
                                            <i class="fas fa-calendar-alt" style="width:16px; height:16px;"> </i>
                                                            
                                        </span>
                                        <input type="date"  placeholder="VD: 1995-12-02" name="birthDay" class="form-control " required pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])">
                                        
                                        
                                    </div>
                                    <!--
                                    <small ng-show="frmDK.txtdate.$error.required" class="form-text text-danger">Vui lòng nhập ngày tháng</small>
                                    <small ng-show="frmDK.txtdate.$error.pattern" class="form-text text-danger">Ngày tháng không đúng với mẫu</small>
                                     -->
                                </div>
                            
                                <div class="offset-1 col-lg-10 mt-2">
                                    <label class="label-form">
                                        Giới tính:
                                    </label>
                                    
                                    <input type="radio"  name="gender"id="gender1" value="true" class="ms-3" required>
                                    <label class="label-form me-5" for="Nam">
                                        Nam
                                    </label>

                                    <label class="label-form" for="Nu">
                                        <input type="radio"  name="gender" id="gender2" value="false" required>

                                        Nữ
                                    </label>
                                    <div>
                                    <!--
                                        <small ng-show="frmDK.GT.$error.required" class="form-text text-danger">Vui lòng chọn giới tính</small>

									-->
                                    </div>

                                </div>
                            
                                <div class="offset-1 col-lg-10">
                                    <div class="input-group mt-3">
                                        <span class="input-group-text " >
                                            <i class="fas fa-lock" style="width:16px; height:16px;"> </i>
                                                            
                                        </span>
                                        <input type="password"  name="password"  class="form-control " placeholder="Mật khẩu" required minlength="5" maxlength="25" >
                                        

                                    </div>
                                    <!--
                                    <small ng-show="frmDK.txtPass.$error.required" class="form-text text-danger">Vui lòng nhập mật khẩu</small>
                                        <small ng-show="frmDK.txtPass.$error.minlength" class="form-text text-danger">Nhập mật khẩu lớn hơn  hoặc bằng 8 kí tự</small>
										-->
                                </div>
                           
                                <div class="offset-1 col-lg-10">
                                    <div class="input-group mt-3">
                                        <span class="input-group-text " >
                                            <i class="fas fa-lock" style="width:16px; height:16px;"> </i>
                                                            
                                        </span>
                                        <input type="password" name="repassword" id="repassword" class="form-control" placeholder="Xác Nhận Mật khẩu" required >
                                        
                                        
                                    </div>
                                    <!--
                                    <small ng-show="frmDK.repassword.$error.required" id="repassword" class="form-text text-danger">Vui lòng nhập lại mật khẩu</small>
									-->
                                </div>
                               

                                <div class="offset-3 mt-4 col-lg-7 mt-3">
                                    <button  class="btn btn-primary btn-1 align-center px-3 fs-5" >
                                        Đăng ký
                                    </button>
                                </div>
                                </form>
                            </div>
                            
                    
                    
                 </div>
     
            </div>
        
      
    


