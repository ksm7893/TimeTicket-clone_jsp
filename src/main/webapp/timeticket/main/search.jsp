<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
	String contextPath = request.getContextPath();
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src='https://cdn.jsdelivr.net/npm/jquery@1.11.3/dist/jquery.min.js'></script>

<script type='text/javascript' src='m/js/jquery-ui.js'></script>
<script src='https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js'></script>
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css' />
	
<link href= "/timeticket/timeticket/css/layout.css" rel="stylesheet">
<link href= "/timeticket/timeticket/css/layout_swiper.css" rel="stylesheet">
<link href= "/timeticket/timeticket/css/detail.css" rel="stylesheet">
<link href= "/timeticket/timeticket/css/common.css" rel="stylesheet">
<%--<!--
<link href= '<%= contextPath %>/timeticket/css/layout.css' rel='stylesheet' type='text/css'>
<link href= '<%= contextPath %>/timeticket/css/detail.css' rel='stylesheet' type='text/css'>
<link href= '<%= contextPath %>/timeticket/css/calendar_theme.css' rel='stylesheet' type='text/css'>
<link href= '<%= contextPath %>/timeticket/css/layout_swiper.css' rel='stylesheet' type='text/css'>
<link href= '<%= contextPath %>/timeticket/css/user_review.css' rel='stylesheet' type='text/css'> 
<link href= '<%= contextPath %>/timeticket/css/common.css' rel='stylesheet' type='text/css'>
-->--%>
</head>
<body>
<div style="width:1100px; margin:0 auto; padding-top:30px;">
    <!-- WRAP : default.html -->

<style>
  .w100 { width:100%; padding-bottom:20px; }
  .w100 img { width:100%; }
</style>


<c:set var="all_search_result" value="''" scope="request" /> <!-- 변수 초기화 -->


  <!------------------- 특정키워드에 대해 추천 이미지 노출 : 시작 ------------------->
  <div class="w100">
    
  </div>
  <!------------------- 특정키워드에 대해 추천 이미지 노출 : 끝 ------------------->
<c:choose>
  <c:when test="${empty searchlist}">
<div id="all_search_no_result">
  <div style="text-align:center; padding:150px 0 190px 0; font-size:20px; color:#999; font-weight:400; line-height:180%;">
  <p style="font-size:24px; color:#333; font-weight:700;">
<img src="/timeticket/timeticket/images/icon_search.png" style="width:24px; vertical-align:-4px; padding-right:10px;">검색어가 입력되지 않았습니다</p>
  <p style="font-size:18px; color:#999; padding-top:20px;">제목, 지역, 장소 등의 검색어를 입력해주세요.</p>
</div>
</div>
  </c:when>
</c:choose>	
	
<c:if test="${ not empty searchlist }">	
	<div style="width:1120px; margin:auto; padding-top:10px; padding-bottom:30px;">
	<table align="center" width="100%" border="0" cellspacing="0">
	<tbody>
	<c:forEach items="${searchlist}" var="ldto" varStatus="a">
		<c:if test="${(a.count) %4 eq 1 }">
		<tr>
		</c:if>
			<td width="25%">
				<a href="/timeticket/timeticket/detail/view.do?tic_code=${ldto.tic_code}">
			<div class="ticket_list">
				<div class="thumb">
				<img src="/timeticket/timeticket/images/${ldto.tic_prof}" alt="${ldto.tic_name }">
					<div class="promo_badge">
					<c:if test="${not empty ldto.dgwon_name }">
					<span class="promo_today">오늘할인</span>
					</c:if>
					<c:if test="${not empty ldto.tgwon_name }">
					<span class="promo_timesale">타임세일</span>
					</c:if>
					</div>
				</div>
			<div class="ticket_info">
					<p class="area">${ldto.tic_loc}</p>
					<p class="category"> 🗂️
						<c:choose>
							<c:when test="${ldto.lcate_code eq 'lcate_1'} ">${ldto.scate_name} </c:when>
							<c:otherwise>${ldto.lcate_name }>${ldto.scate_name }</c:otherwise>
						</c:choose>
				<c:if test="${not empty ldto.gen_name }">&gt; ${ldto.gen_name }</c:if>
					</p>
					<p class="title">${ldto.tic_name }</p>
					<div class="price">
				<div>
					<span class="stars" style=";">
					<c:if test="${ldto.ravg >  0}">
					<img src="/timeticket/timeticket/images/ico_star.png" alt="별점" />${ldto.ravg }
                       <span>(${ldto.rcount })</span>
                       </c:if>
					</span>
					<span style="display:none;;"></span>
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
<td width="25%">&nbsp;</td>
<td width="25%">&nbsp;</td>
<td width="25%">&nbsp;</td>

		<c:if test="${(a.count)%4 eq 0 }">
			</tr>
		</c:if>
	</c:forEach>
						</tbody>
					</table>
 <c:set var="all_search_result" value="'ok'" scope="request" /> <!-- 변수 값 설정 -->
</div>
</c:if>
</div>



</body>
</html>