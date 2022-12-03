<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<style>
   .card{
      width:400px;
      margin: auto;
   }
   .form-select{
      width: fit-content;
      block-size: fit-content;
      display: inline-block;
   }
   .form-control{
      width: fit-content;
      block-size: fit-content;
      display: inline-block;
   }
   a{
      text-decoration: none;
   }
   .text-white{
      text-align:center;
      width: 120px;
      height:50px;
      padding-top: 10px;
   }
   td{
      padding-left: 20px;
      padding-bottom: 10px;
   }
   .err{
      font-size: 10px;
      color: red;
      font-weight: bolder;
   }
</style>

<c:set var="path" value="<%=request.getContextPath() %>"/>
<script type="text/javascript" src="${path }/resources/js/jquery.js" ></script>
<script type="text/javascript">
   $(document).ready(function(){
      //alert(1);
      $('#theater').change(function(){
         //alert($('select[name="theater"]').val());
         var theater = $('select[name="theater"]').val();
         location.href="timetableInsert.th?theater="+theater;
      });
      
      var checked=false;
      
      $('#dupl').click(function(){
         var time = $('select[name="mstart"]').val();
         var day = $('input[name="day"]').val();         
         var cinema = $('select[name="cinema"]').val();
         var theater = $('select[name="theater"]').val();
         //alert(2);
         //alert($('input[name="t_name"]').val());
         //alert(time+"/"+day+"/"+cinema+"/"+theater);
         if(time == ""){
            alert('시간을 선택하세요');
            return;
         }
         if(day == ""){
            alert('날짜를 선택하세요');
            return;
         }
         if(cinema == ""){
            alert('상영관명을 선택하세요');
            return;
         }
         if(theater == ""){
            alert('영화관명을 선택하세요');
            return;
         }
         
         $.ajax({
            url: "timetableInsertCheck.th",
            data: {cinema:cinema, theater:theater,time:time,day:day},
            success: function(data){
               //alert(data);
               if($.trim(data)=="Y"){ //사용가능
                  $('#result').html("등록가능");
                  $('#result').css('color','blue');
                  $('#result').show();
                  checked = true;
               }
               else{ //중복
                  $('#result').html("이미 등록된 시간입니다.");
                  $('#result').css('color','red');
                  $('#result').show();
               }
               
            }
         });//ajax
         
      });//click
      
      $('#sub').click(function(){
         if(checked == false){
            alert("등록가능여부를 확인하세요.");
            return false;
         }
      });
      $('#day').change(function(){
         var theater=$('select[name="theater"]').val();
         var cinema=$('select[name="cinema"]').val();
         var day=$('input[name="day"]').val();
         
         location.href="timeselect.th?theater="+theater+"&cinema="+cinema+"&day="+day;
      });
      
   });//document
   
</script>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/상영스케줄 등록.png" style="margin-left:50%;width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>
<form:form action="timetableInsert.th" method="post" name="f" commandName="ttb">
   <table class="card mb-3">
      <tr>
         <th scope="row" class="card text-white bg-primary mb-3">영화관</th>
         <td>
         <select class="form-select" name="theater" id="theater">
            <option value="">선택하세요
            <c:forEach var="theaterBean" items="${tlists }">
               <option value="${theaterBean.t_theater }" <c:if test="${theaterBean.t_theater eq theater ||theaterBean.t_theater eq ttb.theater}">selected</c:if>>${theaterBean.t_theater  }
            </c:forEach>
         </select>
         <form:errors cssClass="err" path="theater"/>
         </td>
      </tr>
      <tr>
         <th scope="row" class="card text-white bg-primary mb-3">상영관</th>
         <td><select name="cinema" class="form-select" >
         <option value="">선택하세요
               <c:forEach var="theaterBean" items="${clists }">
                  <option value="${theaterBean.t_name}" <c:if test="${theaterBean.t_name eq ttb.cinema || theaterBean.t_name eq cinema}">selected</c:if>>${theaterBean.t_name}관
               </c:forEach>
         </select>
         <form:errors cssClass="err" path="cinema"/>
         </td>
      </tr>
      
      <tr>
         <th scope="row" class="card text-white bg-primary mb-3">날짜</th>
         <td><input type="date" class="form-control" name="day" id="day" value="${ttb.day }${day }">
         <form:errors cssClass="err" path="day"/>         
         </td>
      </tr>
      <tr>
         <th scope="row" class="card text-white bg-primary mb-3">시간</th>
         <td>
            <%
         String []Arr = {"08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00"};
         pageContext.setAttribute("Arr", Arr);
         %> <select class="form-select" name="mstart" id="mstart">
            <option value="">선택하세요
            <c:if test="${empty timelists }">
               <c:forEach var="time" items="${Arr}">
                  <option value="${time}" <c:if test="${time eq ttb.mstart}">selected</c:if>>${time}
               </c:forEach>   
            </c:if>
            
            <c:if test="${not empty timelists }">
               <c:forEach var="time" items="${Arr}">
                  <fmt:parseDate var="time" value="${time }" pattern="HH"/>
                  <fmt:formatDate var="time" value="${time }" pattern="HH"/>
                  <option value="${time}:00"<c:forEach var="timelists" items="${timelists }"> <c:if test="${time eq ttb.mstart}">selected</c:if> 
                     <c:if test="${time eq timelists.noinput1 || time eq timelists.mstart || time eq timelists.noinput2 ||timelists.mstart <= time && time <= timelists.noinput2}">disabled</c:if>
                     </c:forEach>
                  >${time}:00
               </c:forEach>      
            </c:if>
         </select>
         <input type="button" value="확인" id="dupl" class="btn btn-outline-primary"><br>
         <span id="result"></span>
         <form:errors cssClass="err" path="mstart"/>         
         </td>
      </tr>
      <tr>
         <th scope="row" class="card text-white bg-primary mb-3">영화</th>
         <td><select class="form-select" name="mname">
            <option value="">선택하세요
            <c:forEach var="movie" items="${mlists}">
               <c:set var="m_name" value="${movie.m_name}" /> 
               <option value="${movie.m_name}" <c:if test="${movie.m_name eq ttb.mname}">selected</c:if>>${fn:substring(m_name,0,10)}
            </c:forEach>
            <c:forEach var="inde" items="${indelists}">
               <option value="${inde.title}" <c:if test="${inde.title eq ttb.mname}">selected</c:if>>${inde.title}
            </c:forEach>
         </select>
         <form:errors cssClass="err" path="mname"/>         
         </td>
      </tr>

   </table>
   <br>
   <center>
   <input type="button" class="btn btn-outline-primary" value="목록보기" onclick="location.href='timeList.th?pageNumber=${pageNumber}'">
   <input type="submit" id="sub" class="btn btn-outline-primary" value="등록하기">
   </center>

</form:form>
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>