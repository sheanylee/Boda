<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>
<style>

   .bgcolor {
      background-color:#C90000;
   }
   .fcw {
      color:#FFFFFF;
   }

</style>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
   
   function ticketCheck(tnum,scode,person,mname,theater,cinema,
                  day,mstart,checkedSeat,premium,point,r_price, old, stud){
      
      var ticket = document.getElementById('exampleSelect1').value;
      
      var ticketArr = ticket.split(","); 
      var usingticket = ticketArr[0];    //clicked ticket name
      var ticketAllCount = ticketArr[1]; //total of clicked tickek
      
      var usingticketCount = document.getElementById('usingticketCount').value;
      
     // alert(usingticket+"/"+ticketAllCount+"/"+usingticketCount+"/"+ person + "/" + premium);
      
      if(parseInt(ticketAllCount) < parseInt(usingticketCount)){
         alert('가지고 계신 관람권의 수를 초과하였습니다');
         return;
      }
      else if(person < usingticketCount){
         alert('관람권의 수가 관람인원 수를 초과하였습니다');
         return;
      }
      
      if(premium=='4DX' && usingticket=='일반 관람권'){
         alert('해당 관람권으로는 4DX 영화를 관람하실 수 없습니다');
         return;
      }
      else if(premium=='4DX' && usingticket=='골드 관람권'){
         alert('해당 관람권으로는 4DX 영화를 관람하실 수 없습니다');
         return;
      }
      
      if(premium=='recline' && usingticket=='일반 관람권'){
         alert('해당 관람권으로는 recline 영화를 관람하실 수 없습니다');
         return;
      }
      else if(premium=='recline' && usingticket=='골드 관람권'){
         alert('해당 관람권으로는 recline 영화를 관람하실 수 없습니다');
         return;
      }
      
      if(premium=='screenX' && usingticket=='일반 관람권'){
         alert('해당 관람권으로는 screenX 영화를 관람하실 수 없습니다');
         return;
      }
      
      location.href="ticket.bk?usingticket="+usingticket
                  +"&usingticketCount="+usingticketCount
                  +"&tnum="+tnum+"&scode="+scode+"&person="+person
                  +"&mname="+mname+"&theater="+theater+"&cinema="+cinema
                  +"&day="+day+"&mstart="+mstart+"&checkedSeat="+checkedSeat
                  +"&premium="+premium+"&point="+point+"&r_price="+r_price
                  +"&old="+old+"&stud="+stud;
   }
   

   function pointcheck(tnum,scode,person,mname,theater,cinema,day,mstart,
                  checkedSeat,premium,point,r_price,
                  usingticket,usingticketCount,ticketDiscount,
                  totalprice, old, stud){

      var r_point = parseInt(document.getElementById('pointZero').value);//usingpoint
    //  alert(point)
    //  alert(r_point);
     //  alert(totalprice);//r_price-discountTicket
       
      if(isNaN(r_point)){
         alert('isNaN(r_point)');
         return false;
      }
      
       if(isNaN(point)){
          alert('소유하고 계신 포인트만큼 사용 가능합니다');
         return false;
       }
       
      if(parseInt(point) < parseInt(r_point)){
         alert('소유하고 계신 포인트만큼 사용 가능합니다');
         return false;
      } 
      
      if(isNaN(totalprice)){
         alert(isNaN(totalprice));
         return false;
      }
      if(totalprice < r_point){
         alert('사용 포인트가 총 결제금액을 초과하였습니다');
         return false;
      }
      
      location.href="point.bk?"
                  +"usingticket="+usingticket+"&usingticketCount="+usingticketCount
                  +"&ticketDiscount="+ticketDiscount+"&totalprice="+totalprice+"&rr_point="+r_point
                  +"&tnum="+tnum+"&scode="+scode+"&person="+person
                  +"&mname="+mname+"&theater="+theater+"&cinema="+cinema
                  +"&day="+day+"&mstart="+mstart+"&checkedSeat="+checkedSeat
                  +"&premium="+premium+"&point="+point+"&r_price="+r_price
                  +"&old="+old+"&stud="+stud;
   }
   

</script>

<body>
   
<div class="container center">
<div class="row mb-5">
<div class="col-lg-6">

<br><br> 
     <div class="card border-primary mb-3" style="max-width: 80%; height:150px;">
                <div class="card-header">BODA 관람권</div>
                <div class="row" style="margin-top:30px; margin-bottom:10px;" >
                   
                   <div class="col-lg-6">
                       <select class="form-select" id="exampleSelect1" name="ticket" style="margin-left:40px;">
                       <option value=""> 관람권을 선택하세요 </option>
                            <c:forEach var="ticket" items="${ticketList }">
                                <option value="${ticket.t_spec },${ticket.t_order }" <c:if test="${usingticket eq ticket.t_spec}">selected</c:if>> 
                                   ${ticket.t_spec } (${ticket.t_order }장)
                                </option>
                            </c:forEach>
                     </select>
                  </div>
                  <div class="col-lg-5">
                   <div class="input-group mb-1">
                         <input type="text" class="form-control" name="usingticketCount" value="${usingticketCount }" id="usingticketCount"
                            placeholder="사용수량" style="margin-left:30px;">
                         <input class="btn btn-primary" type="button"
                              value="사용" 
                              onclick="ticketCheck('${tnum }','${scode }','${person}','${mname }',
                                          '${theater }','${cinema }','${day }','${mstart }',
                                          '${checkedSeat }','${premium }','${point }','${r_price }',
                                          '${old }','${stud }')" >
                   </div>
                 </div>
              </div>
              관람권 사용 시 청소년/우대 중복 할인 불가합니다<br>
       </div>   

