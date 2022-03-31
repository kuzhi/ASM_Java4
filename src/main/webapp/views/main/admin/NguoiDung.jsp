<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
        <div class="row justify-content-center">
            <div class="col">
                <form class="row g-3 needs-validation" style="margin-top: 10px;" novalidate name="frmHS">
                    
                    <div class="col-12">
                        

                        
                    <div class="col-md-6 col-lg-12">
                        <label for="validationCustom01" class="form-label fw-bold text-dark">Há» vÃ  tÃªn</label>
                        <input type="text" class="form-control" id="validationCustom01" ng-model="student.fullname" value="{{student.fullname}}" required name="txtFullname"
                        pattern="\D{2,}">
                        <small ng-show="frmHS.txtFullname.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p Há» vÃ  tÃªn</small>
                        <small ng-show="frmHS.txtFullname.$error.pattern" class="form-text text-danger">Há» vÃ  tÃªn pháº£i lÃ  chá»¯ vÃ  trÃªn  hoáº·c báº±ng 2 kÃ­ tá»±</small>
                        <!-- <div class="valid-feedback">
                            Looks good!
                        </div> -->
                    </div>
                    <div class="col-md-6 col-lg-12">
                        <label for="validationCustom02" class="form-label fw-bold text-dark">TÃªn ÄÄng nháº­p</label>
                        <input type="text" class="form-control" id="validationCustom02" ng-model="student.username"  name="txtUsername" value="{{student.username}}"  required minlength="5">

                        <small ng-show="frmHS.txtUsername.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p tÃªn ÄÄng nháº­p</small>
                        <small ng-show="frmHS.txtUsername.$error.minlength" class="form-text text-danger">TÃªn ÄÄng nháº­p pháº£i hÆ¡n hoáº·c báº±ng 5 kÃ­ tá»±</small>
                        <!-- <div class="valid-feedback">
                            Looks good!
                        </div> -->
                    </div>
                    <div class="col-md-6 col-lg-12">
                        <label for="validationCustom02" class="form-label fw-bold text-dark">Máº­t kháº©u</label>
                        <input type="text" class="form-control" id="validationCustom02" ng-model="student.password"  name="txtPass" value="{{student.password}}"  required minlength="5">

                        <small ng-show="frmHS.txtPass.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p máº­t kháº©u</small>
                        <small ng-show="frmHS.txtPass.$error.minlength" class="form-text text-danger">Máº­t kháº©u pháº£i hÆ¡n hoáº·c báº±ng5 kÃ­ tá»±</small>
                        <!-- <div class="valid-feedback">
                            Looks good!
                        </div> -->
                    </div>
                    <div class="col-md-6 col-lg-12">
                        <label for="validationCustomUsername" class="form-label fw-bold text-dark">Email</label>
                        <input type="text" class="form-control" id="validationCustom05" ng-model="student.email" name="txtEmail" value="{{student.email}}"
                            required pattern="[a-z0-9]+@[a-z0-9.-]+\.[a-z]{2,}$">
                                        
                            <small ng-show="frmHS.txtEmail.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p email</small>
                            <small ng-show="frmHS.txtEmail.$error.pattern" class="form-text text-danger">Vui lÃ²ng nháº­p ÄÃºng Äá»nh dáº¡ng email</small>

                    </div>
                    <div class="col-md-6 col-lg-12">
                        <label for="validationCustom03" class="form-label fw-bold text-dark">NgÃ y sinh</label>
                        <input type="datetime" class="form-control" id="validationCustom03" ng-model="student.birthday" value="{{student.birthday}}" required name="txtdate"
                        pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])">
                                                                
                                                                
                         <small ng-show="frmHS.txtdate.$error.required" class="form-text text-danger">Vui lÃ²ng nháº­p ngÃ y thÃ¡ng</small>
                        <small ng-show="frmHS.txtdate.$error.pattern" class="form-text text-danger">NgÃ y thÃ¡ng khÃ´ng ÄÃºng vá»i máº«u</small>
                        <!-- <div class="invalid-feedback">
                            Please provide a valid city.
                        </div> -->
                    </div>
                    
                    <div class="col-12">
                        <label for="validationCustom05" class="form-label fw-bold text-dark">Giá»i tÃ­nh: </label>
                        <input class="form-check-input" ng-model="student.gender" type="radio" name="GT" id="flexRadioDefault1"
                        value="true" required>
                        <label class="form-check-label" for="flexRadioDefault1">
                            Nam
                        </label>
                        <input class="form-check-input"  ng-model="student.gender" type="radio" name="GT" id="flexRadioDefault2" value="false" required>
                        <label class="form-check-label" for="flexRadioDefault2" >
                            Ná»¯
                        </label>
                        <div>
                            <small ng-show="frmHS.GT.$error.required" class="form-text text-danger">Vui lÃ²ng chá»n giá»i tÃ­nh</small>
                        </div>
                        <!-- <div class="invalid-feedback">
                            Please provide a valid zip.
                        </div> -->
                    </div>
                    <div class="col-12">
                        <label for="validationCustom05" class="form-label fw-bold text-dark">Vai trÃ²: </label>
                        <input class="form-check-input" ng-model="student.Admin" type="radio" name="management" id="flexRadioDefault1"
                        value="true" required>
                        <label class="form-check-label" for="flexRadioDefault1">
                            Admin
                        </label>
                        <input class="form-check-input"  ng-model="student.Admin" type="radio" name="management" id="flexRadioDefault2" value="false" required>
                        <label class="form-check-label" for="flexRadioDefault2" >
                            User
                        </label>
                        <div>
                            <small ng-show="frmHS.management.$error.required" class="form-text text-danger">Vui lÃ²ng chá»n vai trÃ²</small>
                        </div>
                        <!-- <div class="invalid-feedback">
                            Please provide a valid zip.
                        </div> -->
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
                        <th>TÃªn ÄÄng nháº­p</th>
                        <th>Há» vÃ  tÃªn</th>
                        <th>NgÃ y sinh</th>
                        <th>Giá»i tÃ­nh</th>
                        <th>Vai trÃ²</th>
                        <th></th>
                    </tr>
                    <!-- Sá»­ dá»¥ng @ng-repeat Äá» duyá»t máº£ng students, má»i sinh viÃªn táº¡o má»t <tr> -->
                    <tr ng-repeat="st in students">
                        <td>{{st.username}}</td>
                        <td>{{st.fullname}}</td>
                        <td>{{st.birthday}}</td>
                        <td>{{(st.gender=="true"?"Nam":"Ná»¯")}}</td>
                        <td>{{st.Admin=="true"?"Admin":"User"}}</td>
                        <td>
                            <!-- Gá»i phÆ°Æ¡ng thá»©c edit($index). $index lÃ  vá» trá» cá»§a pháº§n tá»­ student Äang duyá»t. -->
                            <a href="" style="text-decoration: none;" ng-click="edit($index)">Sá»­a</a>
                        </td>
                    </tr>
                </table>
            </div>
            </div>
        </div>
   

