<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- detail_event.jsp -->

<%@ include file="/WEB-INF/Top&Bottom/top.jsp"%>
<style>
	.card{
		align-content:center;
		text-align: center;
		margin:auto;
		width: 70%;
	}
</style>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/이벤트.png" style="width:350px; height:100px"><br>
          </div>
        </div>
      </div>
</div>	
<div class="card border-primary mb-3">
	<div class="card-header">${eb.title}</div>
	<div class="card-body">
		
		이벤트 기간 : ${eb.sday}~${eb.eday}<br><br>
		<img src="<%=application.getContextPath()%>/resources/event_Image/${eb.contents_img}" width="980px"><br><br>
		<c:if test="${empty eb.contents eq null}">
			
		</c:if>
		<c:if test="${not empty eb.contents}">
		게시글 내용 : ${eb.contents}<br>			
		</c:if>
	</div>
		<input id="button" class="btn btn-outline-primary" type="button" value="목록보기" onclick="location.href='event.et'">
</div>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp"%>