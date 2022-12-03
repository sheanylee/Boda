<%@page import="store.cart.ShoppingInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>
<br><br><br>
<%@ include file="/WEB-INF/common/common.jsp" %>
<link href="<%=request.getContextPath() %>/resources/css/custom2.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
    
<style>
	body { padding-top: 20px; }
</style>

<body>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/장바구니.png" style="width:350px; height:100px"><br>
          </div>
        </div>
      </div>
</div>	
<div class="container">  
    
    <article>
   <div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>상품 번호</th>
						<th>상품 이름</th>
						<th>주문 수량</th>
						<th>단위 가격</th>
						<th>총 가격</th>
						<th>총 포인트</th>
						<th>삭제</th>
					</tr>
				</thead>
				<c:if test="${empty shopLists }">
					<tr>
						<td colspan="7" align="center">장바구니에 담긴 상품이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty shopLists }">
					<c:forEach var="sif" items="${shopLists}">
						<tr>
							<td>${sif.num}</td>
							<td>${sif.name}</td>
							<td>
							<form action="update_shoplists.st">
							<input type="hidden" name="num" value="${sif.num}">
							<input type="text" size="3" name="order" value="${sif.order}">&nbsp;개
							<button type="submit" class="btn btn-outline-info">수정</button>
							</form>
							</td>
							<td>${sif.price}</td>
							<td>${sif.total_price}</td>
							<td>${sif.total_point}</td>
							<td><button type="button" class="btn btn-outline-dark" onclick="location.href='delete_shoplists.st?num=${sif.num}'">삭제</button></td>
						</tr>
					</c:forEach>
					<tr align="center">
						<td colspan="7">총 주문 금액: ${totalAmount}</td>
					</tr>
					<tr align="center">
						<td colspan="7">총 적립 가능 포인트: ${totalPoint}</td>
					</tr>
					<tr align="right">
						<td colspan="7">
							<button type="button" class="btn btn-primary" onclick="location.href='store_bill.st'">결제하기 </button>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
    </article>
</div> <!-- container 끝 -->
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>