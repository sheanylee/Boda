<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- 
movie_insert.jsp(관리자)
 -->
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>
 
<style>
th {
	width: 120px;
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
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/독립영화 수정.png" style="margin-right:70%; width:350px; height:100px">
          </div>
        </div>
      </div>
</div>	
<center>
	<form:form commandName="indeMovie" method="post" action="updateIndeMovie.look" enctype="multipart/form-data">
	
	<input type="hidden" name="num" value="${indeMovie.num}">
	<input type="hidden" name="pageNumber" value="${pageNumber}">
	<input type="hidden" name="originalImg" value="${indeMovie.img}">
	<input type="hidden" name="originalImg1" value="${indeMovie.direc_img1}">
	<input type="hidden" name="originalImg2" value="${indeMovie.direc_img2}">
		<br>
		<table>
			<tr>
				<th>영화명</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="title" id="title" value="${indeMovie.title}">
						<form:errors cssClass="err" path="title"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>제작연도</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="year" id="year" value="${indeMovie.year}">
						<form:errors cssClass="err" path="year"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>종류</th>
				<td>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="kind" id="kind" value="단편" <c:if test="${indeMovie.kind eq '단편'}">checked</c:if>>
				          단편
					</div>
					<div class="form-check">
				        <input class="form-check-input" type="radio" name="kind" id="kind" value="장편" <c:if test="${indeMovie.kind eq '장편'}">checked</c:if>>
				          장편
					</div>
					<div class="form-check">
				        <input class="form-check-input" type="radio" name="kind" id="kind" value="개막작" <c:if test="${indeMovie.kind eq '개막작'}">checked</c:if>>
				          개막작
					</div>
					<form:errors cssClass="err" path="kind"/>
				</td>
			</tr>
			<tr>
				<th>장르</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="genre" id="genre" value="${indeMovie.genre}">
						<form:errors cssClass="err" path="genre"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>필름</th>
				<td>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="color" id="color" value="Color" <c:if test="${indeMovie.color eq 'Color'}">checked</c:if>>
				          컬러
					</div>
					<div class="form-check">
				        <input class="form-check-input" type="radio" name="color" id="color" value="B/W" <c:if test="${indeMovie.color eq 'B/W'}">checked</c:if>>
				          흑백
					</div>
					<form:errors cssClass="err" path="color"/>
				</td>
			</tr>
			<tr>
				<th>상영포맷</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="type" id="type" value="${indeMovie.type}">
						<form:errors cssClass="err" path="type"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>러닝타임</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="runtime" id="runtime" value="${indeMovie.runtime}">
						<form:errors cssClass="err" path="runtime"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>월드프리미어</th>
				<td>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="premiere" id="premiere" value="World Premiere" <c:if test="${indeMovie.premiere eq 'World Premiere'}">checked</c:if>>
				          유
					</div>
					<div class="form-check">
				        <input class="form-check-input" type="radio" name="premiere" id="premiere" value="없음" <c:if test="${indeMovie.premiere==null || indeMovie.premiere=='없음'}">checked</c:if>>
				          무
					</div>
					<form:errors cssClass="err" path="premiere"/>
				</td>
			</tr>
			<tr>
				<th>수상경력</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="fest_awards" id="fest_awards" value="${indeMovie.fest_awards}">
						<form:errors cssClass="err" path="fest_awards"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>감독</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="director" id="director" value="${indeMovie.director}">
						<form:errors cssClass="err" path="director"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>감독경력</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="direc_info1" id="direc_info1" value="${indeMovie.direc_info1}">
						<form:errors cssClass="err" path="direc_info1"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>감독2경력(선택)</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="direc_info2" id="direc_info2" value="${indeMovie.direc_info2}">
					</div>
				</td>
			</tr>
			<tr>
				<th>메인사진</th>
				<td>
					<div class="form-group">
						<input type="file" class="form-control" name="upload" id="upload" value="${indeMovie.img}">
						<form:errors cssClass="err" path="img"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>감독사진</th>
				<td>
					<div class="form-group">
						<input type="file" class="form-control" name="upload1" id="upload1" value="${indeMovie.direc_img1}">
						<form:errors cssClass="err" path="direc_img1"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>감독2사진(선택)</th>
				<td>
					<div class="form-group">
						<input type="file" class="form-control" name="upload2" id="upload2" value="${indeMovie.direc_img2}">
					</div>
				</td>
			</tr>
			<tr>
				<th>영상링크</th>
				<td>
					<div class="form-group">
						<input type="text" class="form-control" name="video" id="video" value="${indeMovie.video}">
						<form:errors cssClass="err" path="video"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>인텐션</th>
				<td>
					<div class="form-group">
						 <textarea class="form-control" name="intention" id="intention" rows="5">${indeMovie.intention}</textarea>
						<form:errors cssClass="err" path="intention"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>시놉시스</th>
				<td>
					<div class="form-group">
						<textarea class="form-control" name="synopsis" id="synopsis" rows="5">${indeMovie.synopsis}</textarea>
						<form:errors cssClass="err" path="synopsis"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>줄거리</th>
				<td>
				    <div class="form-group">
				      <textarea class="form-control" name="note" id="note" rows="15">${indeMovie.note}</textarea>
				      <form:errors cssClass="err" path="note" />
				    </div>
				</td>
			</tr>
			<tr>
			<tr>
				<td colspan=2 align="center" height="70">
					<button type="submit" class="btn btn-primary">수정</button>
				</td>
			</tr>
		</table>
	</form:form>
</center>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>