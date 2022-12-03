<%@page import="look.model.LookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
lookList.jsp
 -->
<%@ include file="/WEB-INF/Top&Bottom/top.jsp"%> 
<div class="container">
<style>
	h3, th, td {
		text-align:center;
	}
	a {
		text-decoration-line: none;
	}
</style>

<script type="text/javascript">
	function insertBoard(){
		if(${loginInfo.name==null}){
			alert("로그인이 필요합니다.");
		}
		location.href="insert.board";
	}	
</script>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/문의게시판.png" style="width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>
<center>
	<form action="list.board" method="post">
		<br>
		<table>
			<tr>
				<td width="18%">
				</td>
				<td>
				    <div class="form-group">
				      <select name="whatColumn" class="form-select" id="whatColumn">
						<option value="">전체</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
				      </select>
				    </div>
				</td>
				<td>
				    <div class="form-group">
				      <input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색어를 입력하세요.">
				    </div>
				</td>
				<td>
					<input type="submit" class="btn btn-primary" value="검색">
					&nbsp<input type="button" class="btn btn-outline-primary" value="문의 등록" onclick="insertBoard()">
				</td>
			</tr>
		</table>
	</form>
	<br>
	<b><font color="#F15F5F">${totalCount}</font></b>개의 게시글이 검색되었습니다.
	<br><br>
<c:if test="${fn:length(lists) == 0 }">
	<table class="table table-hover" id="tab">
		<tr>
			<td scope="col">번호</td>
			<td scope="col" width=50%>제목</td>
			<td scope="col">작성자</td>
			<td scope="col">작성일</td>
			<td scope="col">조회</td>
			<td scope="col">IP</td>
		</tr>
		<tr><td colspan="6">게시글이 없습니다.</td></tr>
	</table>
</c:if>

<c:if test="${fn:length(lists) > 0 }">
	<table class="table table-hover" id="tab">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col" width=50%>제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회</th>
				<th scope="col">IP</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="lb" items="${lists }">
			<tr>
				<td>${lb.num }</td>
				<td style="text-align:left;">
				<c:if test="${lb.re_level>0 }">
					<img src="<%=request.getContextPath() %>/resources/img/level.gif" width="${lb.re_level * 20}" height="20">
					<img src="<%=request.getContextPath() %>/resources/board_image/board_image_answer_2.png" height="20">
				</c:if>
				<a href="detail.board?num=${lb.num }&pageNumber=${pageInfo.pageNumber}&readcount=${lb.readcount}">${lb.subject }</a>
				
				<c:if test="${lb.readcount>=10 }">
				<img src="<%=request.getContextPath() %>/resources/board_image/board_image_hot_2.png" width="30" height="20">
				</c:if>
				</td>
				<td>${lb.writer }</td>
				<td>${lb.reg_date }</td>
				<td>${lb.readcount }</td>
				<td>${lb.ip }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</c:if>
<br>
${pageInfo.pagingHtml }
</center>
<br>
</div>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>