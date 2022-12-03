<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<!-- login.jsp <br> -->
<style>
	table{
		margin: 0px auto;
		text-align: left;
	}
</style>


<body>
<form action="login_proc.bd" align="center">
<table align="center">
	<tr>
		<td colspan="2" align="center"><h3 class="text-primary">Boda LOGIN</h3></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			아이디
		</td>
		<td>
			<input type="text" name="id" placeholder="ID" size="20" class="form-control">
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
			비밀번호&nbsp;&nbsp;&nbsp;
		</td>
		<td>
			<input type="password" name="pw" placeholder="PASSWORD" size="20" class="form-control">
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2">
		<div class="d-grid gap-2">
		<button class="btn btn-lg btn-primary" type="submit">로그인</button>
		</div>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2">
		<div class="d-grid gap-2">
		<button class="btn btn-lg btn-primary" type="button" onClick="location.href='join.bd'">회원가입</button>
		</div>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
		<button type="button" class="btn btn-default btn-sm" onClick="location.href='findid.bd'">아이디 찾기</button>&nbsp;&nbsp;
		<button type="button" class="btn btn-default btn-sm" onClick="location.href='findpw.bd'">비밀번호 찾기</button>
</form>
</body>
</html>


<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>