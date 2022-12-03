<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/boda/mypage/mypage_top.jsp" %>
<h5 align="center"><b>나의 예매내역</b></h5><br>
<!-- jh add  -->
<c:if test="${(movieLists ne null) or(indeLists ne null)}">

<!-- jh add -->
<script type="text/javascript">

   function gotoDelete(r_num, r_day, r_mname, r_theater, r_cinema, r_sno){
   
      var yes = confirm('정말 예매를 취소하시겠습니까?');
      if(yes){
         location.href="bookDelete.bk?r_num="+r_num
         +"&r_day="+r_day+"&r_mname="+r_mname+"&r_theater="+r_theater
         +"&r_cinema="+r_cinema+"&r_sno="+r_sno;
      }
      
   }
</script>


<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
<!-- jh end -->

<table class="table table-hover" width="100%">
<thead>
   <tr class="table-primary"><th colspan="8" style="text-align:center;">상업영화</th></tr>
    <tr class="table-primary">
       <th scope="col" width=11%>예매번호</th>
      <th scope="col" width=17%>포스터</th>
      <th scope="col" width=15%>제목</th>
      <th scope="col" width=15%>관람극장</th>
      <th scope="col" width=12%>관람일시 </th>
      <th scope="col" width=12%>관람좌석</th>
      <th scope="col" width=10%>결제금액</th>
      <th scope="col" width=8%>예매취소</th>
    </tr>
</thead>
<tbody>
   <!-- 상업영화 jh add -->
   <c:forEach var="bb" items="${movieLists }">
      <fmt:parseDate var="r_day" value="${bb.r_day }" pattern="yyyy-MM-dd" />
       <fmt:formatDate var="day" value="${r_day}" pattern="yyyy-MM-dd" />
       <tr class="table-active">
         <th scope="row"><strong>${bb.r_num}-${day }</strong></th>
         <td><img
               src="<%=request.getContextPath() %>/resources/movie_image/${bb.r_img }"
               onerror="errorImage(this)" width="120" /></td>
         <td><a href="movie_detail.look?m_num=${bb.m_num }&m_name=${bb.r_mname }">${bb.r_mname }</a></td>
         <td><strong>${bb.r_theater }&nbsp;${bb.r_cinema }관</strong>
               <br><a href="list.th?t_theater=${bb.r_theater}">극장정보</a></td>
         <td><strong>${day }</strong></td>
         <td><strong>${bb.r_sno }</strong></td>
         <td><strong>${bb.r_price} 원 <br> (${bb.r_paying })</strong></td>
         <td>
         <c:if test="${today <= day }">
            <input type="button" class="btn btn-default" value="예매취소" onclick="gotoDelete('${bb.r_num}','${day }','${bb.r_mname }','${bb.r_theater}','${bb.r_cinema }','${bb.r_sno }')">
         </c:if>
         </td>
       </tr>
    </c:forEach>
</tbody>
</table>
<br>
<table class="table table-hover" width="100%">
<thead>
   <tr class="table-primary"><th colspan="8" style="text-align:center;">독립영화</th></tr>
    <tr class="table-primary">
      <th scope="col" width=11%>예매번호</th>
      <th scope="col" width=17%>포스터</th>
      <th scope="col" width=15%>제목</th>
      <th scope="col" width=15%>관람극장</th>
      <th scope="col" width=12%>관람일시 </th>
      <th scope="col" width=12%>관람좌석</th>
      <th scope="col" width=10%>결제금액</th>
      <th scope="col" width=8%>예매취소</th>
    </tr>
</thead>
 <tbody>   
   <!-- 독립영화 jh add  -->
    <c:forEach var="ib" items="${indeLists }">
   <fmt:parseDate var="r_day" value="${ib.r_day }" pattern="yyyy-MM-dd" />
    <fmt:formatDate var="day" value="${r_day}" pattern="yyyy-MM-dd" />
    <tr class="table-active">
      <th scope="row"><strong>${ib.r_num}-${day }</strong></th>
      <td><img
            src="<%=request.getContextPath() %>/resources/Independent_film/${ib.r_img }"
            onerror="errorImage(this)" width="120" /></td>
      <td><a href="indeMovieDetail.look?num=${moiveNum}">${ib.r_mname }</a></td> <!-- 수정 -->
      <td><strong>${ib.r_theater }&nbsp;${ib.r_cinema }관</strong>
               <br><a href="list.th?t_theater=${ib.r_theater}">극장정보</a></td>
      <td><strong>${day }</strong></td>
      <td><strong>${ib.r_sno }</strong></td>
      <td><strong>${ib.r_price} 원 <br> (${ib.r_paying })</strong></td>
      <td>
         <c:if test="${today <= day }">
            <input type="button" class="btn btn-default" value="예매취소" onclick="gotoDelete('${ib.r_num}','${day }','${ib.r_mname }','${ib.r_theater }','${ib.r_cinema }','${ib.r_sno }')">
         </c:if>
         </td>
    </tr>
    </c:forEach>
</tbody>
</table>
</c:if>
<!-- jh add  -->
<c:if test="${(movieLists eq null) and (indeLists eq null)}">
예매내역이 존재하지 않습니다.
</c:if>
<%@ include file="/WEB-INF/boda/mypage/mypage_bottom.jsp" %>