<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri = "http://java.sun.com/jstl/core_rt" prefix ="c"%>
	<%@taglib uri = "http://java.sun.com/jstl/fmt_rt" prefix ="fmt"%>      



<nav>
<c:url var ="url" value="/admin/Report"/>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <button class="nav-link <%=request.getAttribute("tab_active").equals("thongkeluotthich") ? "active" : ""%>" 
    id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#thongkeluotthich"  type="button" 
    role="tab" aria-controls="thongkeluotthich" aria-selected="true">FAVORITE</button>
    
    <button class="nav-link <%=request.getAttribute("tab_active").equals("locnguoiyeuthich") ? "active" : ""%>" 
    id="nav-profile-tab" data-bs-toggle="tab" 
    data-bs-target="#locnguoiyeuthich" type="button" role="tab"  aria-controls="locnguoiyeuthich" aria-selected="false">FAVORITE USERS</button>
    
    <button class="nav-link <%=request.getAttribute("tab_active").equals("locnguoigui") ? "active" : ""%>" id="nav-contact-tab" data-bs-toggle="tab" 
    data-bs-target="#locnguoigui" type="button" 
    role="tab"  aria-controls="nav-contact" aria-selected="false">SHARED FRIENDS</button>
  </div>
</nav>
<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade <%=request.getAttribute("tab_active").equals("thongkeluotthich") ? "active show" : ""%>" 
  id="thongkeluotthich" role="tabpanel" aria-labelledby="nav-home-tab" data-bs-target="#thongkeluotthich">
    <table class="table">
    
		  <thead>
			    <tr>
			      <th scope="col">VIDEO TITLE</th>
			      <th scope="col">FAVORITE COUNT</th>
			      <th scope="col">LASTED DATE</th>
			      <th scope="col">OLDEST DATE</th>
			    </tr>
		  </thead>
		  <tbody>
		  		<c:forEach var="re" items="${reports1}">
		  		
				    <tr>
				      <td>${re.group}</td>
				      <td>${re.likes}</td>
				      <td>${re.newest}</td>
				      <td>${re.oldest}</td>
				    </tr>
		    	</c:forEach>
		    	
		  </tbody>	
</table>
  </div>
  <div class="tab-pane fade <%=request.getAttribute("tab_active").equals("locnguoiyeuthich") ? "active show" : ""%>" id="locnguoiyeuthich" 
  role="tabpanel" aria-labelledby="nav-profile-tab">
    <div class="row">
          <div class="col-md-2 col-lg-2">
            <h1>VIDEO TITLE</h1>
          </div>
          
          <div class="col-md-10 col-lg-10 ">
          <form action="${url}/favByVideos" method="post">
          
          	<select name="title"class="form-select" aria-label="Default select example" id="title" >
          	<c:forEach var="v" items="${videos}">
              <option value="${v.id}" ${v.id == v.id?'selected':'' }>${v.title}</option>
              </c:forEach>
            </select>
          
          	<button class="mt-2 btn btn-info ml-2">Report</button>
          
           </form> 
          </div>
    </div>
    <table class="table">
  <thead>
    <tr>
      <th scope="col">USERNAME</th>
      <th scope="col">FULLNAME</th>
      <th scope="col">EMAIL</th>
      <th scope="col">FAVORITE DATE</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="favU" items="${favUser}">
	    <tr>
	      <td>${favU[0]}</td>
	      <td>${favU[1]}</td>
	      <td>${favU[2]}</td>
	      <td>${favU[3]}</td>
	    </tr>
    </c:forEach>
  	
  </tbody>
</table>
  </div>
  <div class="tab-pane fade <%=request.getAttribute("tab_active").equals("locnguoigui") ? "active show" : ""%> " id="locnguoigui" 
  role="tabpanel" aria-labelledby="nav-contact-tab">
    
    <div class="row">
          <div class="col-md-2 col-lg-2">
            <h1 >VIDEO TITLE</h1>
          </div>
          <div class="col-md-10 col-lg-10 ">
          <form action="${url}/usersend" method="post">
          
          	<select name="userSends"class="form-select" aria-label="Default select example" id="userSends" >
          	<c:forEach var="v" items="${videos}">
              <option value="${v.id}" ${v.id == v.id?'selected':'' }>${v.title}</option>
              </c:forEach>
            </select>
          
          	<button class="mt-2 btn btn-info ml-2">Report</button>
          
           </form> 
          </div>
    </div>

    <table class="table">
  <thead>
    <tr>
      <th scope="col">SENDER NAME</th>
      <th scope="col">SENDER EMAIL</th>
      <th scope="col">RECEIVER EMAIL</th>
      <th scope="col">SENT DATE</th>
    </tr>
  </thead>
  <tbody>
   <c:forEach var="uS" items="${userSend}">
	    <tr>
	      <td>${uS[0]}</td>
	      <td>${uS[1]}</td>
	      <td>${uS[2]}</td>
	      <td>${uS[3]}</td>
	    </tr>
    </c:forEach>
    
  </tbody>
</table>
  </div>
</div>