<%@ page language="java" contentType="text/html; charset-UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

	<style>
		
	</style>
			<div class="cover_1 overlay bg-slant-white ">
				<div class="img_bg" style="background-image: url('resources/images/main_bull.png');" data-stellar-background-ratio="0.5">
					<div class="container">
						<div
							class="row align-items-center justify-content-center text-center">
							<div class="col-md-10" data-aos="fade-up">
								<h4 class="heading mb-5">시원한 황태육수의 <br>불향짬뽕 전문점입니다.   </h4>
								<p class="sub-heading mb-5">
								 Tasty & Delicious Noodle Dishes <br>
								</p>
								<p>
									<a href="/menu"class="smoothscroll btn btn-outline-white px-5 py-3">Menu </a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end of landing main -->
<section class="ftco-section" id="section-offer">
      <div class="container">
        
        <div class="row">
          <div class="col-md-12 text-center mb-5 ftco-animate">
            <h4 class="ftco-sub-title">Our Offers</h4>
            <h2 class="display-4">시즌메뉴  &amp;  콤보세트 </h2>
            <div class="row justify-content-center">
              <div class="col-md-7">
                <p class="lead"> 계절별 신선한 재료로 조리된 요리들을 셋트로 즐겨보세요.  <br> (*관리자 페이지에서 프로모션 테이블에 입력)</p>
              </div>
            </div>
          </div>
          <div class="col-md-12">
            <div class="owl-carousel ftco-owl">
				<c:forEach var="pro" items="${promotion}" varStatus="status">
					<div class="item">
			           <div class="media d-block mb-4 text-center ftco-media ftco-animate border-0">
		                  <img src="/resources/imgUpload/${pro.promo_imgNm} "alt="Free Template by Free-Template.co" class="img-fluid">
			                  <div class="media-body p-md-5 p-4">
			                    <h5 class="text-primary">${pro.promo_price}원</h5>
			                    <h5 class="mt-0 h4">${pro.promo_title} </h5>
			                    <p class="mb-4">${pro.promo_content} </p>
				                    <p class="mb-0"><a href="#" class="btn btn-primary btn-sm">${pro.end_date}까지 </a></p>
				                  </div>
				                </div>
				              </div> 
				</c:forEach> 

             
            </div>
          </div>
          
        </div>
      </div>
    </section>
    <!-- END section -->
   
<!-- .section -->

<script>
/********************************* Promotion 데이터 가져오기 ******************************************/
var data = ${jsonPromo};
for (var key in data) {
	console.log(key);
	  	if (data.hasOwnProperty(key)) {
			//복제카드 만들기 (카드 id : 'item#')
	  		var cloneElements = $('.clone').clone();
	    	cloneElements.removeClass('clone').attr('id', 'item'+ data[key].idx);
	    	cloneElements.css('display','block');
		  	cloneElements.appendTo('.owl-carousel');
		  	 
		  	//데이터 입력 (카드 id : 'price#' / 'title#' / 'content#' / 'date#')
		  	cloneElements.find( $("#promoImg")).attr('id', 'img'+ data[key].idx);
		  	$('#img'+data[key].idx).attr('src',  '/resources/imgUpload/'+data[key].promo_imgNm);
		  	cloneElements.find( $("#promoPrice")).attr('id', 'price'+ data[key].idx);
		  	$('#price'+data[key].idx).text(data[key].promo_price);
		  	cloneElements.find( $("#promoTitle")).attr('id', 'title'+ data[key].idx);
		  	$('#title'+data[key].idx).text(data[key].promo_title);
		  	cloneElements.find( $("#promoContent")).attr('id', 'content'+ data[key].idx);
		  	$('#content'+data[key].idx).text(data[key].promo_content);
		  	var start = data[key].start_date;
		  	var startFix = start.substring(5,10);
		  	var end = data[key].end_date;
		  	var endFix = end.substring(5,10);
		  	cloneElements.find( $("#promoDate")).attr('id', 'promoDate'+ data[key].idx);
		  	$('#promoDate'+data[key].idx).text(startFix+'~'+endFix);
	    }
}
	   	
</script>
