<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
movie.jsp
 -->

<!-- 로고 -->

<style type="text/css">
.back {
	background: url("./resources/Home_Image/정직백.jpg");
	width: 100%;
}

h3, th, td {
	text-align: center;
	align-content: center;
}

.center {
	margin: auto;
	text-align: center;
	align-content: center;
}

table {
	margin: auto;
	text-align: center;
	align-content: center;
}
</style>

	<!-- <body onLoad="window.open('popup.look','pop','scrollbars=no,width=615,height=645')"> -->

	<div class="container">
		<div class="page-header" id="banner">
			<div class="row">
				<div class="col-lg-8 col-md-7 col-sm-6">
					<a href="movie.look" style="display: inline-block;"><img src="<%=request.getContextPath() %>/resources/logo_image/logo_image_1.jpg" style="width:200px;"><img src="<%=request.getContextPath() %>/resources/logo_image/영화를보다.png" style="vertical-align: bottom; width:200px;"></a>
					<br>
					<br>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../common/common.jsp"%>
	<%@ include file="/WEB-INF/Top&Bottom/top.jsp"%>

	<!-- <center>
 -->
	<div class="center">
		<div class="back">
			<!-- 영상 -->
			<input type="hidden" id="isOpenUserEmailYNPopup"
				name="isOpenUserEmailYNPopup" value="False" />

			<!-- S > Movie Selection
    Description:
    - iframe 영역으로 추후 협의 후 작업 진행 예정
 -->
			<div id="ctl00_PlaceHolderContent_divMovieSelection_wrap"
				class="movieSelection_wrap">
				<div class="contents">

					<div class="video_wrap">
						<video autoplay muted loop="loop" width="70%">
							<source
								src='https://adimg.cgv.co.kr/images/202208/comebackhome/0907_comebackhome_1080x608.mp4'
								type='video/mp4'>
						</video>
					</div>
				</div>
			</div>

			<br>
			<br>
			<script type="text/javascript">
	function bookingButton(){
		location.href="booking.bk";
	}
</script>

			<form action="movie.look" method="post">
				<h3 style="color: white;">무비차트</h3>
				<br>
				<table class="cen">
					<tr>
						<td>
							<div class="form-group">
								<select name="whatColumn" class="form-select" id="whatColumn">
									<option value="">전체</option>
									<option value="m_name">영화</option>
									<option value="m_genre">장르</option>
									<option value="m_actor">배우</option>
								</select>
							</div>
						</td>
						<td>
							<div class="form-group">
								<input type="text" class="form-control" id="keyword"
									name="keyword" placeholder="공조2">
							</div>
						</td>
						<td><input type="submit" class="btn btn-primary" value="검색">
						</td>
					</tr>
				</table>
			</form>
			<b style="color: white;"><font class="text-warning">${totalCount}</font>개의
				영화가 검색되었습니다.</b> <br>
			<br>
			<table>
				<tr>
					<c:forEach var="movie" items="${movieList}" varStatus="vs">
						<th>

							<table>
								<tr>
									<th style="color: white;">
									<a href="movie_detail.look?m_num=${movie.m_num}&m_name=${movie.m_name}&pageNumber=${pageInfo.pageNumber}">
											<img
											src="<%=request.getContextPath()%>/resources/movie_image/${movie.m_img}"
											width="250" height="350">
									</a></th>
								</tr>
								<tr>
									<th height="10" style="color: white;"><span
										<c:if test="${movie.m_grade eq '청불'}">class="badge rounded-pill bg-primary"</c:if>
										<c:if test="${movie.m_grade eq '15'}">class="badge rounded-pill bg-warning"</c:if>
										<c:if test="${movie.m_grade eq '12'}">class="badge rounded-pill bg-info"</c:if>
										<c:if test="${movie.m_grade eq '전체'}">class="badge rounded-pill bg-success"</c:if>>
											${movie.m_grade} </span>  <c:set var="m_name" value="${movie.m_name}" />
							 ${fn:substring(m_name,0,16)}</th>
								</tr>
								<tr height="10">
									<th style="color: white;"><fmt:parseDate var="parseM_date"
											value="${movie.m_date}" pattern="yyyy-MM-dd" /> <fmt:formatDate
											var="formatM_date" value="${parseM_date}"
											pattern="yyyy.MM.dd" /> 예매율 <font class="text-warning">${movie.m_per}%</font>
										| 개봉일 <font class="text-warning">${formatM_date}</font></th>
								</tr>
								 <tr>
									<th>
										<button type="button" class="btn btn-primary"
											>상영중</button> 
											<br>
									<br>
									</th>
								</tr>
							</table>
						</th>
						<c:if test="${(vs.count)%5==0}">
							<!-- 레코드 5번째 반복되면 다음줄로-->
				</tr>
				<tr>
				</c:if>
				</c:forEach>
				</tr>
			</table>
			${pageInfo.pagingHtml}<br>
			<br>
		</div>
		<br>
		<img
			src="<%=request.getContextPath()%>/resources/event_Image/가로광고2.jpg"
			width="70%" height="110">
	</div>
	<!-- </center> -->
	<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp"%>