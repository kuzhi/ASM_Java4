<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jstl/core_rt" prefix ="c"%>
	<%@taglib uri = "http://java.sun.com/jstl/fmt_rt" prefix ="fmt"%>      

<c:url var ="url" value="/home" />
<div class="container container-fluid">
    <div class="row border border-1 bg-light p-3">
        <div class="col-md-4 col-lg-6 ">
            <div class="col p-1 border-bottom">
                <img src="<c:url value="/views/img/${video.poster}"/>"style="width: 500px;">
            </div>

        </div>
        <div class="col-md-7 col-lg-6 p-2">
            <p class="fs-3 fw-bold">Nội dung phim: ${video.title}</p>

            <p class="fs-4 " style="text-align: justify;"> 
              ${video.description}
             	
            </p>
            
            <p class="fs-3"> <b>Thời lượng: </b>${video.time}</p>

            <a href="${url}/watchVideo?idVi=${video.id}" class="btn btn-outline-info btn-lg me-2 text-dark fw-bold" style="width: fit-content;" >
                XEM PHIM
            </a>
			<div class="card-footer bg-light d-flex justify-content-center ">
	            <a class="btn  btn-lg me-2 btn-outline-dark" style="background-color: plum; color: white; width: 100px;">
	                <i class="fas fa-heart"></i>
	            </a>
	            <a href="" class="btn btn-outline-dark btn-lg d-block " style="width: 100px;"  data-bs-toggle="modal" data-bs-target="#exampleModal">
	                <i class="fas fa-share"></i>
	            </a>
            </div>
                <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Chia sẻ</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form>
                    <div class="modal-body">
                        <h1 ng-model="gui"></h1>
                        
                            <div class="mb-3">
                              <label  class="form-label">Email gửi đến</label>
                              <input type="email" class="form-control" aria-describedby="emailHelp" placeholder="kinzu@gmail.com" required>
                            </div>
                            <div class="mb-3">
                              <label  class="form-label">Nội dung</label>
                              <input type="text" class="form-control" >
                            </div>

                    </div>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" ng-click="share()">Gửi</button>
                    </div>
                    </form>
                </div>
                </div>
            </div>
            
        </div>

    </div>

</div>