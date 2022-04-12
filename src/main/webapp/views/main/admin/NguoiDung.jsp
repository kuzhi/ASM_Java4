<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>


 
 			<c:url var="url" value="/admin/UsersManagement" />
 
        <div class="row justify-content-center">
        	<div class="col">
				<c:if test="${not empty message}">
					<div class="alert alert-success">${message}</div>
				</c:if>
				<c:if test="${not empty error}">
				
				<div class="alert alert-danger">${error}</div>
				</c:if>
			</div>
            <div class="col">
                <form action="${url}/index" method="post" enctype="multipart/form-data" class="row g-3 needs-validation" style="margin-top: 10px;" novalidate name="frmHS" >
                    
                    <div class="col-12">
                        
	
                        
                    <div class="col-md-6 col-lg-12">
                        <label for="validationCustom01" class="form-label fw-bold text-dark">Họ và tên</label>
                        <input type="text" class="form-control" id="validationCustom01"  value="${user.fullname}"  required name="fullname"
                        pattern="\D{2,}">
                       
                        <!-- <div class="valid-feedback">
                            Looks good!
                        </div> -->
                    </div>
                    <div class="col-md-6 col-lg-12">
                        <label for="validationCustom02" class="form-label fw-bold text-dark">Tên đăng nhập</label>
                        <input type="text" class="form-control" id="validationCustom02"    name="id" value="${user.id}"  required minlength="5">

                        
                        <!-- <div class="valid-feedback">
                            Looks good!
                        </div> -->
                    </div>
                    <div class="col-md-6 col-lg-12">
                        <label for="validationCustom02" class="form-label fw-bold text-dark">Mật khẩu</label>
                        <input type="text" class="form-control" id="validationCustom02"   name=password value="${user.password}"  required minlength="5">

                        
                        <!-- <div class="valid-feedback">
                            Looks good!
                        </div> -->
                    </div>
                    <div class="col-md-6 col-lg-12">
                        <label for="validationCustomUsername" class="form-label fw-bold text-dark">Email</label>
                        <input type="text" class="form-control" id="validationCustom05"   name="email" value="${user.email}"
                            required pattern="[a-z0-9]+@[a-z0-9.-]+\.[a-z]{2,}$">
                                        
                            

                    </div>
                    <div class="col-md-6 col-lg-12">
                        <label for="validationCustom03" class="form-label fw-bold text-dark">Ngày sinh</label>
                        <input type="date" class="form-control" id="validationCustom03"  value="${user.birthDay}" required name="birthDay">
                                                                
                         
                        <!-- <div class="invalid-feedback">
                            Please provide a valid city.
                        </div> -->
                    </div>
                    
                    <div class="col-12">
                        <label for="validationCustom05" class="form-label fw-bold text-dark">Giới tính: </label>
                        <input class="form-check-input"  type="radio" name="gender"  id="flexRadioDefault1"
                        value="true" ${user.gender?"checked":""} required>
                        <label class="form-check-label" for="flexRadioDefault1">
                            Nam
                        </label>
                        <input class="form-check-input"   type="radio" name="gender" id="flexRadioDefault2" value="false" ${user.gender?"":"checked"} required>
                        <label class="form-check-label" for="flexRadioDefault2" >
                            Nữ
                        </label>
                        <div>
                            
                        <!-- <div class="invalid-feedback">
                            Please provide a valid zip.
                        </div> -->
                    </div>
                    <div class="col-12">
                        <label for="validationCustom05" class="form-label fw-bold text-dark">Vai trò: </label>
                        <input class="form-check-input"  type="radio" name="admin" id="flexRadioDefault1"
                        value="true" ${user.admin?"checked":""} required>
                        <label class="form-check-label" for="flexRadioDefault1">
                            Admin
                        </label>
                        <input class="form-check-input"   type="radio" name="admin" id="flexRadioDefault2" value="false" ${user.admin?"":"checked"} required>
                        <label class="form-check-label" for="flexRadioDefault2" >
                            Người dùng
                        </label>
                        
                        <!-- <div class="invalid-feedback">
                            Please provide a valid zip.
                        </div> -->
                    </div>
                    <div class="col-12 mt-3">
                        <button class="btn btn-outline-primary me-3" type="submit" formaction="${url}/create">Thêm mới</button>
                        <button class="btn btn-outline-success me-3" type="submit"  formaction="${url}/update">Lưu thay đổi</button>
                        <button class="btn btn-outline-danger me-3" type="submit"  formaction="${url}/delete">Xóa</button>
                        <button class="btn btn-outline-secondary me-3" type="submit"  formaction="${url}/reset">Reset</button>

                    </div>
                    
                </form>
                <div class="table-responsive  mt-2 ">
                <table class="table table-light table-striped ">
                    <tr class="table-primary">
                        <th>Tên đăng nhập</th>
                        <th>Họ và tên</th>
                        <th>Ngày sinh</th>
                        <th>Giới tính</th>
                        <th>Vai trò</th>
                        <th></th>
                    </tr>
                    <c:forEach var ="u" items="${items}">
					    <tr>
								    
					      <td>${u.id}</td>
					      <td>${u.fullname}</td>
					      <td>${u.birthDay}</td>
					      <td>${u.gender}</td>
					      <td>${u.admin}</td>
					      <td><a href="${url}/edit/${u.id}" class="text-decoration-none">Edit</a></td>
					    </tr>
			   		</c:forEach>
                </table>
            </div>
            </div>
        </div>
   


   



