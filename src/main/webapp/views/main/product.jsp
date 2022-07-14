<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri = "http://java.sun.com/jstl/core_rt" prefix ="c"%>
	<%@taglib uri = "http://java.sun.com/jstl/fmt_rt" prefix ="fmt"%>    
	  
<c:url var = "url" value = "/home" />
<c:url var = "urlImg" value = "/" />
<!-- Bootstrap -->
<div class="container-fluid">
    
    <div class="row row-cols-auto justify-content-md-center" style="margin-top: 15px;">
   
        <c:forEach var = "u" items="${videos}">
        
        
              
        <div id="box">
            <div class="card shadow-sm text-center my-2">
            
                <div class="card-body">
                	
                    <div id="image" >
                        <a  href="${url}/detailVideo?idVi=${u.id}">
                           
                        
                            <img src="${urlImg}views/img/${u.poster}"  class="card-img-top anh" alt="${u.poster}">
                           
                        </a>
                    </div>
                   
                        <h5 class="card-title text-center mt-4 text-primary " >${u.title}</h5>
                        <h5 class="card-title text-center" >Thời lượng (phút): ${u.time}</h5>

                    
                </div>
                <div class="card-footer bg-light d-flex justify-content-center ">
               	 	<c:if test="${empty sessionScope.user}">
                    <a class="btn btn-outline-dark btn-lg d-block me-5" style="background-color: plum; color: white; width: 30%;"   role="button" href="${url}/login" > 
                    <i class="fas fa-heart"></i>
                    </a>
                    
                    </c:if>
                    <c:if test="${not (empty sessionScope.user)}">
                    <a class="btn btn-outline-dark btn-lg d-block me-5" style="background-color: plum; color: white; width: 30%;"   role="button" href="${url}/like?idLi=${u.id}" > 
                    <i class="fas fa-heart"></i>
                    </a>
                    
                    </c:if>
                   
                    <a href=""  class="ms-5 btn btn-outline-dark btn-lg d-block " style="width: 100px;"  data-bs-toggle="modal" data-bs-target="#exampleModal">
                		<i class="fas fa-share"></i>
           		 	</a>
                    
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
		                              <input type="text" class="form-control" aria-describedby="emailHelp" name="id" value="${u.id}" readonly>
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

                <div class="banner position-absolute ">
                    <span>Nổi bật</span>
                </div>
                
            </div>
        </div>
        	
		</c:forEach>
      

    </div>
     <!-- Button -->
     <div class="row text-center float-none" style="margin-top: 20px;">
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