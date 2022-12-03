<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- store_beverage.jsp -->
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>
<br><br><br>
<%@ include file="/WEB-INF/common/common.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<style>
   body { padding-top: 20px; }
   a {
      text-decoration : none; 
      color: black;
   }
</style>
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

     <div class="row">
    <c:forEach var="s_beverage" items="${s_beverage_lists}">
    <div class="col-xs-12 col-sm-6 col-md-3 ">
      <div class="thumbnail">
      <input type="hidden" name="s_num" value="${s_beverage.s_num}">
      <input type="hidden" name="point" value="${s_beverage.s_point}">
      <input type="hidden" name="order" value="">
        <a href="detail.st?s_num=${s_beverage.s_num}"><img src="<%=request.getContextPath() %>/resources/images/${s_beverage.s_image}" width="200" alt="...">
          <div class="caption">
            <h3>${s_beverage.s_name}</h3><br>
            <p>${s_beverage.s_content}</p></a>
            <c:if test="${loginInfo.id=='admin'}">
               <input type="button" class="btn btn-light" role="button" value="수정" role="button" onclick="location.href='store_update_form.ad?s_num=${s_beverage.s_num}'">&nbsp;
               <input type="button" class="btn btn-primary" role="button" value="삭제" role="button" onclick="location.href='store_delete.ad?s_num=${s_beverage.s_num}'">
            </c:if>
        </div>
      </div>
    </div> 
    </c:forEach>
 </div>  
</div> <!-- container 끝 -->
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>