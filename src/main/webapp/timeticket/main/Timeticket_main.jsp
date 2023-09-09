<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>

<script src='https://cdn.jsdelivr.net/npm/jquery@1.11.3/dist/jquery.min.js'></script>

<script type='text/javascript' src='m/js/jquery-ui.js'></script>
<script src='https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js'></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css' />

<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">


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

<!-- 배너 넣어야 됨 -->


<!-- 테마별 추천 -->
<section class = "wrap_1100" style="margin-top: -13px; background:">
  <div style = "display: flex; align-items: flex-end;">
    <div style="width: 370px; height: 135px; background: #ff4b4b; border-radius: 8px 8px 0 0; box-shadow: 0px 3px 10px rgb(153, 36, 36, 0.5);">
      <div class="main_title" style="color: #fff; margin: 32px 0 0 55px;">
        테마별 추천
      </div>
      <div class="main_subtitle" style="color: #fff; margin: 10px 0 0 55px;">
        취향에 맞는 티켓을 찾아보세요
      </div>
    </div>
    <div style="width: 730px; height: 122px;">
      <div class="main_theme_reco" style="border-top:none;">
        <a href="<%=contextPath %>/timeticket/sale/sale.do?type=todaysale"> <!-- 링크넣어야 함 -->
          <div class="reco_btn"><img src="/timeticket/timeticket/images/ico_sale.png">오늘할인</div>
        </a>
        <a href="<%=contextPath %>/timeticket/sale/sale.do?type=timesale">
          <div class="reco_btn"><img src="/timeticket/timeticket/images/ico_time.png">타임세일</div>
        </a>
        <a href="<%=contextPath %>/timeticket/rank/rank.do">
          <div class="reco_btn"><img src="/timeticket/timeticket/images/ico_ranking.png" style="vertical-align: -5px;">랭킹</div>
        </a>
        <a href="<%=contextPath %>/event/event.do">
          <div class="reco_btn"><img src="/timeticket/timeticket/images/ico_event.png">이벤트</div>
        </a>
      </div>
      <div class="main_theme_reco">
        <a href="<%=contextPath %>/timeticket/category/list.do?lcate_code=lcate_1">
          <div class="reco_btn"><img src="/timeticket/timeticket/images/ico_musical.png">공연</div>
        </a>
        <a href="<%=contextPath %>/timeticket/category/list.do?lcate_code=lcate_2">
          <div class="reco_btn"><img src="/timeticket/timeticket/images/ico_exhibition.png">전시</div>
        </a>
        <a href="<%=contextPath %>/timeticket/category/list.do?lcate_code=lcate_3">
          <div class="reco_btn"><img src="/timeticket/timeticket/images/ico_activity.png">체험</div>
        </a>
        <a href="<%=contextPath %>/timeticket/category/list.do?lcate_code=lcate_5">
          <div class="reco_btn"><img src="/timeticket/timeticket/images/ico_class.png">클래스</div>
        </a>
      </div>
    </div>
  </div>
  </section>
  
<!-- 신규오픈 -->
<section class= "rolling_wrap" style="background-color: #F6F6F6;">
<div class="wrap_1100 new_roll">
    <div class="main_title">
      신규 오픈
    </div>
    <div class="main_subtitle">
      최근 새로 등록된 티켓🎫을 만나보세요
    </div>
    <div class="main_title_more">
      <a href="top.do?promo_type=new">
        더보기 &gt;
      </a>
    </div>
    <div class="swiper mySwiper swiper-initialized swiper-horizontal swiper-pointer-events swiper-backface-hidden" style="margin-top:10px;">
      <ul class="swiper-wrapper" id="swiper-wrapper-89bafbb4f910f76a1" aria-live="polite" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
      
