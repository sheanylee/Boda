<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- store_bill.jsp -->

<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//alert(1);
		$('#point').click(function(){
			//alert($('input[name="bill_point"]').val());
			if($('input[name="bill_point"]').val()<1000){
				alert("포인트는 1000이상 사용 가능합니다.");
				$('input[name="bill_point"]').select();
				return false;
			}
			if($('input[name="bill_point"]').val()>${loginInfo.point}){
				alert("보유 포인트가 부족합니다.");
				$('input[name="bill_point"]').select();
				return false;
			}
			location.href="bill_point_proc.st?bill_point="+$('input[name="bill_point"]').val();
			
		}); //포인트 적용 클릭
	});
</script>

<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/결제하기.png" style="margin-right:70%; width:350px; height:100px"><br>
          </div>
        </div>
      </div>
</div>				
<center>
<div class="container">
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">상품명</th>
      <th scope="col">주문 수량</th>
      <th scope="col">총 가격</th>
      <th scope="col">총 적립 포인트</th>
    </tr>
  </thead>
  <tbody>
  <c:set var="sum_order" value="0"/>
  <c:set var="sum_price" value="0"/>
  <c:set var="sum_point" value="0"/>
  <c:forEach var="sif" items="${shopLists}">
  <c:set var="sum_order" value="${sum_order+sif.order}"/>
  <c:set var="sum_price" value="${sum_price+sif.total_price}"/>
  <c:set var="sum_point" value="${sum_point+sif.total_point}"/>
    <tr class="table-active">
      <th scope="row">${sif.name}</th>
      <td>${sif.order}</td>
      <td>${sif.total_price}</td>
      <td>${sif.total_point}</td>
    </tr>
  </c:forEach>
  <tr align="center">
  	<td colspan="4">주문 수량 합계 : ${sum_order} (개)</td>
  </tr>
  <tr align="center">
  	<td colspan="4">주문 가격 합계 : ${sum_price} (원)</td>
  </tr>
  <tr align="center">
  	<td colspan="4">적립 포인트 합계 : ${sum_point} (포인트)</td>
  </tr>
  </tbody>
</table>
<br>

</div><!-- container -->
<table>
<tr>
	<td>
	<c:if test="${bill_point eq null}">
	회원님의 보유 포인트 : ${loginInfo.point} (포인트는 1000이상 사용 가능합니다.)
	</c:if>
	<c:if test="${bill_point ne null}">
	포인트 적용 후 잔여 포인트 : ${loginInfo.point-bill_point} (포인트는 1000이상 사용 가능합니다.)
	</c:if>
	</td>
</tr>
<tr>
<td width="600">
<form name="f" action="bill_point_proc.st">
<div class="input-group mb-3">
	<input type="text" name="bill_point" id="input_point" value="" class="form-control" placeholder="사용하실 포인트를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
	<button class="btn btn-primary" type="button" id="point">포인트 적용</button>
</div>
</form>
</td>
</tr>
</table>
<br>
<!-- <div class="container"> -->
<div class="card border-primary mb-3" style="max-width: 50rem;">
  <div class="card-header">최종 결제 금액</div>
  <div class="card-body">
    <h4 class="card-title">${sum_price}(원)
    <c:if test="${bill_point ne null}">
    - ${bill_point}(포인트) = ${sum_price-bill_point}(원)
    </c:if></h4>
    <p class="card-text"></p>
  </div>
</div>
<br>
<div class="d-grid gap-2" style="max-width: 30rem;">
  <button class="btn btn-lg btn-outline-primary" type="button" onclick="location.href='store_pay.st?final_price=${sum_price-bill_point}'">${sum_price-bill_point}(원) 결제하기</button>
</div>
<!-- </div> -->
</center>

<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>