<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jstl/core_rt" prefix ="c"%>
	<%@taglib uri = "http://java.sun.com/jstl/fmt_rt" prefix ="fmt"%>      
	
    
    <div class="accordion" id="accordionExample">
      <div class="accordion-item">
        <h2 class="accordion-header bg-primary" id="headingOne">
          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
              <h4>Phân loại phim P, C13, C16, C18 là gì?</h4>
          </button>
        </h2>
        <div id="collapseOne" class="accordion-collapse collapse show text-align-justify" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
          <div class="accordion-body">
            <p>
              Căn cứ Thông tư số 12/2015/TT-BVHTTDL của Bộ trưởng Bộ Văn hóa, Thể thao và Du lịch có hiệu lực thi hành từ ngày 01/01/2017, 
              Tiêu chí phân loại phim theo lứa tuổi được quy định như sau:
            </p>
            <p><strong>P:</strong> Phim được phép phổ biến rộng rãi đến mọi đối tượng</p>
            <p><strong>C13:</strong> Phim cấm phổ biến đến khán giả dưới 13 tuổi</p>
            <p><strong>C16:</strong> Phim cấm phổ biến đến khán giả dưới 16 tuổi</p>
            <p><strong>C18:</strong> Phim cấm phổ biến đến khán giả dưới 18 tuổi</p>
            <p>Khách hàng vui lòng chứng thực được độ tuổi phù hợp với phim được phân loại như trên. 
            CGV có quyền từ chối việc bán vé hoặc vào phòng chiếu nếu khách hàng không tuân thủ đúng theo quy định.</p>

          </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header bg-primary" id="headingTwo">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
              <h4>Thức ăn, đồ uống mua bên ngoài có được mang vào rạp CGV không?</h4>
          </button>
        </h2>
        <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
          <div class="accordion-body">
            <p>Để đảm bảo vệ sinh và an toàn, chỉ thức ăn và đồ uống được mua tại CGV mới được đem vào rạp chiếu phim.</p>

            <p>Ngoài ra, bạn cũng không được hút thuốc, dùng kẹo cao su, không quay phim, chụp hình, không nghẹ-gọi điện thoại, không nói chuyện trong rạp chiếu phim.</p>
            
            <p>Tất cả những qui định trên để đảm bảo các bạn có thể thưởng thức phim một cách trọn vẹn và tuyệt vời nhất.</p>
          </div>
        </div>
      </div>
      <div class="accordion-item">
        <h2 class="accordion-header bg-primary" id="headingThree">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
              <h4>Định nghĩa về giá vé "ngày trong tuần" và "ngày cuối tuần" tại CGV là gì?</h4>
          </button>
        </h2>
        <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
          <div class="accordion-body">
              <p>Ngày trong tuần tính từ thứ 2 tới thứ 5.</p>

              <p>  Ngày cuối tuần tính từ thứ 6 tới chủ nhật.
              </p>
          </div>
        </div>
      </div>
      <div class="accordion-item">
          <h2 class="accordion-header bg-primary" id="heading4">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="false" aria-controls="collapse4">
              <h4>Thẻ quà tặng CGV là gì và có giá trị sử dụng đến khi nào?</h4>
            </button>
          </h2>
          <div id="collapse4" class="accordion-collapse collapse" aria-labelledby="heading4" data-bs-parent="#accordionExample">
            <div class="accordion-body">
              <p>Thẻ quà tặng có thể được dùng để mua vé xem phim, bắp nước tại các rạp CGV trên toàn quốc và có thể dùng để thanh toán khi mua vé trực tuyến. 
                Thẻ có các mệnh giá 300,000 VNĐ, 500,000 VNĐ hoặc 1,000,000. Bạn có thể mua thẻ quà tặng tại các rạp CGV hoặc tại website với mệnh giá thấp nhất là 
                300,000 VNĐ và có giá trị sử dụng trong vòng 1 năm kể từ ngày kích hoạt. 
                Thẻ có thể nạp thêm tiền để tiếp tục sử dụng và gia hạn.
              </p>
            </div>
          </div>
        </div>

        <div class="accordion-item">
          <h2 class="accordion-header bg-primary" id="heading5">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse5" aria-expanded="false" aria-controls="collapse5">
              <h4>Chương trình thành viên CGV là gì?</h4>
            </button>
          </h2>
          <div id="collapse5" class="accordion-collapse collapse" aria-labelledby="heading5" data-bs-parent="#accordionExample">
            <div class="accordion-body">
              <p> Đây là chương trình mang đến những ưu đãi đặc quyền dành riêng cho thành viên 
                khi trải nghiệm dịch vụ giải trí điện ảnh tại CGV. Với tài khoản thành viên của mình, bạn có thể:</p>
                <ul>
                  <li>Đặt vé và thanh toán trực tuyến.</li>
                  <li>Nhận combo bắp nước/vé xem phim vào tháng sinh nhật</li>
                  <li>Có cơ hội tận hưởng những ưu đãi và quà tặng đặc biệt.</li>
                  <li>Nhận bản tin điện ảnh hàng tuần về email.</li>
                  <li>Bình luận về phim bạn yêu thích tại website CGV.</li>
                  <li>Kết nối với những người đam mê điện ảnh.</li>
                </ul>
         
            </div>
          </div>
        </div>


    </div>