<c:forEach items="${newlist}" var="newdto" varStatus="loop">
<c:set var="price" value="${newdto.stic_price}" />
<c:if test="${newdto.regi_num eq 'regi_1'}">
<c:if test="${loop.index < 10}">
<li class="swiper-slide swiper-slide-active" role="group" style="width: 187.727px; margin-right: 15px;">
	<a href="<%=contextPath %>/timeticket/detail/view.do?tic_code=${newdto.tic_code}" class="mmain_swipe_tickets">
		<div class="category_ticket">
			<div class="thum">
				<img src="/timeticket/timeticket/images/${newdto.tic_prof}" alt="${newdto.tic_name}" onerror="/timeticket/timeticket/images/nothumb.jpg">
				<div class="promo_badge">
      	<c:if test="${timedto.dgwon_name eq '오늘할인'}">
  		<span class="promo_today">오늘할인</span>
		</c:if>
		<c:if test="${timedto.tgwon_name eq '타임세일'}">
  		<span class="promo_timesale">타임세일</span>
		</c:if>
		<c:if test="${timedto.newb <= 7}">
  		<span class="promo_new2">NEW</span>
		</c:if>		
				</div>
			</div>
			<div class="ticket_info">
				<p class="area">${newdto.tic_loc}</p>
				<p class="category">🗂️ ${newdto.scate_name} &gt; ${newdto.gen_name}</p>
				<p class="title">${newdto.tic_name}</p>
			<c:choose>
                <c:when test="${newdto.msale != 0}">
                  <p class="price">${newdto.msale}%<span><fmt:formatNumber value="${price}" pattern="###,###원" /></span></p>
                </c:when>
                <c:otherwise>
                  <p class="price"><span><fmt:formatNumber value="${price}" pattern="###,###원" /></span></p>
                </c:otherwise>
            </c:choose>
			</div>
		</div>
	</a>
</li>
</c:if>
</c:if>
</c:forEach>

      </ul>
      <ul class="swiper-button-prev swiper-button-disabled" tabindex="-1" role="button" aria-label="Previous slide" aria-controls="swiper-wrapper-89bafbb4f910f76a1" aria-disabled="true"></ul>
      <ul class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-controls="swiper-wrapper-89bafbb4f910f76a1" aria-disabled="false"></ul>
    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
  </div>

</section>

<!-- 체험여가 -->
<section class="rolling_wrap" style="background-color: #FFFFFF;">
  <div class="wrap_1100 activity_roll">
    <div class="main_title">
      체험·여가
    </div>
    <div class="main_subtitle">
      전문 해설사와 함께하는 도심투어🚩
    </div>
    <div class="main_title_more">
      <a href="<%=contextPath %>/timeticket/category/list.do?lcate_code=lcate_3">
        더보기 &gt;
      </a>
    </div>
    <div class="swiper mySwiper swiper-initialized swiper-horizontal swiper-pointer-events swiper-backface-hidden" style="margin-top:10px;">
      <ul class="swiper-wrapper" id="swiper-wrapper-43ba1a8b2a567fb7" aria-live="polite" style="transform: translate3d(0px, 0px, 0px);">

<c:forEach items="${l3list}" var="l3dto" varStatus="loop">
<c:set var="price" value="${l3dto.stic_price}" />
<c:if test="${l3dto.lcate_code eq 'lcate_3'}">
<c:if test="${loop.index < 10}">
        <li class="swiper-slide swiper-slide-active" role="group" style="width: 232.778px; margin-right: 15px;">
	<a href="<%=contextPath %>/timeticket/detail/view.do?tic_code=${l3dto.tic_code}" class="mmain_swipe_tickets">
	<div class="category_ticket">
		<div class="thum">
			<img src="/timeticket/timeticket/images/${l3dto.tic_prof}" alt="${l3dto.tic_name}" onerror="/timeticket/timeticket/images/nothumb.jpg">
			<div class="promo_badge">
      	<c:if test="${timedto.dgwon_name eq '오늘할인'}">
  		<span class="promo_today">오늘할인</span>
		</c:if>
		<c:if test="${timedto.tgwon_name eq '타임세일'}">
  		<span class="promo_timesale">타임세일</span>
		</c:if>
		<c:if test="${timedto.newb <= 7}">
  		<span class="promo_new2">NEW</span>
		</c:if>		
			
			</div>
		</div>
		<div class="ticket_info">
			<p class="area">${l3dto.tic_loc}</p>
      <p class="category">🗂️ ${l3dto.lcate_name}</p>
			<p class="title">${l3dto.tic_name}</p>
              <c:choose>
                <c:when test="${l3dto.msale != 0}">
                  <p class="price">${l3dto.msale}%<span><fmt:formatNumber value="${price}" pattern="###,###원" /></span></p>
                </c:when>
                <c:otherwise>
                  <p class="price"><span><fmt:formatNumber value="${price}" pattern="###,###원" /></span></p>
                </c:otherwise>
              </c:choose>
		</div>
	</div>
	</a>
