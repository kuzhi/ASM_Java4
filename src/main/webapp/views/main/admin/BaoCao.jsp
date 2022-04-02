<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">FAVORITE</button>
    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">FAVORITE USERS</button>
    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">SHARED FRIENDS</button>
  </div>
</nav>
<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
    <table class="table">
  <thead>
    <tr>
      <th scope="col">VIDEO TITLE</th>
      <th scope="col">FAVORITE COUNT</th>
      <th scope="col">LASTED DATE</th>
      <th scope="col">OLDEST DATE</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Spider man: No way home</td>
      <td>100</td>
      <td>5/2/2022</td>
      <td>6/2/2022</td>
    </tr>
    
  </tbody>
</table>
  </div>
  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
    <div class="row">
          <div class="col-md-2 col-lg-2">
            <h1>VIDEO TITLE</h1>
          </div>
          
          <div class="col-md-10 col-lg-10 d-flex">
            <select class="form-select" aria-label="Default select example" value="asdsds">
              <option selected>SPIDER MAN: NO WAY HOME</option>
             
            </select>
          </div>
    </div>
    <table class="table">
  <thead>
    <tr>
      <th scope="col">USERNAME</th>
      <th scope="col">FULLNAME</th>
      <th scope="col">EMAIL</th>
      <th scope="col">FAVORITE DATE</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>TEONV</td>
      <td>Nguyá»n VÄn TÃ¨o</td>
      <td>teonv@gmail.com</td>
      <td>06/02/2022</td>
    </tr>
    
  </tbody>
</table>
  </div>
  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
    
    <div class="row">
          <div class="col-md-2 col-lg-2">
            <h1 >VIDEO TITLE</h1>
          </div>
          <div class="col-md-10 col-lg-10 d-flex">
            <select class="form-select" aria-label="Default select example" value="asdsds">
              <option selected>SPIDER MAN: NO WAY HOME</option>
             
            </select> 
  
  
          </div>
    </div>

    <table class="table">
  <thead>
    <tr>
      <th scope="col">SENDER NAME</th>
      <th scope="col">SENDER EMAIL</th>
      <th scope="col">RECEIVER EMAIL</th>
      <th scope="col">SENT DATE</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Nguyá»n VÄn TÃ¨o</td>
      <td>teonv@gmail.com</td>
      <td>poly@gmail.com</td>
      <td>05/02/2022</td>
    </tr>
    
  </tbody>
</table>
  </div>
</div>