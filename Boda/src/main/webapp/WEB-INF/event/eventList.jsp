<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp"%>

<style>
.card{
		margin: auto;
		align-content:center;
		text-align:center;
		width: 600px;
	}
.text-white{
		text-align:center;
		width: 120px;
		height:50px;
		padding-top: 10px;
}
.center{
	width: 70%;
}
a{
	text-decoration: none;
}
img{
	padding-right: 10px;
	width:350px;
	height:250px;
}
.card-text{
	text-align: left;
	font-size: 15px;
	color: gray;
}
.ad{
	margin: auto;
	align-content: center;
	text-align: center;
}
</style>

<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/이벤트.png" style="margin-left:15px; width:350px; height:100px"><br>
          </div>
        </div>
      </div>
</div>	

<div class="container center">
	<div class="row mb-5">
	
		<div class="col-lg-6">
           <div class="card border-primary mb-3" style="max-width: 40rem;">
             <div class="card-header"><a href="movieType.et">나의 영화 취향 찾기</a></div>
             <div class="card-body">
               <h4 class="card-title"><a href="movieType.et"><img src="<%=request.getContextPath()%>/resources/event_Image/movietypeMain.png"></a></h4>
               <p class="card-text">2022-05-01~2023-4-30</p>
               <c:if test="${loginInfo.id=='admin'}">
	               <div align="right">
	               <button type="button" class="btn btn-dark disabled">고정된 이벤트</button>
	               </div>
               </c:if>
             </div>
           </div>
		</div>
			
        <div class="col-lg-6">
         <div class="card border-primary mb-3" style="max-width: 40rem;">
           <div class="card-header"><a href="roulet.et">룰렛 이벤트</a></div>
           <div class="card-body">
             <h4 class="card-title"><a href="roulet.et"><img src="<%=request.getContextPath()%>/resources/event_Image/룰렛.png"></a></h4>
               <p class="card-text">2022-06-01~2023-05-31</p>
               <c:if test="${loginInfo.id=='admin'}">
	               <div align="right">
	               <button type="button" class="btn btn-dark disabled">고정된 이벤트</button>
	               </div>
               </c:if>
             </div>
           </div>
		</div>
		
		<c:forEach var="eb" items="${event_lists}">
			<div class="col-lg-6">
           <div class="card border-primary mb-3" style="max-width: 40rem;">
             <div class="card-header"><a href="detail.et?no=${eb.no}">${eb.title}</a></div>
             <div class="card-body">
               <h4 class="card-title"><a href="detail.et?no=${eb.no}"><img src="<%=application.getContextPath()%>/resources/event_Image/${eb.main_img}" ></a></h4>
               <p class="card-text">${eb.sday}~${eb.eday}</p>
               <c:if test="${loginInfo.id=='admin'}">
	               <div align="right">
	               <button type="button" class="btn btn-dark" onclick="location.href='event_update_form.et?no=${eb.no}'">수정</button>&nbsp;&nbsp;
	               <button type="button" class="btn btn-primary" onclick="location.href='event_delete.et?no=${eb.no}'">삭제</button>
	               </div>
               </c:if>
             </div>
           </div>
		</div>
		</c:forEach>
		
	</div>
</div>

<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp"%>