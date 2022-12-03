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
	function gototest(btn){
		//alert(btn);
		location.href="movieTest_5.et?d="+btn;
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
	<p class="fcw hfs">드라마 덕후인 당신, 본방으로 챙겨보는 드라마의 원하는 결말은?
	<br><br>
	<div class="pc">
		<img src="<%=request.getContextPath()%>/resources/event_Image/movietypeTest4.png" width=30% height=30%>
	</div>
	<br><br>
	<center>
	    <button type="button" class="hfs bgcolor btn btn-outline-primary" 
	    	style="width:50%;" name="d1" onclick="gototest('d1')">
	  		  다양한 해석이 나올 수 있는 열린 결말
	    </button>
	    <br><br>
	    <button type="button" class="hfs bgcolor btn btn-outline-primary" 
	    	style="width:50%;" name="d2" onclick="gototest('d2')">
	  		  누가 어떻게 됐는지 알아야 속이 편한 닫힌 결말
	    </button>
	</center>
	<br><br><br>
</div>
 </div>
 
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>