</li>
</c:if>
</c:if>
</c:forEach>

      </ul>
      <ul class="swiper-button-prev swiper-button-disabled" tabindex="-1" role="button" aria-label="Previous slide" aria-controls="swiper-wrapper-43ba1a8b2a567fb7" aria-disabled="true"></ul>
      <ul class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-controls="swiper-wrapper-43ba1a8b2a567fb7" aria-disabled="false"></ul>
    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
  </div>
</section>

<!-- 전시회 -->
<section style="background: linear-gradient(45deg, #FF5858,#FFB0B3); height: 350px;">
  <div class="rolling_wrap">
    <div class="wrap_1100 exhibit_roll">
      <div class="main_title_shadow">
        전시회
      </div>
      <div class="main_subtitle_shadow">
        예술의 다양성과 아름다움을 즐겨요
      </div>
      <div class="main_title_more">
        <a href="<%=contextPath %>/timeticket/category/list.do?lcate_code=lcate_2" style="color:#fff; font-weight:400;">
          더보기 &gt;
        </a>
      </div>
      <div class="swiper mySwiper swiper-initialized swiper-horizontal swiper-pointer-events swiper-backface-hidden" style="margin-top:10px;">
        <ul class="swiper-wrapper" id="swiper-wrapper-124f9b61563cb3c1" aria-live="polite" style="transform: translate3d(0px, 0px, 0px);">

<c:forEach items="${l2list}" var="l2dto" varStatus="loop">
<c:set var="price" value="${l2dto.stic_price}" />
<c:if test="${l2dto.lcate_code eq 'lcate_2'}">
<c:if test="${loop.index < 10}">
          <li class="swiper-slide swiper-slide-active" role="group" style="width: 232.778px; margin-right: 15px;">
	<a href="<%=contextPath %>/timeticket/detail/view.do?tic_code=${l2dto.tic_code}" class="mmain_swipe_tickets">
	<div class="category_ticket">
		<div class="thum">
			<img src="/timeticket/timeticket/images/${l2dto.tic_prof}" alt="${l2dto.tic_name}" onerror="/timeticket/timeticket/images/nothumb.jpg">
			<div class="promo_badge">
      	<c:if test="${timedto.dgwon_name eq '오늘할인'}">
  		<span class="promo_today">오늘할인</span>
		</c:if>
		<c:if test="${timedto.tgwon_name eq '타임세일'}">
  		<span class="promo_timesale">타임세일</span>
		</c:if>
		<c:if test="${timedto.newb <= 7}">
  		<span class="promo_new2">NEW</span>
		</c:if>		
			
			</div>
		</div>
		<div class="ticket_info">
			<p class="area">${l2dto.tic_loc}</p>
      <p class="category">🗂️ ${l2dto.lcate_name}</p>
			<p class="title">${l2dto.tic_name}</p>
              <c:choose>
                <c:when test="${l2dto.msale != 0}">
                  <p class="price">${l2dto.msale}%<span><fmt:formatNumber value="${price}" pattern="###,###원" /></span></p>
                </c:when>
                <c:otherwise>
                  <p class="price"><span><fmt:formatNumber value="${price}" pattern="###,###원" /></span></p>
                </c:otherwise>
              </c:choose>
		</div>
	</div>
	</a>
</li>
</c:if>
</c:if>
</c:forEach>

        </ul>
        <ul class="swiper-button-prev swiper-button-disabled" tabindex="-1" role="button" aria-label="Previous slide" aria-controls="swiper-wrapper-124f9b61563cb3c1" aria-disabled="true"></ul>
        <ul class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-controls="swiper-wrapper-124f9b61563cb3c1" aria-disabled="false"></ul>
      <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
    </div>
  </div>
</section>

