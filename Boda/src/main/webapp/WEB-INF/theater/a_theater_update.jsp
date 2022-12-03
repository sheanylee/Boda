<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>


<style>
	.card{
		width:600px;
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
	.err{
		font-size: 10px;
		color: red;
		font-weight: bolder;
	}
</style>

<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/영화관 수정.png" style="width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>
<form:form commandName="tb" action="a_update.th?pageNumber=${pageNumber }" method="post" cssClass="f" enctype="multipart/form-data">
<input type="hidden" name="t_num" value="${tb.t_num}">
<table class="card mb-3">
	<tr>
		<th scope="row" class="card text-white bg-primary mb-3">코드</th>
		<td><input readonly type="text" class="form-control" name="t_code" value="${tb.t_code }">
		<form:errors cssClass="err" path="t_code"/>
		</td>
	</tr>
	<tr>
		<th scope="row" class="card text-white bg-primary mb-3">설립일</th>
		<td>
		<fmt:parseDate var="tday" value="${tb.t_day}" pattern="yyyy-MM-dd"/>
		<fmt:formatDate value="${tday}" var="day" pattern="yyyy-MM-dd"/>
		<input type="date" class="form-control" name="t_day" value="${day }">
		<form:errors cssClass="err" path="t_day"/>
		</td>
	</tr>
	<tr>
		<th scope="row" class="card text-white bg-primary mb-3">지역선택</th>
		<td>
		<%
		String[] Arr = {"서울","경기도","인천","강원도","충남","대구","부산","경상남도","전라남도"};
		%>
		<c:set var="region" value="<%=Arr %>"/>
		<select class="card bg-secondary mb-3 form-select" name="t_region">
			<c:forEach var="region" items="${region }">
				<option value="${region }"  <c:if test="${tb.t_region eq region }">selected</c:if>>${region }
			</c:forEach>
		</select>
		<form:errors cssClass="err" path="t_region"/>
		</td>
	</tr>
	
	<tr>
		<th scope="row" class="card text-white bg-primary mb-3">시 / 구</th>
		<td><input type="text" class="form-control" name="t_gu" value="${tb.t_gu }">
		<form:errors cssClass="err" path="t_gu"/>
		</td>
	</tr>
	<tr>
		<th scope="row" class="card text-white bg-primary mb-3">상세주소</th>
		<td><input type="text" class="form-control" name="t_address" value="${tb.t_address }">
		<form:errors cssClass="err" path="t_address"/>
		</td>
	</tr>
	<tr>
		<th scope="row" class="card text-white bg-primary mb-3">위도/경도</th>
		<td><input type="text" class="form-control" placeholder="ex)37.642338, 127.0300198" name="t_location" value="${tb.t_location }">
		<form:errors cssClass="err" path="t_location"/>
		</td>
	</tr>
	<tr>
		<th scope="row" class="card text-white bg-primary mb-3">영화관 이름</th>
		<td><input readonly type="text" class="form-control" name="t_theater" value="${tb.t_theater }">
		<form:errors cssClass="err" path="t_theater"/>
		</td>
	</tr>
	<tr>
		<th scope="row" class="card text-white bg-primary mb-3">이미지</th>
		<td><input type="text" class="form-control" readonly name="beforeImg" value="${tb.t_img }">
		<input type="file" class="form-control" name="upload">
		<form:errors cssClass="err" path="t_img"/>
		</td>
	</tr>
	<tr>
		<th scope="row" class="card text-white bg-primary mb-3">연락처</th>
		<td><input type="text" class="form-control" name="t_tel" value="${tb.t_tel }">
		<form:errors cssClass="err" path="t_tel"/>
		</td>
	</tr>
	<tr>
		<th scope="row" class="card text-white bg-primary mb-3">주차여부</th>
		<td>
		<input type="radio" class="form-check-input" value="yes" name="t_parking" <c:if test="${tb.t_parking eq 'yes' }">checked</c:if>>yes&nbsp;
		<input type="radio" class="form-check-input" value="no" name="t_parking" <c:if test="${tb.t_parking eq 'no' }">checked</c:if>>no
		<form:errors cssClass="err" path="t_parking"/>
		</td>
	</tr>
	<tr>
		<th scope="row" class="card text-white bg-primary mb-3">상영관</th>
		<td><input type="text" readonly class="form-control" name="t_name" value="${tb.t_name }">관
		<form:errors cssClass="err" path="t_name"/>
		</td>
	</tr>
	<tr>
		<th scope="row" class="card text-white bg-primary mb-3">좌석 수</th>
		<td><input type="text" class="form-control" name="t_seat" value="${tb.t_seat }">
		<form:errors cssClass="err" path="t_seat"/>
		</td>
	</tr>
	<tr>
		<th scope="row" class="card text-white bg-primary mb-3">프리미엄</th>
		<td>
		<input type="radio" class="form-check-input"  name="t_premium" value="2D" <c:if test="${tb.t_premium eq '2D' }">checked</c:if>>2D&nbsp;
		<input type="radio" class="form-check-input"  name="t_premium" value="4DX"  <c:if test="${tb.t_premium eq '4DX' }">checked</c:if>>4DX&nbsp;
		<input type="radio" class="form-check-input"  name="t_premium" value="screenX" <c:if test="${tb.t_premium eq 'screenX' }">checked</c:if>>screenX&nbsp;
		<input type="radio" class="form-check-input"  name="t_premium" value="recline" <c:if test="${tb.t_premium eq 'recline' }">checked</c:if>>recline&nbsp;
		<form:errors cssClass="err" path="t_premium"/>
		</td>
	</tr>
</table>
<br>
<center>
	<input type="button" class="btn btn-outline-primary" value="상세보기" onclick="location.href='a_detail.th?t_num=${tb.t_num}&pageNumber=${pageNumber }'">&nbsp;<input type="submit" class="btn btn-outline-primary" value="수정하기">&nbsp;<input type="reset" class="btn btn-primary" value="지우기">
</center>
</form:form>

</body>

    <%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>