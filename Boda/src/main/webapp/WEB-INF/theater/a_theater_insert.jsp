<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>


<style>
   .card{
      width:600px;
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

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">
   var checked = false;
   $('document').ready(function(){
      //alert(1);
      $('#dupl').click(function(){
         var cinema = $('input[name="t_name"]').val();
         var theater = $('input[name="t_theater"]').val();
         //alert(2);
         //alert($('input[name="t_name"]').val());
         if(cinema == ""){
            alert('상영관명을 입력하세요');
            return;
         }
         if(theater == ""){
            alert('영화관명을 입력하세요');
            return;
         }
         
         $.ajax({
            url: "TheaterInsertCheck.th",
            data: {cinema:cinema, theater:theater},
            success: function(data){
               //alert(data);
               if($.trim(data)=="Y"){ //사용가능
                  $('#result').html("등록가능");
                  $('#result').css('color','blue');
                  $('#result').show();
                  checked = true;
               }
               else{ //중복
                  $('#result').html("이미 등록된 상영관입니다.");
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
      
      $('#t_name').keydown(function(){
         $('#result').css('display','none');
      })
      
      
   });//document

</script>



<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/영화관 등록하기.png" style="margin-left:40%;width:450px; height:110px"><br>
          </div>
        </div>
      </div>
</div>

<form:form commandName="theaterBean" action="insert.th" method="post" cssClass="f" enctype="multipart/form-data">
<input type="hidden" name="pageNumber" value="${pageNumber}">
<table class="card mb-3">
   <tr>
      <th scope="row" class="card text-white bg-primary mb-3">코드</th>
      <td><input type="text" class="form-control" placeholder="ex)s01" name="t_code" value="${theaterBean.t_code }">
      <form:errors cssClass="err" path="t_code"/>
      </td>
   </tr>
   <tr>
      <th scope="row" class="card text-white bg-primary mb-3">설립일</th>
      <td><input type="date" class="form-control" name="t_day" value="${theaterBean.t_day }">
      <form:errors cssClass="err" path="t_day"/>
      </td>
   </tr>
   <tr>
      <th scope="row" class="card text-white bg-primary mb-3">지역선택</th>
      <td>
      <%
      String[] Arr = {"서울","경기도","인천","강원도","충남","충북","대전","대구","부산","울산","경상남도","경북","전라남도","제주도","광주광역시"};
      %>
      <c:set var="region" value="<%=Arr %>"/>
      <select name="t_region" class="form-select">
         <c:forEach var="region" items="${region }">
            <option value="${region }"  <c:if test="${theaterBean.t_region eq region }">selected</c:if>>${region }
         </c:forEach>
      </select>
      <form:errors cssClass="err" path="t_region"/>
      </td>
   </tr>
   
   <tr>
      <th scope="row" class="card text-white bg-primary mb-3">시 / 구</th>
      <td><input type="text" class="form-control" placeholder="ex)강서구 or 부천시 소사구" name="t_gu" value="${theaterBean.t_gu }">
      <form:errors cssClass="err" path="t_gu"/>
      </td>
   </tr>
   <tr>
      <th scope="row" class="card text-white bg-primary mb-3">상세주소</th>
      <td><input type="text" class="form-control" placeholder="ex)자양동 9-4 몰오브케이 3층" name="t_address" value="${theaterBean.t_address }">
      <form:errors cssClass="err" path="t_address"/>
      </td>
   </tr>
   <tr>
      <th scope="row" class="card text-white bg-primary mb-3">위도/경도</th>
      <td><input type="text" class="form-control" placeholder="ex)37.642338, 127.0300198" name="t_location" value="${theaterBean.t_location }">
      <form:errors cssClass="err" path="t_location"/>
      </td>
   </tr>
   <tr>
      <th scope="row" class="card text-white bg-primary mb-3">영화관 이름</th>
      <td><input type="text" class="form-control" placeholder="ex)Boda강남" name="t_theater" value="${theaterBean.t_theater }">
      <!-- <input type="button" value="중복검사" id="check"> -->
      <form:errors cssClass="err" path="t_theater"/>
      <!-- <span id="msg"></span> -->
      </td>
   </tr>
   <tr>
      <th scope="row" class="card text-white bg-primary mb-3">이미지</th>
      <td><input type="file" class="form-control" name="upload" value="${theaterBean.t_img }">
      </td>
   </tr>
   <tr>
      <th scope="row" class="card text-white bg-primary mb-3">연락처</th>
      <td><input type="text" class="form-control" placeholder="ex)1544-1222" name="t_tel" value="${theaterBean.t_tel }">
      <form:errors cssClass="err" path="t_tel"/>
      </td>
   </tr>
   <tr>
      <th scope="row" class="card text-white bg-primary mb-3">주차여부</th>
      <td>
      <input type="radio" class="form-check-input" value="yes" name="t_parking" <c:if test="${theaterBean.t_parking eq 'yes' }">checked</c:if>>yes&nbsp;
      <input type="radio" class="form-check-input"  value="no" name="t_parking" <c:if test="${theaterBean.t_parking eq 'no' }">checked</c:if>>no
      <form:errors cssClass="err" path="t_parking"/>
      </td>
   </tr>
   <tr>
      <th scope="row" class="card text-white bg-primary mb-3">상영관</th>
      <td><input type="text" class="form-control" placeholder="숫자만 입력하세요" id="t_name" name="t_name" value="${theaterBean.t_name }">관
      <input type="button" value="확인" id="dupl" class="btn btn-outline-primary"><br>
      <span id="result"></span>
      <form:errors cssClass="err" path="t_name"/>
      </td>
   </tr>
   <tr>
      <th scope="row" class="card text-white bg-primary mb-3">좌석 수</th>
      <td><input type="text" class="form-control" placeholder="숫자만 입력하세요" name="t_seat" value="${theaterBean.t_seat }">
      <form:errors cssClass="err" path="t_seat"/>
      </td>
   </tr>
   <tr>
      <th scope="row" class="card text-white bg-primary mb-3">프리미엄</th>
      <td>
      <input type="radio" class="form-check-input" name="t_premium" value="2D" <c:if test="${theaterBean.t_premium eq '2D' }">checked</c:if>>2D&nbsp;
      <input type="radio" class="form-check-input" name="t_premium" value="4DX"  <c:if test="${theaterBean.t_premium eq '4DX' }">checked</c:if>>4DX&nbsp;
      <input type="radio" class="form-check-input" name="t_premium" value="screenX" <c:if test="${theaterBean.t_premium eq 'screenX' }">checked</c:if>>screenX&nbsp;
      <input type="radio" class="form-check-input" name="t_premium" value="recline" <c:if test="${theaterBean.t_premium eq 'recline' }">checked</c:if>>recline&nbsp;
      <form:errors cssClass="err" path="t_premium"/>
      </td>
   </tr>
</table><br>
<center>
   <input type="button" class="btn btn-outline-primary" value="목록보기" onclick="location.href='admin_list.th?pageNumber=${pageNumber}'">&nbsp;<input type="submit" id="sub" class="btn btn-outline-primary" value="등록하기">&nbsp;<input type="reset" class="btn btn-primary" value="지우기">
</center>
</form:form>

</body>

    <%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>