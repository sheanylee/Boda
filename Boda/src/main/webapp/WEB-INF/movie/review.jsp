<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
review.jsp
 -->
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<style>
	th {
		text-align: center;
	}
	.err{
	font-size: 9pt;
	color: #FF4848;
	font-weight: bold;
	}
</style>

<script type="text/javascript">
	function deleteReview(r_num, r_movieName){
		location.href="deleteReview.look?r_movieName="+r_movieName+"&r_num="+r_num+"&pageNumber=${pageInfo.pageNumber}"
	}
	function login(){
		location.href="login.bd"
	}
	function review(countReview){
		 
		if(countReview>=1){
			alert("이미 관람평을 작성하셨습니다.")
			return false;
		}
		 
		if(reviewForm.r_review.value==""){
			alert("관람평을 작성해주세요.")
			return false;
		}
		if(reviewForm.r_star.value=="평점"){
			alert("평점을 선택해주세요.")
			return false;
		}
	}
</script>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/감상평.png" style="margin-right:70%; width:350px; height:100px">
          </div>
        </div>
      </div>
</div>	
<center>
<fmt:formatNumber var="count" value="${totalCount}" pattern="###,###"/>
<div class="d-grid gap-2">
	<table>
		<tr>
			<th>
				<fmt:formatNumber type="number" pattern="0.00" value="${avgR_star}" var="r_star"/>
				「${r_movieName}」 평점 <font color="#F15F5F">${r_star}</font>점<br>
				<br>
			</th>
		</tr>
	</table>
</div>
<c:if test="${(loginInfo.id)==null}">
	<button type="button" class="btn btn-outline-primary" onclick="login()">로그인하고 관람평 남기기</button>
	<br>
</c:if>

<c:if test="${(loginInfo.id)!=null}">
	<form action="review.look" method="post" name="reviewForm" id="reviewForm">
		<input type="hidden" name="r_memberId" id="r_memberId" value="${loginInfo.id}">
		<input type="hidden" name="r_movieName" id="r_movieName" value="${r_movieName}">
		<table>
			<tr>
				<th>
					<div class="form-group">
						<textarea class="form-control" name="r_review" id="r_review" value="${r_review}" 
						cols="80" rows="3" maxlength="162" placeholder="관람평을 남겨주세요."></textarea>
					</div>
				</th>
				<th width=1%>
				</th>
				<th>
					<div class="form-group">
						<select class="form-select" name="r_star" id="r_star" value="${r_star}">
					        <option>평점</option>
					        <option>1</option>
					        <option>2</option>
					        <option>3</option>
					        <option>4</option>
					        <option>5</option>
					        <option>6</option>
					        <option>7</option>
					        <option>8</option>
					        <option>9</option>
					        <option>10</option>
						</select>
					</div>
				</th>
				<th width=1%>
				</th>
				<th>
					<button type="submit" class="btn btn-primary" onclick="return review('${countReview}')">관람평<br>남기기</button>
				</th>
			</tr>
		</table>
	</form>
</c:if>
<br>
<b><font color="#F15F5F">${count}</font></b>개의 관람평이 있습니다.
<br><br>
<table>
	<tr>
	<c:forEach var="review" items="${reviewList}" varStatus="vs">
		<td>
			<div class="card border-primary mb-3" style="width: 30rem; height: 14rem;">
			<div class="card-header">
				<fmt:parseDate var="parseR_date" value="${review.r_date}" pattern="yy/MM/dd"/>
				<fmt:formatDate var="formatR_date" value="${parseR_date}" pattern="yyyy.MM.dd"/>
				<table>
					<tr>
						<fmt:formatNumber type="number" pattern="0" value="${review.r_star}" var="r_star"/>
						<td width=90% ><b>${review.r_memberId} <span class="badge bg-primary">평점 ${r_star}</span></b>
							<c:if test="${(loginInfo.id)==(review.r_memberId)}">
								<button type="button" class="btn btn-outline-primary btn-sm" onclick="deleteReview(${review.r_num}, '${r_movieName}')">삭제</button>
							</c:if>
						</td>
						<td width=10%><b>${formatR_date}</b></td>
					</tr>
				</table>
			</div>
			  <div class="card-body">
			    <p class="card-text">${review.r_review} </p>
			  </div>
			</div>
		</td>
		<td width="20px"></td>
		<c:if test="${(vs.count)%2==0}"> <!-- 레코드 2번째 반복되면 다음줄로-->
			</tr><tr>
		</c:if>
	</c:forEach>
	</tr>
</table>
<br>
${pageInfo.pagingHtml}
</center>
<br>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>