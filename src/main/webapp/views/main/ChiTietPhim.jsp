<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jstl/core_rt" prefix ="c"%>
	<%@taglib uri = "http://java.sun.com/jstl/fmt_rt" prefix ="fmt"%>      

<c:url var ="url" value="/home" />
<c:url var = "urlImg" value = "/" />

<div class="container container-fluid">
    <div class="row border border-1 bg-light p-3">
        <div class="col-md-4 col-lg-6 ">
            <div class="col p-1 border-bottom">
                <img src="${urlImg}views/img/${video.poster}" style="width: 500px;">
            </div>

        </div>
        <div class="col-md-7 col-lg-6 p-2">
            <p class="fs-3 fw-bold">Nội dung video: ${video.title}</p>

            <p class="fs-4 " style="text-align: justify;"> 
              ${video.description}
             	
            </p>
            
            <p class="fs-3"> <b>Thời lượng (phút): </b>${video.time}</p>

            <a href="${url}/watchVideo?idVi=${video.id}" class="btn btn-outline-info btn-lg me-2 text-dark fw-bold" style="width: fit-content;" >
                XEM PHIM
            </a>
			<div class="card-footer bg-light d-flex justify-content-center ">
	            <c:if test="${empty sessionScope.user}">
                    <a class="btn btn-outline-dark btn-lg d-block me-5" style="background-color: plum; color: white; width: 30%;"   role="button" href="${url}/login" > 
                    <i class="fas fa-heart"></i>
                    </a>
                    
                    </c:if>
                    <c:if test="${not (empty sessionScope.user)}">
                    <a class="btn btn-outline-dark btn-lg d-block me-5" style="background-color: plum; color: white; width: 30%;"   role="button" href="${url}/like" > 
                    <i class="fas fa-heart"></i>
                    </a>
                    
                    </c:if>
	            <a href="" class="btn btn-outline-dark btn-lg d-block " style="width: 100px;"  data-bs-toggle="modal" data-bs-target="#exampleModal">
	                <i class="fas fa-share"></i>
	            </a>
            </div>
                <!-- Modal -->
                <c:choose>
                
               <c:when test="${empty sessionScope.user}">
		               <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
								<div class="modal-content">
								    <div class="modal-header">
								    <h5 class="modal-title" id="exampleModalLabel"></h5>
								    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								    </div>
								    <form>
								    <div class="modal-body">
								        
								        
								            
								            <div class="mb-3">
								              <label  class="form-label text-danger"> Vui lòng đăng nhập</label>
								            </div>
								
								    </div>
								    <div class="modal-footer">
								    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
								    </div>
								    </form>
								</div>
								</div>
								</div>
               </c:when>
               <c:otherwise>
            
            
             <c:if test="${not (empty sessionScope.user)}">
            		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		                <div class="modal-dialog">
		                <div class="modal-content">
		                    <div class="modal-header">
		                    <h5 class="modal-title" id="exampleModalLabel">Chia sẻ</h5>
		                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                    </div>
		                    <form action="${url}/sendmail" method = "post">
		                    <div class="modal-body">
		                        
		                        
		                            <div class="mb-3">
		                              <label  class="form-label">Email gửi đến</label>
		                              <input type="email" name ="email" class="form-control" aria-describedby="emailHelp" placeholder="kinzu@gmail.com" required>
		                            </div>
		                            
		                            <div class="mb-3">
		                              <label  class="form-label">Tên phim</label>
		                              <input type="test" class="form-control" aria-describedby="emailHelp" name="id" value="${video.id}" readonly>
		                            </div>
		                            <div class="mb-3">
		                              <label  class="form-label">Nội dung</label>
		                              <input type="text" name="review" class="form-control" >
		                            </div>
		
		                    </div>
		                    <div class="modal-footer">
		                    <button  class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		                    <button type="submit" class="btn btn-primary" >Gửi</button>
		                    </div>
		                    </form>
		                </div>
		                </div>
		            </div>
            </c:if>
            </c:otherwise>
                </c:choose>
                
        </div>

    </div>

</div>