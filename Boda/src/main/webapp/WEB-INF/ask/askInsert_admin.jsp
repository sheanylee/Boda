<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
askInsert_admin.jsp
 -->
<%@ include file="/WEB-INF/Top&Bottom/top.jsp"%>

<style>
	h3, th{
		text-align:center;
	}
	.err{
	color: red;
	font-weight: bolder;
	font-size: 10;
	}
</style>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/자주찾는짊문등록.png" style="width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>
<center>
	<form:form commandName="ask" action="insertAsk.ask" method="post">
		<br>
		<table width="700">
			<tr>
				<td>
					<div class="form-floating">
						<input type="text" class="form-control" name="ask_title" id="ask_title" placeholder="제목" value="${ask.ask_title}" maxlength="400">
						<label for="floatingSubject">제목</label>
						<form:errors cssClass="err" path="ask_title"/>
  					</div>
				</td>
			</tr>
			<tr>
				<td>
				    <div class="form-group">
				      <textarea class="form-control" name="ask_content" id="ask_content" rows="15" placeholder="내용" maxlength="1750">${ask.ask_content}</textarea>
				      <form:errors cssClass="err" path="ask_content" />
				    </div>
				</td>
			</tr>
			<tr>
				<td colspan=2 align="center" height="70">
					<button type="reset" class="btn btn-outline-primary">리셋</button>
					<button type="button" class="btn btn-outline-primary" Onclick="window.location='selectAsk.ask'">목록</button>
					<button type="submit" class="btn btn-primary">등록</button>
				</td>
			</tr>
		</table>
	</form:form>
<br>
</center>
<br>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>