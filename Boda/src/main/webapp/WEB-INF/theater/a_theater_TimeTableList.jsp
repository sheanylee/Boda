<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<style>
	.card{
		width:80%;
		margin: auto;
	}
	.form-select{
		width: fit-content;
		block-size: fit-content;
		display: inline-block;
	}
	.form-control{
		width: fit-content;
		block-size: fit-content;
		display: inline-block;
	}
	a{
		text-decoration: none;
	}
	.text-white{
		display: inline-block;
		text-align:center;
		width: 120px;
		height:50px;
		padding-top: 10px;
	}
	.bg-primary{
		width:600px;
		color: white;
	}
</style>

<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/상영시간표.png" style="width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>
<form method="get" action="timeList.th" align="center">
   <select class="form-select" name="whatColumn">
      <option value="">전체검색
      <option value="theater">영화관
      <option value="mname">영화
   </select>
   <input type="text"  class="form-control" name="keyword">
   <input type="submit" class="btn btn-primary"  value="검색">
   <input type="button" class="btn btn-primary" value="추가하기" onclick="location.href='timetableInsert.th?pageNumber=${pageInfo.pageNumber }'">
<br>
<br>
    <table class="card border-primary mb-3" >
       <tr>
          <th scope="row" class="bg-primary">번호</th>
          <th scope="row" class="bg-primary">영화관</th>
          <th scope="row" class="bg-primary">상영관</th>
          <th scope="row" class="bg-primary">관람가</th>
          <th scope="row" class="bg-primary">장르</th>
          <th scope="row" class="bg-primary">영화</th>
          <th scope="row" class="bg-primary">종류</th>
          <th scope="row" class="bg-primary">총 좌석수</th>
          <th scope="row" class="bg-primary">남은좌석수</th>
          <th scope="row" class="bg-primary">상영일</th>
          <th scope="row" class="bg-primary">시작시간</th>
          <th scope="row" class="bg-primary">종료시간</th>
          <th scope="row" class="bg-primary">러닝타임</th>
          <th scope="row" class="bg-primary">개봉일</th>
          <th scope="row" class="bg-primary">상영종료일</th>
          <th scope="row" class="bg-primary">수정</th>
          <th scope="row" class="bg-primary">삭제</th>
          
       </tr>
       
        <c:if test="${empty lists }">
        	<tr>
        		<th colspan="17">영화 상영시간표가 존재하지 않습니다.</th>
        	</tr>
        </c:if>
       
          <c:forEach var="time" items="${lists }">
          
       <tr>
             <Td>${time.num }</Td>
             <Td>${time.theater }</Td>
             <Td>${time.cinema }</Td>
             <Td>${time.m_grade }</Td>
             <Td>${time.m_genre }</Td>
             <Td>${time.mname }</Td>
             <Td>${time.t_premium }</Td>
             <Td>${time.t_seat }</Td>
             <Td>${time.t_seat - time.bookingSeat }</Td>
             <Td>${time.day }</Td>
             <Td>${time.mstart }</Td>
             <Td>${time.mend }</Td>
             <Td>${time.m_runtime }</Td>
             <Td>${time.m_date }</Td>
             <fmt:parseDate value="${time.m_Enddate }" var="m_Enddate" pattern="yyyy-MM-dd"/>
             <fmt:formatDate value="${m_Enddate }" var="end" pattern="yyyy-MM-dd"/>
             <Td>${end }</Td>
             <td>
             <input type="button" class="btn btn-outline-primary" value="수정" onclick="location.href='updateTable.th?num=${time.num}&pageNumber=${pageInfo.pageNumber }&theater=${time.theater}&mname=${time.mname}'">
             </td>
             <td>
             <input type="button" class="btn btn-primary" value="삭제" onclick="location.href='deleteTable.th?num=${time.num}&pageNumber=${pageInfo.pageNumber }'">
             </td>
       </tr>
          </c:forEach>
          
          <tr>
          	<th scope="row" class="bg-primary" colspan="17" align="left">독립영화</th>
          </tr>
          
          <c:if test="${empty indelists }">
          	<tr>
          		<th colspan="17">독립영화 상영시간표가 존재하지 않습니다.</th>
          	</tr>
          </c:if>
          
          <c:forEach var="inde" items="${indelists }">
          
       <tr>
             <Td>${inde.num }</Td>
             <Td>${inde.theater }</Td>
             <Td>${inde.cinema }</Td>
             <Td>${inde.m_grade }</Td>
             <Td>${inde.m_genre }</Td>
             <Td>${inde.mname }</Td>
             <Td>${inde.t_premium }</Td>
             <Td>${inde.t_seat }</Td>
             <Td>${inde.t_seat - inde.bookingSeat }</Td>
             <Td>${inde.day }</Td>
             <Td>${inde.mstart }</Td>
             <Td>${inde.mend }</Td>
             <Td>${inde.m_runtime }</Td>
             <Td>${inde.m_date }</Td>
             <fmt:parseDate value="${inde.m_Enddate }" var="m_Enddate" pattern="yyyy-MM-dd"/>
             <fmt:formatDate value="${m_Enddate }" var="end" pattern="yyyy-MM-dd"/>
             <Td>${end }</Td>
             <td>
             <input type="button" class="btn btn-outline-primary" value="수정" onclick="location.href='updateTable.th?num=${inde.num}&pageNumber=${pageInfo.pageNumber }&theater=${inde.theater}&mname=${inde.mname}'">
             </td>
             <td>
             <input type="button" class="btn btn-primary" value="삭제" onclick="location.href='deleteTable.th?num=${inde.num}&pageNumber=${pageInfo.pageNumber }'">
             </td>
       </tr>
          </c:forEach>
    </table>
    <br>
    <center>
   ${pageInfo.pagingHtml }
    </center>
</form>
    <%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>