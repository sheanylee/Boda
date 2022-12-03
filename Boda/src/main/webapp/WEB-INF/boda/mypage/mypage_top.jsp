<%@page import="boda.member.model.MemberBean"%>
<%@page import="store.model.MyTicketDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mypage_top.jsp -->

<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>
<%-- 
<%
MemberBean mb=(MemberBean)session.getAttribute("loginInfo");
MyTicketDao myticketDao=new MyTicketDao();
int count1=myticketDao.getMyTicketCountById1(mb.getId());
int count2=myticketDao.getMyTicketCountById2(mb.getId());
int count3=myticketDao.getMyTicketCountById3(mb.getId());
int myticket_count=count1+count2+count3;

System.out.println("count1:"+count1);
System.out.println("count2:"+count2);
System.out.println("count3:"+count3);
System.out.println("myticket_count:"+myticket_count);
session.setAttribute("myticket_count", myticket_count);
%>
 --%>
 <div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/마이페이ㅣㅈ.png" style="width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>
<br>
<center>
<div class="container">
<div class="col-xs-3">
<table width="1300">
	<tr align="center">
		<td rowspan="2"><img src="<%=request.getContextPath()%>/resources/images/user.png" height="150"></td>
		<td width="60%"><h3><b>${loginInfo.name}</b>님 오늘도 즐거운 관람되세요!</h3></td>
	</tr>
	<tr align="center">
		<td><h4>아이디 : <b>${loginInfo.id}</b></h4></td>
	</tr>
</table>
<br>
<hr>
<br>
<table width="1300">
	<tr align="center">
		<td colspan="2"><h4><b>MY COUPON</b></h4></td>
		<td colspan="2"><h4><b>MY POINT</b></h4></td>
	</tr>
	<tr>
		<td colspan="4">&nbsp;</td>
	</tr>
	<tr align="center">
      <td><h5>영화 관람권</h5></td>
      <td align="left"><h5>${Myticket_count}개</h5></td>
      <td><h5>사용가능 point</h5></td>
      <td align="left"><h5>${Mypoint}점</h5>
      </td>   <!-- 가영: 이벤트 룰렛 후에 포인트가 새로 업데이트 -->
   </tr>

</table>
<br>
<hr>
<br>
<table width="1300">
<ul class="list-group">

	<tr width="30%" align="center">
		<td width="30%">
		<div class="list-group">
  		<a href="mybooklist.bd?userId=${loginInfo.id}" class="list-group-item list-group-item-action"><b>나의 예매내역</b></a>
		</div>
		</td>
		<td rowspan="5">
		