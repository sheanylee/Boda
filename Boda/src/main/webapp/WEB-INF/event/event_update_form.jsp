<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- event_update_form.jsp<br> -->

<%@ include file="/WEB-INF/Top&Bottom/top.jsp"%>
<style>
	.err {
		font-size: 15px;
		font-weight: bold;
		color: red;
	}
</style>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		//alert(1);
		var check="";
		$('#pw_confirm').click(function(){
			//alert(2);
			if($('input[name="pw"]').val()==""){
				alert("비밀번호를 입력 후 확인을 클릭하셔야 합니다.");
				$('input[name="pw"]').focus();
				return;
			}
			if($('input[name="pw"]').val()=="0000"){
				$('#msg').html("<font color=blue>확인이 완료되었습니다.</font>");
				check="ok";
				$('#msg').show();
			}
			else{
				$('#msg').html("<font color=red>비밀번호가 일치하지 않습니다.</font>");
				check="no";
				$('#msg').show();
			}
		});//비밀번호 확인 클릭
		
		$('#sub').click(function(){
			//alert(3);
			if(check=="no"){
				alert("비밀번호가 일치하지 않아 수정할 수 없습니다.");
				$('input[name="pw"]').select();
				return false;
			}
			if(check==""){
				alert("관리자 비밀번호 확인 후 수정 가능합니다.");
				$('input[name="pw"]').focus();
				return false;
			}
		});
		
		$('input[name="pw"]').keydown(function(){
			$('#msg').css('display','none');
			check="";
		});
	});

</script>
<center>
<h2>이벤트 수정</h2>
<form:form commandName="event" action="event_update.et" method="post" enctype="multipart/form-data">
<input type="hidden" name="no" value="${event.no}">
<input type="hidden" name="origin_main_img" value="${event.main_img}">
<input type="hidden" name="origin_contents_img" value="${event.contents_img}">
<table>
	<tr>
		<td colspan="3">
			<div class="form-group">
  			<label class="col-form-label mt-4" for="inputDefault">제목</label>&nbsp;
  			<form:errors cssClass="err" path="title"/>
  			<input type="text" name="title" class="form-control" placeholder="제목을 입력하세요." id="inputDefault" size="70" value="${event.title}">
			
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<div class="form-group">
      		<label for="exampleTextarea" class="form-label mt-4">내용</label>
      		<form:errors cssClass="err" path="contents"/>
      		<textarea class="form-control" name="contents" id="exampleTextarea" rows="3" placeholder="내용을 입력하세요.">${event.contents}</textarea>
    		
    		</div>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<div class="form-group">
      		<label for="formFile" class="form-label mt-4">대표 이미지</label>&nbsp;
      		<form:errors cssClass="err" path="main_img"/><br><br>
      		<div align="center">
      		<img width=200 src="<%=application.getContextPath()%>/resources/event_Image/${event.main_img}"><br><br>
      		</div>
      		<input class="form-control" type="file" name="upload1" id="formFile">
    		
    		</div>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<div class="form-group">
      		<label for="formFile" class="form-label mt-4">게시글 이미지</label>&nbsp;
      		<form:errors cssClass="err" path="contents_img"/><br><br>
      		<div align="center">
      		<img width=200 src="<%=application.getContextPath()%>/resources/event_Image/${event.contents_img}"><br><br>
      		</div>
      		<input class="form-control" type="file" name="upload2" id="formFile">
    		
    		</div>
		</td>
	</tr>
	<tr>
		<td>
			<label for="formFile" class="form-label mt-4">이벤트 시작 날짜</label>&nbsp;
			<form:errors cssClass="err" path="sday"/>
			<input type="date" class="form-control" name="sday" value="${event.sday}">
		</td>
		<td>&nbsp;&nbsp;</td>
		<td>
			<label for="formFile" class="form-label mt-4">이벤트 종료 날짜</label>&nbsp;
			<form:errors cssClass="err" path="eday"/>
			<input type="date" class="form-control" name="eday" value="${event.eday}">
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<label for="formFile" class="form-label mt-4">관리자 비밀번호</label>&nbsp;
			<span id="msg"></span>
		</td>
	</tr>
	<tr>
		<td colspan="3">
    		<div class="input-group mb-3">
      		<input type="password" name="pw" class="form-control" placeholder="비밀번호 입력 후 확인을 클릭하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
      		<button class="btn btn-primary" type="button" id="pw_confirm">확인</button>
    		</div>
		</td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="3">
			<div class="d-grid gap-2">
  			<button class="btn btn-lg btn-outline-primary" type="submit" id="sub">이벤트 수정</button>
			</div>
		</td>
	</tr>
	
</table>
</form:form>
</center>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp"%>