<br><br> 
   
      <div class="card border-primary mb-3" style="max-width: 80%; height:150px;">
           <div class="card-header">BODA 포인트</div>
           <div class="input-group mb-1" style="max-width: 90%;">
               <input type="text" class="form-control" value="0" name="r_point" id="pointZero"
                  style="margin-left:30px; margin-top:10px; margin-bottom:10px;" 
                  placeholder="포인트 입력"><!-- 사용할포인트 -->
               
                  <input class="btn btn-primary" type="submit"
                     value="사용" style="margin-top:10px; margin-bottom:10px;" 
                     onclick="return pointcheck('${tnum }','${scode }','${person}','${mname }',
                                          '${theater }','${cinema }','${day }','${mstart }',
                                          '${checkedSeat }','${premium }','${point }','${r_price }',
                                          '${usingticket }','${usingticketCount }','${ticketDiscount }',
                                          '${(r_price*person)-ticketDiscount}','${old }','${stud }')" >
           </div>
             <c:if test="${point eq 0}">총 0 포인트 사용 가능</c:if>
             <c:if test="${point ne 0}">총 ${point } 포인트 사용 가능</c:if>
       </div>   
<br>   
         
       
<br>
</div><!--col-lg-6  -->

<div class="col-lg-6">
   
   <form action="bookFinal.bk" method="post" align="center" name="pay">
      <input type="hidden" name="r_userId" value="${loginInfo.id }"><!-- bbean -->
      <input type="hidden" name="r_price" value="${r_price }"><!-- 결제금액 -->
      <input type="hidden" name="r_mname" value="${mname}">
      <input type="hidden" name="r_theater" value="${theater}">
      <input type="hidden" name="r_cinema" value="${cinema }">
      <input type="hidden" name="r_day" value="${day}">
      <input type="hidden" name="r_mstart" value="${mstart}">
      <input type="hidden" name="r_sno" value="${checkedSeat }">
      <input type="hidden" name="r_point" value="${r_point }"><!-- bbean -->
      
      <input type="hidden" name="tnum" value="${tnum }">
      <input type="hidden" name="scode" value="${scode }">
      <input type="hidden" name="person" value="${person }">
      <input type="hidden" name="point" value="${point }">
      <input type="hidden" name="totalPrice" value="${(r_price*person)-r_point }">
      <input type="hidden" name="usingticket" value="${usingticket }">
      <input type="hidden" name="usingticketCount" value="${usingticketCount }">

          <!-- class="table table-hover -->
      <div class="card border-primary mb-3" style="max-width: 100%;">
             <div class="card-header bgcolor fcw"><b>빠른 예매</b></div>
          <div class="card-body">
             <div class="card-text">
               <table class="table table-hover">
                  <tr>
                     <td width=30%>영화제목</td>
                     <th width=70%> ${mname} (${premium })</th>
                  </tr>
                  <tr>
                     <td>상영관</td>
                     <th> ${theater}/${cinema }관 | ${checkedSeat }석</th>
                  </tr>
                  <tr>
                     <td>상영일자</td>
                     <th>${day} | ${mstart}</th>
                  </tr>
                  <tr>   
                     <td>금액</td>
                     <td><b>${r_price*person } (${person }명)</b>
                        <c:if test="${stud ne 0 || stud ne null}"> | 청소년: ${stud }</c:if>
                         <c:if test="${old ne 0 || old ne null}"> | 우대 : ${old } </c:if>
                     </td>
                  </tr>
                  <tr>   
                     <td>관람권 할인 금액</td>
                     <th>
                        <c:if test="${ticketDiscount eq 0 }"> - </c:if>
                        <c:if test="${ticketDiscount ne 0 }"> -${ticketDiscount }</c:if>
                     </th>
                  </tr>
                  <tr>
                     <td>청소년/우대 할인 금액</td>
                     <th>
                        <c:if test="${pp eq 0 }"> - </c:if>
                        <c:if test="${pp ne 0 }"> -${pp }   </c:if>
                     </th>
                  </tr>
                  <tr>   
                     <td>포인트 할인 금액</td>
                     <th>
                        <c:if test="${r_point eq 0 }"> - </c:if>
                        <c:if test="${r_point ne 0 }"> -${r_point }</c:if>
                     </th>
                  </tr>
                  <tr>
                     <td>최종결제금액</td>
                     
                     <th> ${(r_price*person)-ticketDiscount-pp-r_point } 원</th>
                  </tr>
               </table>
               
      <div class="card border-primary mb-3" style="max-width: 100%;">
                <div class="card-header">결제수단 선택</div>
               <fieldset class="form-group" style="padding-left:30px; padding-right:30px;">
                  <div class="form-check" >
                    <input class="form-check-input" type="radio" name="r_paying" value="credit" checked>신용카드
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="r_paying" value="phone">핸드폰   
                  </div>
                  </fieldset>
      </div>   <!-- card border-primary mb-3 -->            

      <input type="submit" value="예매하기" class="btn btn-outline-primary">
</div><!-- col-lg-6 -->
         </div><!-- class="card-body" -->
      </div><!-- class="card border-primary mb-3" -->
   </form>
</div>
   
      
</div><!-- row mb-5 -->
</div><!-- container -->

</body>

<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>