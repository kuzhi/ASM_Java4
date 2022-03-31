<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <style>
        .title-header {
            border-width: 2px;
            border-style: solid;
            border-bottom: 0;
            border-top-left-radius: 3px;
            border-top-right-radius: 3px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 21px;
        }

        .title-body {
            border-width: 2px;
            border-style: solid;
            border-top: 0;
            border-left: 0;
            border-right: 0;
        }
    </style>

    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col">
                <form class="row g-3 needs-validation" style="margin-top: 10px;" novalidate name="frmHS">
                    
                    <div class="col-12">
                        <div class="row">
                        <div class="col-md-4 col-lg-5 ">
                            <div class="col border-bottom">
                                <img src="../asset/img/android.png">
                            </div>
                        </div>
                        <div class="col-md-7 col-lg-7 p-2">
                            <div class="col-md-6 col-lg-12">
                                <label for="validationCustom01" class="form-label fw-bold text-dark">Video_ID</label>
                                <input type="text" class="form-control" id="validationCustom01" value="VI_1"  readonly>
                          
                                <!-- <div class="valid-feedback">
                                    Looks good!
                                </div> -->
                            </div>
                            <div class="col-md-6 col-lg-12">
                                <label for="validationCustom02" class="form-label fw-bold text-dark">TÃªn phim</label>
                                <input type="text" class="form-control" id="validationCustom02"   name="txtUsername" value="John Wick 3"  required minlength="1">
        
                                <small ng-show="frmHS.txtUsername.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p tÃªn phim</small>
                                <small ng-show="frmHS.txtUsername.$error.minlength" class="form-text text-danger">TÃªn phim pháº£i hÆ¡n hoáº·c báº±ng 1 kÃ­ tá»±</small>
                                <!-- <div class="valid-feedback">
                                    Looks good!
                                </div> -->
                            </div>
                            <div class="col-md-6 col-lg-12">
                                <label for="validationCustom02" class="form-label fw-bold text-dark">Sá» view</label>
                                <input type="number" class="form-control" id="validationCustom02"   name="txtUsername2" value="0"   required >
        
                                <small ng-show="frmHS.txtUsername2.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p sá» view</small>
                                <!-- <div class="valid-feedback">
                                    Looks good!
                                </div> -->
                            </div>
                            <div class="col-md-6 col-lg-12">
                                <label for="validationCustomUsername" class="form-label fw-bold text-dark">Thá» loáº¡i phim</label>
                                <input type="text" class="form-control" id="validationCustom05"  name="txtEmail" value="HÃ nh Äá»ng"
                                    required pattern="\D{2,}" minlength="4">
                                                
                                    <small ng-show="frmHS.txtEmail.$error.required" class="form-text text-danger">Vui lÃ²ng thá» loáº¡i phim</small>
                                    <small ng-show="frmHS.txtEmail.$error.minlength" class="form-text text-danger">Thá» loáº¡i phim pháº£i hÆ¡n hoáº·c báº±ng 4 kÃ­ tá»±</small>
                                    <small ng-show="frmHS.txtEmail.$error.pattern" class="form-text text-danger">Thá» loáº¡i phim pháº£i lÃ  chá»¯</small>

                            </div>
                            
                            
                            <div class="col-md-6 col-lg-12">
                                <label for="validationCustom05" class="form-label fw-bold text-dark">Active: </label>
                                <input class="form-check-input"  type="radio" name="GT" id="flexRadioDefault1"
                                value="true" required>
                                <label class="form-check-label" for="flexRadioDefault1">
                                    Active
                                </label>
                                <input class="form-check-input"   type="radio" name="GT" id="flexRadioDefault2" value="false" required checked>
                                <label class="form-check-label" for="flexRadioDefault2" >
                                    Inactive
                                </label>
                                <div>
                                    <small ng-show="frmHS.GT.$error.required" class="form-text text-danger">Vui lÃ²ng chá»n active hay inactive</small>
                                </div>
                                <!-- <div class="invalid-feedback">
                                    Please provide a valid zip.
                                </div> -->
                            </div>
                            
                        </div>
                        <div class="col-md-6 col-lg-12">
                            <label for="validationCustom03" class="form-label fw-bold text-dark">MÃ´ táº£ phim</label>
                            <div class="form-floating">
                                <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" name="notes" style="height: 100px" value="pháº§n 3 cá»§a series phim John Wick" required></textarea>
                                <label for="floatingTextarea2">MÃ´ táº£ phim</label>
                              </div>
                              <small ng-show="frmHS.notes.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p thÃ´ng tin mÃ´ táº£ phim</small>                                                                    
                            
                            <!-- <div class="invalid-feedback">
                                Please provide a valid city.
                            </div> -->
                        </div>   
                        </div>   
                            
                    </div>
                
                    <div class="col-12 mt-3">
                        <button class="btn btn-outline-primary me-3" ng-click="insert()" ng-disabled="frmHS.$invalid">ThÃªm má»i</button>
                        <button class="btn btn-outline-success me-3"  ng-click="save()" ng-disabled="frmHS.$invalid">LÆ°u thay Äá»i</button>
                        <button class="btn btn-outline-danger me-3"  ng-click="delete()" ng-disabled="frmHS.$invalid">XÃ³a</button>
                        <button class="btn btn-outline-secondary me-3"  ng-click="reset()" ng-disabled="frmHS.$invalid">Reset</button>

                    </div>
                    
                </form>
                <div class="table-responsive  mt-2 ">
                <table class="table table-light table-striped ">
                    <tr class="table-primary">

                        <th>Video_ID</th>
                        <th>TÃªn phim</th>
                        <th>Sá» view</th>
                        <th>Thá» loáº¡i phim</th>
                        <th>ACtive</th>
                        <th>MÃ´ táº£ phim</th>
                        <th>pháº§n 3 cá»§a series phim John Wick</th>
                    </tr>
                    <!-- Sá»­ dá»¥ng @ng-repeat Äá» duyá»t máº£ng students, má»i sinh viÃªn táº¡o má»t <tr> -->
                    <tr >
                        <td>VI_1</td>
                        <td>John Wick 3</td>
                        <td>0</td>
                        <td>HÃ nh Äá»ng</td>
                        <td>Active</td>
                        <td></td>

                        <td>
                            <!-- Gá»i phÆ°Æ¡ng thá»©c edit($index). $index lÃ  vá» trá» cá»§a pháº§n tá»­ student Äang duyá»t. -->
                            <a href="" style="text-decoration: none;" ng-click="edit($index)">Sá»­a</a>
                        </td>
                    </tr>
                </table>
            </div>
            </div>
        </div>
    </div>

