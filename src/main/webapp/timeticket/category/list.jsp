<%@page import="list.service.ScategoryDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="list.service.RegionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel='stylesheet' type='text/css'
	href='<%=contextPath%>/timeticket/css/common.css' />
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css' />
<title>Insert title here</title>
<style>
.category_menu_on {
	width: 100%;
	margin-top: -2px;
	border-top: 1px solid #eee;
	border-bottom: 1px solid #eee;
	background: #f9f9f9;
}

.category_menu_off {
	width: 100%;
	margin-top: -2px;
	border-top: 1px solid #eee;
}

.category_menu {
	padding: 25px 0 30px 0;
	font-size: 16px;
}

.category_menu li {
	display: inline-block;
}

.category_menu li a {
	color: #888;
	padding: 0 5px;
	margin: 0 15px;
}

.category_menu li a:first-child {
	margin-left: 5px;
}

.category_submenu {
	padding: 5px 0 25px 0;
	font-size: 16px;
}

.category_submenu li {
	display: inline-block;
}

.category_submenu li a {
	color: #888;
	padding: 0 10px;
	margin: 0 15px;
}

.category_submenu li a:first-child {
	margin-left: 0px;
}

.category_menu li a:hover {
	color: #000;
	font-weight: 600;
}

.category_submenu li a:hover {
	color: #000;
	font-weight: 600;
}

.category_menu .on a {
	color: #000;
	font-weight: 600;
	border-bottom: 2px solid #000;
	padding: 0px 5px 10px 5px;
}

.category_submenu .on a {
	color: #000;
	font-weight: 600;
	background: #eee;
	padding: 8px 10px;
	border-radius: 30px;
}

.category_etc {
	color: #fff;
	height: 150px;
	margin-top: 25px;
	font-size: 34px;
	font-weight: 700;
	line-height: 145px;
	padding-left: 40px;
}

.category_area, .category_sort {
	font-size: 16px;
	margin-top: 40px;
}

.category_area li a, .category_sort li a {
	color: #777;
}

.category_area li {
	display: inline-block;
	padding-right: 18px;
}

.category_sort li {
	display: inline-block;
	padding-left: 10px;
}

.category_sort li:nth-child(2n) {
	font-size: 11px;
	color: #ccc;
	vertical-align: 2px;
}

.category_area li a:hover, .category_area .area_on a {
	color: #ff4b4b;
	font-weight: 600;
}

.category_sort li a:hover, .category_sort .sort_on a {
	color: #00aeef;
	font-weight: 600;
}
</style>

</head>
<body>

<%-- <a href="<%=contextPath%>/timeticket/category/list.do?lcate_code=lcate_1"
		name="lcate1">공연</a>
	<a href="<%=contextPath%>/timeticket/category/list.do?lcate_code=lcate_2"
		name="lcate2">전시</a>
	<a href="<%=contextPath%>/timeticket/category/list.do?lcate_code=lcate_3"
		name="lcate3">체험</a>
	<a href="<%=contextPath%>/timeticket/category/list.do?lcate_code=lcate_4"
		name="lcate4">키즈</a>
	<a href="<%=contextPath%>/timeticket/category/list.do?lcate_code=lcate_5"
		name="lcate5">클래스</a><br> --%>
	
	<%-- <a href="<%=contextPath%>/timeticket/ex01.jsp">Home</a><br> --%>

