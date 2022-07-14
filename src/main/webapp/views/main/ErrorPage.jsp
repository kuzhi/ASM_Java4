<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri = "http://java.sun.com/jstl/core_rt" prefix ="c"%>
	<%@taglib uri = "http://java.sun.com/jstl/fmt_rt" prefix ="fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR PAGE</title>
<link rel="stylesheet" href="<c:url value= "/views/css/ErrorPage.css"/>">
<c:url var = "url" value ="/home/index"/>
</head>
<body>
<!--  -->
	<section class="notFound">
        <div class="img">
        <img src="https://assets.codepen.io/5647096/backToTheHomepage.png" alt="Back to the Homepage"/>
        <img src="https://assets.codepen.io/5647096/Delorean.png" alt="El Delorean, El Doc y Marti McFly"/>
        </div>
        <div class="text">
        <h1>404</h1>
        <h2>${error1}</h2>
        <h3>QUAY VỀ TRANG CHỦ?</h3>
        <a href="${url}" class="yes">YES</a>
        <a href="${url}" class="yes">YES</a>
        </div>
    </section>
</body>
</html>