<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
<head>
<meta charset="UTF-8">
<title>top</title>

<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	padding-top: 20px;
}

header {
	
	background-color: #0E185F;
	
	font-family: 'Nanum Gothic', sans-serif;
	text-align: left;
}

footer {
	font-family: 'Nanum Gothic', sans-serif;
	text-align: center;
}

ul.nav {
	background-color: rgba(201, 201, 201, .5);
	padding: 10px;
	border-radius: 10px;
}

footer {
	border: 1px dotted blue;
}

.topcontainer {
	background-color: #0E185F;
	text-align: left;
	border-radius: 6px;
	padding-left:30px;
	margin-top: 10px;
	margin-bottom: 10px;
	width:100%
}

.imgpadding{	
	margin-right:12px;
	margin-left:7px;
}

.imgpadding1{
	margin-right:15px;
}

.margintoplogo{
	margin-top:80px;
}

.margintopuser{
	padding-bottom:10px;
}

.loginperson_font{
	font-size:15px;
	color:#FFFFFF;
}
.clearfix {
	width: 100%;
}
.f_middle{
	
}
</style>

</head>

<script>
	function checkLogin(loginId){
		
		alert(loginId);
		
		if(loginId == ""){
			location.href="login.bd";
		}
		else if(loginId=='admin'){
			location.href="movie.look"; /* 관리자페이지로 넘어가게 할 에정입니다 */
		}
		else{
			location.href="myBodapage.bd"; /* 마이페이지로 넘어가게 할 예정입니다 */
		}
	}
	
	function gotologout(){
		location.href="logout.bd";
	}
</script>
${loginInfo.id }
<table align="center" width="70%">
	<tr>
		<td align="center">
			<div class="topcontainer" style="height:200;">
				<!--좌측 상단 로고이미지 -->
				<img onclick="location.href='movie.look'"
					src="<%=request.getContextPath()%>/resources/Home_Image/logo1.jfif"
					width="200px">
						
					<div class="float_r margintoplogo">
						<!-- ~님 반갑습니다 -->
						<c:if test="${loginInfo.id ne null}">
							<p><font class="loginperson_font">${loginInfo.id }님 반갑습니다 </font> </p>
						</c:if>
						<!-- 로그인혹은마이페이지 -->
						<img src="<%=request.getContextPath()%>/resources/images/userIcon.png" 
							width=50px height=48px class="imgpadding1" onclick="checkLogin('${loginInfo.id}')">
						<!-- 고객센터페이지 -->
						<img src="<%=request.getContextPath()%>/resources/images/centerIcon.png" 
							width=47px height=47px class="imgpadding" onclick="">
						<!-- 로그아웃처리 -->
						<img src="<%=request.getContextPath()%>/resources/images/logoutIcon.png" 
							width=50px height=50px class="imgpadding" onclick="gotologout()">
					</div>
			</div> <!-- topcontainer div -->
		</td>
	</tr>
	<tr>
		<td>
			<!-- 관리자네비게이션 -->
			<c:if test="${loginInfo.id eq 'admin' }">
			<div class="clearfix">
				<ul class="nav nav-tabs nav-justified">
					<li class="active"><a href="">관리자</a></li>
					<li><a href="selectMovie.look">영화</a></li>
					<li><a href="admin_list.th">극장</a></li><!-- 극장목록으로이동 -->
					<li><a href="timeList.th">상영시간표</a></li>
					<li><a href="">예매</a></li>
					<li><a href="store_ticket.st">스토어</a></li>
					<li><a href="">고객센터</a></li>
					<li><a href="">이벤트-혜택</a></li>
				</ul>
			</div>
			</c:if>
			
			<!-- 사용자네비게이션 -->
			<c:if test="${loginInfo.id ne 'admin' }">
			<div class="clearfix">
				<ul class="nav nav-tabs nav-justified">
					<li class="active"><a href="movie.look">영화</a></li>
					<li><a href="list.th">극장</a></li>
					<li><a href="booking.bk">빠른예매</a></li>
					<li><a href="store_ticket.st">스토어</a></li>
					<li><a href="">이벤트</a></li>
					<li><a href="">혜택</a></li>
				</ul>
			</div>
			</c:if>
		</td>
	</tr>
</table>
<br><br>
<!-- 템플릿 적용 -->

