<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib uri = "http://java.sun.com/jstl/core_rt" prefix ="c"%>
	<%@taglib uri = "http://java.sun.com/jstl/fmt_rt" prefix ="fmt"%>      
	<c:url var ="url" value="/home" />
<div class="container">
	<div class="row">
		<h1 class="text-primary"> Tên video đang xem: ${video.title}</h1>
	</div>
    <div class="ratio ratio-16x9">
        <iframe src="https://www.youtube.com/embed/${video.id}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
     </div>
     
     
</div>