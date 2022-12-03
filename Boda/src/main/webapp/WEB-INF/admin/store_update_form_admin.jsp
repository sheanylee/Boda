<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- store_update_form_admin.jsp<br> -->

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
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/상품 수정.png" style="width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>
<center>
<form:form commandName="store" action="store_update_proc.ad" method="post" enctype="multipart/form-data">
<input type="hidden" name="s_num" value="${store.s_num}">
<input type="hidden" name="s_code" value="${store.s_code}">
<input type="hidden" name="originalimg" value="${store.s_image }">
<table>
	<tr>
		<td colspan="3">
			<div class="form-group">
  			<label class="col-form-label mt-4" for="inputDefault">상품 카테고리</label>&nbsp;
  			<c:if test="${store.s_code=='1'}">
			<input type="text" value="영화관람권" disabled>
			</c:if>
			<c:if test="${store.s_code=='2'}">
				<input type="text" value="팝콘" disabled>
			</c:if>
			<c:if test="${store.s_code=='3'}">
				<input type="text" value="음료" disabled>
			</c:if>
			<c:if test="${store.s_code=='4'}">
				<input type="text" value="간식" disabled>
			</c:if>
			<br>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<div class="form-group">
      		<label for="formFile" class="form-label mt-4">사진</label>&nbsp;
      		<form:errors cssClass="err" path="s_image"/><br><br>
      		<div align="center">
      		<img width=200 src="<%=application.getContextPath()%>/resources/images/${store.s_image}"><br><br>
      		</div>
      		<input class="form-control" type="file" name="upload" id="formFile">
    		
    		</div>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<div class="form-group">
  			<label class="col-form-label mt-4" for="inputDefault">상품 명</label>&nbsp;
  			<form:errors cssClass="err" path="s_name"/>
  			<input type="text" name="s_name" class="form-control" placeholder="상품 명을 입력하세요." id="inputDefault" size="70" value="${store.s_name}">
			
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<div class="form-group">
  			<label class="col-form-label mt-4" for="inputDefault">가격</label>&nbsp;
  			<form:errors cssClass="err" path="s_price"/>
  			<input type="text" name="s_price" class="form-control" placeholder="가격을 입력하세요." id="inputDefault" size="70" value="${store.s_price}">
			
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<div class="form-group">
  			<label class="col-form-label mt-4" for="inputDefault">재고수량</label>&nbsp;
  			<form:errors cssClass="err" path="s_stock"/>
  			<input type="text" name="s_stock" class="form-control" placeholder="재고수량을 입력하세요." id="inputDefault" size="70" value="${store.s_stock}">
			
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<div class="form-group">
      		<label for="exampleTextarea" class="form-label mt-4">상품 설명</label>&nbsp;
      		<form:errors cssClass="err" path="s_content"/>
      		<textarea class="form-control" name="s_content" id="exampleTextarea" rows="3" placeholder="설명을 입력하세요.">${store.s_content}</textarea>
    		
    		</div>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<div class="form-group">
  			<label class="col-form-label mt-4" for="inputDefault">적립 포인트</label>&nbsp;
  			<form:errors cssClass="err" path="s_point"/>
  			<input type="text" name="s_point" class="form-control" placeholder="포인트을 입력하세요." id="inputDefault" size="70" value="${store.s_point}">
			
			</div>
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
  			<button class="btn btn-lg btn-outline-primary" type="submit" id="sub">상품 수정</button>
			</div>
		</td>
	</tr>
	
</table>
</form:form>
</center>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp"%>