<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Bootstrap -->
<div class="container-fluid">
    <form class="d-flex">
        <input id="list__item" class="form-control me-2"  type="text" placeholder="TÃªn phim"  ng-model="phim">
        <button id="list__item" class="btn btn-outline-success float-none"  type="submit" ng-click="search()">Search</button>
    </form>
    <div class="row row-cols-auto justify-content-md-center" style="margin-top: 15px;">
        
        <div id="box" ng-repeat="p in yeuthichs | limitTo: 6:begin | filter:searchPhim" class="rol-md-6 rol-12 mt-2 text-center" >
            <div class="card shadow-sm text-center">
                <div class="card-body">
                    <div id="image" >
                        <a  href="#!quiz/{{p.Id}}/{{p.Name}}/{{p.Logo}}">
                            <img src="asset/img/{{p.Logo}}" class="card-img-top anh" alt="áº£nh minh há»a">
                        </a>
                    </div>
                   
                        <h5 class="card-title text-center mt-4 text-primary " >{{p.Name}}</h5>
                        <h5 class="card-title text-center" >Thá»i lÆ°á»£ng: {{p.Time}}</h5>

                    
                </div>
                <div class="card-footer bg-light">
                    <a class="btn btn-outline-dark btn-lg d-block" role="button" ng-if="!yeuthich" ng-click ="thich()">{{fav}}</a>

                </div>
               
            </div>
        </div>

       

    </div>
     <!-- Button -->
     <div class="row text-center float-none" style="margin-top: 20px;">
        <ul class="d-flex justify-content-center">
            <li class="button_dh"><a href="" ng-click="first()">
                    <i class="fas fa-2x fa-step-backward mx-2"> </i>
                </a></li>
            <li class="button_dh"><a href="" ng-click="prev()">
                    <i class="fas fa-2x fa-backward mx-2"> </i>
                </a></li>
            <span class="float-end fs-4 fw-5">{{index}}/{{pageCount}}</span>
            <li class="button_dh"><a href="" ng-click="next()">
                    <i class="fas fa-2x fa-forward mx-2"> </i>
                </a></li>
            <li class="button_dh"><a href="" ng-click="last()">
                    <i class="fas fa-2x fa-step-forward mx-2" view-box> </i>
                </a></li>
        </ul>
    </div>
</div>    