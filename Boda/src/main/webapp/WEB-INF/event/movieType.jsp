<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<style>
	.fcw{color:white;}
	.bgcolor{
		background-color:white;
	}
	.pc{
		margin:0,auto;
	}
	.hfs{
		font-size: 25px;
	}
</style>
<script type="text/javascript">
	function gototest(){
		location.href="movieTest_1.et";
	}
</script>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/이벤트.png" style="width:350px; height:100px"><br>
          </div>
        </div>
      </div>
</div>	
 <div class="container">
<div class="card text-white bg-primary mb-3 center" style="max-height: 50%;">
	<br><br><br>
	<p class="fcw hfs">나와 맞는 영화를 알고싶은<br> 당신의 영화를 취향을 찾아드립니다</p>
	<br><br>
	<div class="pc">
		<img src="<%=request.getContextPath()%>/resources/event_Image/movietypeMain.png" width=40%>
	</div>
	<br><br>
	<center>
	    <button type="button" class="hfs bgcolor btn btn-outline-primary" 
	    	style="width:50%;" onclick="gototest()">
	  		  나의 영화 취향 찾으러가기
	    </button>
	</center>
	<br><br><br>
</div>
 </div>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>