<!-- 원데이 클래스 -->
<section class="rolling_wrap" style="background-color: #F6F6F6; margin-top:330px;">
  <div class="wrap_1100 class_roll">
    <div class="main_title">
      원데이 클래스
    </div>
    <div class="main_subtitle">
      공에, 미술🎨, 뷰티, 쿠킹까지 다양한 취미생활
    </div>
    <div class="main_title_more">
      <a href="<%=contextPath %>/timeticket/category/list.do?lcate_code=lcate_5">
        더보기 &gt;
      </a>
    </div>
    <div class="swiper mySwiper swiper-initialized swiper-horizontal swiper-pointer-events swiper-backface-hidden" style="margin-top:10px;">
      <ul class="swiper-wrapper" id="swiper-wrapper-3f3e4bf7e4ce107e7" aria-live="polite" style="transform: translate3d(0px, 0px, 0px);">

<c:forEach items="${l5list}" var="l5dto" varStatus="loop">
<c:set var="price" value="${l5dto.stic_price}" />
<c:if test="${l5dto.lcate_code eq 'lcate_5'}">
<c:if test="${loop.index < 10}">
        <li class="swiper-slide swiper-slide-active" role="group" style="width: 232.778px; margin-right: 15px;">
	<a href="<%=contextPath %>/timeticket/detail/view.do?tic_code=${l5dto.tic_code}" class="mmain_swipe_tickets">
	<div class="category_ticket">
		<div class="thum">
			<img src="/timeticket/timeticket/images/${l5dto.tic_prof}" alt="${l5dto.tic_name}" onerror="/timeticket/timeticket/images/nothumb.jpg">
			<div class="promo_badge">
		<c:if test="${timedto.dgwon_name eq '오늘할인'}">
  		<span class="promo_today">오늘할인</span>
		</c:if>
		<c:if test="${timedto.tgwon_name eq '타임세일'}">
  		<span class="promo_timesale">타임세일</span>
		</c:if>
		<c:if test="${timedto.newb <= 7}">
  		<span class="promo_new2">NEW</span>
		</c:if>		
			
			</div>
		</div>
		<div class="ticket_info">
			<p class="area">${l5dto.tic_loc}</p>
      <p class="category">🗂️ ${l5dto.lcate_name}</p>
			<p class="title">${l5dto.tic_name}</p>
              <c:choose>
                <c:when test="${l5dto.msale != 0}">
                  <p class="price">${l5dto.msale}%<span><fmt:formatNumber value="${price}" pattern="###,###원" /></span></p>
                </c:when>
                <c:otherwise>
                  <p class="price"><span><fmt:formatNumber value="${price}" pattern="###,###원" /></span></p>
                </c:otherwise>
              </c:choose>
		</div>
	</div>
	</a>
</li>
</c:if>
</c:if>
</c:forEach>

      </ul>
      <ul class="swiper-button-prev swiper-button-disabled" tabindex="-1" role="button" aria-label="Previous slide" aria-controls="swiper-wrapper-3f3e4bf7e4ce107e7" aria-disabled="true"></ul>
      <ul class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-controls="swiper-wrapper-3f3e4bf7e4ce107e7" aria-disabled="false"></ul>
    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
  </div>
</section>

<!-- 어린이 뮤지컬 -->
<section class="rolling_wrap" style="background-color: #FFFFFF;">
  <div class="wrap_1100 kid_roll">
    <div class="main_title">
      어린이 뮤지컬
    </div>
    <div class="main_title_more">
      <a href="<%=contextPath %>/timeticket/category/list.do?lcate_code=lcate_4">
        더보기 &gt;
      </a>
    </div>
    <div class="main_subtitle">
      아이👶와 함께 즐기는 문화생활
    </div>
    <div class="swiper mySwiper swiper-initialized swiper-horizontal swiper-pointer-events swiper-backface-hidden" style="margin-top:10px;">
      <ul class="swiper-wrapper" id="swiper-wrapper-979f34c16cc4d08d" aria-live="polite" style="transform: translate3d(0px, 0px, 0px);">

