<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jstl/core_rt" prefix ="c"%>
	<%@taglib uri = "http://java.sun.com/jstl/fmt_rt" prefix ="fmt"%>      
   
    <div class="container">
        
        
                    <form name ="frmDmk">
                            <img src="asset/img/lock-solid.png" class="img-fluid offset-4 my-3"/>
                            <h1 class="fs-2  fw-bold  text-center font ">
                                Äá»I Máº¬T KHáº¨U
                            </h1>
                            <h5 class="text-center font_2" >
                                Báº¡n cÃ³ thá» thay Äá»i máº­t kháº©u cá»§a báº¡n táº¡i ÄÃ¢y
                            </h5>
                            
                                <div class=" offset-3 col-8" >
                                    <div class="input-group ">
                                    
                                    <span class="input-group-text" >
                                        
                                        <i class="fas fa-key" style="width:16px; height:16px;"></i>
                                    </span>
                                    <div class="form-floating col-8">

                                        <input type="text" name="txtOldpass" ng-model="oldpass" class="form-control "  placeholder="Nháº­p máº­t kháº©u cÅ©" required minlength="5">
                                        <label for="password">Nháº­p máº­t kháº©u cÅ©</label>
                                        
                                    </div>
                                    
                                    </div>
                                    <small ng-show="frmDmk.txtOldpass.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p tÃªn ÄÄng nháº­p</small>
                                    <small ng-show="frmDmk.txtOldpass.$error.minlength" class="form-text text-danger">TÃªn ÄÄng nháº­p pháº£i hÆ¡n  hoáº·c báº±ng 5 kÃ­ tá»±</small>
                                </div>
                            

                            
                                <div class="offset-3 col-8">
                                    <div class="input-group mt-3">
                                        <span class="input-group-text " >
                                            <i class="fas fa-unlock-alt " style="width:16px; height:16px;"> </i>
                                                            
                                        </span>
                                        <div class="form-floating col-8">

                                            <input type="password" name="txtNewPass" ng-model="newpassword" class="form-control " placeholder="Nháº­p máº­t kháº©u má»i" required minlength="8">
                                            <label for="password">Nháº­p máº­t kháº©u má»i</label>
    
                                        </div>
                                        
                                    </div>
                                    <small ng-show="frmDmk.txtNewPass.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p máº­t kháº©u má»i</small>
                                    <small ng-show="frmDmk.txtNewPass.$error.minlength" class="form-text text-danger">Máº­t kháº©u má»i pháº£i lá»n hÆ¡n  hoáº·c báº±ng 8 kÃ­ tá»±</small>
                                </div>
                               
                            
                            
                                <div class="offset-3 col-8">
                                    <div class="input-group mt-3">
                                        <span class="input-group-text" >
                                            <i class="fas fa-unlock " style="width:16px; height:16px;"> </i>
                                                            
                                        </span>
                                        
                                        <div class="form-floating col-8">

                                            <input type="password" name="txtRepass" ng-model="rePass" class="form-control " placeholder="XÃ¡c nháº­n  máº­t kháº©u" required minlength="8">
                                            <label for="password">XÃ¡c nháº­n  máº­t kháº©u</label>
    
                                        </div>
                                        
                                    </div>
                                    <small ng-show="frmDmk.txtRepass.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p xÃ¡c nháº­n  máº­t kháº©u </small>
                                        <small ng-show="frmDmk.txtRepass.$error.minlength" class="form-text text-danger">Máº­t kháº©u má»i pháº£i lá»n hÆ¡n hoáº·c báº±ng 8 kÃ­ tá»±</small>
                                </div>
                           

                            <div class="form-row ">

                                <div class="offset-3 col-6 mt-5">
                                    <button type="submit" ng-click="save()" class="btn btn-primary btn-1 align-center px-3 fs-5">
                                        LÆ°u thay Äá»i
                                    </button>
                                </div>
                            </div>
                           
                          
                    
                    </form>

    </div>
   

    
