<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
insertLookForm.jsp<br>
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
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/문의등록.png" style="width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>
<center>
	<form:form commandName="lookBean" action="insert.board" method="post">
		<input type="hidden" name="writer" id="writer" value="${loginInfo.id}">
		<input type="hidden" name="passwd" id="passwd" value="${loginInfo.pw}">
		<input type="hidden" name="email" id="email" value="${loginInfo.email}">
		<h3>문의 등록</h3>
		<br>
		<table width="700">
			<tr>
				<td>
					<div class="form-floating">
						<input type="text" class="form-control" name="subject" id="subject" placeholder="제목" value="${lookBean.subject}" maxlength="50">
						<label for="floatingSubject">제목</label>
						<form:errors cssClass="err" path="subject"/>
  					</div>
				</td>
			</tr>
			<tr>
				<td>
				    <div class="form-group">
				      <textarea class="form-control" name="content" id="content" rows="15" placeholder="내용" maxlength="500">${lookBean.content}</textarea>
				      <form:errors cssClass="err" path="content" />
				    </div>
				</td>
			</tr>
			<tr>
				<td colspan=2 align="center" height="70">
					<button type="reset" class="btn btn-outline-primary">리셋</button>
					<button type="button" class="btn btn-outline-primary" Onclick="window.location='list.board'">목록</button>
					<button type="submit" class="btn btn-primary">등록</button>
				</td>
			</tr>
		</table>
	</form:form>
<br>
</center>
<br>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>