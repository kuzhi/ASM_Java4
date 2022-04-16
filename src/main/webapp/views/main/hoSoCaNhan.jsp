<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri = "http://java.sun.com/jstl/core_rt" prefix ="c"%>
	<%@taglib uri = "http://java.sun.com/jstl/fmt_rt" prefix ="fmt"%>      
   <c:url var = "url" value = "/home" />

    
    <style>
        .title-header {
            border-width: 2px;
            border-style: solid;
            border-bottom: 0;
            border-top-left-radius: 3px;
            border-top-right-radius: 3px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 21px;
        }

        .title-body {
            border-width: 2px;
            border-style: solid;
            border-top: 0;
            border-left: 0;
            border-right: 0;
        }
    </style>

    <div class="container-fluid">
    	<div class="row">
				<c:if test="${not empty message}">
					<div class="alert alert-success">${message}</div>
				</c:if>
				<c:if test="${not empty error}">
				
				<div class="alert alert-danger">${error}</div>
				</c:if>
			</div>
        <div class="row justify-content-center">
            <div class="col">
                <form class="row g-3 needs-validation" style="margin-top: 10px;" novalidate name="frmHS" method="post" action="${url}/profile" enctype="multipart/form-data">
                    <div class="col-12 d-flex">
                        <div class="col-2 title-header">
                            <label for="validationCustomUsername" class="form-label fs-6 fw-bold">Hồ sơ cá nhân</label>
                        </div>
                        <div class="col-10 title-body"></div>
                    </div>
                    <div class="col-12">
                        <!-- Button trigger modal -->
                        

                        
                    <div class="col-md-6">
                        <label for="validationCustom01" class="form-label fw-bold text-dark">Họ và tên</label>
                        <input type="text" class="form-control" id="validationCustom01" name="fullname" value="${user.fullname}" required>
                        <!-- <div class="valid-feedback">
                            Looks good!
                        </div> -->
                    </div>
                    <div class="col-md-6">
                        <label for="validationCustom02" class="form-label fw-bold text-dark">Tên đăng nhập</label>
                        <input type="text" class="form-control readonly" id="validationCustom02" name="id" value="${user.id}" readonly required>
                        <!-- <div class="valid-feedback">
                            Looks good!
                        </div> -->
                    </div>
                    <div class="col-12">
                        <label for="validationCustomUsername" class="form-label fw-bold text-dark">Email</label>
                        <input type="text" class="form-control" id="validationCustom05" name="email" value="${user.email}"
                            required>

                    </div>
                    <div class="col-12">
                        <label for="validationCustom03" class="form-label fw-bold text-dark">Ngày sinh</label>
                        <input type="date" class="form-control" id="validationCustom03" name="birthDay" value="${user.birthDay}" required>
                        <!-- <div class="invalid-feedback">
                            Please provide a valid city.
                        </div> -->
                    </div>
                    
                    <div class="col-12">
                        <label for="validationCustom05" class="form-label fw-bold text-dark">Giới tính: </label>
                        <input class="form-check-input"  type="radio" name="gender" ${user.gender?"checked":""} id="flexRadioDefault1"
                        value="true">
                        <label class="form-check-label" for="flexRadioDefault1">
                            Nam
                        </label>
                        <input class="form-check-input"  type="radio" name="gender" id="flexRadioDefault2" ${user.gender?"":"checked"}>
                        <label class="form-check-label" for="flexRadioDefault2" >
                            Nữ
                        </label>

                        <!-- <div class="invalid-feedback">
                            Please provide a valid zip.
                        </div> -->
                    </div>
                    <div class="col-12">
                        <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                    </div>
                </form>
            </div>
        </div>
    </div>



