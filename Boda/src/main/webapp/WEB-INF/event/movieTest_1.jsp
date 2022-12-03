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
		location.href="movieTest_2.et?a="+btn;
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
	<p class="fcw hfs">서점을 찾은 당신, 책을 구경하러 향하는 곳은?



	<br><br>
	<div class="pc">
		<img src="<%=request.getContextPath()%>/resources/event_Image/movietypeTest1.png" width=35% height=35%>
	</div>
	<br><br>
	<center>
	    <button type="button" class="hfs bgcolor btn btn-outline-primary" 
	    	style="width:50%;" name="a1" onclick="gototest('a1')">
	  		  요즘 뜨는 책들이 모여있는 베스트셀러 구역
	    </button>
	    <br><br>
	    <button type="button" class="hfs bgcolor btn btn-outline-primary" 
	    	style="width:50%;" name="a2" onclick="gototest('a2')">
	  		  알아보고 온 책의 위치를 찾기 위해 컴퓨터 앞
	    </button>
	</center>
	<br><br><br>
</div>
 </div>
 


<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>