<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
	function todayClose(){
		 window.close();
		
	}
</script>

<meta charset="UTF-8">
<title>Boda 헌혈 이벤트</title>
</head>
<body>
<img src="<%=request.getContextPath()%>/resources/event_Image/헌혈.png" width="600">
<center>
<input type="button" value="닫기" onclick="todayClose()">
</center>
</body>
</html>