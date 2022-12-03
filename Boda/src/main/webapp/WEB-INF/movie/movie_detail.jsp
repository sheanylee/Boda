<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>
	
<!-- 
movie_detail.jsp
 -->

<style>

h3, th, td {
	text-align: center;
}
</style>

<script type="text/javascript">
	function bookingButton(){
		location.href="booking.bk";
	}
	function reviewButton(){
		location.href="review.look?r_movieName=${movieBean.m_name}";
	}
</script>

<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/영화상세보기.png" style="margin-right:70%; width:350px; height:100px">
          </div>
        </div>
      </div>
</div>	
<center>
<table width="1000">
	<tr>
		<td width="50%">
			<table align="center">
				<tr>
					<th><b><font size="40">${movieBean.m_name}</font></b></th>
				</tr>
				<tr>
					<th>
						<hr>
							<table align="center" width="300">
								<tr>
									<td width="100">평점</td>
									<td width="100">예매율</td>
									<td width="100">누적관객</td>
								</tr>
								<tr>
									<fmt:formatNumber type="number" pattern="0.00" value="${avgR_star}" var="r_star"/>
									<td><b><font color=#8C8C8C>${r_star}</font></b></td>
									<td><b><font color="#8C8C8C">${movieBean.m_per}</font>%</b></td>
									<fmt:formatNumber var="formatM_view" value="${movieBean.m_view}" pattern="###,###" />
									<td><b><font color="#8C8C8C">${formatM_view}</font>명</b></td>
								</tr>
							</table>
						<hr>
					</th>
				</tr>
				<tr>
					<th>
						${movieBean.m_nation} | 
						${movieBean.m_genre} | 
						<b><font color="#8C8C8C">${movieBean.m_runtime}</font></b>분 | 
						<c:if test="${(movieBean.m_grade)=='전체'}"><b><font color="#BCE55C">전체관람가</font></b></c:if>
						<c:if test="${(movieBean.m_grade)=='12'}"><b><font color="#6799FF">12세이상관람가</font></b></c:if>
						<c:if test="${(movieBean.m_grade)=='15'}"><b><font color="#F2CB61">15세이상관람가</font></b></c:if>
						<c:if test="${(movieBean.m_grade)=='청불'}"><b><font color="#F15F5F">청소년관람불가</font></b></c:if>
						<br><br>
						<fmt:parseDate var="parseM_date" value="${movieBean.m_date}" pattern="yyyy-MM-dd" /> 
						<fmt:formatDate var="formatM_date" value="${parseM_date}" pattern="yyyy.MM.dd" />
						<b><font color="#8C8C8C">${formatM_date}</font></b> 개봉
					</th>
				</tr>
			</table>
		</td>
		<td width="50%">
			<img src="<%=request.getContextPath()%>/resources/movie_image/${movieBean.m_img}" width="402.75" height="574">
		</td>
	</tr>
	<tr>
		<td></td>
		<td height="70px">
			<button type="button" class="btn btn-primary btn-lg">상영중</button>
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<br><br>
			<font size="4">${movieBean.m_info}</font>
			<br><br><br>
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<b>
			감독 | <font color="#8C8C8C">${movieBean.m_pd}</font><br>
			배우 | <font color="#8C8C8C">${movieBean.m_actor}</font>
			</b>
		</td>
	</tr>
</table>
<br><br>
<table>
	<tr>
		<td>
			<div class="d-grid gap-2">
			  <button class="btn btn-outline-primary btn-lg" type="button" onclick="reviewButton()">「${movieBean.m_name}」 관람평 보러가기</button>
			</div>
		</td>
	</tr>
</table>
</center>
<br><br><br>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>
