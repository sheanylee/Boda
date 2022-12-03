<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<style>
	.card{
		width:70%;
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
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/영화관 목록.png" style="width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>

<form method="get" action="admin_list.th" align="center">
	
	<select name="whatColumn" class="form-select" >
		<option value="">전체검색
		<option value="t_code">코드
		<option value="t_region">지역
		<option value="t_theater">영화관
	</select>
	<input type="text" class="form-control" name="keyword">
	<input type="submit" value="검색" class="btn btn-primary">
	<input type="button" class="btn btn-primary" value="추가하기" onclick="location.href='insert.th?pageNumber=${pageInfo.pageNumber }'">

	<br><br>
	<table class="card border-primary mb-3">
		<tr>
			<th class="bg-primary">No.</th>
			<th class="bg-primary">코드</th>
			<th class="bg-primary">지역</th>
			<th class="bg-primary">영화관 이름</th>
			<th class="bg-primary">전화번호</th>
		</tr>
		<c:forEach var="tb" items="${lists }" varStatus="sta">
		<tr>
			<td>${tb.t_num }</td>
			<td>${tb.t_code }</td>
			<td>${tb.t_region }</td>
			<td><a href="a_detail.th?t_num=${tb.t_num}&t_theater=${tb.t_theater}&pageNumber=${pageInfo.pageNumber}">${tb.t_theater }</a></td>
			<td>${tb.t_tel }</td>			
		</tr>
		<c:if test="${sta.index/3 == 4 }">
			
		</c:if>
		</c:forEach>
		
	</table>
</form> 
<br> 
<center>
${pageInfo.pagingHtml }
</center>

    <%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>