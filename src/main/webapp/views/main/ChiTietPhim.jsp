<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jstl/core_rt" prefix ="c"%>
	<%@taglib uri = "http://java.sun.com/jstl/fmt_rt" prefix ="fmt"%>      

<div class="container container-fluid">
    <div class="row border border-1 bg-light p-3">
        <div class="col-md-4 col-lg-6 ">
            <div class="col p-1 border-bottom">
                <img src="../asset/img/dammay2.png"style="width: 500px;">
            </div>
            
            
            <div class="col ">
                <fieldset>
                    <img src="../asset/img/dammay2.png" class=" mt-2 me-2" alt="" width="100" height="100">
                    <img src="../asset/img/dammay2.png" class="mt-2 me-2" alt="" width="100" height="100">
                    <img src="../asset/img/dammay2.png" class="mt-2 me-2" alt="" width="100" height="100"> 
                    <img src="../asset/img/dammay2.png" class="mt-2 me-2" alt="" width="100" height="100"> 
                    <img src="../asset/img/dammay2.png" class="mt-2 me-2" alt="" width="100" height="100"> 
                </fieldset>
            </div>
        </div>
        <div class="col-md-7 col-lg-6 p-2">
            <p class="fs-3 fw-bold">Ná»i dung phim NgÆ°á»i Nhá»n: NO WAY HOME </p>

            <p class="fs-4 " style="text-align: justify;"> 
             
             Vá»i danh tÃ­nh cá»§a NgÆ°á»i Nhá»n giá» ÄÃ£ ÄÆ°á»£c tiáº¿t lá», Peter nhá» Doctor Strange giÃºp Äá»¡. 
             Khi má»t cÃ¢u tháº§n chÃº bá» sai, nhá»¯ng káº» thÃ¹ nguy hiá»m tá»« cÃ¡c tháº¿ giá»i khÃ¡c báº¯t Äáº§u xuáº¥t hiá»n, 
             buá»c Peter pháº£i khÃ¡m phÃ¡ ra Ã½ nghÄ©a thá»±c sá»± cá»§a viá»c trá» thÃ nh NgÆ°á»i Nhá»n.
            </p>
            <p class="fs-3"><b>NÄm phÃ¡t hÃ nh: </b>2021</p>
            <p class="fs-3"> <b>Quá»c gia:</b>Phim Ãu Má»¹</p>
            <p class="fs-3"> <b>Thá»i lÆ°á»£ng:</b>180 phÃºt</p>

            <a href="#!watchFilm" class="btn btn-info btn-lg me-2 text-white fw-bold" style="width: fit-content;" >
                XEM PHIM
            </a>

            <a class="btn  btn-lg me-2 " style="background-color: plum; color: white; width: 100px;">
                <i class="fas fa-heart"></i>
            </a>
            <a href="" class="btn btn-primary btn-lg"  style="width: 100px;"  data-bs-toggle="modal" data-bs-target="#exampleModal">
                <i class="fas fa-share"></i>
            </a>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Chia sáº»</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form>
                    <div class="modal-body">
                        <h1 ng-model="gui"></h1>
                        
                            <div class="mb-3">
                              <label  class="form-label">Äáº¿n</label>
                              <input type="email" class="form-control" aria-describedby="emailHelp" placeholder="kinzu@gmail.com" required>
                            </div>
                            <div class="mb-3">
                              <label  class="form-label">Ná»i dung</label>
                              <input type="text" class="form-control" >
                            </div>

                    </div>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" ng-click="share()">Gá»­i</button>
                    </div>
                    </form>
                </div>
                </div>
            </div>
            
        </div>

    </div>
    <div class="row">
        <h1 class="fs-1 fw-bold text-center ">REVIEW PHIM</h1>
        <div class="col border border-1 bg-light p-5">
            <p style="text-align: justify; font-size: 30px;">
                Phim bÃ¡m sÃ¡t thuyáº¿t Äa vÅ© trá»¥, cho phÃ©p tá»n táº¡i cÃ¡c chiá»u khÃ´ng gian song song. ÄÃ³ lÃ  má»t táº£i nghiá»m tuyá»t vá»i cho khÃ¡n giáº£, khi tháº¥y Spider-Man: No way Home âcrossoverâ tá»t ra sao. Sá» lÆ°á»£ng nhÃ¢n váº­t khÃ´ng há» lÃ  gÃ¡nh náº·ng cá»§a bá» phim khi mÃ  trong 143 phÃºt, khÃ´ng há» cÃ³ má»t giÃ¢y phÃºt nÃ o lÃ  thá»«a thÃ£i hay buá»n táº» trong diá»n biáº¿n cÃ¢u chuyá»n. Sá»± chÃº Ã½ cá»§a khÃ¡n giáº£ cÃ³ láº½ lÃ  nhá»¯ng mÃ n chiáº¿n Äáº¥u cá»§a Spider-Man vÃ  cÃ¡c Ã¡c nhÃ¢n sáº½ Äáº·c sáº¯c ra sao, cÃ³ khÃ¡c biá»t vá»i nhá»¯ng báº£n phim trÆ°á»c, nhÆ°ng VÃ­ MoMo chá» cÃ³ thá» tiáº¿t lá» á» ÄÃ¢y lÃ  chÃºng ráº¥t âcháº¥tâ, dÃ¹ khÃ´ng chiáº¿m thá»i lÆ°á»£ng nhiá»u!
            </p>
        </div>
    </div>
    <div class="row">
        <h1 class="fs-1 fw-bold text-center">TRAILER</h1>
        <div class="ratio ratio-16x9">
            <iframe src="https://www.youtube.com/embed/OB3g37GTALc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
          </div>
    </div>

</div>