<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<!-- 자바로 좌석배열 작성한 후 c:Set 설정 --> 
<%
response.setCharacterEncoding("UTF-8");

   String[] col = {"a","b","c","d","e","f","g","h","i","j"}; //좌석 열 
   int[] row = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
   
   String[] p_kind = {"person_a","person_s","person_o"}; //select name=person
   String[] p = {"성인","청소년","우대"}; //kind of person

%>
<c:set var="col" value="<%=col %>"/>
<c:set var="crow" value="<%=row %>"/>
<c:set var="p_kind" value="<%=p_kind %>"/>
<c:set var="p" value="<%=p %>"/>


<script type="text/javascript">
   
   var seatNo = Array();
   var seatCol = ['a','b','c','d','e','f','g','h','i','j'];
   var seatRow = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
   
   var checkedSeat = Array();
   
   for(var i=0;i<seatRow.length;i++){
      for(var j=0;j<seatCol.length;j++){
         seatNo.push(seatCol[j]+seatRow[i]);
      }
   }
   //document.write(seatNo); //a1~j15 이름부여
   //document.write(seatNo.length); //150
   
   var person;

   function personCheck(){
      //alert(1);
      var a = parseInt(document.person.adult.value);
      var s = parseInt(document.person.stud.value);
      var o = parseInt(document.person.old.value);
      person = parseInt(a)+parseInt(s)+parseInt(o);
      /* 
      alert(a + "/" + s + "/" + o);
      alert(person);
       */
      if(person>5){
         alert("한 아이디로 예약 가능한 관람인원은 최대 5명까지 입니다");
         return false;
      }
   }
   
   function seatCheck(sc){
     
      var a = document.person.adult.value;
      var s = document.person.stud.value;
      var o = document.person.old.value;
      person = parseInt(a)+parseInt(s)+parseInt(o);
      
      //alert(sc);
      for(var i=0;i<checkedSeat.length;i++){
         if(sc==checkedSeat[i]){
            alert('같은 좌석은 중복으로 선택 불가합니다');
            checkedSeat.pop();
            chekcedSeat[i].checked=false;
            return false;
         }
      }
      
      checkedSeat.push(sc);
      //alert(checkedSeat.length);
      
      if(checkedSeat.length>person){
         alert('관람 인원에 맞게 자리를 지정해주세요');
         checkedSeat.pop();
         return false;
      }
      else if(person==0){
         alert('관람 인원을 먼저 지정해주세요');
         checkedSeat.pop();
         return false;
      }
      
   }
   
   function check(num,theater,cinema,day,mstart,mname,m_runtime,selectRg,scode,premium){ //예약되어있는 좌석인지 확인필요, 확인 후 예약창으로 

      var adult = document.person.adult.value;
      var stud = document.person.stud.value;
      var old = document.person.old.value;
      person = parseInt(adult)+parseInt(stud)+parseInt(old);
      
      //alert(checkedSeat);
       
      //alert(checkedSeat.length);
       
       if(checkedSeat.length < person){
          alert('관람 인원에 맞게 자리를 지정해주세요');
          for(var j=0;j<checkedSeat.length;j++){
            // checkedSeat.pop();
            chekcedSeat.splice(0,chekcedSeat.length-1);
             chekcedSeat[j].checked=false;
             return false;
          }
          
          return false;
       }
       
      location.href="seat.se?checkedSeat="+checkedSeat
          +"&person="+person+"&adult="+adult+"&stud="+stud+"&old="+old
            +"&num="+num+"&theater="+theater+"&cinema="+cinema+"&day="+day
            +"&mstart="+mstart+"&mname="+mname+"&m_runtime="+m_runtime
            +"&selectRg="+selectRg+"&scode="+scode+"&premium="+premium;
            
   }
   
</script>
<style>
   .theme1 {border:0px; height:20px; background: linear-gradient(to left, red, red);}  
</style>

<body>

   <form name="person" align="center">
   <!-- 관람인원 선택하기 -->
   성인 :
      <select class="seat_person_select" name="adult" onchange="personCheck()">
            <option value=0>선택</option>
         <c:forEach var="i" begin="1" end="5"> 
            <option value=${i }>${i }</option>
         </c:forEach>
      </select>
   청소년 :
      <select class="seat_person_select" name="stud" onchange="personCheck()">
            <option value=0>선택</option>
         <c:forEach var="i" begin="1" end="5"> 
            <option value=${i }>${i }</option>
         </c:forEach>
      </select>
   우대 : 
      <select class="seat_person_select" name="old" onchange="personCheck()">
            <option value=0>선택</option>
         <c:forEach var="i" begin="1" end="5"> 
            <option value=${i }>${i }</option>
         </c:forEach>
      </select>
   <input type="reset" value="재설정" class="btn btn-default">
   
   </form>
   <br>
      <table width=50% align="center">
      <tr>
         <td colspan=3>
          <hr class="theme1 center" width=100%>
       </td>
    </tr>
    <tr>
      <td width=20%><img width="30" src="<%=request.getContextPath() %>/resources/images/chu.png"></td>
      <td width=60% align="center">스크린( ${premium } )</td>
      <td width=20% align="right"><img width="30" src="<%=request.getContextPath() %>/resources/images/chu.png"></td>
    </tr>
   </table>
   <br>
<!-- 관람 인원 수만큼 체크할 수 있게 지정하기 seatArr -->
<form name="seat" align="center" >

<input type="hidden" name="timeTableRecord" value="${timeTableRecord }">
<input type="hidden" name="selectRg" value="${selectRg }">
<fmt:parseNumber var="seatRow" value="${scode/10 }"/>

<%-- ${snumber } --%>
<br>
   <table width=40% align="center">
      <tr>
         <td></td>
         <c:forEach var="r" begin="1" end="${seatRow }" step="1">
            <th><p style="margin-bottom:10px; margin-top:10px; font-size: 20px;">${r }</p></th>
         </c:forEach>
      </tr>
      <c:forEach var="col" items="${col }">
         <tr>
            <th><p style="margin-right:10px; padding-top:13px; font-size: 20px;">${col }</p></th>
            
            <c:forEach var="row" begin="1" end="${seatRow }" step="1">
               <td>
               <c:set var="colrow" value="${col}${row }/"/>
               <input type="checkbox" name="seat" value="${col}${row }" style="width:30px;"
                class="btn btn-default seat_btn" onclick="return seatCheck('${col}${row }')" 
                  <c:if test="${fn:contains(snumber, colrow) }">
                     disabled
                  </c:if>
               >
               </td>
            </c:forEach>
         </tr>
      </c:forEach>
   </table>


<br>
<input type="button" value="좌석 선택" class="btn btn-default" 
   onclick="return check('${timeTableRecord.num }','${timeTableRecord.theater }','${timeTableRecord.cinema }',
      '${timeTableRecord.day }','${timeTableRecord.mstart }','${timeTableRecord.mname }',
      '${timeTableRecord.m_runtime }','${selectRg }','${scode }','${premium }')">
</form>
   
</body>

<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>