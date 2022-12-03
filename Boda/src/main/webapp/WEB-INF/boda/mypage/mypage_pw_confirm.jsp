<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/boda/mypage/mypage_top.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#sub').click(function(){
			
			if($('input[name="pw_confirm"]').val().length==0){
				alert("비밀번호를 입력하세요.");
				$('input[name="pw_confirm"]').focus();
				return false;
			}
		});
	});
</script>
<h3 align="center">회원 정보 확인</h3><br>
<form role="form" action="pw_confirm_proc.bd">
<table align="center">
	<tr>
		<td>
			<h5>회원 정보 변경을 위해 비밀번호를 입력해주세요.</h5>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			<input type="text" class="form-control" name="pw_confirm" placeholder="비밀번호">
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr align="center">
		<td>
			<button type="submit" class="btn btn-primary" id="sub">회원 정보 변경</button>
		</td>
	</tr>
</table>
</form>
<%@ include file="/WEB-INF/boda/mypage/mypage_bottom.jsp" %>