<head>
    <meta charset="utf-8">
    <title>Bootswatch: Simplex</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Global Site Tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23019901-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'UA-23019901-1');
    </script>
  </head>
  <body>
    <div class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
      <div class="container">
        <a href="../" class="navbar-brand">Boda</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" id="themes">Themes</a>
              <div class="dropdown-menu" aria-labelledby="themes">
                <a class="dropdown-item" href="../default/">Default</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="../cerulean/">Cerulean</a>
                <a class="dropdown-item" href="../cosmo/">Cosmo</a>
                <a class="dropdown-item" href="../cyborg/">Cyborg</a>
                <a class="dropdown-item" href="../darkly/">Darkly</a>
                <a class="dropdown-item" href="../flatly/">Flatly</a>
                <a class="dropdown-item" href="../journal/">Journal</a>
                <a class="dropdown-item" href="../litera/">Litera</a>
                <a class="dropdown-item" href="../lumen/">Lumen</a>
                <a class="dropdown-item" href="../lux/">Lux</a>
                <a class="dropdown-item" href="../materia/">Materia</a>
                <a class="dropdown-item" href="../minty/">Minty</a>
                <a class="dropdown-item" href="../morph/">Morph</a>
                <a class="dropdown-item" href="../pulse/">Pulse</a>
                <a class="dropdown-item" href="../quartz/">Quartz</a>
                <a class="dropdown-item" href="../sandstone/">Sandstone</a>
                <a class="dropdown-item" href="../simplex/">Simplex</a>
                <a class="dropdown-item" href="../sketchy/">Sketchy</a>
                <a class="dropdown-item" href="../slate/">Slate</a>
                <a class="dropdown-item" href="../solar/">Solar</a>
                <a class="dropdown-item" href="../spacelab/">Spacelab</a>
                <a class="dropdown-item" href="../superhero/">Superhero</a>
                <a class="dropdown-item" href="../united/">United</a>
                <a class="dropdown-item" href="../vapor/">Vapor</a>
                <a class="dropdown-item" href="../yeti/">Yeti</a>
                <a class="dropdown-item" href="../zephyr/">Zephyr</a>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../help/">Help</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="https://blog.bootswatch.com/">Blog</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" id="download">Simplex</a>
              <div class="dropdown-menu" aria-labelledby="download">
                <a class="dropdown-item" rel="noopener" target="_blank" href="https://jsfiddle.net/bootswatch/1uvdsae4/">Open in JSFiddle</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="../5/simplex/bootstrap.min.css" download>bootstrap.min.css</a>
                <a class="dropdown-item" href="../5/simplex/bootstrap.css" download>bootstrap.css</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="../5/simplex/_variables.scss" download>_variables.scss</a>
                <a class="dropdown-item" href="../5/simplex/_bootswatch.scss" download>_bootswatch.scss</a>
              </div>
            </li>
          </ul>
          <ul class="navbar-nav ms-md-auto">
            <li class="nav-item">
              <a target="_blank" rel="noopener" class="nav-link" href="https://github.com/thomaspark/bootswatch/"><i class="bi bi-github"></i> Login</a>
            </li>
            <li class="nav-item">
              <a target="_blank" rel="noopener" class="nav-link" href="https://twitter.com/bootswatch"><i class="bi bi-twitter"></i> 고객센터</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    
    <!-- Navbar -->
      <div class="bs-docs-section clearfix">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="page-header">
              <h1 id="navbars">Boda</h1>
            </div>

            

            <div class="bs-component">
              <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">
                  <a class="navbar-brand" href="#">Menu</a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>

                  <div class="collapse navbar-collapse" id="navbarColor02">
                    <ul class="navbar-nav me-auto">
                      <li class="nav-item">
                        <a class="nav-link active" href="#">영화
                          <span class="visually-hidden">(current)</span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="list.th">극장</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">빠른예매</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">스토어</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">이벤트</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">혜택</a>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href="#">Action</a>
                          <a class="dropdown-item" href="#">Another action</a>
                          <a class="dropdown-item" href="#">Something else here</a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                      </li>
                    </ul>
                    <form class="d-flex">
                      <input class="form-control me-sm-2" type="text" placeholder="Search">
                      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                    </form>
                  </div>
                </div>
              </nav>
            </div>

            

          </div>
        </div>
     	</div>
      </div>
