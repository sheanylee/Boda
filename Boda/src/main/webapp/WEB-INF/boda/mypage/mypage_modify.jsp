<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>
<%@ include file="/WEB-INF/boda/mypage/mypage_top.jsp" %>

<%@ include file="/WEB-INF/common/common.jsp" %>
<style>
	.err{
		color: red;
		font-size: 12;
	}
</style>

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#sub').click(function(){
			//alert(1);
			
			if($('input[name="name"]').val().length==0){
				alert("이름을 입력하세요.");
				$('input[name="name"]').focus();
				return false;
			}			
			
			if($('input[name="pw"]').val().length==0){
				alert("비밀번호를 입력하세요.");
				$('input[name="pw"]').focus();
				return false;
			}
			if($('input[name="repw"]').val().length==0){
				alert("비밀번호 확인을 입력하세요.");
				$('input[name="repw"]').focus();
				return false;
			}
			
			if($('input[name="pw"]').val()!=$('input[name="repw"]').val()){
				alert("비밀번호가 맞지 않습니다.");
				$('input[name="repw"]').select();
				return false;
			}
			if($('input[name="ph1"]').val().length==0){
				alert("전화번호 앞자리를 입력하세요.");
				$('input[name="ph1"]').focus();
				return false;
			}
			if($('input[name="ph2"]').val().length==0){
				alert("전화번호 뒷자리를 입력하세요.");
				$('input[name="ph2"]').focus();
				return false;
			}
			if($('input[name="email"]').val().length==0){
				alert("이메일을 입력하세요.");
				$('input[name="email"]').focus();
				return false;
			}
			
			
		});//회원가입 클릭
		
	});
	 
		 
</script>

<form action="modify_member_proc.bd" role="form" class="form-inline" align="center" name="f">
<h3 class="text-primary">회원 정보 변경</h3><br>
<input type="hidden" name="id" value="${loginInfo.id}">
<table width="500" align="center">
	<tr align="left">
		<td colspan="3">
			*이름
		</td>
	</tr>
	<tr>
		<td colspan="3">
  			<input type="text" name="name" class="form-control" placeholder="이름" id="inputDefault" size="70" value="${loginInfo.name}">
		</td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr align="left">
		<td colspan="3">
			*아이디
		</td>
	</tr>
	<tr>
		<td colspan="3">
  			<div class="input-group mb-3">
      		<input type="text" name="id" class="form-control" placeholder="아이디 입력 후 중복체크을 클릭하세요." disabled value="${loginInfo.id}">
    		</div>
		</td>
	</tr>
	<tr>
		<td colspan="3"></td>
	</tr>
	<tr align="left">
		<td colspan="3">
			*비밀번호
		</td>
	</tr>
	<tr>
		<td colspan="3">
  			<input type="text" name="pw" class="form-control" placeholder="비밀번호" id="inputDefault" size="70" value="${loginInfo.pw}">
		</td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr align="left">
		<td colspan="3">
			*비밀번호 확인
		</td>
	</tr>
	<tr>
		<td colspan="3">
  			<input type="text" name="repw" class="form-control" placeholder="비밀번호 확인" id="inputDefault" size="70" value="${loginInfo.repw}">
		</td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr align="left">
		<td colspan="3">
			*전화번호
		</td>
	</tr>
	<tr>
		<td width="20%">
      		<select class="form-select" name="ph0">
		        <option value="010" <c:if test="${loginInfo.ph0=='010'}">selected</c:if> >010</option>
		        <option value="011" <c:if test="${loginInfo.ph0=='011'}">selected</c:if> >011</option>
		        <option value="012" <c:if test="${loginInfo.ph0=='012'}">selected</c:if> >012</option>
      		</select>
      	</td>
      	<td width="30%">
      		<input type="text" name="ph1" class="form-control" placeholder="입력" id="inputDefault" size="70" value="${loginInfo.ph1}">
      	</td>
      	<td width="30%">
      		<input type="text" name="ph2" class="form-control" placeholder="입력" id="inputDefault" size="70" value="${loginInfo.ph2}">
		</td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr align="left">
		<td colspan="3">
			*이메일
		</td>
	</tr>
	<tr>
		<td colspan="3">
  			<input type="text" name="email" class="form-control" placeholder="이메일" id="inputDefault" size="70" value="${loginInfo.email}">
		</td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr align="left">
		<td colspan="3">
			<div class="d-grid gap-2">
  			<button class="btn btn-lg btn-primary" type="submit" id="sub">회원 정보 변경</button>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="3"></td>
	</tr>
	<tr>
		<td colspan="3"></td>
	</tr>
	
</table>
</form>

<%@ include file="/WEB-INF/boda/mypage/mypage_bottom.jsp" %>
