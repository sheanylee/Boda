<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- store_detail.jsp -->
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//alert(1);
		$('#cart_order').click(function(){
			//alert(1);
			if( $('input[name="order"]').val()=="" ){
				alert("수량을 입력하여야 구매 가능합니다.");
				$('input[name="order"]').focus();
				return false;
			}
			
			if( $('input[name="order"]').val()==0 || $('input[name="order"]').val()<0 ){
				alert("수량은 1이상 입력 가능합니다.");
				$('input[name="order"]').select();
				return false;
			}
			location.href="Cartadd.st?order="+$('input[name="order"]').val()+"&s_num="+$('input[name="s_num"]').val()+"&point="+$('input[name="point"]').val();
		});//장바구니 클릭
		
		$('#direct_order').click(function(){
			//alert(1);
			if( $('input[name="order"]').val()=="" ){
				alert("수량을 입력하여야 구매 가능합니다.");
				$('input[name="order"]').focus();
				return false;
			}
			
			if( $('input[name="order"]').val()==0 || $('input[name="order"]').val()<0 ){
				alert("수량은 1이상 입력 가능합니다.");
				$('input[name="order"]').select();
				return false;
			}
			location.href="direct_buy.st?order="+$('input[name="order"]').val()+"&s_num="+$('input[name="s_num"]').val();
		});//바로 구매 클릭
	});
</script>

<script>
	function gift(){
		//alert(2);
		if(f.order.value==""){
			alert("수량을 입력하여야 선물 가능합니다.");
			return;
		}
		if(f.order.value==0 || f.order.value<0){
			alert("수량은 1이상 입력 가능합니다.");
			return;
		}
		location.href="gift.st?s_num="+f.s_num.value+"&order="+f.order.value;
	}
</script>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
          <c:if test="${store.s_code=='1'}">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/영화관람권.png" style="width:350px; height:100px"><br>
          </c:if>
          <c:if test="${store.s_code=='2'}">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/팝콘.png" style="width:350px; height:100px"><br>
          </c:if>
          <c:if test="${store.s_code=='3'}">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/음료.png" style="width:350px; height:100px"><br>
          </c:if>
          <c:if test="${store.s_code=='4'}">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/간식.png" style="width:350px; height:100px"><br>
          </c:if>
          </div>
        </div>
      </div>

<center>
<div class="card border-primary mb-3" style="max-width: 90rem;">
  <div class="card-header">상품 상세보기</div>
  <div class="card-body">
    <p class="card-text">
    <form name="f">
    <input type="hidden" name="s_num" value="${store.s_num}">
    <input type="hidden" name="point" value="${store.s_point}">
    	<table width="700">
	<tr>
		<td rowspan="5">
			<img src="<%=request.getContextPath() %>/resources/images/${store.s_image}" width="300" alt="...">
		</td>
		<td>
			<h3>상품 명 : ${store.s_name}</h3>
		</td>
	</tr>
	<tr>
		<td>
			<h6>상세 설명 : ${store.s_content}</h6>
		</td>
	</tr>
	<tr>
		<td>
			<h6>가격 : ${store.s_price}원</h6>
		</td>
	</tr>
	<tr>
		<td>
			<c:if test="${loginInfo.id ne 'admin' }">
               <h6>수량 : <input type="text" placeholder="00" name="order" size="3">&nbsp;개</h6>
            </c:if>
		</td>
	</tr>
	<tr>
		<td>
			<h6>${store.s_point} 포인트 적립</h6>
		</td>
	</tr>
	</table>
	<table width="700">
	<c:if test="${loginInfo.id ne 'admin' }">
	<tr>
		<td width="50%">
			<div class="d-grid gap-2">
	  		<button class="btn btn-lg btn-outline-primary" type="button" id="cart_order">장바구니</button>
			</div>
		</td>
		<td>&nbsp;&nbsp;</td>
		<td width="50%">
			<div class="d-grid gap-2">
	  		<button class="btn btn-lg btn-primary" type="button" id="direct_order">바로 구매하기</button>
			</div>
		</td>
	</tr>
	<c:if test="${store.s_num==1 || store.s_num==2 || store.s_num==3}">
	<tr>
		<td colspan="3"></td>
	</tr>
	<tr>
		<td colspan="3"></td>
	</tr>
	<tr>
		<td colspan="3" width="500" align="center">
	  		<button class="btn btn-lg btn-outline-primary" type="button" onclick="gift()">선물하기</button>
		</td>
	</tr>
	</c:if>
    </c:if>
	<c:if test="${loginInfo.id=='admin'}">
	<tr>
		<td width="50%">
			<div class="d-grid gap-2">
	  		<button class="btn btn-lg btn-outline-primary" type="button" onclick="location.href='store_update_form.ad?s_num=${store.s_num}'">수정</button>
			</div>
		</td>
		<td>&nbsp;&nbsp;</td>
		<td width="50%">
			<div class="d-grid gap-2">
	  		<button class="btn btn-lg btn-primary" type="button" onclick="location.href='store_delete.ad?s_num=${store.s_num}'">삭제</button>
			</div>
		</td>
	</tr>
    </c:if>
</table>
</form>
</div>
  </div>
</div>
</center>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp"%>