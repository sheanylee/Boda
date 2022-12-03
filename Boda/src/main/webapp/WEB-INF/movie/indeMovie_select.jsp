<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
indeMovie_select.jsp(관리자)-->

<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<style>
	th{
		text-align: center;
		width:130px;
		height: 30px;
	}
</style>

<script type="text/javascript">
	function insertButton(){
		location.href="insertIndeMovie.look"
	}
	function updateButton(num){
		location.href="updateIndeMovie.look?num="+num+"&pageNumber=${pageInfo.pageNumber}"
	}
	function deleteButton(num, img, direc_img1, direc_img2){
		location.href="deleteIndeMovie.look?num="+num+"&img="+img+"&direc_img1="+direc_img1+"&direc_img2="+direc_img2+"&pageNumber=${pageInfo.pageNumber}"
	}
	
</script>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/독립영화 관리.png" style="width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>
<center>
	<form action="selectIndeMovie.look" method="post">
		<br>
		<table>
			<tr>
				<td width="18%">
				</td>
				<td>
				    <div class="form-group">
				      <select name="whatColumn" class="form-select" id="whatColumn">
						<option value="">전체</option>
						<option value="title">영화</option>
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
	<c:forEach var="indeMovie" items="${indeMovieList}">
	<hr>
	<table width=1000>
		<tr>
			<td>
				<table>
					<tr>
						<th>영화명</th>
						<td>${indeMovie.title}</td>
					</tr>
					<tr>
						<th>장르</th>
						<td>${indeMovie.genre}</td>
					</tr>
					<tr>
						<th>러닝타임</th>
						<td>${indeMovie.runtime}</td>
					</tr>
					<tr>
						<th>제작연도</th>
						<td>${indeMovie.year}</td>
					</tr>
					<tr>
						<th>종류</th>
						<td>${indeMovie.kind}</td>
					</tr>
					<tr>
						<th>필름</th>
						<td>${indeMovie.color}</td>
					</tr>
					<tr>
						<th>상영포맷</th>
						<td>${indeMovie.type}</td>
					</tr>
					<tr>
						<th>감독</th>
						<td>${indeMovie.director}</td>
					</tr>
					<tr>
						<th>감독경력</th>
						<td>${indeMovie.direc_info1}</td>
					</tr>
					<c:if test="${indeMovie.direc_info2!=null}">
						<tr>
							<th>감독2경력</th>
							<td>${indeMovie.direc_info2}</td>
						</tr>
					</c:if>
					<tr>
						<th>수상경력</th>
						<td>${indeMovie.fest_awards}</td>
					</tr>
					<tr>
						<th>월드프리미어</th>
						<td>${indeMovie.premiere}</td>
					</tr>
					<tr height=10></tr>
					<tr>
						<th>시놉시스</th>
						<td>${indeMovie.synopsis}</td>
					</tr>
					<tr height=10></tr>
					<tr>
						<th>인텐션</th>
						<td>${indeMovie.intention}</td>
					</tr>
					<tr height=10></tr>
					<tr>
						<th>${indeMovie.title}<br>줄거리</th>
						<td>${indeMovie.note}</td>
					</tr>
				</table>
			</td>
			<td>
				<table>
					<tr>
						<th>
							메인사진<br>
							<img src="<%=request.getContextPath()%>/resources/movie_image/Independent_film/${indeMovie.img}" height="130"><br><br>
						</th>
					</tr>
					<tr>
						<th>
							감독사진<br>
							<img src="<%=request.getContextPath()%>/resources/movie_image/Independent_film/direc/${indeMovie.direc_img1}" height="130"><br><br>
						</th>		
					</tr>
					<c:if test="${indeMovie.direc_img2!=null}">
						<tr>
							<th>
								감독2사진<br>
								<img src="<%=request.getContextPath()%>/resources/movie_image/Independent_film/direc/${indeMovie.direc_img2}" height="130"><br><br>
							</th>		
						</tr>
					</c:if>
					<tr>
						<th>
							영상링크<br>
							<a href="${indeMovie.video}">${indeMovie.video}</a><br><br>
						</th>
					</tr>			
					<tr>
						<th>
							<button type="button" class="btn btn-outline-primary" onclick="updateButton(${indeMovie.num})">수정</button>
							<button type="button" class="btn btn-outline-primary" onclick="deleteButton(${indeMovie.num}, '${indeMovie.img}', '${indeMovie.direc_img1}', '${indeMovie.direc_img2}')">삭제</button><br><br>
						</th>
					</tr>			
				</table>
			</td>
		</tr>
	</table>
	<br>
	</c:forEach>
	<hr>
	${pageInfo.pagingHtml}
</center>
<br><br>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>