<c:if test="${not empty sList }">
<section class="category_menu_on">
	<div class="wrap_1100">
		<ul class="category_menu">
			<c:choose>
			<c:when test="${empty param.scate_code or param.scate_code eq '' }"><li class="on"></c:when>
			<c:otherwise><li></c:otherwise>
			</c:choose>
			<a href="<%=contextPath%>/timeticket/category/list.do?lcate_code=${param.lcate_code}" id=""><%=request.getAttribute("lcate_name") %> 전체</a></li>
			<c:forEach items="${sList }" var="sdto">
				<c:choose>
				<c:when test="${param.scate_code eq sdto.scate_code }"><li class="on"></c:when>
				<c:otherwise><li></c:otherwise>
				</c:choose>
				<a href="<%=contextPath%>/timeticket/category/list.do?lcate_code=${param.lcate_code}&scate_code=${sdto.scate_code }" id="${sdto.scate_code }">${sdto.scate_name }</a></li>
			</c:forEach>
		</ul>
	
	
		<c:if test="${(param.scate_code eq 'scate_1' or param.scate_code eq 'scate_2')  }">
			<ul class="category_submenu">
			<c:choose>
			<c:when test="${empty param.gen_code or param.gen_code eq '' }"><li class="on"></c:when>
			<c:otherwise><li></c:otherwise>
			</c:choose>
				<a href="<%=contextPath%>/timeticket/category/list.do?lcate_code=${param.lcate_code}&scate_code=${param.scate_code }" id="">장르 전체</a></li>
			<c:forEach items="${gList }" var="gdto">
				<c:choose>
				<c:when test="${param.gen_code eq gdto.gen_code }"><li class="on"></c:when>
				<c:otherwise><li></c:otherwise>
				</c:choose>
				<a href="<%=contextPath%>/timeticket/category/list.do?lcate_code=${param.lcate_code}&scate_code=${param.scate_code }&gen_code=${gdto.gen_code}" id="${gdto.gen_code}">${gdto.gen_name }</a></li>
			</c:forEach>
			</ul>
		</c:if> 
		<c:if test="${(param.scate_code ne 'scate_1' or param.scate_code ne 'scate_2') }"></c:if> 
	</div>
	</section>
	</c:if>
	<c:if test="${empty sList }">
	<section class="category_menu_off">
		<div class="wrap_1100">
			<c:if test="${param.lcate_code eq 'lcate_2' }"><div class="category_etc" style="background: linear-gradient(45deg, #ff5858, #ffbaa4);">전시</div></c:if>
			<c:if test="${param.lcate_code eq 'lcate_3' }"><div class="category_etc" style="background: linear-gradient(45deg, #4dc9ff, #d9ff40);">체험</div></c:if>
		</div>
	</section>
	</c:if>
	<br>
	<section class="wrap_1100">
		<div
			style="display: flex; justify-content: space-between; margin-top: 5px;">
			<c:if test="${not empty rList }">
				<div>
					<ul class="category_area">
						<c:choose>
							<c:when test="${empty param.reg_code or param.reg_code eq '' }"><li class="area_on"></c:when>
							<c:otherwise><li></c:otherwise>
						</c:choose>
						<a
							href="<%=contextPath%>/timeticket/category/list.do?lcate_code=${param.lcate_code}&scate_code=${param.scate_code}&sort=${param.sort}&gen_code=${param.gen_code}"
							id="">전체</a></li>
						<c:forEach items="${rList}" var="rdto">
							<c:choose>
								<c:when test="${param.reg_code eq rdto.reg_code }"><li class="area_on"></c:when>
								<c:otherwise><li></c:otherwise>
							</c:choose>
							<a
								href="<%=contextPath%>/timeticket/category/list.do?reg_code=${rdto.reg_code}&lcate_code=${param.lcate_code}&scate_code=${param.scate_code}&gen_code=${param.gen_code}&sort=${param.sort}"
								id="${rdto.reg_code}">${rdto.reg_name }</a></li>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<div>
				<ul class="category_sort">
					<c:choose>
						<c:when test="${empty param.sort or param.sort eq '' }"><li class="sort_on"></c:when>
						<c:otherwise><li></c:otherwise>
					</c:choose>
					<a
						href="<%=contextPath%>/timeticket/category/list.do?reg_code=${param.reg_code }&lcate_code=${param.lcate_code}&scate_code=${param.scate_code}&gen_code=${param.gen_code}"
						id="">인기순</a></li>
						<li>|</li>
					<c:choose>
						<c:when test="${param.sort eq 'tic_review' }"><li class="sort_on"></c:when>
						<c:otherwise><li></c:otherwise>
					</c:choose>
						<a
						href="<%=contextPath%>/timeticket/category/list.do?reg_code=${param.reg_code }&lcate_code=${param.lcate_code}&scate_code=${param.scate_code}&gen_code=${param.gen_code}&sort=tic_review"
						id="tic_review">별점순</a></li>
						<li>|</li>
					<c:choose>
						<c:when test="${param.sort eq 'priceAsc' }"><li class="sort_on"></c:when>
						<c:otherwise><li></c:otherwise>
					</c:choose>
						<a
						href="<%=contextPath%>/timeticket/category/list.do?reg_code=${param.reg_code }&lcate_code=${param.lcate_code}&scate_code=${param.scate_code}&gen_code=${param.gen_code}&sort=priceAsc"
						id="priceAsc">최저가순</a></li>
						<li>|</li>
					<c:choose>
						<c:when test="${param.sort eq 'priceDesc' }"><li class="sort_on"></c:when>
						<c:otherwise><li></c:otherwise>
					</c:choose>
						<a
						href="<%=contextPath%>/timeticket/category/list.do?reg_code=${param.reg_code }&lcate_code=${param.lcate_code}&scate_code=${param.scate_code}&gen_code=${param.gen_code}&sort=priceDesc"
						id="priceDesc">최고가순</a></li>
				</ul>
			</div>
		</div>
		<div style="margin-top: 25px;">
			<c:if test="${empty lList }">
				<div
					style="font-weight: 400; margin: auto; text-align: center; line-height: 250%; height: 350px; padding-top: 100px; color: #333;">
					<img src="<%=contextPath%>/img/icon_noproduct.png" alt=""
						style="width: 84px;" />
					<p style="font-size: 20px; font-weight: 500;">이용 가능한 티켓이 없습니다.</p>
					<p style="font-size: 15px;">다른 조건(날짜,장르,지역)으로 확인해보세요.</p>
				</div>
			</c:if>
			<c:if test="${not empty lList }">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tbody>
					<c:forEach items="${lList }" var="ldto" varStatus="a">
						<c:if test="${(a.count)%4 eq 1 }"><tr></c:if>
								<td valign="top" align="left">
								<a href="<%=contextPath%>/timeticket/detail/view.do?tic_code=${ldto.tic_code }">
									<div class="ticket_list">
										<div class="thumb">
											<img src="<%=contextPath%>/timeticket/images/${ldto.tic_prof}" alt="${ldto.tic_name }">
											<div class="promo_badge">
											<c:if test="${ldto.newb <= 7 }">
											<span class="promo_new">NEW</span>
											</c:if>
											<c:if test="${not empty ldto.dgwon_name }">
											<span class="promo_today">오늘할인</span>
											</c:if>
											<c:if test="${not empty ldto.tgwon_name }">
											<span class="promo_timesale">타임세일</span>
											</c:if>
											</div>
										</div>
										<div class="ticket_info">
											<p class="area">${ldto.tic_loc }</p>
											<p class="category">🗂️
											<c:choose>
											<c:when test="${ldto.lcate_code eq 'lcate_1'} ">${ldto.scate_name} </c:when>
											<c:otherwise>${ldto.lcate_name }</c:otherwise>
											</c:choose>
											<c:if test="${not empty ldto.gen_name }">&gt; ${ldto.gen_name }</c:if></p>
											<p class="title">${ldto.tic_name }</p>
											<div class="price">
												<div>
													<span class="stars">
													<img src="<%=contextPath %>/timeticket/images/ico_star.png" alt="별점" />${ldto.ravg }
													<span>(${ldto.rcount })</span>
													</span>
												</div>
												<div>
													<span class="sale_percent">${ldto.msale }%</span>
													<span class="baro_price">${ldto.stic_price }원</span>
												</div>
											</div>
										</div>
									</div>
								</a>
								</td>
						<c:if test="${(a.count)%4 eq 0 }"></tr></c:if>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
	</section>
</body>
</html>