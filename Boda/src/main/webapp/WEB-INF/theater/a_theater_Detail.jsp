<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<style>
	.card{
		width:600px;
		margin: auto;
	}
	.card-header{
		width:400px;
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
		text-align:center;
		width: 120px;
		height:50px;
		padding-top: 10px;
	}
	td{
		padding-left: 20px;
		padding-bottom: 10px;
	}
</style>
 <%@ include file="graphModal.jsp" %>


<script type="text/javascript">
	function remove(){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="admin_delete.th?t_num=${tb.t_num }&pageNumber=${pageNumber}";			
		}else{
			return false;
		}
	}

    </script>

<%
ServletContext context =  config.getServletContext();
String path = context.getContextPath()+"/resources/극장 이미지/";
%>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/영화관 상세보기.png" style="margin-left:40%;width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>
<form>
	<table class="card mb-3">
	<c:if test="${theaterBean != null }">
		<tr>
			<th scope="row">
			 <span class="card text-white bg-primary mb-3">운영현황</span>
			</th>
			<td style="display: inline;" >
				<input type="button"  class="btn btn-outline-primary" data-toggle="modal" data-target="#income" value="매출현황">
				<input type="button"  class="btn btn-outline-primary" data-toggle="modal" data-target="#visit" onclick="sendDate()" value="방문현황">
				<input type="button"  class="btn btn-outline-primary" data-toggle="modal" data-target="#movie_booking" onclick="sendDate3()" value="예매현황">
			</td>
		</tr>
	</c:if>
		<tr>
			<th scope="row" class="card text-white bg-primary mb-3">번호</th>
			<td>${tb.t_num }</td>
		</tr>
		<tr>
			<th scope="row"  class="card text-white bg-primary mb-3">코드</th>
			<td>${tb.t_code}</td>
		</tr>
		<tr>
			<th scope="row" class="card text-white bg-primary mb-3">설립일</th>
			<td>
			<fmt:parseDate var="tday" value="${tb.t_day}" pattern="yyyy-MM-dd"/>
			<fmt:formatDate value="${tday}" var="day" pattern="yyyy-MM-dd"/>
			${day }
			</td>
		</tr>
		<tr>
			<th scope="row" class="card text-white bg-primary mb-3">지역</th>
			<td>${tb.t_region }</td>
		</tr>
		<tr>
			<th scope="row" class="card text-white bg-primary mb-3">주소</th>
			<td>${tb.t_gu }&nbsp;${tb.t_address }</td>
		</tr>
		<tr>
			<th scope="row" class="card text-white bg-primary mb-3">위치</th>
			<td>${tb.t_location }</td>
		</tr>
		<tr>
			<th scope="row" class="card text-white bg-primary mb-3">영화관</th>
			<td>${tb.t_theater }</td>
		</tr>
		<tr>
			<th scope="row" class="card text-white bg-primary mb-3">이미지</th>
			<td><img src="<%=path %>${tb.t_img }" width="400" height="200"></th>
		</tr>
		<tr>
			<th scope="row" class="card text-white bg-primary mb-3">전화번호</th>
			<td>${tb.t_tel }</td>
		</tr>
		<tr>
			<th scope="row" class="card text-white bg-primary mb-3">주차 가능 여부</th>
			<td>${tb.t_parking }</td>
		</tr>
		<tr>
			<th scope="row" class="card text-white bg-primary mb-3">상영관</th>
			<td>${tb.t_name } 관</td>
		</tr>
		<tr>
			<th scope="row" class="card text-white bg-primary mb-3">좌석 수</th>
			<td>${tb.t_seat } 석</td>
		</tr>
		<tr>
			<th scope="row" class="card text-white bg-primary mb-3">상영종류</th>
			<td>${tb.t_premium }</td>
		</tr>
		
	</table>
	<br>
	<center>
				<input type="button"  class="btn btn-outline-primary" value="목록보기" onclick="location.href='admin_list.th?pageNumber=${pageNumber}'">
				<input type="button"  class="btn btn-outline-primary" value="수정하기" onclick="location.href='a_update.th?t_num=${tb.t_num }&pageNumber=${pageNumber}'">
				<input type="button"  class="btn btn-primary"value="삭제하기" onclick="return remove()">
	</center>
</form>

    <%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>