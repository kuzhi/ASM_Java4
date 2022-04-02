<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  
    <div class="container">
        
            <div class="row g-0 bg-light ">
                <div class="col-lg-5 ps-0">
                     <img src="asset/img/background_formdn.jpg" alt="logo" class="img-fluid ">
                </div>
                
                <div class="col-lg-7 px-5 pt-5">
                    <form name="frmQmk">

                            <h1 class="fs-2  fw-bold  text-center font ">
                                QUÃN Máº¬T KHáº¨U
                            </h1>
                            <h5 class="text-center font_2" >
                                Láº¥y láº¡i máº­t kháº©u cá»§a báº¡n táº¡i ÄÃ¢y
                            </h5>
                            
                                <div class=" offset-1 col-lg-10" >
                                    <div class="input-group ">
                                    
                                    <span class="input-group-text" >
                                        
                                        <i class="fas fa-envelope" style="width:16px; height:16px;"></i>
                                    </span>
                                    
                                    <div class="form-floating col-10">

                                        <input type="email" ng-model ="student.email" name="txtEmail"  class="form-control "  placeholder="Nháº­p Äá»a chá» email cá»§a báº¡n" required>
                                        <label for="email">Nháº­p Äá»a chá» email cá»§a báº¡n</label>

                                    </div>
                                    <small ng-show="frmQmk.txtEmail.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p Äá»a chá» email</small>
                                </div>
                                
                           

                                <div class="col-lg-10">
                                    <div class="input-group mt-3">
                                        <span class="input-group-text " >
                                            <i class="fas fa-barcode " style="width:16px; height:16px;"> </i>
                                                            
                                        </span>
                                        
                                        <div class="form-floating col-10">

                                            <input type="text" name="txtUser"  class="form-control " ng-model="student.username" placeholder="Nháº­p tÃªn ÄÄng nháº­p cá»§a báº¡n cá»§a báº¡n" style="width: 300px;" required>
                                            <label for="text">TÃªn ÄÄng nháº­p</label>
    
                                            </div>
                                            <small ng-show="frmQmk.txtUser.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p tÃªn ÄÄng nháº­p</small>

                                        </div>
                                    </div>
                                </div>

                                <div class="offset-1 col-10">
                                    
                                    <div class="offset-3 col-lg-5 mt-5">
                                        <button  ng-click="getPass()" class="btn btn-primary btn-1 align-center px-3 fs-5">
                                            Láº¥y láº¡i
                                        </button>
                                    </div>
                                </div>
 
                            </div> 
                    
                    </form>
                 </div>
     
            </div>
        
      
    </div>


    


