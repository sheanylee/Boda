<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<style>
	.title{
		margin-left: 210px;
		width:500px;
		font-size: 20px;
	}
	.card{
			
		margin-left: 210px;
		width:500px;
		font-size: 20px;
	}
	.indetab{
		margin: auto;
		width:70%;
	}
	
	a{
		text-decoration: none;
	}
</style>

<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/독립.png" style="margin-right:70%; width:350px; height:100px"><br>
				Boda에서 보고싶은 독립영화에 '좋아요'를 눌러주세요! 매달 좋아요 TOP3는 Boda에서 상영될 예정입니다.
          </div>
        </div>
      </div>
</div>			

<br>
	<table class="indetab">
		<tr class="indeTr">
<c:forEach var="ib" items="${lists }" varStatus="line">
			<td>
				<table border="1" class="table table-hover">
					<tr>
						<td colspan="2" align="center"><img src="<%=request.getContextPath()%>/resources/Independent_film/${ib.img }" width="300" height="180"></td>
					</tr>
					<tr>
						<th scope="row"><a href="indeMovieDetail.look?num=${ib.num }">${ib.title }</a></th>
						<td align="right"><a href="indeLikes.look?num=${ib.num }" style="text-align: right"><img src="<%=request.getContextPath()%>/resources/Independent_film/kindpng_1467222.png" width="25"></a>&nbsp;${ib.likes }</td>
					</tr>
					<tr>
						<td colspan="2" style="font-weight: bolder;">${ib.kind}</td>
					</tr>
					<tr>
						<td colspan="2" style="font-weight: bolder;" height="80">${ib.year}|${ib.genre}|${ib.color}|${ib.type}|${ib.runtime}|${ib.premiere}</td>
					</tr>
				</table>

			</td>
			<c:if test="${line.index / 3 eq 1}">
				</tr>
			</c:if>
</c:forEach>
	</table>
	<br><br>

<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>