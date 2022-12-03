<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
movie_reopening.jsp
 -->
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<style>
	h3, th, td{
		text-align:center;
	}
	
	
	
</style>

<script type="text/javascript">
	function bookingButton(m_num){
		location.href="booking.bk?m_num="+m_num+"&pageNumber=${pageInfo.pageNumber}"
	}
</script>

<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/재상영.png" style="width:350px; height:100px"><br>
			종영작 중 가장 많은 <b>하트</b>를 받은 <b>TOP3</b>가 <b><font color="#F15F5F">Boda</font></b>에서 재상영되고 있습니다.<br>
          </div>
        </div>
      </div>
</div>
<center>
<form action="movie.look" method="post">
	
</form>
<br>
<br>
<table>
	<tr>
	<c:forEach var="movie" items="${reopeningMovieList}" varStatus="vs">
		<th>
			<table>
				<tr>
					<th>
						<a href="movie_detail.look?m_num=${movie.m_num}&m_name=${movie.m_name}&pageNumber=${pageInfo.pageNumber}">
						<img src="<%=request.getContextPath()%>/resources/movie_image/${movie.m_img}" width="268.5" height="382.6666666666667">
						</a>
					</th>
				</tr>
				<tr>
					<th height="10">
						<span <c:if test="${movie.m_grade eq '청불'}">class="badge rounded-pill bg-primary"</c:if>
						<c:if test="${movie.m_grade eq '15'}">class="badge rounded-pill bg-warning"</c:if>
						<c:if test="${movie.m_grade eq '12'}">class="badge rounded-pill bg-info"</c:if>
						<c:if test="${movie.m_grade eq '전체'}">class="badge rounded-pill bg-success"</c:if>>
							${movie.m_grade}
						</span>
							 ${movie.m_name}
					</th>
				</tr>
				<tr height="10">
					<th>
						<fmt:parseDate var="parseM_date" value="${movie.m_date}" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="formatM_date" value="${parseM_date}" pattern="yyyy.MM.dd"/>
						예매율 <font color="#8C8C8C">${movie.m_per}</font>% | 재개봉일 <font color="#8C8C8C">${formatM_date}</font>
					</th>
				</tr>
				<tr>
					<th>
						<button type="button" class="btn btn-outline-primary btn-sm" >상영중</button>
						<br><br>
					</th>
				</tr>
			</table>
		</th>
	</c:forEach>
	</tr>
</table>
<br>
</center>
<br>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>