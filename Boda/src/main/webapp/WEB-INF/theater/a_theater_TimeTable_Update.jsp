<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<style>
	.card{
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
	.err{
		font-size: 10px;
		color: red;
		font-weight: bolder;
	}
</style>

<c:set var="path" value="<%=request.getContextPath() %>"/>
<script type="text/javascript" src="${path }/resources/js/jquery.js" ></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#day').change(function(){
			var theater=$('select[name="theater"]').val();
			var cinema=$('select[name="cinema"]').val();
			var day=$('input[name="day"]').val();
			var num=$('input[name="num"]').val();
			
			location.href="timeupdate.th?theater="+theater+"&cinema="+cinema+"&day="+day+"&num="+num;
		});
		
		$('#sub').click(function(){
			if($('select[name="mname"]').val()==""){
				alert("영화를 선택하세요");
				return false;
			}
		});
		
	});
</script>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/상영스케줄 수정.png" style="margin-left:50%;width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>
<form:form action="updateTable.th" method="post" name="f" commandName="tb">
<input type="hidden" name="num" value="${tb.num }${num}">
<input type="hidden" name="pageNumber" value="${pageNumber }">
<input type="hidden" name="theater" value="${theater }">
	<table class="card mb-3">
		<tr>
			<th scope="row" class="card text-white bg-primary mb-3">영화관</th>
			<td>
			<select class="card bg-secondary mb-3 form-select"  name="theater" id="theater">
				<option disabled value="">선택하세요
				<c:forEach var="theaterBean" items="${tlists }">
					<option disabled value="${theaterBean.t_theater}" <c:if test="${theaterBean.t_theater eq tb.theater || theaterBean.t_theater eq theater}">selected</c:if>>${theaterBean.t_theater }
				</c:forEach>
			</select>
			<form:errors cssClass="err" path="theater"/>
			</td>
		</tr>
		<tr>
			<th scope="row" class="card text-white bg-primary mb-3">상영관</th>
			<td><select  class="card bg-secondary mb-3 form-select"  name="cinema">
			<option value="">선택하세요
					<c:forEach var="theaterBean" items="${clists }">
						<option value="${theaterBean.t_name}" <c:if test="${theaterBean.t_name eq tb.cinema || cinema eq theaterBean.t_name}">selected</c:if>>${theaterBean.t_name}관
					</c:forEach>
			</select>
			<form:errors cssClass="err" path="cinema"/>
			</td>
		</tr>
		
		<tr>
			<th scope="row" class="card text-white bg-primary mb-3">날짜</th>
			<td><input type="date" class="form-control" name="day" id="day" value="${tb.day }${day}">
			<form:errors cssClass="err" path="day"/>			
			</td>
		</tr>
		<tr>
			<th scope="row" class="card text-white bg-primary mb-3">시간</th>
			<td>
				<%
			String []Arr = {"08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00"};
			pageContext.setAttribute("Arr", Arr);
			%> 
			<fmt:parseDate var="mstart" value="${tb.mstart }" pattern="HH:mm"/>
			<fmt:formatDate var="start" value="${mstart }" pattern="HH:mm"/>
			<select  class="card bg-secondary mb-3 form-select"  name="mstart">
				<option value="">선택하세요
				<c:if test="${empty timelists }">
					<c:forEach var="time" items="${Arr}">
						<option value="${time}" <c:if test="${time eq start}">selected</c:if>>${time}
					</c:forEach>	
				</c:if>
			<c:if test="${not empty timelists }">
					<c:forEach var="time" items="${Arr}">
						<fmt:parseDate var="time" value="${time }" pattern="HH"/>
						<fmt:formatDate var="time" value="${time }" pattern="HH"/>
						<option value="${time}:00"<c:forEach var="timelists" items="${timelists }"> <c:if test="${time eq ttb.mstart}">selected</c:if> 
							<c:if test="${time eq timelists.noinput1 || time eq timelists.mstart || time eq timelists.noinput2 ||timelists.mstart <= time && time <= timelists.noinput2}">disabled</c:if>
							</c:forEach>
						>${time}:00
					</c:forEach>		
				</c:if>
			</select>
			<form:errors cssClass="err" path="mstart"/>			
			</td>
		</tr>
		<tr>
			<th scope="row" class="card text-white bg-primary mb-3">영화</th>
			<td><select class="card bg-secondary mb-3 form-select" name="mname">
				<option value="">선택하세요
				<c:forEach var="movie" items="${mlists}">
				<c:set var="m_name" value="${movie.m_name}" /> 
					<option value="${movie.m_name}" <c:if test="${movie.m_name eq tb.mname}">selected</c:if>>${fn:substring(m_name,0,10)}
				</c:forEach>
				<c:forEach var="inde" items="${indeLists}">
					<option value="${inde.title}" <c:if test="${inde.title eq tb.mname}">selected</c:if>>${inde.title}
				</c:forEach>
				<c:forEach var="ind" items="${upindelists}">
					<option value="${ind.title}" <c:if test="${ind.title eq tb.mname}">selected</c:if>>${ind.title}
				</c:forEach>
			</select>
			<form:errors cssClass="err" path="mname"/>			
			</td>
		</tr>

	</table>
	<br>
<center>
	<input type="button" class="btn btn-outline-primary"  value="목록보기" onclick="location.href='timeList.th?pageNumber=${pageNumber }'">
	<input type="submit" class="btn btn-primary"  value="수정하기" id="sub">
</center>
</form:form>
    <%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>
