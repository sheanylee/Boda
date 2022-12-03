<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- findid.jsp <br> -->

<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<form action="findid_proc.bd" align="center">
<h3 class="text-primary">FIND ID, BODA</h3><br>
	<table align="center" width="50%">
	<tr>
		<td>이름</td>
		<td colspan="6">
			<input type="text" name="name" class="form-control" placeholder="이름">
		</td>
	</tr>
	<tr>
		<td colspan="7">&nbsp;</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>
			<select class="form-select" name="ph0">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="012">012</option>
			</select>
		</td>
		<td colspan="2">&nbsp;&nbsp;&nbsp;</td>
		<td>
			<input type="text" name="ph1" class="form-control" placeholder="입력" size="5">
		</td>
		<td>&nbsp;</td>
		<td>
			<input type="text" name="ph2" class="form-control" placeholder="입력" size="5">
		</td>
	</tr>
	<tr>
		<td colspan="7">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="3" width="50%">
		<div class="d-grid gap-2">
		<button type="submit" class="btn btn-lg btn-primary">아이디 찾기 </button>
		</div>
		</td>
		<td></td>
		<td colspan="3" width="50%">
		<div class="d-grid gap-2">
		<button type="button" class="btn btn-lg btn-primary" onClick="location.href='login.bd'">이전으로 </button>
		</div>
		</td>
	</tr>
	</table>
</form>


<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>