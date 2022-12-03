<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- member_admin.jsp <br> -->

<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/회원정보확인.png" style="width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>

<div class="container">

<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        전체 회원 목록
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
      <div class="accordion-body">
      <!-- 테이블 시작 -->
        <table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">이름</th>
      <th scope="col">아이디</th>
      <th scope="col">전화번호</th>
      <th scope="col">이메일</th>
      <th scope="col">포인트</th>
    </tr>
  </thead>
  <tbody>
  <c:if test="${empty mlists }">
  <tr>
  	<td colspan="6" align="center">조회 할 회원 목록이 없습니다.</td>
  </tr>
  </c:if>
  <c:if test="${!empty mlists }">
  <c:forEach var="mb" items="${mlists}">
    <tr class="table-light">
      <th scope="row">${mb.no}</th>
      <td>${mb.name}</td>
      <td>${mb.id}</td>
      <td>${mb.ph0} - ${mb.ph1} - ${mb.ph2}</td>
      <td>${mb.email}</td>
      <td>${mb.point}점</td>
    </tr>
    </c:forEach>
   </c:if>
  </tbody>
</table>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        탈퇴 회원 목록
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample" style="">
      <div class="accordion-body">
        <!-- 테이블 시작 -->
        <table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">이름</th>
      <th scope="col">아이디</th>
      <th scope="col">전화번호</th>
      <th scope="col">이메일</th>
      <th scope="col">포인트</th>
      <th scope="col">탈퇴 날짜</th>
    </tr>
  </thead>
  <tbody>
  <c:if test="${empty dlists }">
  	<tr>
  		<td colspan="7" align="center">탈퇴 회원이 없습니다.</td>
  	</tr>
  </c:if>
  <c:if test="${!empty dlists }">
  <c:forEach var="dmb" items="${dlists}">
    <tr class="table-light">
      <th scope="row">${dmb.no}</th>
      <td>${dmb.name}</td>
      <td>${dmb.id}</td>
      <td>${dmb.ph0} - ${dmb.ph1} - ${dmb.ph2}</td>
      <td>${dmb.email}</td>
      <td>${dmb.point}점</td>
      <td>${dmb.time}</td>
    </tr>
    </c:forEach>
  </c:if>
  </tbody>
</table>
      </div>
    </div>
  </div>
</div>
</div>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>