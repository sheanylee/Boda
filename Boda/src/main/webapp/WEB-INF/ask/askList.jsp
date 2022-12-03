<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
ask.jsp
 -->
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/자주찾는질문.png" style="width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>
<br>
<center>
	<form>
		<table>
			<tr>
				<td>
				    <div class="form-group">
				      <select name="whatColumn" class="form-select" id="whatColumn">
						<option value="전체">전체</option>
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
				</td>
			</tr>
		</table>
	</form>
<br>
<b><font color="#F15F5F">${totalCount}</font></b>개의 질문이 검색되었습니다.
</center>
<br>
<div class="container">
	<div class="accordion" id="accordionExample">
		<c:forEach var="ask" items="${lists}" varStatus="status">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne_${status.count}" aria-expanded="true" aria-controls="collapseOne">
			        ${ask.ask_title}
			      </button>
			    </h2>
			    <div id="collapseOne_${status.count}" class="accordion-collapse collapse hidden" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
			      <div class="accordion-body">
			        ${ask.ask_content}
			      </div>
			    </div>
			  </div>
		</c:forEach>
	</div>
</div>

<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>