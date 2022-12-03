<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- join.jsp <br> -->

<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<style>
	.err{
		color: red;
		font-size: 12;
	}
</style>

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var use;
		var ischeck=false;
		
		$('#id_check').click(function(){
			//alert(1);
			ischeck=true;
			
			if($('input[name="id"]').val().length==0){
				alert("아이디를 입력하고 중복체크하세요.");
				$('input[name="id"]').focus();
				return;
			}
			
			$.ajax({
				url : "id_check_proc.bd",
				data : ({ userid: $('input[name="id"]').val() }),
				success : function(data){
					//alert('data:'+$.trim(data));
					
					if($.trim(data)=='NO'){
						$('#msg').html("<font color=red>사용 불가능합니다.</font>");
						use="impossible";
						$('#msg').show();
					}
					else{
						$('#msg').html("<font color=blue>사용 가능합니다.</font>");
						use="possible";
						$('#msg').show();
						ischange=true;
					}
				}//success
			});//ajax
		});//중복체크 클릭
		
		$('input[name="id"]').keydown(function(){
			$('#msg').css('display','none');
			use="";
			ischeck=false;
			ischange=false;
		});//아이디 키보드
		
		$('#sub').click(function(){
			//alert(1);
			
			if($('input[name="name"]').val().length==0){
				alert("이름을 입력하세요.");
				$('input[name="name"]').focus();
				return false;
			}
			
			if($('input[name="id"]').val().length==0){
				alert("아이디를 입력하고 회원가입하세요");
				$('input[name="id"]').focus();
				return false;
			}
			
			if(ischeck==false){
				alert("중복체크하시고 회원가입하세요.");
				return false;
			}
			
			if(use=="impossible"){
				alert("중복된 아이디로 회원가입할 수 없습니다.");
				$('input[name="id"]').select();
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

<form action="join_proc.bd" role="form" class="form-inline" align="center" name="f">
<h3 class="text-primary">Boda Register</h3><br>
<table width="500" align="center">
	<tr align="left">
		<td colspan="3">
			*이름
		</td>
	</tr>
	<tr>
		<td colspan="3">
  			<input type="text" name="name" class="form-control" placeholder="이름" id="inputDefault" size="70">
		</td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr align="left">
		<td colspan="3">
			*아이디&nbsp;&nbsp;<span id="msg"></span>
		</td>
	</tr>
	<tr>
		<td colspan="3">
  			<div class="input-group mb-3">
      		<input type="text" name="id" class="form-control" placeholder="아이디 입력 후 중복체크을 클릭하세요.">
      		<button class="btn btn-primary" type="button" id="id_check">중복체크</button>
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
  			<input type="text" name="pw" class="form-control" placeholder="비밀번호" id="inputDefault" size="70">
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
  			<input type="text" name="repw" class="form-control" placeholder="비밀번호 확인" id="inputDefault" size="70">
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
		        <option value="010">010</option>
		        <option value="011">011</option>
		        <option value="012">012</option>
      		</select>
      	</td>
      	<td width="40%">
      		<input type="text" name="ph1" class="form-control" placeholder="입력" id="inputDefault" size="70">
      	</td>
      	<td width="40%">
      		<input type="text" name="ph2" class="form-control" placeholder="입력" id="inputDefault" size="70">
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
  			<input type="text" name="email" class="form-control" placeholder="이메일" id="inputDefault" size="70">
		</td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr align="left">
		<td colspan="3">
			<div class="d-grid gap-2">
  			<button class="btn btn-lg btn-primary" type="submit" id="sub">회원가입</button>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="3"></td>
	</tr>
	<tr>
		<td colspan="3"></td>
	</tr>
	<tr align="left">
		<td colspan="3">
			<div class="d-grid gap-2">
  			<button class="btn btn-lg btn-primary" type="button" onClick="location.href='login.bd'">로그인 화면</button>
			</div>
		</td>
	</tr>
	
</table>
</form>



<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>
