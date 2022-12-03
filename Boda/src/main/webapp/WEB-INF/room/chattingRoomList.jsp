<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>
<!-- modal -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/bootstrap/css/bootstrap.css">	

<script type="text/javascript">

   var chatlist = [];

    $('document').ready(function(){
       $('#creRoom').click(function(){
          //alert(1);
          var read_mno = $('#selectedFr').val();
          var room_no;
         
         //창 크기 지정
         var width = 550;
         var height = 550;
         
         //pc화면기준 가운데 정렬
         var left = (window.screen.width / 2) - (width/2);
         var top = (window.screen.height / 4);
         
         //윈도우 속성 지정
         var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=no, titlebar=yes, location=yes, titlebar=yes';
         
          //child form
         //parent form
          window.name = "chattingList";
         
       
         $.ajax({
            type : 'POST',
            url : 'getRoom_no.room',
            dataType : 'json',
            data : {
               read_mno : read_mno
            },
            success : function(data){
               room_no = data;
               //alert(read_mno +"/"+room_no);
               
               //연결하고싶은url
                var path= '<%=request.getContextPath()%>/getChattingRoom.chat?read_mno='+read_mno+'&room_no='+room_no;
         
               //등록된 url 및 window 속성 기준으로 팝업창을 연다.
               var pop = window.open(path, "chatting room", windowStatus);
               pop.focus();
            },
            error : function(){
               console.log('오류');
               return false;
            }
         });
       });//creRoom

       $('#cloRoom').click(function(){
          location.reload(true);
       });

    });//document
    
function gotochat(room_no,send_mno){
   /*  
       var room_no = $('input[name="room_no"]').val();
       var read_mno = $('input[name="read_mno"]').val();
       var send_mno = $('input[name="send_mno"]').val();
    */
      //alert("gotochat:"+room_no+"/"+read_mno);
      //창 크기 지정
      var width = 550;
      var height = 550;
      
      //pc화면기준 가운데 정렬
      var left = (window.screen.width / 2) - (width/2);
      var top = (window.screen.height / 4);
      
      //윈도우 속성 지정
      var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=no, titlebar=yes, location=yes, titlebar=yes';
      
       //연결하고싶은url
       var path= '<%=request.getContextPath()%>/getChattingRoom.chat?room_no='+room_no+'&send_mno='+send_mno;
   
       //child form
      //parent form
       window.name = "chattingList";
      //등록된 url 및 window 속성 기준으로 팝업창을 연다.
      var pop = window.open(path, "chatting room", windowStatus);
      pop.focus();
}

</script>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/회원메시지.png" style="width:350px; height:100px"><br>
          </div>
        </div>
      </div>
</div>  
<div class="container" align="center"> 
           <!--  chatting room list start -->
           <div style="margin-top:50px; width:80%; align-content: center; text-align:center;">
                   <div class="card-body">
                       <div class="table-responsive">
                           <table class="table table-hover m-b-0 without-header">
                               <tbody>
                               
                               <!-- roomlist == 0 -->
                                <c:if test="${fn:length(roomlist) == 0 }">
                                   <tr>
                               		<th width="20%">고객명</th>
                               		<th width="50%">내용</th>
                               		<th width="30%">시각</th>
                              	   </tr>
                                   <tr>
                                      <td colspan="3" height="100px"><h6 style="margin-top:30px;"> 채팅방이 존재하지 않습니다 </h6></td>
                                   </tr>
                                </c:if>
                                <!-- roomlist != 0 -->
                                <c:if test="${fn:length(roomlist) > 0 }">
                                     <tr>
	                               		<th width="20%">고객명</th>
	                               		<th width="50%" colspan="2">내용</th>
	                               		<th width="30%">시각</th>
	                              	   </tr>
                                   <c:forEach var="rlist" items="${roomlist }">
                                      <tr>
                                            <c:if test="${rlist.m1_name eq loginInfo.name}">
                                               <td width="20%" onclick="gotochat('${rlist.room_no}','${rlist.read_mno}')">
                                               <div class="d-inline-block align-middle">
                                                     <div class="d-inline-block">
                                                         <h6>${rlist.m2_name}</h6>
                                                     </div>
                                              </div>
                                              </td>
                                              <td width="40%" onclick="gotochat('${rlist.room_no}','${rlist.read_mno}')">
                                               <div class="d-inline-block align-middle">
                                                     <div class="d-inline-block">
                                                         <p class="text-muted f-w-700">
                                                         ${rlist.content } 
	                                                    </p>
                                                     </div>
                                              </div>
                                              </td>
                                              <td width="10%" onclick="gotochat('${rlist.room_no}','${rlist.read_mno}')">
                                              		<c:if test="${rlist.mno1_lastvisit < rlist.time}">
                                                       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
  														<path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
													   </svg>
												   
                                                    </c:if>
                                              </td>
                                              <td width="30%" class="text-right" onclick="gotochat('${rlist.room_no}','${rlist.read_mno}'">
                                                     <p class="text-muted m-b-0" style="text-align:right;" >${rlist.time} </p>
                                              </td>
                                             
                                           </c:if>
                                          
                                           <c:if test="${rlist.m1_name ne loginInfo.name}">
                                              <td width="20%" onclick="gotochat('${rlist.room_no}','${rlist.read_mno}')">
                                               <div class="d-inline-block align-middle">
                                                     <div class="d-inline-block">
                                                         <h6>${rlist.m1_name}</h6>
                                                     </div>
                                              </div>
                                              </td>
                                              <td width="40%" onclick="gotochat('${rlist.room_no}','${rlist.read_mno}')">
                                               <div class="d-inline-block align-middle">
                                                     <div class="d-inline-block">
                                                         <p class="text-muted f-w-700">
                                                         ${rlist.content } 
                                                         </p>
                                                     </div>
                                              </div>
                                              </td>
                                              <td width="10%">
                                                  <c:if test="${rlist.mno2_lastvisit < rlist.time}">
                                                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
														<path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
											  		</svg>
                                                  </c:if>
                                              </td>
                                              <td width="30%" class="text-right" onclick="gotochat('${rlist.room_no}','${rlist.read_mno}'">
                                                     <p class="text-muted m-b-0" style="text-align:right;">${rlist.time} </p>
                                              </td>
                                           </c:if>
                                      </tr>
                                   </c:forEach>
                                 </c:if>
                                   
                               </tbody>
                           </table>
                       </div>
                   </div>
               </div>
           </div>
 </div> 
<!--upload preview end -->								

<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>
