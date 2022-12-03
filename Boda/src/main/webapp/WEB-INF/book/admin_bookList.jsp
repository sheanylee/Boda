<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/예약내역 목록.png" style="width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>
   <div class="container">
    <div class="bs-docs-section">
       <div class="row">
          <div class="col-lg-12">
               <div class="page-header">
                 <h3 class="center" id="tables">예약내역 목록(관리자용) (총 : ${pageInfo.totalCount })</h3>
                </div>

   <br>
    
   <form name="bookingListForm" method="post" align="center" action="admin_bookList.bk">
        <div class="row" style="margin-left:20%;">
         <div class="col-lg-2">
            <div class="form-group">
               <select name="whatColumn" class="form-select" width="10%">
                  <option value="">전체검색</option>
                  <option value="r_num">예약번호</option>
                  <option value="r_userId">예약자</option>
                  <option value="r_mname">영화제목</option>
                  <option value="r_price">결제금액</option>
               </select>
             </div>
          </div>
          <div class="col-lg-5">
            <input type="text" name="keyword" class="form-control">
            </div>
          <div class="col-lg-2" style="margin-left:-30px;">
            <input type="submit" value="검색" class="btn btn-outline-primary">
         </div>
        </div>
  
   <br><br><br>
   
    <div class="bs-component">
         <table class="table table-hover">
            <tr>
               <th scope="col">예약번호</th>
               <th scope="col">예약자</th>
               <th scope="col">예약일</th>
               <th scope="col">예약영화</th>
               <th scope="col">극장</th>
               <th scope="col">상영관</th>
               <th scope="col">상영일</th>
               <th scope="col">상영시간</th>
               <th scope="col">좌석</th>
               <th scope="col">결제방법</th>
               <th scope="col">결제금액</th>
            </tr>
            <c:forEach var="blist" items="${bookLists}">
               <tr>
                <fmt:parseDate var="r_day" value="${blist.r_day }" pattern="yyyy-MM-dd" />
              <fmt:formatDate var="day" value="${r_day}" pattern="yyyy-MM-dd" />   
                  <td>${blist.r_num }-${day }</td>
                  <td>${blist.r_userId }</td>
                <fmt:parseDate var="r_reserDay" value="${blist.r_reserDay }" pattern="yyyy-MM-dd" />
              <fmt:formatDate var="reserDay" value="${r_reserDay}" pattern="yyyy-MM-dd" />    
                  <td>${reserDay }</td>
                  <td>${blist.r_mname }</td>
                  <td>${blist.r_theater }</td>
                  <td>${blist.r_cinema }</td>
                  <td>${day }</td>
                  <td>${blist.r_mstart }</td>
                  <td>${blist.r_sno }</td>
                  <td>${blist.r_paying }</td>
                  <td>${blist.r_price }</td>
               </tr>
            </c:forEach>
         </table>   
      </div><!-- bs-component -->
   </form>
  


   <p align="center">${pageInfo.pagingHtml }</p>

</div></div></div></div>
 
 <%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>