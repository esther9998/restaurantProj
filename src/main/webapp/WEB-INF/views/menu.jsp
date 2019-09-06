<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

			<div class="section bg-light" id="section-menu" data-aos="fade-up">
				<div class="container">
					<div class="row section-heading justify-content-center mb-5 site-meun-top">
						<div class="col-md-8 text-center">
							<h2 class="heading mb-3">Menu</h2>
							<hr>
						</div>
					</div>
					<div class="row justify-content-center">
						<div class="col-md-8">
							<ul class="nav site-tab-nav" id="pills-tab" role="tablist">
								<li class="nav-item">
								<a class="nav-link active" id="pills-01-tab" data-toggle="pill"
									href="#pills-01" role="tab" aria-controls="pills-01" aria-selected="true">Breakfast</a>
								</li>
								<li class="nav-item">
								<a class="nav-link" id="pills-02-tab" data-toggle="pill" href="#pills-02"
									role="tab" aria-controls="pills-02" aria-selected="false">Brunch</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									id="pills-03-tab" data-toggle="pill" href="#pills-03"
									role="tab" aria-controls="pills-03" aria-selected="false">Dinner</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									id="pills-04-tab" data-toggle="pill" href="#pills-04"
									role="tab" aria-controls="pills-04" aria-selected="false">Drinks</a>
								</li>
							</ul>
							<div class="tab-content" id="pills-tabContent">
							<!-- 탭 nav -->
								<div class="tab-pane fade show active" id="pills-01" role="tabpanel" aria-labelledby="pills-01-tab"></div>
								<div class="tab-pane fade" id="pills-02" role="tabpanel" aria-labelledby="pills-02-tab"></div>
								<div class="tab-pane fade" id="pills-03" role="tabpanel"aria-labelledby="pills-03-tab"></div>
								<div class="tab-pane fade show" id="pills-04" role="tabpanel" aria-labelledby="pills-04-tab"></div>
							
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- .section -->
			
			
			<!--  데이터 동적 생성 모델 -->
			<div class="d-block d-md-flex menu-food-item menuClone" style ="display: none !important" >
				<div class="text order-1 mb-3">
				<img id="menuImg" src="/resources/images/img_3.jpg"	alt="Free Website Template for Restaurants by Free-Template.co">
						<h3 id="menuTitle"><a href="#">Grilled Top Sirlion Steak</a></h3>
						<p id="menuContent">Spinach and artichokes in a creamy cheese dip with warm tortilla chips &amp; salsa.</p>
				</div>	
				<div class="price order-2"  id="menuPrice">
					<strong>$18.99</strong>
				</div>
			</div>
		<script>
/********************************* Promotion 데이터 가져오기 ******************************************/
var data = ${jsonMenu};
for (var key in data) {
	
	   	if (data.hasOwnProperty(key)) {
	  	//복제카드 만들기 (카드 id : 'item#')
	  		var cloneElements = $('.menuClone').clone();
	   	 	cloneElements.removeClass('menuClone').attr('id', 'item'+ data[key].idx);
	  	  	cloneElements.css('display','block');
	  	  	
	  		if(data[key].category == 1){
			  	cloneElements.appendTo('#pills-01');
	  		}else if(data[key].category == 2){
			  	cloneElements.appendTo('#pills-02');
	  		}else if(data[key].category == 3){
			  	cloneElements.appendTo('#pills-03');
	  		}else if(data[key].category == 4){
			  	cloneElements.appendTo('#pills-04');
	  		}else{
	  			//category 0은 안붙음. 
	  		}
	  		
	  		//데이터 입력
	  		cloneElements.find( $("#menuImg")).attr('id', 'menuImg'+ data[key].idx);
		  	$('#menuImg'+data[key].idx).attr('src',  '/resources/imgUpload/'+data[key].menu_serverImgFile);
		  	cloneElements.find( $("#menuTitle")).attr('id', 'menuTitle'+ data[key].idx);
			$('#menuTitle'+data[key].idx).text(data[key].menu_title);
		  	cloneElements.find( $("#menuContent")).attr('id', 'menuContent'+ data[key].idx);
		  	$('#menuContent'+data[key].idx).text(data[key].menu_content);
		  	cloneElements.find( $("#menuPrice")).attr('id', 'menuPrice'+ data[key].idx);
		  	$('#menuPrice'+data[key].idx).text(data[key].menu_price);
	  	} 
	}
</script>
			
