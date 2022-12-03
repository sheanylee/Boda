<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>
<style>
	.title{
		margin-left: 540px;
		width:500px;
		font-size: 20px;
	}
	.table{
		width:800px;
		margin: auto;
	}
	a{
		text-decoration: none;
	}
</style>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/독립.png" style="width:350px; height:100px"><br>
          </div>
        </div>
      </div>
</div>			

<br>


<table border="1" class="table table-hover">
	<Tr>
		<td colspan="2"><img src="<%=request.getContextPath()%>/resources/Independent_film/${ib.img}" width="800" height="500"></td>
	</Tr>
	<tr>
		<th scope="row">${ib.title }</th>
		<td align="right"><a style="font-weight: bolder;">${ib.kind }</a></td>
	</tr>
	<tr>
		<td><a style="font-weight: bolder;">${ib.director } | ${ib.year } | ${ib.genre } | ${ib.color } | ${ib.type } | ${ib.runtime } | ${ib.premiere }</a></td>
		<td align="right">
			<iframe src="${ib.video }?autoPlay=true" width="400" height="250" frameborder="no" marginwidth="0" marginheight="0" scrolling="no" allowfullscreen="allowfullscreen"></iframe>
		</td>
	</tr>
	<tr>
		<th scope="row" colspan="2">SYNOPSIS</th>
	</tr>
	<tr>
		<td colspan="2">${ib.synopsis }</td>
	</tr>
	<tr>
		<th scope="row" colspan="2">DIRECTING INTENTION</th>
	</tr>
	<tr>
		<td colspan="2">${ib.intention }</td>
	</tr>
	<tr>
		<th scope="row" colspan="2">FESTIVAL & AWARDS</th>
	</tr>
	<tr>
		<td colspan="2">${ib.fest_awards }</td>
	</tr>
	
	<tr>
		<th scope="row" colspan="2">DIRECTOR</th>
	</tr>
	<tr>
		<td colspan="2">
			<img src="<%=request.getContextPath()%>/resources/Independent_film/direc/${ib.direc_img1}"width="300" height="300">
				<br>
				<a style="font-weight: bolder;">${ib.director }</a><br>
				${ib.direc_info1 }
			<c:if test="${ib.direc_img2 ne null}">
			<img src="<%=request.getContextPath()%>/resources/Independent_film/direc/${ib.direc_img1 }"width="300" height="150">
			</c:if>
			<c:if test="${ib.direc_info2 ne null}">
				<a style="font-weight: bolder;">${ib.director }</a><br>
				${ib.direc_info1 }
			</c:if>
		</td>
	</tr>
	
	<tr>
		<th scope="row" colspan="2">PROGRAM NOTE</th>
	</tr>
	<tr>
		<td colspan="2">${ib.note }</td>
	</tr>
</table>
<center>
<a href="indeMovieList.look">목록보기</a><br><br>
<img src="<%=request.getContextPath()%>/resources/event_Image/가로광고3.jpg" width="800px" height="80">
</center>

<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>