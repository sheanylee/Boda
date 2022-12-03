<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/Top&Bottom/top.jsp" %>

<style>
	.fcw{color:white;}
	.fcb{color:black;}
	.bgcolor{
		background-color:white;
	}
	.pc{
		margin:0,auto;
	}
	.hfs{
		font-size: 25px;
	}
	td{
		padding:50px;
	}
	.caemg{
		margin-left:120px;
	}
	.titlefs{
		font-size:25px;
	}
</style>
<script type="text/javascript">
	function gotoEvent(){

		location.href="event.et";
	}
</script>
<div class="container">
      <div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
           <img class="logo" src="<%=request.getContextPath() %>/resources/logo_image/이벤트.png" style="width:350px; height:100px"><br>
          </div>
        </div>
      </div>
</div>	
 <div class="container">
<div class="card text-white bg-primary mb-3 center" style="max-height: 50%;">
	<br><br><br>
	<p class="fcw hfs">이런 영화를 추천드려요!
	<br><br>
	<div class="container">
<!-- #1 -->
		<c:if test="${mb_aList != null }">
			<c:forEach var="mb_a" begin="0" end="0" items="${mb_aList }">
				<div class="caemg fcb card border-primary mb-3"  style="max-width: 80%;">
					<div class="titlefs fcb card-header">#1</div>
					<table>
					<tr>
						<td width=40%><img src="<%=request.getContextPath()%>/resources/movie_image/${mb_a.m_img }" width=100%></td>
						<td><p class="titlefs text-primary"><b>${mb_a.m_name }</b></p>
							감독 : ${mb_a.m_pd } | 장르 : ${mb_a.m_genre }<br>
							${mb_a.m_info }
						</td>
					</tr>
					</table>
					</div>
			
			</c:forEach> 
		</c:if>
		<c:if test="${imb_aList != null }">
			<c:forEach var="imb_a" begin="0" end="0" items="${imb_aList }">
				<div class="caemg fcb card border-primary mb-3"  style="max-width: 80%;">
					<div class="titlefs fcb card-header">#1</div>
				<table>
					<tr>
						<td width=40%><img src="<%=request.getContextPath()%>/resources/Independent_film/${imb_a.img }" width=100%></td>
						<td><p class="titlefs text-primary"><b>${imb_a.title }</b></p>
							감독 : ${imb_a.director } | 장르 : ${imb_a.genre }<br>
							${imb_a.synopsis }
						</td>
					</tr>
				</table>
				</div>
			</c:forEach> 
		</c:if>
		
<!-- #2 -->
		<c:if test="${mb_bList != null }">
			<c:forEach var="mb_b" begin="0" end="0" items="${mb_bList }">
				<div class="caemg fcb card border-primary mb-3"  style="max-width: 80%;">
					<div class="titlefs fcb card-header">#2</div>
				<table>
					<tr>
						<td  width=40%><img src="<%=request.getContextPath()%>/resources/movie_image/${mb_b.m_img }" width=100%></td>
						<td><p class="titlefs text-primary"><b>${mb_b.m_name }</b></p>
							감독 : ${mb_b.m_pd } | 장르 : ${mb_b.m_genre }<br>
							${mb_b.m_info }
						</td>
					</tr>
				</table>
				</div>
			</c:forEach> 
		</c:if>

<!-- #3 -->
		<c:if test="${mb_cList != null }">
			<c:forEach var="mb_c" begin="0" end="0" items="${mb_cList }">
			<div class="caemg fcb card border-primary mb-3"  style="max-width: 80%;">
					<div class="titlefs fcb card-header">#3</div>
				<table>
					<tr>
						<td  width=40%><img src="<%=request.getContextPath()%>/resources/movie_image/${mb_c.m_img }" width=100%></td>
						<td><p class="titlefs text-primary"><b>${mb_c.m_name }</b></p>
							감독 : ${mb_c.m_pd } | 장르 : ${mb_c.m_genre }<br>
							${mb_c.m_info }
						</td>
					</tr>
				</table>
				</div>
			</c:forEach> 
		</c:if>
		<c:if test="${imb_cList != null }">
			<c:forEach var="imb_c"  begin="0" end="0"  items="${imb_cList }">
			<div class="caemg fcb card border-primary mb-3"  style="max-width: 80%;">
					<div class="titlefs fcb card-header">#3</div>
				<table>
					<tr>
						<td  width=40%><img src="<%=request.getContextPath()%>/resources/Independent_film/${imb_c.img }" width=100%></td>
						<td><p class="titlefs text-primary"><b>${imb_c.title }</b></p>
							감독 : ${imb_c.director } | 장르 : ${imb_c.genre }<br>
							${imb_c.synopsis }
						</td>
					</tr>
				</table>
				</div>
			</c:forEach> 
		</c:if>
<!-- #4 -->
		<c:if test="${mb_dList != null }">
			 <c:forEach var="mb_d" begin="0" end="0" items="${mb_dList }">
			<div class="caemg fcb card border-primary mb-3"  style="max-width: 80%;">
					<div class="titlefs fcb card-header">#4</div>
				<table>
					<tr>
						<td  width=40%><img src="<%=request.getContextPath()%>/resources/movie_image/${mb_d.m_img }" width=100%></td>
						<td><p class="titlefs text-primary"><b>${mb_d.m_name }</b></p>
							감독 : ${mb_d.m_pd } | 장르 : ${mb_d.m_genre }<br>
							${mb_d.m_info }
						</td>
					</tr>
				</table>
				</div>
			</c:forEach> 
		</c:if>
<!-- #5 -->		
		<c:if test="${imb_eList != null }">
			<c:forEach var="imb_e" begin="1" end="1" items="${imb_eList }">
			<div class="caemg fcb card border-primary mb-3"  style="max-width: 80%;">
					<div class="titlefs fcb card-header">#5</div>
				<table>
					<tr>
						<td  width=40%><img src="<%=request.getContextPath()%>/resources/Independent_film/${imb_e.img }" width=100%></td>
						<td><p class="titlefs text-primary"><b>${imb_e.title }</b></p>
							감독 : ${imb_e.director } | 장르 : ${imb_e.genre }<br>
							${imb_e.synopsis }
						</td>
					</tr>
				</table>
				</div>
			</c:forEach> 
		</c:if>

		
	</div>
	<br><br>
	<center>
	    <button type="button" class="hfs bgcolor btn btn-outline-primary" 
	    	style="width:50%;" name="e2" onclick="gotoEvent()">
	  		  다른 이벤트 참여하기
	    </button>
	</center>
	<br><br><br>
</div>
 </div>
 
<%@ include file="/WEB-INF/Top&Bottom/bottom.jsp" %>