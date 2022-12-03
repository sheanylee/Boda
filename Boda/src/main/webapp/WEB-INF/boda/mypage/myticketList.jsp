<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/boda/mypage/mypage_top.jsp" %>
<h5 align="center"><b>나의 관람권 보유 내역</b></h5><br>
<table class="table table-hover">
  <thead>
    <tr align="center" class="table-dark">
      <th scope="col">이미지</th>
      <th scope="col">종류</th>
      <th scope="col">수량</th>
    </tr>
  </thead>
  <tbody>
  <c:if test="${empty myticket_lists }">
  	<tr>
  		<td colspan="3" align="center">구매한 영화 관람권이 없습니다.</td>
  	</tr>
  </c:if>
  <c:if test="${!empty myticket_lists }">
  <c:forEach var="mtb" items="${myticket_lists}">
	    <tr align="center" class="table-active">
	      <td>
	      	<c:if test="${mtb.t_spec eq '일반 관람권'}">
	      		<img src="<%=request.getContextPath()%>/resources/images/ticket1.jpg" width="120">
	      	</c:if>
	      	<c:if test="${mtb.t_spec eq '골드 관람권'}">
	      		<img src="<%=request.getContextPath()%>/resources/images/ticket2.jpg" width="120">
	      	</c:if>
	      	<c:if test="${mtb.t_spec eq '프리미엄 관람권'}">
	      		<img src="<%=request.getContextPath()%>/resources/images/ticket3.jpg" width="120">
	      	</c:if>
	      </td>
	      <th scope="row">${mtb.t_spec}</th>
	      <td>${mtb.t_order}</td>
	    </tr>
  </c:forEach>
  </c:if>
  </tbody>
</table>
<%@ include file="/WEB-INF/boda/mypage/mypage_bottom.jsp" %>