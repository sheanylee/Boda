<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
movie_select.jsp(관리자)-->

<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>



<style>
th {
	text-align: center;
	width: 100px;
	height: 30px;
}
</style>

<script type="text/javascript">
	function insertButton(){
		location.href="insertMovie.look"
	}
	function updateButton(m_num){
		location.href="updateMovie.look?m_num="+m_num+"&pageNumber=${pageInfo.pageNumber}"
	}
	function deleteButton(m_num, m_img){
		location.href="deleteMovie.look?m_num="+m_num+"&pageNumber=${pageInfo.pageNumber}&m_img="+m_img
	}
	
</script>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/영화 관리.png" style="margin-right:70%; width:350px; height:100px">
          </div>
        </div>
      </div>
</div>	
<center>
	<form action="selectMovie.look" method="post">
		<br>
		<table>
			<tr>
				<td width="18%">
				</td>
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
				      <input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색어를 입력하세요.">
				    </div>
				</td>
				<td>
					<input type="submit" class="btn btn-primary" value="검색">
					&nbsp<input type="button" class="btn btn-outline-primary" value="영화 등록" onclick="insertButton()">
				</td>
			</tr>
		</table>
	</form>
	<br>
	<b><font color="#F15F5F">${totalCount}</font></b>개의 영화가 검색되었습니다.
	<br><br>
	<c:forEach var="movie" items="${movieList}">
	<hr>
	<table width="1000">
		<tr>
			<th rowspan="12">
				<img src="<%=request.getContextPath()%>/resources/movie_image/${movie.m_img}" width="161.1" height="229.6"><br>
				<br>
				<button type="button" class="btn btn-outline-primary" onclick="updateButton(${movie.m_num})">수정</button>
				<button type="button" class="btn btn-outline-primary" onclick="deleteButton(${movie.m_num}, '${movie.m_img}')">삭제</button>
			</th>
		</tr>
		<tr>
			<th>영화코드</th>
			<td>${movie.m_code}</td>
		</tr>
		<tr>
			<th>영화명</th>
			<td>${movie.m_name}</td>
		</tr>
		<tr>
			<th>장르</th>
			<td>${movie.m_genre}</td>
		</tr>
		<tr>
			<th>시청등급</th>
			<td>${movie.m_grade}</td>
		</tr>
		<tr>
			<th>제작국가</th>
			<td>${movie.m_nation}</td>
		</tr>
		<tr>
			<th>감독</th>
			<td>${movie.m_pd}</td>
		</tr>
		<tr>
			<th>츨연</th>
			<td>${movie.m_actor}</td>
		</tr>
		<tr>
			<th>러닝타임</th>
			<td>${movie.m_runtime}</td>
		</tr>
		<tr>
			<th>개봉일</th>
			<fmt:parseDate var="parseM_date" value="${movie.m_date}" pattern="yyyy-MM-dd"/>
			<fmt:formatDate var="formatM_date" value="${parseM_date}" pattern="yyyy.MM.dd"/>
			<td>${formatM_date}
			</td>
		</tr>
		<tr>
			<th>종영일</th>
			<fmt:parseDate var="parseM_enddate" value="${movie.m_enddate}" pattern="yyyy-MM-dd"/>
			<fmt:formatDate var="formatM_enddate" value="${parseM_enddate}" pattern="yyyy.MM.dd"/>
			<td>${formatM_enddate}</td>
		</tr>
		<tr>
			<th>누적관객</th>
			<fmt:formatNumber var="formatM_view" value="${movie.m_view}" pattern="###,###"/>
			<td>${formatM_view}</td>
		</tr>
		<tr>
			<th colspan="3"></th>
		</tr>
		<tr>
			<th>${movie.m_name}<br>줄거리</th>
			<td colspan="2">${movie.m_info}</td>
		</tr>
	</table>
	<br>
	</c:forEach>
	<hr>
	${pageInfo.pagingHtml}
</center>
<br><br>

<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>


