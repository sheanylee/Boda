<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>  
<style type="text/css">
.container{
	width:1180px;
}
.card{  
	width:1180px;
	margin: auto;
	font-size: 20px;
	padding: 20px;

}
.atag{
	text-decoration: none;
}
.ad{
	margin: auto;
	align-content: center;
	text-align: center;
}
a{
	text-decoration: none;
	align-content: center;
}
</style>

<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/교통위치.png" style="width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>
<div align="center" style="position: fiexd">
	<img
		src="<%=request.getContextPath()%>/resources/극장 이미지/h3_theater.gif"
		width="200">
</div>
<br>


<div align="center" style="position: fiexd">
	<img
		src="<%=request.getContextPath()%>/resources/극장 이미지/${tb.t_img}"
		width="1180px" >
</div>

<div class="card text-white bg-dark mb-3" >
	
	<p>${tb.t_theater }&nbsp;&nbsp;<a class="atag" href="theater_Info.th?t_num=${tb.t_num }">
	<img src="<%=request.getContextPath()%>/resources/타임테이블 이미지/positioning.png" width="30">교통&위치보기</a></p>
	<p>${tb.t_region }&nbsp;${tb.t_gu }&nbsp;${tb.t_address }</p>
	<p>${tb.t_tel }&nbsp;총
		${thbean.max}관&nbsp;/${thbean.seat }석</p>
	<p>4WAY 입체음향, 완벽한 디지털 사운드,최고급 의자, 장애인을 위한
		전용화장실,전용 입퇴장로, 여성전용 화장실 파우더 룸,24시간 쉼없이 돌아가는 무비 파라다이스</p>
</div>

<div class="ad">
	<img src="<%=request.getContextPath()%>/resources/ad_img/2중간영화광고980x90.jpg" width="1180px" height="110">
</div>


<div class="container">
	<hr>
	<div>
		<img src="<%=request.getContextPath()%>/resources/타임테이블 이미지/버스.png"
			width="60">&nbsp;교통안내
		<hr>
	</div>

	<br>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<br>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d037c141a0bf3d1354b3664020d19979"></script>
	<script type="text/javascript">

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(${tb.t_location}), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		//https://www.google.com/maps/place/CGV+%EA%B0%95%EB%82%A8/data=!4m5!3m4!1s0x0:0x7e2247a87da80045!8m2!3d37.5015587!4d127.026319
		
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(${tb.t_location});

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
	</script>


	<input type="button" value="길찾기" class="btn btn-primary"
		onclick="location.href='https://map.kakao.com/link/to/${tb.t_theater },${tb.t_location }'" />
		<hr>
	<div>
		<img src="<%=request.getContextPath()%>/resources/타임테이블 이미지/자돋차.png"
			width="60">&nbsp;주차안내
		<hr>
		<di>
		<dt># 주차정보</dt>
		<dd>- 위치: 건물 지하2F ~ 지하4F</dd>
		<dt># 주차요금</dt>
		<dd>- CGV 영화 관람 시 주차 3시간 6,000원</dd>
		<dd>- 주차시간 (3시간) 초과 시 10분 당 1,000원</dd>
		<dd>※ 발렛서비스 운영시간 : 오전 8시 이후 ~ 오후 20시</dd>

		<dd>※ 발렛 무료 서비스는 영화 관람 고객 한 함. (영화 미관람 시 건물 주차장에서 별도 정산)</dd>
		<dd>※ 20시 이후 입차 차량은 발렛서비스 이용이 제한될 수 있으며, 별도 운영되는 주차팀의 사정에 따라 변경될
			수 있습니다.</dd>

		<dt># 이용안내</dt>
		<dd>- 주차공간이 협소하여 평일 오후/주말은 주차가 어렵습니다.</dd>
		<dd>- 편리한 대중교통 이용을 이용하여 주시기 바랍니다.</dd>
		</di>
	</div>
	<div align="right">
	<a href="javascript:history.back();">이전페이지로 돌아가기</a>
	</div>

</div>


</body>

<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>