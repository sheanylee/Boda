<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/boda/mypage/mypage_top.jsp"%>
<h5>나의 예매내역</h5>
<br>

<c:if test="${lists ne null}">
	<form action="mybooklist.bd" method="get">

		<input type="hidden" name="mname" value="${bb.r_mname }" />


		<div class="lst-item">
			<c:forEach var="bb" items="${lists }">
				<div class="box-number">
					<fmt:parseDate var="r_day" value="${bb.r_day }"
						pattern="yyyy-MM-dd" />
					<fmt:formatDate var="day" value="${r_day}" pattern="yyyy-MM-dd" />
					<em>예매번호</em> <strong>${bb.r_num}-${day }</strong>
				</div>
				<div>
					<span> <img
						src="<%=request.getContextPath() %>/resources/movie_image/${bb.r_img }"
						onerror="errorImage(this)" width="120" />

					</span>

				</div>
				<div>
					<dl>
						<dt>
							<a href="movie_detail.look?m_num=${bb.m_num }">${bb.r_mname }</a>
							<!--영화 이름을 보내서 이름과 일치하는 무비 디테일 페이지로 가고싶어요...  -->

						</dt>
						<dd>
							<em>관람극장</em> <strong>${bb.r_theater }&nbsp;${bb.r_cinema }관</strong>
							<a href="list.th?t_theater=${bb.r_theater}">극장정보</a>
						</dd>
						<dd>

							<em>관람일시</em> <strong>${day }</strong>
						</dd>
						<dd>
							<em>관람좌석</em> <strong>${bb.r_sno }</strong>
						</dd>
					</dl>
				</div>

				<dl>
					<dt>총 결제금액</dt>
					<dd>
						<strong>${bb.r_price} 원 (${bb.r_paying })</strong>
					</dd>
				</dl>
				<hr>
			</c:forEach>

		</div>
	</form>
</c:if>
<c:if test="${lists eq null}">
예매내역이 존재하지 않습니다.
</c:if>
<%@ include file="/WEB-INF/boda/mypage/mypage_bottom.jsp"%>

<%@ include file="/WEB-INF/boda/mypage/mypage_bottom.jsp"%>
