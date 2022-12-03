<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>
<br><br><br>
<%@ include file="/WEB-INF/common/common.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
    
<style>
   body { padding-top: 20px; }
</style>

<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/고객결제내역.png" style="width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>


<div class="container">  

   <form action="store_paylist.st">
   <table align="center">
      <tr>
         <td>
            <select class="form-select" name="whatColumn">
              <option value="">선택</option>
              <option value="o_id">고객 아이디</option>
              <option value="o_name">상품 명</option>
              </select>
         </td>
         <td>
            <input type="text" class="form-control" placeholder="검색어를 입력하세요." name="keyword">
         </td>
         <td>
            <button type="submit" class="btn btn-primary">검색</button>
         </td>
      </tr>
   </table>
   </form><br>

   <div class="table-responsive">
         <table class="table">
            <thead>
               <tr>
                  <th>고객 아이디</th>
                  <th>상품 명</th>
                  <th>주문 수량</th>
                  <th>단위 가격</th>
                  <th>총 가격</th>
                  <th>총 적립 포인트</th>
               </tr>
            </thead>
            <c:forEach var="ob" items="${paylists}">
               <tr>
                  <td>${ob.o_id}</td>
                  <td>${ob.o_name}</td>
                  <td>${ob.o_order}</td>
                  <td>${ob.o_price}</td>
                  <td>${ob.o_total_price}</td>
                  <td>${ob.o_total_point}</td>
               </tr>
            </c:forEach>
         </table>
<center>
${pageInfo.pagingHtml }
</center>
</div> <!-- container 끝 -->
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>