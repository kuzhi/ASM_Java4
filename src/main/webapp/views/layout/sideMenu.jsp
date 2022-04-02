<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
    <div class="container-fluid" style="width: 100%;">
        <div class="fs-5 fw-bold text-white d-flex align-items-center" style="background-color: var(--primary-color); min-height: 50px;">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-list text-white" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
            </svg>
            DANH MỤC MÔN HỌC
        </div>
        <ul class="list-group" style="padding-top: 0; padding-bottom: 0;">
                <li class="list-group-item bg-white text-start" ng-repeat="p in products" style="padding: 0.5rem;">
                    <a href="#!/quiz/{{p.Id}}/{{p.Name}}/{{p.Logo}}" style="text-decoration: none; color: black;">
                        <img src="asset/img/{{p.Logo}}" width="30px" alt="">
                        {{p.Name}}
                    </a>
                </li>
        </ul>
    </div>
	
</body>
</html>