<c:forEach items="${kidslist}" var="kidsdto" varStatus="loop">
<c:set var="price" value="${kidsdto.stic_price}" />
<c:if test="${kidsdto.tic_kids == 1}">
<c:if test="${loop.index < 10}">
        <li class="swiper-slide swiper-slide-active" role="group" style="width: 232.778px; margin-right: 15px;">
	<a href="<%=contextPath %>/timeticket/detail/view.do?tic_code=${kidsdto.tic_code}" class="mmain_swipe_tickets">
	<div class="category_ticket">
		<div class="thum">
			<img src="/timeticket/timeticket/images/${kidsdto.tic_prof}" alt="${kidsdto.tic_name}" onerror="/timeticket/timeticket/images/nothumb.jpg">
			<div class="promo_badge">
		<c:if test="${timedto.dgwon_name eq '오늘할인'}">
  		<span class="promo_today">오늘할인</span>
		</c:if>
		<c:if test="${timedto.tgwon_name eq '타임세일'}">
  		<span class="promo_timesale">타임세일</span>
		</c:if>
		<c:if test="${timedto.newb <= 7}">
  		<span class="promo_new2">NEW</span>
		</c:if>		
			
			</div>
		</div>
		<div class="ticket_info">
			<p class="area">${kidsdto.tic_loc}</p>
      <p class="category">🗂️ ${kidsdto.lcate_name}</p>
			<p class="title">${kidsdto.tic_name}</p>
              <c:choose>
                <c:when test="${kidsdto.msale != 0}">
                  <p class="price">${kidsdto.msale}%<span><fmt:formatNumber value="${price}" pattern="###,###원" /></span></p>
                </c:when>
                <c:otherwise>
                  <p class="price"><span><fmt:formatNumber value="${price}" pattern="###,###원" /></span></p>
                </c:otherwise>
              </c:choose>
		</div>
	</div>
	</a>
</li>
</c:if>
</c:if>
</c:forEach>

      </ul>
      <ul class="swiper-button-prev swiper-button-disabled" tabindex="-1" role="button" aria-label="Previous slide" aria-controls="swiper-wrapper-979f34c16cc4d08d" aria-disabled="true"></ul>
      <ul class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-controls="swiper-wrapper-979f34c16cc4d08d" aria-disabled="false"></ul>
    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
  </div>
</section>

<!-- 실시간 포토후기 --> 
<section style="background: linear-gradient(#FCD9A4,#FDF1CF); height: 350px;">
  <div class="wrap_1100" style="display:flex; justify-content: space-between; padding-top:95px;">

    <!-- S: 좌측 컨텐츠 -->
    <div style="width: 770px;">
      <div style="display: flex; justify-content: space-between; flex-wrap: wrap; width:100%;">
      
      
<c:forEach items="${rvlist}" var="rvdto" varStatus="loop">
<c:if test="${not empty rvdto.rev_img}">
<c:if test="${loop.index <= 3}">
<c:set var="name" value="${rvdto.mem_name}" />
<c:set var="nameLength" value="${fn:length(name)}" />

<a href="<%=contextPath %>/timeticket/detail/view.do?tic_code=${rvdto.tic_code}">

  <div class="main_trust_contents">

    <div style="font-size:18px; font-weight:600; color:#333; padding:15px 10px 0px 10px; text-align:center;" class="ellip">
      ${rvdto.tic_name}
    </div>

<div style="text-align:center; width:205px; height:205px; margin:15px 0 10px 17px;
 border-radius: 10px; background-image: url(/timeticket/timeticket/images/${rvdto.rev_img}); background-size: cover; background-color: #eee;"></div>
																													
    <div style="padding:5px 20px 0 20px; font-weight:400; text-align:left; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; word-wrap:break-word; line-height: 1.5em; height: 3em; color:#777; ">
      ${rvdto.rev_cont}
    </div>

    <div style="display: flex; justify-content: space-between; margin-top:15px; padding:10px 15px 10px 15px; border-top:1px solid #eee;">
      <div style="font-size:14px; color:#333; font-weight:700;"><img src="/timeticket/timeticket/images/ico_star.png" style="width:15px; padding-right:5px; vertical-align: -1px;" alt="별점">
        <script>
    	document.write(parseFloat(${rvdto.rev_point}).toFixed(1));
  		</script>
      </div>
			
      <div style="font-size:13px; color:#777; font-weight:400;" class="ellip">
<c:choose>
  <c:when test="${nameLength eq 2}">
    <c:set var="maskedName" value="${fn:substring(name, 0, 1)}*" />
  </c:when>
  <c:otherwise>
    <c:set var="maskedName" value="${fn:substring(name, 0, nameLength - 2)}*${fn:substring(name, 2, nameLength)}" />
  </c:otherwise>
</c:choose>
  ${maskedName}
      </div>
    </div>

  </div>
