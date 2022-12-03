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
		location.href="movieTest_4.et?c="+btn;
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
	<p class="fcw hfs">간만에 쉬는 당신, 무엇을 하며 시간을 보내겠는가?
	<br><br>
	<div class="pc">
		<img src="<%=request.getContextPath()%>/resources/event_Image/movietypeTest3.png" width=25% height=25%>
	</div>
	<br><br>
	<center>
	    <button type="button" class="hfs bgcolor btn btn-outline-primary" 
	    	style="width:50%;" name="c1" onclick="gototest('c1')">
	  		  침대 밖은 위험해, 가만히 누워 체력을 보충한다
	    </button>
	    <br><br>
	    <button type="button" class="hfs bgcolor btn btn-outline-primary" 
	    	style="width:50%;" name="c2" onclick="gototest('c2')">
	  		  지인들과 만나 이야기하며 힐링한다
	    </button>
	</center>
	<br><br><br>
</div>
 </div>
 
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>