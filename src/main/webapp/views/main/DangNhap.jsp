<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <div class="container">
        
            <div class="row  row1 g-0 bg-light ">
                <div class="col-lg-5 ps-0">
                     <img src="asset/img/background_formdn.jpg" alt="logo" class="img-fluid ">
                </div>
                
                <div class="col-lg-7 px-5 pt-5">
                    <form name="frmDN">

                            <h1 class="fs-2  fw-bold my-3 text-center">
                                ÄÄNG NHáº¬P
                            </h1>
                            <h5 class="fs-5 text-center"></h5>
                            
                                <div class=" offset-1 col-lg-10" >
                                    <div class="input-group ">
                                    
                                    <span class="input-group-text" >
                                            <i class="fas fa-user" style="width:16px; height:16px;"> </i>
                                                            
                                        
                                    </span>
                                    <div class="form-floating col-lg-10">
                                        <input type="text" ng-model="student.username" name="txtusername"  class="form-control " id="username" placeholder="TÃªn ÄÄng nháº­p" required>
                                    <label for="userName">TÃªn ÄÄng nháº­p</label>
                                </div>
                                <small ng-show="frmDN.txtusername.$invalid" id="username" class="form-text text-danger">Vui lÃ²ng nháº­p tÃªn ÄÄng nháº­p</small>
    
                                    </div>
                                </div>
                            

                                <div class="offset-1 col-lg-10">
                                    <div class="input-group mt-3">
                                        <span class="input-group-text " >
                                            <i class="fas fa-lock" style="width:16px; height:16px;"> </i>
                                                            
                                        </span>
                                        <div class="form-floating col-lg-10">

                                        <input type="password" ng-model="student.password" name="txtpass" id="pass" class="form-control " placeholder="Máº­t kháº©u" required>
                                        <label for="password">Máº­t kháº©u</label>

                                        </div>
                                    </div>
                                    <small ng-show="frmDN.txtpass.$invalid" id="pass" class="form-text text-danger">Vui lÃ²ng nháº­p máº­t kháº©u</small>

                                </div>

                            <div class="form-row ">

                                <div class="mt-2 offset-2 col-lg-7">
                                    <button ng-click="login()" ng-disabled="frmDN.$invalid" class="btn btn-primary btn-1 align-center px-3 fs-5">
                                        ÄÄng nháº­p
                                    </button>
                                </div>
                            </div>
                            
                            
                    
                    </form>
                 </div>
     
            </div>
        
      
    </div>


    


    