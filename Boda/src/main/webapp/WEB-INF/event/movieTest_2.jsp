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
		location.href="movieTest_3.et?b="+btn;
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
	<p class="fcw hfs">놀이공원에 간 당신, 무엇을 하겠는가?
	<br><br>
	<div class="pc">
		<img src="<%=request.getContextPath()%>/resources/event_Image/movietypeTest2.png" width=30% height=30%>
	</div>
	<br><br>
	<center>
	    <button type="button" class="hfs bgcolor btn btn-outline-primary" 
	    	style="width:50%;" name="b1" onclick="gototest('b1')">
	  		  세상에서 가장 빠르고 무섭다는 놀이기구에 탑승한다
	    </button>
	    <br><br>
	    <button type="button" class="hfs bgcolor btn btn-outline-primary" 
	    	style="width:50%;" name="b2" onclick="gototest('b2')">
	  		  실제 귀신을 본 사람들이 많다는 유령의 집에 들어간다
	    </button>
	</center>
	<br><br><br>
</div>
 </div>
 
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>