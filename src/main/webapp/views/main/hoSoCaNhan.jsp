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
                    <div class="col-12 d-flex">
                        <div class="col-2 title-header">
                            <label for="validationCustomUsername" class="form-label fs-6 fw-bold">Chá»nh sá»­a</label>
                        </div>
                        <div class="col-10 title-body"></div>
                    </div>
                    <div class="col-12">
                        <!-- Button trigger modal -->
                        <button type="button" class="" style="background-color: white; border: 0;" data-bs-toggle="modal"
                            data-bs-target="#staticBackdrop">
                            <img src="asset/img/user.jpg" width="50px" alt="" class="border border-dark rounded-circle">
                        </button>

                        
                    <div class="col-md-6">
                        <label for="validationCustom01" class="form-label fw-bold text-dark">Há» vÃ  tÃªn</label>
                        <input type="text" class="form-control" id="validationCustom01" ng-model="student.fullname" value="{{student.fullname}}" required>
                        <!-- <div class="valid-feedback">
                            Looks good!
                        </div> -->
                    </div>
                    <div class="col-md-6">
                        <label for="validationCustom02" class="form-label fw-bold text-dark">TÃªn ÄÄng nháº­p</label>
                        <input type="text" class="form-control" id="validationCustom02" ng-model="student.username" value="{{student.username}}" readonly required>
                        <!-- <div class="valid-feedback">
                            Looks good!
                        </div> -->
                    </div>
                    <div class="col-12">
                        <label for="validationCustomUsername" class="form-label fw-bold text-dark">Email</label>
                        <input type="text" class="form-control" id="validationCustom05" ng-model="student.email" value="{{student.email}}"
                            required>

                    </div>
                    <div class="col-12">
                        <label for="validationCustom03" class="form-label fw-bold text-dark">NgÃ y sinh</label>
                        <input type="datetime" class="form-control" id="validationCustom03" ng-model="student.birthday" value="{{student.birthday}}" required>
                        <!-- <div class="invalid-feedback">
                            Please provide a valid city.
                        </div> -->
                    </div>
                    
                    <div class="col-12">
                        <label for="validationCustom05" class="form-label fw-bold text-dark">Giá»i tÃ­nh: </label>
                        <input class="form-check-input" ng-model="student.gender" type="radio" name="flexRadioDefault" id="flexRadioDefault1"
                        value="true">
                        <label class="form-check-label" for="flexRadioDefault1">
                            Nam
                        </label>
                        <input class="form-check-input"  ng-model="student.gender" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="false">
                        <label class="form-check-label" for="flexRadioDefault2" >
                            Ná»¯
                        </label>

                        <!-- <div class="invalid-feedback">
                            Please provide a valid zip.
                        </div> -->
                    </div>
                    <div class="col-12">
                        <button class="btn btn-primary" type="submit" ng-click="save()" ng-disabled="frmHS.$invalid">LÆ°u thay Äá»i</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

