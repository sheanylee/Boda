<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
reMovie.jsp
 -->

<%@include file="../common/common.jsp" %>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>
 
<center>
<style>
	h3, th, td{
		text-align:center;
	}
</style>

<script type="text/javascript">
	function bookingButton(m_num){
		location.href="movie_booking.look?m_num="+m_num+"&pageNumber=${pageInfo.pageNumber}"
	}
</script>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/재상영.png" style="margin-right:70%; width:350px; height:100px">
          </div>
        </div>
      </div>
</div>	
<form action="reMovie.look" method="post">
	<br>
	<table>
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
			      <input type="text" class="form-control" id="keyword" name="keyword" placeholder="공조2">
			    </div>
			</td>
			<td>
				<input type="submit" class="btn btn-primary" value="검색">
			</td>
		</tr>
	</table>
</form>
<b><font color="#FF4848">${totalCount}</font></b>개의 영화가 검색되었습니다.
<br><br>
<table>
	<tr>
	<c:forEach var="movie" items="${movieList}" varStatus="vs">
		<th>
			<table>
				<tr>
					<th>
						<a href="movie_detail.look?m_num=${movie.m_num}&pageNumber=${pageInfo.pageNumber}">
						<img src="<%=request.getContextPath()%>/resources/movie_image/${movie.m_img}" width="322.2" height="459.2">
						</a>
					</th>
				</tr>
				<tr>
					<th height="10">
						<span <c:if test="${movie.m_grade eq '청불'}">class="badge rounded-pill bg-primary"</c:if>
						<c:if test="${movie.m_grade eq '15'}">class="badge rounded-pill bg-warning"</c:if>
						<c:if test="${movie.m_grade eq '12'}">class="badge rounded-pill bg-info"</c:if>
						<c:if test="${movie.m_grade eq 'All'}">class="badge rounded-pill bg-success"</c:if>>
							${movie.m_grade}
						</span>
							 ${movie.m_name}
					</th>
				</tr>
				<tr height="10">
					<th>
						<fmt:parseDate var="parseM_date" value="${movie.m_date}" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="formatM_date" value="${parseM_date}" pattern="yyyy.MM.dd"/>
						예매율 <font color="#4641D9">${movie.m_per}</font>% | 개봉일 <font color="#4641D9">${formatM_date}</font>
					</th>
				</tr>
				<tr>
					<th>
						<button type="button" class="btn btn-primary" onclick="bookingButton(${movie.m_num})">예매</button>
						<br><br>
					</th>
				</tr>
			</table>
		</th>
		<c:if test="${(vs.count)%5==0}"> <!-- 레코드 5번째 반복되면 다음줄로-->
			</tr><tr>
		</c:if>
	</c:forEach>
	</tr>
</table>
${pageInfo.pagingHtml}
</center>
<br><br>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>