<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		//alert(1);
		var check="";
		$('#id_confirm').click(function(){
			//alert(2);
			if($('input[name="id"]').val()==""){
				alert("아이디를 입력 후 조회를 클릭하셔야 합니다.");
				$('input[name="id"]').focus();
				return;
			}
			$.ajax({
				url : "id_check_proc.bd",
				data : ({ userid: $('input[name="id"]').val() }),
				success : function(data){
					//alert('data:'+$.trim(data));
					
					if($.trim(data)=='NO'){
						$('#msg').html("<font color=blue>선물 가능한 아이디입니다.</font>");
						check="ok";
						$('#msg').show();
					}
					else{
						$('#msg').html("<font color=red>선물 불가능합니다.</font>");
						check="no";
						$('#msg').show();
						ischange=true;
					}
				}//success
			});//ajax
		});//조회 클릭
		
		$('#sub').click(function(){
			//alert(3);
			if(check=="no"){
				alert("없는 아이디로 선물할 수 없습니다.");
				$('input[name="id"]').select();
				return false;
			}
			if(check==""){
				alert("아이디 조회 후 선물 가능합니다.");
				$('input[name="id"]').focus();
				return false;
			}
		});//
		
		$('input[name="id"]').keydown(function(){
			$('#msg').css('display','none');
			check="";
		});//
	});

</script>
<div class="container" align="center">
<h3>관람권 선물하기(기프트 카드)</h3>
<form action="direct_buy.st">
<input type="hidden" name="s_num" value="${sb.s_num}">
<input type="hidden" name="order" value="${gift_order}">
<table width="500">
	<tr>
		<td align="center">
		<label for="formFile" class="form-label mt-4">선물 할 관람권 : ${sb.s_name} ${gift_order}개</label>
		</td>
	</tr>
	<tr>
		<td>
			<label for="formFile" class="form-label mt-4">선물 할 아이디</label>&nbsp;
			<span id="msg"></span>
		</td>
	</tr>
	<tr>
		<td>
    		<div class="input-group mb-3">
      		<input type="text" name="id" class="form-control" placeholder="아이디 입력 후 조회를 클릭하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
      		<button class="btn btn-primary" type="button" id="id_confirm">조회</button>
    		</div>
		</td>
	</tr>
	<tr>
		<td></td>
	</tr>
	<tr>
		<td>
			<div class="d-grid gap-2">
  			<button class="btn btn-lg btn-primary" type="submit" id="sub">결제하러 가기</button>
			</div>
		</td>
	</tr>
</table>
</form>
</div>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>