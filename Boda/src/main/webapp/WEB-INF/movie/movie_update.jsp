<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
movie_update.jsp(관리자)
-->
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<style>
th {
	width: 70px;
}
.err{
	font-size: 9pt;
	color: #FF4848;
	font-weight: bold;
}
</style>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/영화 수정.png" style="margin-right:70%; width:350px; height:100px">
          </div>
        </div>
      </div>
</div>	
<center>
	<form:form commandName="movie" method="post" action="updateMovie.look" enctype="multipart/form-data">

	<input type="hidden" name="m_num" value="${movie.m_num}">
	<input type="hidden" name="pageNumber" value="${pageNumber}">
	<input type="hidden" name="originalImg" value="${movie.m_img}">
		<br>
		<table>
			<tr>
				<th>영화코드</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="m_code" id="m_code" value="${movie.m_code}" maxlength="10">
						<form:errors cssClass="err" path="m_code"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>영화명</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="m_name" id="m_name" value="${movie.m_name}">
						<form:errors cssClass="err" path="m_name"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>장르</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="m_genre" id="m_genre" value="${movie.m_genre}">
						<form:errors cssClass="err" path="m_genre"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>포스터</th>
				<td>
					<img width="80.55" height="114.8" src="<%=application.getContextPath()%>/resources/movie_image/${movie.m_img}">
					<div class="form-group">
						<input type="file" class="form-control" name="upload" id="upload" value="${movie.upload}">
						<form:errors cssClass="err" path="m_img"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>관람등급</th>
				<td>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="m_grade" id="m_grade" value="전체" <c:if test="${movie.m_grade eq '전체'}">checked</c:if>>
				          전체관람가
					</div>
					<div class="form-check">
				        <input class="form-check-input" type="radio" name="m_grade" id="m_grade" value="12" <c:if test="${movie.m_grade eq '12'}">checked</c:if>>
				          12
					</div>
					<div class="form-check">
				        <input class="form-check-input" type="radio" name="m_grade" id="m_grade" value="15" <c:if test="${movie.m_grade eq '15'}">checked</c:if>>
				          15
					</div>
					<div class="form-check">
				        <input class="form-check-input" type="radio" name="m_grade" id="m_grade" value="청불" <c:if test="${movie.m_grade eq '청불'}">checked</c:if>>
				          청소년관람불가
					</div>
					<form:errors cssClass="err" path="m_grade"/>
				</td>
			</tr>
			<tr>
				<th>제작국가</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="m_nation" id="m_nation" value="${movie.m_nation}">
						<form:errors cssClass="err" path="m_nation"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>감독</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="m_pd" id="m_pd" value="${movie.m_pd}">
						<form:errors cssClass="err" path="m_pd"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>출연</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="m_actor" id="m_actor" value="${movie.m_actor}">
						<form:errors cssClass="err" path="m_actor"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>러닝타임</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="m_runtime" id="m_runtime" value="${movie.m_runtime}">
						<form:errors cssClass="err" path="m_runtime"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>개봉일</th>
				<td>
					<fmt:parseDate var="parseM_date" value="${movie.m_date}" pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="formatM_date" value="${parseM_date}" pattern="yyyy-MM-dd"/>
					<div class="form-group">
						<input type="date" class="form-control" name="m_date" id="m_date" value="${formatM_date}">
						<form:errors cssClass="err" path="m_date"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>종영일</th>
				<td>
					<fmt:parseDate var="parseM_enddate" value="${movie.m_enddate}" pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="formatM_enddate" value="${parseM_enddate}" pattern="yyyy-MM-dd"/>
					<div class="form-group">
						<input type="date" class="form-control" name="m_enddate" id="m_enddate" value="${formatM_enddate}">
						<form:errors cssClass="err" path="m_enddate"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>줄거리</th>
				<td>
				    <div class="form-group">
				      <textarea class="form-control" name="m_info" id="m_info" rows="15">${movie.m_info}</textarea>
				      <form:errors cssClass="err" path="m_info" />
				    </div>
				</td>
			</tr>
			<tr>
				<th>누적관객</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="m_view" id="m_view" value="${movie.m_view}">
						<form:errors cssClass="err" path="m_view"/>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan=2 align="center" height="70">
					<button type="submit" class="btn btn-primary">수정</button>
				</td>
			</tr>
		</table>
	</form:form>
</center>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>