</a>
</c:if>
</c:if>
</c:forEach>
      </div>
    </div>
    <!-- E: 좌측 컨텐츠 -->

    <!-- S: 우측 타이틀 -->
    <div style="width: 260px; margin-top: 100px;">
      <div class="main_title_shadow">
        <span style="font-weight:300;">실시간</span> 포토후기
      </div>
      <div class="main_subtitle_shadow">
        생생한 후기를 들려드릴게요✨
      </div>
    </div>
    <!-- E: 우측 타이틀 -->

  </div>
</section>

<!-- 타임세일 -->
<section style="background-color: #FFFFFF; padding:50px 0; margin-top:150px;">
  <div class="wrap_1100">
    <div class="main_title">
      타임세일
    </div>
    <div class="main_subtitle">
      한정기간/한정수량 최저가💸 티켓을 만나보세요
    </div>
    <div style="margin-top: 40px;">
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
    
      <tbody>  
      
<c:if test="${not empty tslist}">
  <c:forEach items="${tslist}" var="timedto" varStatus="loop">
    <c:set var="price" value="${timedto.stic_price}" /> 
    <c:if test="${loop.index % 4 == 0}">
      <tr>
    </c:if>
      <td valign="top" align="left"><a href="<%=contextPath %>/timeticket/detail/view.do?tic_code=${timedto.tic_code}">
  <div class="ticket_list">
    <div class="thumb">
        <img src="/timeticket/timeticket/images/${timedto.tic_prof}" alt="${timedto.tic_name}" onerror="/timeticket/timeticket/images/nothumb.jpg">
      <div class="promo_badge">
      
      	<c:if test="${timedto.dgwon_name eq '오늘할인'}">
  		<span class="promo_today">오늘할인</span>
		</c:if>
		<c:if test="${timedto.tgwon_name eq '타임세일'}">
  		<span class="promo_timesale">타임세일</span>
		</c:if>
		<c:if test="${timedto.newb <= 7}">
  		<span class="promo_new2">NEW</span>
		</c:if>		
		
    </div>                                                                                                                      
    </div>
		<div class="ticket_info">
			<p class="area">${timedto.tic_loc}</p>
      <p class="category">🗂️ ${timedto.scate_name} &gt; ${timedto.gen_name}</p>
			<p class="title">${timedto.tic_name}</p>
      <div class="price">
        <div>
          <span class="stars" style=";">
            <img src="/timeticket/timeticket/images/ico_star.png" alt="별점">${timedto.ravg}
            <span>(${timedto.rcount})</span>
          </span>
          <span style="display:none;;"></span>
        </div>
        <div>
          <span class="sale_percent">${timedto.msale}%</span>
          <span class="baro_price"><fmt:formatNumber value="${price}" pattern="###,###원" /></span>
        </div>
      </div>
    </div>
  </div>
</a>
</td>
    <c:if test="${(loop.index + 1) % 4 == 0 || loop.last}">
      </tr>
    </c:if>
  </c:forEach>
</c:if>


</tbody>

</table>
    </div>
  </div>
</section>


<script>
var swiper = new Swiper('.main_rolling .mySwiper', {
    slidesPerView: 1.45,
    centeredSlides: true,
    speed: 400,
    spaceBetween: 10,
    centeredSlides: true,
      autoplay: {
        delay: 2000,
        disableOnInteraction: false,
      },
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
    loop: true
});


var swiper = new Swiper('.new_roll .mySwiper', {
    slidesPerView: 5.5,
    centeredSlides: false,
    spaceBetween: 15,
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
});

var swiper = new Swiper('.activity_roll .mySwiper', {
    slidesPerView: 4.5,
    centeredSlides: false,
    spaceBetween: 15,
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
});

var swiper = new Swiper('.exhibit_roll .mySwiper', {
    slidesPerView: 4.5,
    centeredSlides: false,
    spaceBetween: 15,
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
});

var swiper = new Swiper('.class_roll .mySwiper', {
    slidesPerView: 4.5,
    centeredSlides: false,
    spaceBetween: 15,
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
});

var swiper = new Swiper('.kid_roll .mySwiper', {
    slidesPerView: 4.5,
    centeredSlides: false,
    spaceBetween: 15,
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
});

</script>

</body>
</html>