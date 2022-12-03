<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<style>
   .row {
      width:100%;
      text-align:center;
      margin-bottom: 4px;
      margin-top: 4px;
   }
   .col-md-4, .col-md-2, .col-md-2{
      border: 1px solid;
      padding:10px;
   }
   caption{
      font-size:25px;
      font : bolder;
      text-align:center;
      margin-bottom:20px;
   }
   .ttable{
       width:70%; 
   }
   .marginbt{
      pqdding-bottom: 50px;
   }
   
</style>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/빠른예매.png" style="margin-right:70% ;width:350px; height:100px"><br>
          </div>
        </div>
      </div>
</div>      
<script src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script>

        var currentDate = new Date();
        var arrDayStr = ['일', '월', '화', '수', '목', '금', '토'];

       
        document.write("<table class='table marginbt ttable'  align='center'>");
        document.write("<tr>");
        currentDate.setDate(currentDate.getDate()-1);
        for(let j=0; j<7; j++){ // j는 몇 번을 반복할 것인지에 대한 반복 횟수
        currentDate.setDate(currentDate.getDate()+1);
        document.write("<th><a href='booking.bk?currentDate="
              +currentDate.getFullYear()
                +"-"+strPlusZero(currentDate.getMonth()+1)
                +"-"+strPlusZero(currentDate.getDate())+"'>"
                
           +currentDate.getFullYear()
            +"-"+strPlusZero(currentDate.getMonth()+1)
            +"-"+strPlusZero(currentDate.getDate())+"("+arrDayStr[currentDate.getDay()]
            +")</a></th>");
        }
        document.write("</tr></table>");

        function strPlusZero(strValue){
            strValue = strValue + "";
            if(strValue.length == 1){
                strValue = "0"+strValue;
            }
            return strValue;
        }

        function movie(mname, currentDate){

           location.href="booking.bk?mname="+mname+"&currentDate="+currentDate; 
        }
        
        function region(selectRg,currentDate,mname){
           //alert(selectRg);
           location.href="booking.bk?selectRg="+selectRg+"&currentDate="+currentDate+"&mname="+mname; 
        }

        function cinema(selectCn,selectRg,currentDate,mname){
           //alert(selectCn);
           location.href="booking.bk?selectCn="+selectCn+"&selectRg="+selectRg+"&currentDate="+currentDate+"&mname="+mname; 
        }
        
        function gotoSeat(mstart, mname, selectCn, selectRg, currentDate, cinema, runtime, premium){
           //alert(mstart);
           location.href="seatForm.se?mstart="+mstart+"&mname="+mname+"&selectCn="+selectCn+"&selectRg="+selectRg+"&currentDate="+currentDate+"&cinema="+cinema+"&runtime="+runtime+"&premium="+premium; 
        }
</script>


<table class="table marginbt" style="width:70%;" align="center">
   <tr>
      <th width=25%>영화</th>
      <th colspan=2 width=35%>영화관</th>
      <th width=40%>영화시간</th>
   </tr>
   
   <tr>
      <c:if test="${empty GetMovieLists}">
      <td colspan="4" height="200" align="center" valign="middle">선택 가능한 영화가 없습니다.</td>
   </c:if>
      <td>
         <!-- 상업영화 -->
         <c:forEach var="GetMovieLists" items="${GetMovieLists }">
            <button  type="button" class="btn btn-default" style="width:100%;"
               onclick="movie('${GetMovieLists.mname }','${currentDate }')">
            ${GetMovieLists.mname } (${GetMovieLists.m_genre })</button><br>
         </c:forEach>
         <!-- 독립영화 -->
         <c:forEach var="GetIndeMovieLists" items="${GetIndeMovieLists }">
            <button  type="button" class="btn btn-default" style="width:100%;"
               onclick="movie('${GetIndeMovieLists.mname }','${currentDate }')">
            ${GetIndeMovieLists.mname } (${GetIndeMovieLists.m_genre })</button><br>
         </c:forEach>
      </td>
      <td>
         <c:forEach var="getRegionList" items="${getRegionList }">
            <button  type="button" class="btn btn-default" 
               onclick="region('${getRegionList.t_region }','${currentDate }','${mname }')">
            ${getRegionList.t_region }</button><br><br>
         </c:forEach>
      </td>
      <td>
          <c:forEach var="TheaterLists" items="${TheaterLists }">
            <button  type="button" class="btn btn-default" 
               onclick="cinema('${TheaterLists.t_theater }','${selectRg }','${currentDate }','${mname }')">${TheaterLists.t_theater }</button><br><br>
         </c:forEach>
      </td>
      <td>
         <!-- 상업영화 -->
         <c:forEach var="TimeTableLists" items="${TimeTableLists }">
            <button width="50px" type="button" class="btn btn-default"  style="width:100%;"
               onclick="gotoSeat('${TimeTableLists.mstart }','${mname }','${selectCn}','${selectRg}','${currentDate}','${TimeTableLists.cinema }','${TimeTableLists.m_runtime }','${TimeTableLists.t_premium } ')">
               <b>${TimeTableLists.mstart }</b> (${TimeTableLists.m_runtime }분) | <b>${mname }</b> ${TimeTableLists.t_premium } 
               (${TimeTableLists.cinema }관) <br>
               총&nbsp;${TimeTableLists.t_seat-TimeTableLists.bookingSeat }&nbsp;/&nbsp;${TimeTableLists.t_seat }&nbsp;석
            </button><br><br>
         </c:forEach>
         <!-- 인디영화 -->
         <c:forEach var="IndeTimeTableLists" items="${IndeTimeTableLists }">
            <button width="50px" type="button" class="btn btn-default"  style="width:100%;"
               onclick="gotoSeat('${IndeTimeTableLists.mstart }','${mname }','${selectCn}','${selectRg}','${currentDate}','${IndeTimeTableLists.cinema }','${IndeTimeTableLists.m_runtime }','${IndeTimeTableLists.t_premium } ')">
               <b>${IndeTimeTableLists.mstart }</b> (${IndeTimeTableLists.m_runtime }분) | <b>${mname }</b> ${IndeTimeTableLists.t_premium } 
               (${IndeTimeTableLists.cinema }관) <br>
               총 ${IndeTimeTableLists.t_seat } / ${IndeTimeTableLists.t_seat-IndeTimeTableLists.bookingSeat }석
            </button><br><br>
         </c:forEach>
      </td>
      <tr>
</table>


<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>