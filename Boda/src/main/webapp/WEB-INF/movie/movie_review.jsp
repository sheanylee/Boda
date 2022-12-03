<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>
	

movie_review.jsp
 

<style>

h3, th, td {
	text-align: center;
	color: #EAEAEA;
}
</style>

<% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); %>
<br>
<br>
<c:forEach var="reviewBean" items="${reviewList}">
${reviewBean.r_num} | ${reviewBean.r_id} | "${reviewBean.r_review}" | ${reviewBean.r_date} | ${reviewBean.r_movie}

${reviewBean.r_star}

</c:forEach>
<br>
${pageInfo.pagingHtml }
