<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>


 
 			<c:url var="url" value="/admin/UsersManagement" />
 
        <div class="row justify-content-center">
        	<div class="row">
				<c:if test="${not empty message}">
					<div class="alert alert-success">${message}</div>
				</c:if>
				<c:if test="${not empty error}">
				
				<div class="alert alert-danger">${error}</div>
				</c:if>
			</div>
            <div class="col">
                <form action="${url}/index" method="post" enctype="multipart/form-data" class="row g-3 needs-validation" style="margin-top: 10px;"  >
                    
                        
	
                        
                    <div class="col-md-6 col-lg-12">
                        <label for="validationCustom01" class="form-label fw-bold text-dark">Họ và tên</label>
                        <input type="text" class="form-control" id="validationCustom01" name="fullname"  value="${users.fullname}"  required  pattern="\D{2,}" />
                       
                        <!-- <div class="valid-feedback">
                            Looks good!
                        </div> -->
                    </div>
                    <div class="col-md-6 col-lg-12">
                        <label for="validationCustom02" class="form-label fw-bold text-dark " >Tên đăng nhập</label>
                        <input type="text" class="form-control" id="validationCustom02" <c:if test="${not(empty iduser)}" >readonly</c:if>  name="id" value="${users.id}"  required minlength="5" maxlength="50" />

                        
                        <!-- <div class="valid-feedback">
                            Looks good!
                        </div> -->
                    </div>
                    <div class="col-md-6 col-lg-12">
                        <label for="validationCustom02" class="form-label fw-bold text-dark">Mật khẩu</label>
                        <input type="text" class="form-control" id="validationCustom02"   name=password value="${users.password}"  required minlength="5" maxlength="10" />

                        
                        <!-- <div class="valid-feedback">
                            Looks good!
                        </div> -->
                    </div>
                    <div class="col-md-6 col-lg-12">
                        <label for="validationCustomUsername" class="form-label fw-bold text-dark">Email</label>
                        <input type="text" class="form-control" id="validationCustom05"   name="email" value="${users.email}" required pattern="[a-z0-9]+@[a-z0-9.-]+\.[a-z]{2,}$" />
                                        
                            

                    </div>
                    <div class="col-md-6 col-lg-12">
                        <label for="validationCustom03" class="form-label fw-bold text-dark">Ngày sinh</label>
                        <input type="date" class="form-control" id="validationCustom03" name="birthDay"  value="${users.birthDay}"  required />
                                                                
                         
                        <!-- <div class="invalid-feedback">
                            Please provide a valid city.
                        </div> -->
                    </div>
                    <div class="col-12">
                    
                        <label for="validationCustom05" class="form-label fw-bold text-dark">Giới tính: </label>
                        <input class="form-check-input"  type="radio" name="gender"  id="flexRadioDefault1" value="true" ${users.gender?"checked":""} required />
                        <label class="form-check-label" for="flexRadioDefault1">
                            Nam
                        </label>
                        <input class="form-check-input"   type="radio" name="gender" id="flexRadioDefault2" value="false" ${users.gender?"":"checked"} required  />
                        <label class="form-check-label" for="flexRadioDefault2" >
                            Nữ
                        </label>             
                    </div>
                    <div class="col-12">
                        <label for="validationCustom05" class="form-label fw-bold text-dark">Vai trò: </label>
                        <input class="form-check-input"  type="radio" name="admin" id="flexRadioDefault1" value="true" ${users.admin?"checked":""} required />
                        <label class="form-check-label" for="flexRadioDefault1">
                            Admin
                        </label>
                        <input class="form-check-input"   type="radio" name="admin" id="flexRadioDefault2" value="false" ${users.admin?"":"checked"} required />
                        <label class="form-check-label" for="flexRadioDefault2" >
                            Người dùng
                        </label>
                        
                        <!-- <div class="invalid-feedback">
                            Please provide a valid zip.
                        </div> -->
                    </div>
                    <div class="col-12 mt-3">
                        <button class="btn btn-outline-primary me-3"  <c:if test="${not(empty deactive)}" >disabled</c:if> formaction="${url}/create">Thêm mới</button>
                        
                        <button class="btn btn-outline-success me-3" <c:if test="${empty active}" >disabled</c:if> formaction="${url}/update">Lưu thay đổi</button>
                        <button class="btn btn-outline-danger me-3"  <c:if test="${empty active}" >disabled</c:if> formaction="${url}/delete">Xóa</button>
                        
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
					      <c:choose>
					      	<c:when test="${u.gender==true}">
					      		<td>Nam</td>
					      	</c:when>
					      	<c:when test="${u.gender==false}">
					      		<td>Nữ</td>
					      	</c:when>	
					      </c:choose>
					      
					      <c:choose>
					      	<c:when test="${u.admin==true}">
					      		<td>Admin</td>
					      	</c:when>
					      	<c:when test="${u.admin==false}">
					      		<td>Người dùng</td>
					      	</c:when>	
					      </c:choose>
					      <td><a href="${url}/edit/${u.id}" class="text-decoration-none">Edit</a></td>
					    </tr>
			   		</c:forEach>
                </table> 
            </div>
            <div class="row bg-light">
            	<div class="col-lg-7 d-flex flex-column">
            	<div class="p-2"></div>
            	<p >${count} users</p>
            	
            	</div>
            	
            	<div class="col-lg-5">
					<div class="row  float-none" style="margin-top: 10px;">
		  				<ul class="pagination d-flex justify-content-center">
				  		    <li class="page-item"><a href="${url}/index?page=1" class="page-link"  >First</a></li>
				  		  	<li class="page-item <c:if test="${currentPage == 1}">disabled</c:if>"><a href="${url}/index?page=${currentPage-1}"  class="page-link"  >Previous</a></li>
		  
						  	<c:forEach varStatus="i" begin="1" end="${maxPage}" step="1">
						    <li class="page-item ${currentPage== i.index? 'active':''}"><a href="${url}/index?page=${i.index}" 
						    	class=" page-link "  >${i.index}</a></li>
						   </c:forEach>
						   
		   		  			<li class="page-item <c:if test="${currentPage == maxPage}">disabled</c:if>"><a href="${url}/index?page=${currentPage+1}"  class="page-link"  >Next</a></li>
		   
		    				<li class="page-item"><a href="${url}/index?page=${maxPage}"  class="page-link"  >Last</a></li>
		  				</ul>
    				</div>

				</div>
            </div>
            </div>
        </div>
   


   



