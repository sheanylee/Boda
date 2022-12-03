<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp"%>

<style type="text/css">
.accordion {
	margin: auto;
	width: 1180px;
}

a {
	text-decoration: none;
}

.imgLine {
	align-content: center;
	text-align: center;
}

.img {
	padding-bottom: 15px;
}

.ad {
	margin: auto;
	align-content: center;
	text-align: center;
}
</style>
z

<center>
	<h3>
		<p class="text-primary"
			style="width: 600px; height: 50px; margin: auto;">BODA만의 특별함이 있는
			영화관을 소개합니다</p>
	</h3>
	<br> <a class="text-primary"
		style="font-size: 20px; font-weight: bolder;">#TECHNOLOGY</a> <a
		class="text-primary" style="font-size: 20px; font-weight: bolder;">&nbsp;&nbsp;#PRESTIGE</a>
	<a class="text-primary" style="font-size: 20px; font-weight: bolder;">&nbsp;&nbsp;#CONCEPT</a>
</center>
<br>
<br>

<div class="accordion" id="accordionExample">
	<div class="accordion-item">
		<h2 class="accordion-header" id="headingOne">
			<button class="accordion-button" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapseOne"
				aria-expanded="true" aria-controls="collapseOne">
				<a style="font-size: 20; font-weight: bolder;">TECHNOLOGY</a>
			</button>
		</h2>

		<div id="collapseOne" class="accordion-collapse collapse show"
			aria-labelledby="headingOne" data-bs-parent="#accordionExample">
			<div class="accordion-body">

				<div class="card mb-3">
					<div class="card-body">
						<h5 class="card-title">3S(Screen, Sound, Seat)</h5>
						<h6 class="card-subtitle text-muted">진화된 3S(Screen,
							Sound,Seat) 기술로 컨텐츠 몰입도를 극대화하여 영화 관람에 최적화된 환경을 제공합니다.</h6>
					</div>
					<div class="imgLine">
						<img class="img" src="./resources/cinema_Info/16554477734650.png" width=1040>
						<img class="img" src="./resources/cinema_Info/starium.png"> <img class="img"
							src="./resources/cinema_Info/4DX.png"> <img class="img"
							src="./resources/cinema_Info/sound.png" width=355 height=355>
						<img class="img" src="./resources/cinema_Info/ScreenX.png" width=1040>
					</div>

				</div>
				<!--<div class="card mb-3">  -->
			</div>
			<!-- <div class="accordion-body"> -->
		</div>
		<!-- <div id="collapseOne" -->



		<h2 class="accordion-header" id="headingTwo">
			<button class="accordion-button collapsed" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapseTwo"
				aria-expanded="false" aria-controls="collapseTwo">
				<a style="font-size: 20; font-weight: bolder;">PRESTIGE</a>
			</button>
		</h2>

		<div id="collapseTwo" class="accordion-collapse collapse"
			aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
			<div class="accordion-body">
				<div class="card mb-3">
					<div class="card-body">
						<h5 class="card-title">세련된 인테리어와 프리미엄 서비스</h5>
						<h6 class="card-subtitle text-muted">세련된 인테리어와 프리미엄 서비스로 진정한
							품격을 느낄 수 있는 최고급 영화 관람 환경을 선사합니다.</h6>
					</div>

					<div class="imgLine">
						<img class="img-rounded"
							src="./resources/cinema_Info/goldclass.png" width=355 height=355>
						<img class="img-rounded"
							src="./resources/cinema_Info/premiumrecl.png" width=355
							height=355> <img src="./resources/cinema_Info/spherex.png"
							width=355 height=355>
					</div>

				</div>
			</div>
		</div>



		<h2 class="accordion-header" id="headingThree">
			<button class="accordion-button collapsed" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapseThree"
				aria-expanded="false" aria-controls="collapseThree">
				<a style="font-size: 20; font-weight: bolder;">CONCEPT</a>
			</button>
		</h2>
		<div id="collapseThree" class="accordion-collapse collapse"
			aria-labelledby="headingThree" data-bs-parent="#accordionExample">
			<div class="accordion-body">
				<div class="card mb-3">
					<div class="card-body">
						<h5 class="card-title">유니크한 테마로 구성된 컨셉 상영관</h5>
						<h6 class="card-subtitle text-muted">유니크한 테마로 구성된 컨셉 상영관으로
							특별한 추억을 만들 수 있는 다양한 영화 관람 경험을 선물합니다.</h6>
					</div>

					<div class="imgLine">
						<img class="img-rounded"
							src="./resources/cinema_Info/cine&fore.png" width=355 height=355>
						<img class="img-rounded"
							src="./resources/cinema_Info/cine&livingroom.png" width=355
							height=355> <img class="img-rounded"
							src="./resources/cinema_Info/cine&kids.png" width=355 height=355>
					</div>
				</div>
			</div>



		</div>
	</div>
</div>
<br>
<div class="ad">
	<img
		src="<%=request.getContextPath()%>/resources/ad_img/중간영화광고800x90.jpg"
		width="1180px" height="110">
</div>

<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp"%>