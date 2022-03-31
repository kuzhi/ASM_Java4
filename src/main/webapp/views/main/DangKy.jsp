<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
        
            <div class="row g-0 bg-light ">
                <!-- HÃ¬nh -->
                <div class="col-lg-5 ps-0">
                     <img src="asset/img/background_formdk.jpg" alt="logo" class="img-fluid ">
                </div>
                <!-- ////-->
                <div class="col-lg-7 px-5 pt-2">
                    <form name="frmDK">

                            <h1 class="fs-2  fw-bold my-1 text-center">
                                ÄÄNG KÃ
                            </h1>
                            <h5 class="fs-5 text-center"></h5>
                           
                                <div class=" offset-1 col-lg-10" >
                                    <div class="input-group ">
                                    
                                    <span class="input-group-text" >
                                        
                                        <i class="fas fa-user" style="width:16px; height:16px;"> </i>
                                    </span>
                                    
                                    <input type="text" ng-model="username" name="txtUsername"  class="form-control "  placeholder="TÃªn ÄÄng nháº­p" required minlength="5">
                                    
                                    </div>
                                    <small ng-show="frmDK.txtUsername.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p tÃªn ÄÄng nháº­p</small>
                                    <small ng-show="frmDK.txtUsername.$error.minlength" class="form-text text-danger">TÃªn ÄÄng nháº­p pháº£i hÆ¡n hoáº·c báº±ng5 kÃ­ tá»±</small>
                                </div>
                            
                                <div class="offset-1 col-lg-10">
                                    <div class="input-group mt-3">
                                        <span class="input-group-text " >
                                            <i class="fas fa-envelope" style="width:16px; height:16px;"> </i>
                                                            
                                        </span>
                                        <input type="email" ng-model="email" name="txtEmail"  class="form-control " placeholder="VD: khoa@gmail.com" required pattern="[a-z0-9]+@[a-z0-9.-]+\.[a-z]{2,}$">
                                        
                                        
                                    </div>
                                    <small ng-show="frmDK.txtEmail.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p email</small>
                                    <small ng-show="frmDK.txtEmail.$error.pattern" class="form-text text-danger">Vui lÃ²ng nháº­p ÄÃºng Äá»nh dáº¡ng email</small>
                                </div>
                           
                                <div class="offset-1 col-lg-10">
                                    <div class="input-group mt-3">
                                        <span class="input-group-text " >
                                            <i class="fas fa-user" style="width:16px; height:16px;"> </i>
                                                            
                                        </span>
                                        <input type="text" ng-model="fullname" name="txtFullname"  class="form-control " placeholder="Há» vÃ  tÃªn" required pattern="\D{2,}">
                                        
                                        
                                    </div>
                                    <small ng-show="frmDK.txtFullname.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p Há» vÃ  tÃªn</small>
                                    <small ng-show="frmDK.txtFullname.$error.pattern" class="form-text text-danger">Há» vÃ  tÃªn pháº£i lÃ  chá»¯ vÃ  trÃªn  hoáº·c báº±ng 2 kÃ­ tá»±</small>
                                </div>
                            
                                <div class="offset-1 col-lg-10">
                                    <div class="input-group mt-3">
                                        <span class="input-group-text " >
                                            <i class="fas fa-calendar-alt" style="width:16px; height:16px;"> </i>
                                                            
                                        </span>
                                        <input type="datetime" ng-model="date" placeholder="VD: 1995-12-02" name="txtdate" class="form-control " required pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])">
                                        
                                        
                                    </div>
                                    <small ng-show="frmDK.txtdate.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p ngÃ y thÃ¡ng</small>
                                    <small ng-show="frmDK.txtdate.$error.pattern" class="form-text text-danger">NgÃ y thÃ¡ng khÃ´ng ÄÃºng vá»i máº«u</small>
                                </div>
                            
                                <div class="offset-1 col-lg-10 mt-2">
                                    <label class="label-form">
                                        Giá»i tÃ­nh:
                                    </label>
                                    
                                    <input type="radio" ng-model="gender" name="GT"id="gender1" value="true" class="ms-3" required>
                                    <label class="label-form me-5" for="Nam">
                                        Nam
                                    </label>

                                    <label class="label-form" for="Nu">
                                        <input type="radio" ng-model="gender" name="GT" id="gender2" value="false" required>

                                        Ná»¯
                                    </label>
                                    <div>
                                        <small ng-show="frmDK.GT.$error.required" class="form-text text-danger">Vui lÃ²ng chá»n giá»i tÃ­nh</small>


                                    </div>

                                </div>
                            
                                <div class="offset-1 col-lg-10">
                                    <div class="input-group mt-3">
                                        <span class="input-group-text " >
                                            <i class="fas fa-lock" style="width:16px; height:16px;"> </i>
                                                            
                                        </span>
                                        <input type="password" ng-model="password" name="txtPass"  class="form-control " placeholder="Máº­t kháº©u" required minlength="8" maxlength="25" >
                                        

                                    </div>
                                    <small ng-show="frmDK.txtPass.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p máº­t kháº©u</small>
                                        <small ng-show="frmDK.txtPass.$error.minlength" class="form-text text-danger">Nháº­p máº­t kháº©u lá»n hÆ¡n  hoáº·c báº±ng 8 kÃ­ tá»±</small>

                                </div>
                           
                                <div class="offset-1 col-lg-10">
                                    <div class="input-group mt-3">
                                        <span class="input-group-text " >
                                            <i class="fas fa-lock" style="width:16px; height:16px;"> </i>
                                                            
                                        </span>
                                        <input type="password" ng-model="repassword" name="repassword" id="repassword" class="form-control" placeholder="XÃ¡c Nháº­n Máº­t kháº©u" required >
                                        
                                        
                                    </div>
                                    <small ng-show="frmDK.repassword.$error.required" id="repassword" class="form-text text-danger">Vui lÃ²ng nháº­p láº¡i máº­t kháº©u</small>

                                </div>
                               
                                

                                <div class="offset-3 mt-4 col-lg-7 mt-3">
                                    <button  class="btn btn-primary btn-1 align-center px-3 fs-5" ng-click="dangKy(username,
                                    password,
                                    fullname,
                                    email,
                                    gender,
                                    date)" ng-disabled="frmDK.$invalid">
                                        ÄÄng kÃ½
                                    </button>
                                </div>
                            </div>
                            
                    
                    </form>
                 </div>
     
            </div>
        
      
    


