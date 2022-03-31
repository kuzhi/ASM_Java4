<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row" style="margin-bottom: 15px;">
    <div class="title-page col d-flex">
        <div class="title-page__main text-center col-2">
            <span class="fw-bold" style="font-size: 1.2rem; color: var(--bs-body-bg);">Trang chủ</span>
        </div>
        <div class="title-page__border"></div>
        <div class="title-page__item text-start col-4">
            <!-- Biến linh động -->
            <span class="fw-bold" style="font-size: 1.2rem; color: var(--text-color);">{{tenTam}}</span>
        </div>
    </div>
    <!-- Title page -->
</div>
<div class="row">
    <div class="main col-12" style="padding-left: 42px;" ng-view>
        
    </div>
</div>
</div>
</body>
</html>