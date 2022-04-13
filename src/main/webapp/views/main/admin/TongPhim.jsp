<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri = "http://java.sun.com/jstl/core_rt" prefix ="c"%>
	<%@taglib uri = "http://java.sun.com/jstl/fmt_rt" prefix ="fmt"%>      

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
    
    
    
 			<c:url var="url" value="/admin/VideoManagement" />
	
    <div class="container-fluid">
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
                <form action="${url}/index" method="post" enctype="multipart/form-data" class="row g-3 needs-validation" style="margin-top: 10px;" >
                    
                    <div class="col-12">
                        <div class="row">
                        <div class="col-md-4 col-lg-5 ">
                            <div class="col border-bottom">
                                <img src="<c:url value = "/file/${video.poster}"/>" id="image" width="700" height="400">
                            </div>
                           <input type="file" class="form-control" id="imageFile" name="poster" value="${video.poster}" onchange="previewFile()" 
                           accept="image/gif, image/jpeg, image/png"
                           >
                            
                        </div>
                        <div class="col-md-7 col-lg-7 p-2">
                            <div class="col-md-6 col-lg-12">
                                <label for="validationCustom01" class="form-label fw-bold text-dark">Video_ID</label>
                                <input type="text" class="form-control" id="validationCustom01" name="id" value="${video.id}"  >
                                
                                <c:if test="${not empty errorId}">                            
                          		<small class="form-text text-danger">Vui lòng nhập id</small>
                          		</c:if>
                          		
                                <!-- <div class="valid-feedback">
                                    Looks good!
                                </div> -->
                            </div>
                            <div class="col-md-6 col-lg-12">
                                <label for="validationCustom02" class="form-label fw-bold text-dark">Tên Video</label>
                                <input type="text" class="form-control" id="validationCustom02"   name="title" value="${video.title}"  required minlength="1">
        						
        						<c:if test="${not empty errorVideo}">                            
        							
                                <small class="form-text text-danger">Vui lòng nhập tên video</small>
                                </c:if>
                                <!-- <div class="valid-feedback">
                                    Looks good!
                                </div> -->
                            </div>
                            <div class="col-md-6 col-lg-12">
                                <label for="validationCustom02" class="form-label fw-bold text-dark">Số view</label>
                                <input type="number" class="form-control" id="validationCustom02"   name="views" value="${video.views}"   required >
        						<c:if test="${not empty errorView}"> 
                                <small  class="form-text text-danger">Vui lòng nhập số view</small>
                                </c:if>
                                <!-- <div class="valid-feedback">
                                    Looks good!
                                </div> -->
                            </div>
                                  
                            
                            <div class="col-md-6 col-lg-12">
                                <label for="validationCustom05" class="form-label fw-bold text-dark">Active: </label>
                                <input class="form-check-input"  type="radio" name="active" id="flexRadioDefault1"
                                value="true" ${video.active?"checked":""} required>
                                <label class="form-check-label" for="flexRadioDefault1">
                                    Active
                                </label>
                                <input class="form-check-input"   type="radio" name="active" id="flexRadioDefault2" value="false" ${video.active?"":"checked"} required >
                                <label class="form-check-label" for="flexRadioDefault2" >
                                    Inactive
                                </label>
                                <div>
                                	<c:if test="${not empty errorActive}">
                                    <small  class="form-text text-danger">Vui lòng chọn active hay inactive</small>
                                    </c:if>
                                </div>
                                <!-- <div class="invalid-feedback">
                                    Please provide a valid zip.
                                </div> -->
                            </div>
                            
                        </div>
                        <div class="col-md-6 col-lg-12">
                            <label for="validationCustom03" class="form-label fw-bold text-dark">Mô tả video</label>
                            <div>
                                <textarea class="form-control fw-2" placeholder="Leave a comment here" id="floatingTextarea2" name="description" style="height: 100px" value="${video.description}" required>
                                ${video.description}
                                </textarea>
                              </div>
                               
                               <c:if test="${not empty errorDes}"> 
                              	<small  class="form-text text-danger">Vui lòng nhập mô tả phim</small>                                                                    
                            	</c:if>
                            <!-- <div class="invalid-feedback">
                                Please provide a valid city.
                            </div> -->
                        </div>   
                        </div>   
                            
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
                        <th>Video ID</th>
                        <th>Tên Video</th>
                        <th>Số view</th>
                        <th>Active</th>
                        <th>Poster</th>
                        <th></th>
                    </tr>
                    <c:forEach var ="video" items="${videos}">
					    <tr>
								    
					      <td>${video.id}</td>
					      <td>${video.title}</td>
					      <td>${video.views}</td>
					      
					      <c:choose>
					      	<c:when test="${video.active==true}">
					      		<td>Active</td>
					      	</c:when>
					      	<c:when test="${video.active==false}">
					      		<td>Inactive</td>
					      	</c:when>	
					      </c:choose>
					      
					      <td>${video.poster}</td>
					      <td><a href="${url}/edit/${video.id}" class="text-decoration-none">Edit</a></td>
					    </tr>
			   		</c:forEach>
                </table>
            </div>
            </div>
        </div>
    </div>

