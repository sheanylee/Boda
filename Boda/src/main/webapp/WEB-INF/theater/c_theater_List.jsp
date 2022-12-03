<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>  
<style type="text/css">

.card{  
	width:70%;
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
</style>

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type='text/javascript'>

	$(function() {
	    
	    $("#datepicker").on("change",function(){
	        var selected = $(this).val();
	       //alert(selected);
	       	location.href="list.th?day="+selected+"&t_theater=${t_theater}&t_region=${t_region }";
	    });
	});
</script>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/극장.png" style="width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>	

<div class="card text-white bg-dark mb-3">
	<p align="center">지역과 영화관을 선택하세요</p>
	<hr>
	<ui align="center">
	<c:forEach var="rtb" items="${rlists }">
		<c:if test="${rtb.t_region eq '서울'}">
			<a class="atag" href="list.th?t_region=${rtb.t_region }&t_region2=서울&t_region3=서울" >서울</a>&nbsp;&nbsp;
		</c:if>
		<c:if test="${rtb.t_region eq '경기'}">
			<a class="atag" href="list.th?t_region=${rtb.t_region }&t_region2=경기&t_region3=경기" >경기</a>&nbsp;&nbsp;
		</c:if>
		<c:if test="${rtb.t_region eq '인천'}">
			<a class="atag" href="list.th?t_region=${rtb.t_region }&t_region2=인천&t_region3=인천" >인천</a>&nbsp;&nbsp;
		</c:if>
		<c:if test="${rtb.t_region eq '강원도'}">
			<a class="atag" href="list.th?t_region=${rtb.t_region }&t_region2=강원도&t_region3=강원도">강원</a>&nbsp;&nbsp;
		</c:if>
		<c:if test="${rtb.t_region eq '대전' || rtb.t_region eq '충남' || rtb.t_region eq '충북'}">
			<a class="atag"href="list.th?t_region=${rtb.t_region }&t_region2=대전&t_region3=충북" >대전/충청</a>&nbsp;&nbsp;
		</c:if>
		<c:if test="${rtb.t_region eq '대구'}">
			<a class="atag" href="list.th?t_region=${rtb.t_region }&t_region2=대구&t_region3=대구" >대구</a>&nbsp;&nbsp;
		</c:if>
		<c:if test="${rtb.t_region eq '부산' || rtb.t_region eq '울산'}">
			<a class="atag" href="list.th?t_region=${rtb.t_region }&t_region2=울산&t_region3=울산">부산/울산</a>&nbsp;&nbsp;
		</c:if>
		<c:if test="${rtb.t_region eq '경상남도' || rtb.t_region eq '경북'}">
			<a class="atag" href="list.th?t_region=${rtb.t_region }&t_region2=경북&t_region3=경북">경상</a>&nbsp;&nbsp;
		</c:if>
		<c:if test="${rtb.t_region eq '전라남도' || rtb.t_region eq '광주광역시' || rtb.t_region eq '제주도'}">
			<a class="atag" href="list.th?t_region=${rtb.t_region }&t_region2=광주광역시&t_region3=제주도" >광주/전라/제주</a>&nbsp;&nbsp;
		</c:if>
		
	</c:forEach>
	<hr>
	<c:forEach var="tb" items="${lists }" varStatus="j">
		<a class="atag" style="text-decoration: none;" href="list.th?t_theater=${tb.t_theater }&t_region=${t_region }&t_region2=${t_region2}&t_region3=${t_region3}">${tb.t_theater }
			<c:if test="${j.last != true}">|</c:if>
		</a>&nbsp;&nbsp;
		<c:if test="${j.index/5 == 1 }">
			<br>
		</c:if>
	</c:forEach>
	</ui>
</div>

<br>
<div align="center" style="position: fiexd">
	<img
		src="<%=request.getContextPath()%>/resources/극장 이미지/h3_theater.gif"
		width="200">
</div>
<br>


<div align="center" style="position: fiexd">
	<img
		src="<%=request.getContextPath()%>/resources/극장 이미지/${tbean.t_img}"
		width="70%" >
</div>

<div class="card text-white bg-dark mb-3" >
	
	<p>${tbean.t_theater }&nbsp;&nbsp;<a class="atag" href="theater_Info.th?t_num=${tbean.t_num }">
	<img src="<%=request.getContextPath()%>/resources/타임테이블 이미지/positioning.png" width="30">교통&위치보기</a></p>
	<p>${tbean.t_region }&nbsp;${tbean.t_gu }&nbsp;${tbean.t_address }</p>
	<p>${tbean.t_tel }&nbsp;총
		${thbean.max}관&nbsp;/${thbean.seat }석</p>
	<p>4WAY 입체음향, 완벽한 디지털 사운드,최고급 의자, 장애인을 위한
		전용화장실,전용 입퇴장로, 여성전용 화장실 파우더 룸,24시간 쉼없이 돌아가는 무비 파라다이스</p>
</div>

<div class="ad">
	<img src="<%=request.getContextPath()%>/resources/ad_img/2중간영화광고980x90.jpg" width="70%" height="110">
</div>


<div style="width:70%; margin: auto; height:150px;">
	<hr>
	<label style="font-size: 20px ">상영시간표</label>
	<div class="input-group date">
	<input type="date" class="form-control" id="datepicker" name="t_day" value="${day }">   
	</div>
	<hr>
		<p><img src="<%=request.getContextPath()%>/resources/타임테이블 이미지/조조 심야.png"></p>
</div> <!-- 밑에부터 반복 -->
	<c:if test="${not empty ttlists}">
	<c:forEach var="ttb" items="${ttlists }">
	
		<div class="card border-secondary mb-3" >
		<a class="atag" href="booking.bk">
			<fmt:formatNumber value="${ttb.m_grade}" type="number" var="m_grade"/>
			<c:if test="${m_grade eq 'All'}">
				<img alt="" src="<%=request.getContextPath()%>/resources/타임테이블 이미지/All.png" width="50" height="50">
			</c:if>
			<c:if test="${m_grade eq '12'}">
				<img alt="" src="<%=request.getContextPath()%>/resources/타임테이블 이미지/12.png" width="50" height="50">
			</c:if>
			<c:if test="${m_grade eq '15'}">
				<img alt="" src="<%=request.getContextPath()%>/resources/타임테이블 이미지/15.png" width="50" height="50">
			</c:if>
			<c:if test="${m_grade eq '18'}">
				<img alt="" src="<%=request.getContextPath()%>/resources/타임테이블 이미지/18.png" width="50" height="50">
			</c:if>
			&nbsp;${ttb.mname}&nbsp;|
			&nbsp;${ttb.cinema }관&nbsp;|
			&nbsp;상영중&nbsp;|
			&nbsp;${ttb.m_genre}&nbsp;|
			&nbsp;${ttb.mstart}&nbsp;|
			&nbsp;${ttb.mend }&nbsp;|
			&nbsp;${ttb.m_date }&nbsp;|
			&nbsp;${ttb.t_premium }&nbsp;|
			&nbsp;${ttb.t_seat - ttb.bookingSeat }/${ttb.t_seat }
		</a>
		</div>
	</c:forEach>
	</c:if>
	<c:forEach var="inde" items="${indelists }">
	
		<div class="card border-secondary mb-3" >
		<a class="atag" href="booking.bk">
			<img alt="" src="<%=request.getContextPath()%>/resources/타임테이블 이미지/15.png" width="50" height="50">
			&nbsp;${inde.mname}&nbsp;|
			&nbsp;${inde.cinema }관&nbsp;|
			&nbsp;상영중&nbsp;|
			&nbsp;${inde.m_genre}&nbsp;| 
			&nbsp;${inde.mstart}&nbsp;|
			&nbsp;${inde.mend }&nbsp;|
			&nbsp;${inde.m_date }&nbsp;|
			&nbsp;${inde.t_premium }&nbsp;| 
			&nbsp;${inde.t_seat - inde.bookingSeat }/${inde.t_seat }
		</a>
		</div>
	</c:forEach>
	<c:if test="${empty ttlists && empty indelists}">
			<div class="card border-secondary mb-3" >
			상영스케줄이 없습니다.
			</div>
	</c:if>
	
</body>

<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>