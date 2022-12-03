<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--     
lookDetail.jsp<br>
 -->
 <%@ include file="/WEB-INF/Top&Bottom/top.jsp"%>
<style>
	h3, th{
		text-align:center;
	}
</style>

<script type="text/javascript">

</script>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/문의내용.png" style="width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>
<center>
	<form action="detail.board" method="post">
	
		<br>
		<table>
			<tr>
				<td>
					<div class="card border-primary mb-3" style="width: 60rem; height: 23rem;">
						<div class="card-header">
							<table>
								<tr>
									<td>${lb.writer} [${lb.email}]</td>
									<td width=18%>${lb.reg_date}</td>
								</tr>
							</table>
						</div>
							<div class="card-body">
							<h4 class="card-title">${lb.subject}</h4>
							<p class="card-text">${lb.content}</p>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>
					<input type="button" value="목록" class="btn btn-outline-primary" onclick="location.href='list.board?pageNumber=${pageNumber }'">
					<c:if test="${(loginInfo.id)==(lb.writer)}">
						<input type="button" class="btn btn-primary" value="삭제" onclick="location.href='delete.board?num=${lb.num}&pageNumber=${pageNumber }'">
						<input type="button" class="btn btn-primary" value="수정" onclick="location.href='update.board?num=${lb.num}&pageNumber=${pageNumber }'">
					</c:if>
					<c:if test="${(loginInfo.id)=='admin'}">
						<input type="button" value="답변" class="btn btn-primary" onclick="location.href='reple.board?num=${lb.num}&pageNumber=${pageNumber }&ref=${lb.ref }&re_step=${lb.re_step }&re_level=${lb.re_level }'">
					</c:if>
				</th>
			</tr>
		</table>
	</form>
	<br>
</center>
<br>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>