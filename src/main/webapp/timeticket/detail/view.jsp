<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">

<link href= '<%= contextPath %>/timeticket/css/layout.css' rel='stylesheet' type='text/css'>
<link href= '<%= contextPath %>/timeticket/css/detail.css' rel='stylesheet' type='text/css'>
<link href= '<%= contextPath %>/timeticket/css/calendar_theme.css' rel='stylesheet' type='text/css'>
<link href= '<%= contextPath %>/timeticket/css/layout_swiper.css' rel='stylesheet' type='text/css'>
<link href= '<%= contextPath %>/timeticket/css/user_review.css' rel='stylesheet' type='text/css'> 
<link href= '<%= contextPath %>/timeticket/css/common.css' rel='stylesheet' type='text/css'>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type='text/javascript' src='https://timeticket.co.kr/m/js/jquery-ui.js'></script>
<script src='https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js'></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css' />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<style>
@charset "utf-8";
/* css 추가 */
a {
	text-decoration: none;
}

#calendar_popup .ui-widget.ui-widget-content {
	width: 100%;
	padding: 5px;
	box-sizing: border-box;
	border-radius: 10px;
	background: #fff;
}

#calendar_popup .ui-datepicker .ui-datepicker-header {
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 0;
}

#calendar_popup .ui-widget-header {
	background: #fff;
	border: 0;
	margin-top: 10px;
}

#calendar_popup .ui-datepicker .ui-datepicker-prev {
	position: static;
	display: block;
	width: 15px;
	height: 18px;
	background: url(<%=contextPath%>/images/ico_pre.png) no-repeat center
		center;
	background-size: 100% 100%;
	margin-right: 20px;
	cursor: pointer;
	order: 0
}

#calendar_popup .ui-datepicker .ui-datepicker-next {
	position: static;
	display: block;
	width: 15px;
	height: 18px;
	background: url(<%=contextPath%>/images/ico_next.png) no-repeat center
		center;
	background-size: 100% 100%;
	margin-left: 20px;
	cursor: pointer;
	order: 2
}

#calendar_popup .ui-datepicker .ui-datepicker-prev span, #calendar_popup .ui-datepicker .ui-datepicker-next span
	{
	position: static;
	display: none;
}

#calendar_popup .ui-datepicker .ui-datepicker-title {
	margin: 0;
	padding-bottom: 4px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 0;
}

#calendar_popup .ui-datepicker .ui-datepicker-title span {
	color: #414141;
	font-weight: bold;
	font-size: 18px;
}

#calendar_popup .ui-datepicker .ui-datepicker-title span.ui-datepicker-year
	{
	order: 0
}

#calendar_popup .ui-datepicker .ui-datepicker-title span.ui-datepicker-year::after
	{
	content: ".";
	display: inline-block;
	color: #414141;
	font-weight: bold;
	font-size: 18px;
}

#calendar_popup .ui-datepicker .ui-datepicker-calendar {
	width: 100%;
	margin-top: 10px;
}

#calendar_popup .ui-datepicker th {
	padding: 0;
	color: #919191;
	font-size: 15px;
	font-weight: 400;
	padding-bottom: 10px;
}

#calendar_popup .ui-datepicker td {
	padding: 0;
	padding-bottom: 12px;
	position: relative;
}

#calendar_popup .ui-datepicker td a {
	display: block;
	width: 25px;
	height: 25px;
	line-height: 25px;
	border-radius: 90px;
	color: #414141;
	font-size: 15px;
	margin: 0 auto;
	border: 0;
	background: none;
	text-align: center;
	padding: 0;
}

#calendar_popup .ui-datepicker td.ui-datepicker-today a:after {
	content: '오늘';
	position: absolute;
	font-size: 10px;
	bottom: -6px;
	left: 50%;
	transform: translateX(-50%);
	border: 0;
	width: auto;
	height: auto;
	color: #ff4b4b;
}

#calendar_popup .ui-state-disabled {
	opacity: 0.4;
}

#calendar_popup .ui-state-disabled span {
	display: block;
	width: 25px;
	height: 25px;
	line-height: 25px;
	border-radius: 90px;
	color: #414141;
	font-size: 15px;
	margin: 0 auto;
	border: 0;
	background: none;
	text-align: center;
	padding: 0;
}

#calendar_popup .ui-datepicker tr td:first-child a, #calendar_popup .ui-datepicker tr td:first-child span
	{
	color: #ff4b4b;
}

#calendar_popup .ui-datepicker tr td:last-child a, #calendar_popup .ui-datepicker tr td:last-child span
	{
	color: #4b75ff;
}

#calendar_popup .ui-datepicker tr td a.ui-state-active {
	background: #ff4b4b;
	color: #fff;
}

#calendar_popup.calendar_popup_02 .ui-widget.ui-widget-content {
	padding-bottom: 5px;
}

.calendar_popup_02 .submit_btn {
	padding-top: 10px;
	width: 100%;
	background: #f4f4f4;
	cursor: pointer;
}

.calendar_popup_02 .submit_btn button {
	display: block;
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-align: center;
	background: #ff4b4b;
	color: #fff;
	font-size: 16px;
	font-weight: bold;
	border-radius: 10px;
	border: 0;
	cursor: pointer;
}

.calendar_popup_02 .submit_btn button.disabled {
	background: #c6c6c6;
	cursor: pointer;
}
</style>

<style>
.shadetabs ul, li {list-style:none; margin:0; padding:0;  }

.shadetabs{ width:818px; cursor:pointer; padding:0; background:#fff; height:61px; border:1px solid #eee; border-bottom:1px solid #eee;}

.shadetabs li{  }


.shadetabs li a{
text-decoration: none; 
float:left; 
width:25%; 
padding-top:20px;
text-align:center;
font-size: 18px;
font-weight: 600;
color:#777;
}

.shadetabs li a:visited{ }
.shadetabs li a:hover{  }
.shadetabs li.selected{ }


.shadetabs li.selected a{
color:#ff4b4b;
font-weight: 800;
}

.shadetabs li.selected span{ border-bottom:4px solid #ff4b4b; padding-bottom:16px; }


.shadetabs li.selected a:hover{
text-decoration: none;
}

.contentstyle{
width: 100%;
height:auto;
}
</style>

<style>
.main_tab_wrap {
	border: 1px solid #eee;
	border-top: none;
	padding: 30px 59px;
	border-radius: 0 0 10px 10px;
}

.main_tab_title {
	font-size: 20px;
	margin-top: 15px;
	font-weight: 700;
	color: #000;
}

.back_img {
	background: -moz-linear-gradient(top, rgba(0, 0, 0, 0.6) 0%,
		rgba(0, 0, 0, 0.95) 100%);
	background: -webkit-linear-gradient(top, rgba(0, 0, 0, 0.6) 0%,
		rgba(0, 0, 0, 0.95) 100%);
	background: linear-gradient(to bottom, rgba(0, 0, 0, 0.6) 0%,
		rgba(0, 0, 0, 0.95) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#80000000',
		endColorstr='#e6000000', GradientType=0);
}

.promo_box {
	position: relative;
	height: 70px;
	padding: 15px 25px;
	margin-top: 15px;
	border-radius: 10px;
	font-size: 16px;
	line-height: 150%;
}

.promo_datetime {
	float: left;
	margin-top: 10px;
	font-size: 16px;
	font-weight: 700;
	color: #fff;
	border-radius: 10px;
}

.promo_btn_circle {
	position: absolute;
	bottom: 25px;
	right: 15px;
}

.promo_btn_circle img {
	width: 40px;
}

/* 클래스 상세페이지 글자 스타일 */
.cls_detail {
	width: 100%;
	margin: 0 auto;
	font-size: 14px;
	color: #313131;
	line-height: 1.8em;
	text-align: left;
}

.cls_detail img {
	margin: 20px 0;
	width: 100%;
	border-radius: 10px;
}

.cls_para {
	padding: 10px 10px;
	text-align: justify;
}

.cls_title {
	margin: 30px 0 5px 0;
	padding: 13px 20px;
	font-size: 20px;
	font-weight: bold;
	background: #F7DFDB;
	color: #ff4b4b;
	border-radius: 10px;
}

.cls_title:nth-child(1) {
	margin-top: 40px;
}

.info_subtitle {
	font-weight: bold;
}

.radius_box {
	background: #f8f8f8;
	padding: 12px 15px;
	border-radius: 10px;
	margin-top: 5px;
}

/* 상세 이미지 펼쳐보기 */
.info_detail_btn {
	position: absolute;
	bottom: 15px;
	width: 94%;
	height: 55px;
	line-height: 55px;
	margin-left: 3%;
	border: 1px solid #ccc;
	border-radius: 10px;
	background: #fff;
	color: #000;
	font-size: 20px;
	font-weight: 600;
	text-align: center;
	box-shadow: 1px 1px 3px 2px #ddd;
}

.info_detail_poster {
	position: relative;
	margin-top: 35px;
	width: 100%;
	height: 700px;
	color: #fff;
	font-size: 20px;
	background-size: 100%;
	background-repeat: no-repeat;
	background-position-y: 0%;
	background-image:
		url('/timeticket/timeticket/detail/images/${ vdto.tic_back }');
}

.info_detail_gradient {
	width: 100%;
	height: 700px;
	background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0) 40%,
		rgba(255, 255, 255, 0.4) 60%, rgba(255, 255, 255, 0.8) 80%,
		rgb(255, 255, 255) 100%);
}

.viewpage_flex {
	display: flex;
	justify-content: flex-start;
}

.viewpage_flex div:nth-child(1) {
	padding-left: 10px;
	width: 120px;
	color: #888;
}

.viewpage_flex div:nth-child(2) {
	color: #000;
}

.viewpage_flex a {
	text-decoration: underline;
}

.border_box {
	border: 1px solid #eee;
	padding: 10px 20px;
	border-radius: 10px;
	margin-top: 5px;
}

.border_box .viewpage_flex {
	border-bottom: 1px solid #eee;
	padding-bottom: 8px;
	margin-bottom: 8px;
}

.border_box .viewpage_flex:last-child {
	border: none;
	padding-bottom: 0;
	margin-bottom: 0;
}

.now_engine {
	padding-bottom: 15px;
	font-size: 15px;
	font-weight: 400;
}

.now_engine a {
	color: #555;
}
</style>

<style>
.bottom_menu {
	font-size: 16px;
	font-weight: 500;
	color: #444;
	margin-bottom: 20px;
}

.bottom_menu a {
	color: #444;
}

.bottom_btns {
	display: flex;
	font-size: 14px;
	color: #444;
}

.bottom_btns div {
	border: 1px solid #d5d5d5;
	border-radius: 10px;
	width: 140px;
	padding: 10px 0;
	margin-right: 25px;
	text-align: center;
}
</style>

<style>
.shadetabs ul, li {
	list-style: none;
	margin: 0;
	padding: 0;
}

.shadetabs {
	width: 818px;
	cursor: pointer;
	padding: 0;
	background: #fff;
	height: 61px;
	border: 1px solid #eee;
	border-bottom: 1px solid #eee;
}

.shadetabs li {
	
}

.shadetabs li a {
	text-decoration: none;
	float: left;
	width: 25%;
	padding-top: 20px;
	text-align: center;
	font-size: 18px;
	font-weight: 600;
	color: #777;
}

.shadetabs li a:visited {
	
}

.shadetabs li a:hover {
	
}

.shadetabs li.selected {
	
}

.shadetabs li.selected a {
	color: #ff4b4b;
	font-weight: 800;
}

.shadetabs li.selected span {
	border-bottom: 4px solid #ff4b4b;
	padding-bottom: 16px;
}

.shadetabs li.selected a:hover {
	text-decoration: none;
}

.contentstyle {
	width: 100%;
	height: auto;
}
</style>

<style>
.viewpage_text { line-height:160%; font-size:15px;	}
.viewpage_text .viewpage_noti { padding:15px 0 0 0; font-weight:700; font-size:16px; }
</style>


<script>
      				// Initialize and add the map
				      function initMap() {
				        // The location of Uluru
				        const uluru = { lat: ${pdto.place_lat}, lng: ${pdto.place_lon} };
				        // The map, centered at Uluru
				        const map = new google.maps.Map(document.getElementById("map"), {
				          zoom: 4,
				          center: uluru,
				        });
				        // The marker, positioned at Uluru
				        const marker = new google.maps.Marker({
				          position: uluru,
				          map: map,
				        });
				      }
				    </script>
			
			
<!-- 장소 버튼 클릭시 에이작스 처리 -->
<script>
						var map3;
						function initMap3() {
						  	map3 = new google.maps.Map(document.getElementById("map")
						  			, {
										center: new google.maps.LatLng(51.508742,-0.120850),
										zoom: 15
									  }
						  			);
								} 
</script>
</head>



<body style="background-color: #fff; height: auto;">

 	<div style="background-color: #f6f6f6; padding-top:10px; padding-bottom:50px;"> 	
	<div style="padding-top: 20px; width: 815px; margin: 0 auto;">
	<c:choose>
		<c:when test="${vdto.lcate_name eq '공연'}">
			<div class="now_engine">
				🗂️ <a href='<%=contextPath %>/timeticket/category/list.do?lcate_code=lcate_1'>${ vdto.lcate_name } > </a><a href='<%=contextPath %>/timeticket/category/list.do?lcate_code=lcate_1&scate_code=scate_1'>${ vdto.scate_name }
					> </a><a href='<%=contextPath %>/timeticket/category/list.do?lcate_code=lcate_1&scate_code=scate_1&gen_code=gen_1'>${ vdto.gen_name } > </a>
			</div>
		</c:when>
		
		<c:when test="${vdto.lcate_name eq '클래스'}">
			<div class="now_engine">
				🗂️ <a href='<%=contextPath %>/timeticket/category/list.do?lcate_code=lcate_5'>${ vdto.lcate_name } > </a><a href='#'>${ vdto.scate_name }
					> </a>
			</div>
		</c:when>
		
		<c:otherwise>
			<div class="now_engine">
				🗂️ <a href='<%=contextPath %>/timeticket/category/list.do?lcate_code=lcate_2'>${ vdto.lcate_name } > </a>
			</div>
		</c:otherwise>
	</c:choose>
		
		
		<div style="float: left; position: relative; width: 482px; margin-right: 20px; border-radius: 10px;">
			<img src='/timeticket/timeticket/detail/images/${ vdto.tic_back }'
      style="width:482px; height: 482px; border-radius:10px;" onError="this.style.visibility='hidden'"> 
			<div class="info_bg_gradient"></div>

	

			<!-- 타임세일/오늘티켓 아이콘 노출-->
			<div style="position: absolute; top: 15px; left: 15px; display: flex;">
				<c:if test="${ 0 <= vdto.new_bar && vdto.new_bar <= 7 }">
					<span class='promo_new'>NEW</span>
				</c:if> 
				<c:if test="${tdvdto.gwon_name eq '오늘할인'}">
					<span class='promo_today'>${ tdvdto.gwon_name }</span>
				</c:if>
				<c:if test="${tvdto.gwon_name eq '타임세일'}">
					<span class='promo_timesale'>${ tvdto.gwon_name }</span>
				</c:if>
			</div>



			<!-- 타임세일/오늘할인 배너 -->
			<div style="">



				<!-- 타임세일 안내 영역 -->
				<c:if test="${tvdto.gwon_name eq '타임세일' }">
					<div class="promo_box" style="background: #FFE9E9; border: 1px solid #fde3e3;">
						<div style="font-weight: 700; color: #FF4B4B;">
						${ tvdto.gwon_name	} 진행중 ⏰ 
							<span style="font-size: 14px; color: #555; font-weight: 400;">
							회차당 2~3매 선착순 최저가
							</span>
						</div>
						<div class="promo_datetime" style="padding: 5px 15px; background: #ff4b4b;">
						~${ tvdto.ts_etime }
						</div>
						<div class="promo_btn_circle">
							<a href="<%=contextPath %>/timeticket/sale/sale.do?type=timesale"> 
							<img src="/timeticket/timeticket/detail/images/btn_circle_right.png" />
							</a>
						</div>
					</div>
				</c:if>

				<!-- 오늘할인 안내 영역 --> 
				<c:if test="${tdvdto.gwon_name eq '오늘할인' }">
					<div class="promo_box"
						style="background: #EDFFE5; border: 1px solid #d8f5cc;">
						<div style="font-weight: 700; color: #459E26;">
						${ tdvdto.gwon_name } 적용중 🎉 
						<span style="font-size:14px; color:#555; font-weight:400;">오늘 추가로 할인되는 티켓이 있어요!</span>
						</div>
						<div class="promo_datetime" style="padding: 5px 0 5px 15px; width: 105px; background: #459E26;" id="today_timer">
						
						</div>
						<div class="promo_btn_circle">
							<a href="section.php?&page=promo&type=today"> 
							<img src="/timeticket/timeticket/detail/images/btn_circle_right.png" />
							</a>
						</div>
					</div>  					
				</c:if>
			</div>

			<script>
		      // 오늘할인 타이머
		      var date1;
		      date1 = new Date();
		      date1.setHours(0);
		      date1.setMinutes(0);
		      date1.setSeconds(0);
		      var time1 = date1.getTime();
		      date1.setDate(date1.getDate() + 1);
		      var time2 = date1.getTime();

		      var now = new Date();
		      var gap = Math.round((time2 - now.getTime()) / 1000);
		      var time = gap; // 기준시간
		      var hour = ""; // 시간
		      var min = ""; // 분
		      var sec = ""; // 초

		      var x = setInterval(function () {
		        hour = parseInt(time / 3600);
		        min = parseInt(time / 60 % 60);
		        sec = time % 60; // 나머지를 계산
		        if (hour < 10) hour = "0" + hour;
		        if (min < 10) min = "0" + min;
		        if (sec < 10) sec = "0" + sec;
				
		        document.getElementById("today_timer").innerHTML = hour+' : '+min+' : '+sec;
		        time--;

		        if (time < 0) {
		          clearInterval(x);
		          document.getElementById("today_timer").innerHTML = "00 : 00 : 00";
		        }
		        
		      }, 1000);
			</script>
			
			

			<!-- 좌측 포스터 이미지 -->
			<div style="position: absolute; top: 180px; left: 25px;">
				<img src="/timeticket/timeticket/detail/images/${ vdto.tic_prof }"
					style="border-radius: 8px; width: 140px;" alt="${ vdto.tic_name }">
			</div>



			<!-- 포스터 옆 정보영역 -->
			<div style="position: absolute; top: 181px; left: 183px;">
				<div class="info-warp">
				<c:choose>
					<c:when test="${vdto.lcate_name eq '공연'}">
					<div class="icon">
						<span>${ vdto.tic_loc }</span>
						<span>${ vdto.scate_name }</span>
					</div>
					</c:when>
					<c:when test="${vdto.lcate_name eq '클래스'}">
					<div class="icon">
						<span>${ vdto.tic_loc }</span>
						<span>${ vdto.lcate_name }</span>
					</div>
					</c:when>
					<c:otherwise>
					<div class="icon">
						<span>${ vdto.tic_loc }</span>
						<span>${ vdto.lcate_name }</span>
						</div>
					</c:otherwise>
				</c:choose>
					<p style="padding-top: 10px; font-size: 14px; font-weight: 300; color: #fff;">
					${ vdto.tic_class }
					</p>

					<p class="title" style="padding-top: 5px;">${ vdto.tic_name }</p>
					<div class="openrun">
						<p class="run_tit">
							<img src="/timeticket/timeticket/detail/images/ico_calendar.png">
							${ vdto.tic_run_ti }
							</p>
						<p class="run_info">
							<span>
							<img src="/timeticket/timeticket/detail/images/ico_clock.png">
							${ vdto.tic_time }
							</span>
							<span>
							<img src="/timeticket/timeticket/detail/images/ico_people.png">
							${ vdto.tic_age }
							</span>
						</p>
						<p class="run_tit">
							<img src="/timeticket/timeticket/detail/images/ico_location_w.png">
								${pdto.place}
						</p>
					</div>
				</div>
			</div>



			<div style="position: absolute; top: 400px; left: 20px;">
				<div class="price_warp">
					
			<c:choose>
		
					<c:when test="${ '공연' eq vdto.lcate_name }">		
					<div class="sale_info">
						<p class="sale_p">최대 ${ vdto.gwon_sale }% 할인</p>	
						<p class="sale_txt">1인 세일가 기준</p>	
					</div>
					
					<div class="price_info">
						<span class="origin_price">
						<fmt:formatNumber value="${ vdto.tic_price }" pattern="#,###원" />
						</span> 
						<span class="sale_price">
						<fmt:formatNumber value="${ vdto.sale_pay }" pattern="#,###원" />
						</span>						
					</div>
					</c:when>
					
					
					
					<c:when test="${ '전시' eq vdto.lcate_name }">
					<div class="sale_info">
						<p class="sale_p">타임티켓가</p>	
						<p class="sale_txt">일반 입장권 기준</p>
					</div>	
	
					<div class="price_info">
						<span class="sale_price">
						<fmt:formatNumber value="${ vdto.sale_pay }" pattern="#,###원" />
						</span>			
					</div> 
					</c:when>
					
					
					
					<c:when test="${ '체험' eq vdto.lcate_name }">		
					<div class="sale_info">
						<p class="sale_p">최대 할인가</p>	
						<p class="sale_txt">1인 체험권 기준</p>	
					</div>
					
					<div class="price_info">
						<span class="origin_price">
						<fmt:formatNumber value="${ vdto.tic_price }" pattern="#,###원" />
						</span> 
						<span class="sale_price">
						<fmt:formatNumber value="${ vdto.sale_pay }" pattern="#,###원" />
						</span>						
					</div>
					</c:when>
									
					
					
					<c:when test="${vdto.lcate_name eq '클래스' &&  0 eq vdto.gwon_sale}">
					<div class="sale_info">	
						<p class="sale_p">타임티켓가</p>	
						<p class="sale_txt">1인 이용권 기준</p>	
					</div>
					
					<div class="price_info">
						<span class="sale_price">
						<fmt:formatNumber value="${ vdto.sale_pay }" pattern="#,###원" />
						</span>						
					</div>
					</c:when>
					
					
					<c:otherwise>
					<div class="sale_info">
						<p class="sale_p">최대 할인가</p>
						<p class="sale_txt">1인 이용권 기준</p>	
					</div>
					
					<div class="price_info">
						<span class="origin_price">
						<fmt:formatNumber value="${ vdto.tic_price }" pattern="#,###원" />
						</span> 
						<span class="sale_price">
						<fmt:formatNumber value="${ vdto.sale_pay }" pattern="#,###원" />
						</span>						
					</div>
					</c:otherwise>
					
					</c:choose>
				
					
				</div>
			</div>
		</div>


	

    <!----- 가격노출영역 // 무료일때 ----->
    <div class="price_section_etc" style="color:#00a5be; display: none;;;">
      ※ 무료 관람이 가능한 티켓입니다.<br>
      (별도의 구매없이 일정 확인 후 방문해주세요)
    </div>

    <!----- 가격노출영역 // 판매대기일때 ----->
    <div class="price_section_etc" style="color:#ff0000; display: none;;">
      ※ 등록 대기중인 티켓입니다.<br>
      (일정 추가와 함께 곧 오픈됩니다)
    </div>

    <!----- 가격노출영역 // 오픈예정일때 ----->
    <div class="price_section_etc" style="color:#ff4b4b; display: none;;">
      <p style="font-size:15px; font-weight:bold; ">
        &lt; 오픈일시 : 2020-03-20 11:10:00 &gt;
      </p>
      <p style="font-size:14px; margin-top:10px; color:#777">
        ※ 상단 오픈일시 이후로 예매 가능합니다.<br>
        ※ 관람정보가 변경될 수 있으니 유의하세요!
      </p>
    </div>
  </section>
		
		
		<div style="clear: both;"></div>
		

		<section style="width: 820px; margin: 0 auto; padding-top: 20px;">
			<div class="review_preview" style="">
						
						<!-- <script>
							// 더보기 버튼 처리
							    function showFullReviewForSample(selected) {
							      document.getElementById('sample_review' + selected).classList.add('show');
							      document.getElementById('sample_seemore' + selected).setAttribute("style", "display: none;");
							    }
							
							    function getMeta(url) {
							      const img = new Image();
							      img.addEventListener("load", function () {
							        sessionStorage.setItem('width', this.naturalWidth);
							        sessionStorage.setItem('height', this.naturalHeight);
							      });
							      img.src = url;
							    }
						</script> -->
			
			
			<c:if test="${ p1dto.avg_rev ne 0.0}">
				<div class="review_preview_container">
					<div class="review_preview_title_section">
						<div class="review_preview_left">
							<span class="review_preview_title">이용후기</span> 
							<span class="review_preview_number">${ p1dto.total_rev }</span> 
							<span class="review_preview_title">평점</span> 
							<span class="review_preview_number" style="color: #ff4b4b;">${ p1dto.avg_rev }/5</span>
						</div>
						<!-- <div class="review_preview_right">
							후기 더보기 
							<span class="review_preview_right_btn"></span>
						</div> -->
					</div>
					
					<div class="review_preview_samples">
					
						<c:forEach items="${plist}" var="p2dto" varStatus="i">
							<div class="review_wrap" id="user_review1">
								<div class="review_title">
									<div class="review_title_left">
										<div class="review_title_left_stars">
											<div class="review_title_left_star">
												<div class="review_title_left_star_filled" style="width: calc(${p2dto.rev_point} * 19px);"></div> 
											</div> 
										</div>
										<div class="review_title_left_name" style="padding-left: 10px;">
											<c:out value="${p2dto.mem_name}"/> 
										</div> 
									</div>
									<div class="review_title_right" style="padding-right: 8px;">
										<c:out value="${p2dto.rev_date}"/>
									</div>
								</div>
								
								<div class="review_text">
									<div class="review_text_area" >
										<c:out value="${p2dto.rev_cont}"/>
									</div>
									<!-- <div class="review_text_seemore" id="seemore" onclick="showFullReview()">... 더보기</div> -->
								</div>
						
								<div style="1; margin-top: 10px;">
									<div viewmode="off" style="background-image: url(/timeticket/timeticket/images/${p2dto.rev_img})" 
										name="/timeticket/timeticket/images/${p2dto.rev_img}" onclick="showOriginalRatio(0)" class="sample_img_label 0">
									</div>
								</div>
							</div>
						</c:forEach>		
						
						</div>
					</div>
					</c:if>
				</div>
		</section>
		
		
		

		 <section style="width: 820px; margin: 0 auto; padding-top: 20px;">

			<!-- 메뉴영역, js/ajaxtabs.css -->
			<ul id="maintab" class="shadetabs FixedTopMenu" style="border-radius: 10px 10px 0 0;">
				<li id="tab_01_notice" class="selected" onclick="loadKakaoMap();">
					<a class="tabLink" href="#default" rel="ajaxcontentarea" data-no="0">
						<span>안내</span>
					</a>
				</li>
				<li>
				<a data-no="1">
					<span>후기
						<span style="letter-spacing: -1px;">(${ p1dto.total_rev })</span>
					</span>
				</a>						
				</li>
				<!-- <li>
					<a data-no="2">
						<span>Q&amp;A
							<span style="letter-spacing: -1px;">
								()
							</span>
						</span>
					</a>
				</li> -->
				<li>
				<a data-no="3">
				<span>장소</span>
				</a>
				</li>
				<li><a data-no="4">
				<span>환불규정</span>
				</a>
				</li>
			</ul>

<script>
		$(document).ready(function() {
			  $('#maintab li').click(function() {
			    $('#maintab li').removeClass('selected');
			    $(this).addClass('selected');
			  });
			});
</script>
		
		
<script>
		
 $(function (){
	 $("#maintab a").on("click", function (event){
		 console.log( $(this).data("no") );
		 //document.querySelector('.main_tab_wrap').remove();
	            
				    var params =  "tic_code=${ param.tic_code }&type=" + $(this).data("no"); 
			  		
				    var that = this;
				    
					$.ajax({
						           url:"/timeticket/timeticket/detail/view.ajax",
						           dataType:"json",
						           type:"GET", 
						           data:params, 
						           cache:false,
						           success:function (data, textStatus, jqXHR){
						                		
						        	   
						        	// type0
				                	 	if ($(that).data("no")=="0") {
				                	 		$('.main_tab_wrap').remove();	
				                	 		$("#ajaxcontentarea").append(`<div class='main_tab_wrap' style=';'></div>`); 
				                	 		
				                	 		$(  data.infoViewArr ).each( function (i, elem){

							                		   var info = `<div style='display: none;; width: 700px; height: 95px; margin-bottom: 20px;'>
							       						<img src='img/bnr_class_noti.png'
							   							style='width: 700px; border-radius: 10px;' alt='예매전 주의사항 - 클래스' />
							   							</div>

									   					<div style='margin-top: 10px;'>
									   						<div class='viewpage_noti'>예매정보</div>
									   						<div class='viewpage_text radius_box'>\${elem.info}</div>
									   					</div>
									   					
									   					<div style='margin-top: 25px;'>
								   						<div class='viewpage_noti'>이용정보</div>
								   						<div class='viewpage_text radius_box'>\${elem.info_use}</div>
								   						</div>
				
								   					
									   					<div class='info_detail_poster' alt='상세'>
									   						<div class='info_detail_gradient'></div>
									   							
									   						<div class='info_detail_btn' 	id='mdetail_unfold'>
									   							펼쳐보기 
									   							<img src='/timeticket/timeticket/detail/images/icon_down.png'
									   							style='width: 13px; vertical-align: 2px; padding-left: 10px;'>
									   						</div>
									   						<div class='main_img'></div>
									   						</div>


										   					<div style='margin-top: 25px;'>
										   						<div class='viewpage_noti'>유의사항</div>
										   						<div class='viewpage_text radius_box'>\${elem.info_note}</div>
										   					</div>										   					
										   	
										   					<div style='margin-top: 25px;'>
										   						<div class='viewpage_noti'>장소안내</div>
										   						<div class='viewpage_text radius_box'
										   							style='border-radius: 10px 10px 0 0;'>
										   							<p>· 장소: \${elem.place}</p>
										   							<p>· 주소: \${elem.place_add}</p>
										   							<p>· 주차: \${elem.place_park}</p>
										   						</div>
										   						
										   						<div align='center' style='margin-top: 10px;''>
										   						
										   						<div id='map' style='width:100%;height:400px'></div>
										   						</div>
										   						</div>
										   						
										   						<div style='margin-top: 25px; margin-bottom: 25px;'>
										   						
									   							<div class='viewpage_noti'>판매정보</div>

									   							<div class='viewpage_text border_box'>
									   								<div class='viewpage_flex'>
									   									<div>주최/주관</div>
									   									<div>\${elem.info_host}</div>
									   								</div>
									   							<div class='viewpage_flex'>
									   									<div>문의전화</div>
									   									<div>📞\${elem.info_num}</div>
									   							</div>
									   							
									   							<div class='viewpage_flex'>
							   									<div>환불규정</div>
							   									<div>
							   										<a href='#tab_view' data-no='4'><span>환불규정
							   												바로가기</span></a>
							   									</div>
								   								</div>
								   								<div class='viewpage_flex'>
								   									<div>환불방법</div>
								   									<div>마이티켓 &gt; 예매내역에서 직접 취소</div>
								   								</div>
								   							</div>
										   				</div>
													</div>`;



							                		   $(info).appendTo($(".main_tab_wrap"));
							                		   $("#map").append($("<script src='https://maps.googleapis.com/maps/api/js?key=AIzaSyASJkVY1x-BDuG1ySeXbNePbgZ25se-P6w&callback=initMap3' async defer><\/script>")); 
								                		  	   
							                	  }); // each
										}// if 0 
										
										
										
										
										// type1
				                	 	if ($(that).data("no")=="1") {
				                	 		$('.main_tab_wrap').remove();	
				                	 		// $("#ajaxcontentarea").append(`<div class='score_wrap' style=';'><div class='review_start' style=';'></div></div>`);
				                	 		$("#ajaxcontentarea").append(`<div class='main_tab_wrap' style=';'><div class='score_wrap' style=';'><div class='review_start' style=';'></div></div></div>`);
				                	 		
				                	 		$(  data.ViewArr ).each( function (i, elem){

							                		   var reviews = `<div class='review_wrap' id='user_review'>
														<div class='review_title'>
															<div class='review_title_left'>
																<div class='review_title_left_stars'>
																	<div class='review_title_left_star'>
																		<div class='review_title_left_star_filled' style='width: calc(\${elem.rev_point} * 19px);'></div> 
																	</div> 
																</div>
																<div class='review_title_left_name' style='padding-left: 10px;'>
																	\${elem.mem_name}
																</div> 
															</div>
															<div class='review_title_right' style='padding-right: 8px;'>
																\${elem.rev_date}
															</div>
														</div>
														
														<div class='review_text'>
															<div class='review_text_area' id='text_862432'>
																\${elem.rev_cont}
															</div>
															<!-- <div class="review_text_seemore" id="seemore" onclick="showFullReview()">... 더보기</div> -->
														</div>
												
														<div style='1; margin-top: 10px;'>
															<div class='img_label' viewmode='off' style='background-image: url(/timeticket/timeticket/images/\${elem.rev_img})' name='/timeticket/timeticket/images/\${elem.rev_img}' onclick='showOriginalRatio()''>
															</div>
														</div>
													</div>` ;
							                		   
							                		   $(reviews).appendTo($(".review_start"));
							                		   
							                	   } ); // each
										}// if 1
						    						             
												
												
												
						                		 // type2
						                	   else if ($(that).data("no")=="2") {
						                		   // 일단 Q&A는 생
						                			 
						                	   }// if 2
						                	   
						                	   
						                	   					                	 
						                	   
						                	   // type3
						                	   else if ($(that).data("no")=="3") {									                		  
						                		   $('.main_tab_wrap').remove();								                		   							                	
						                	 	   $("#ajaxcontentarea").append(`<div class='main_tab_wrap' style=';'></div>`);
								                	 
						                		   $(  data.placeViewArr ).each( function (i, elem){
						                		   var place = `<div class='main_tab_title'>장소안내</div>
						                			   <div class='viewpage_text radius_box' style='margin-top:10px; border-radius: 10px 10px 0 0;'>
						                			     <p>· 장소: \${elem.place}</p>
						                			     <p>· 주소: \${elem.place_add}</p>
						                			     <p>· 주차: \${elem.place_park}</p>
						                			   </div>
						                			   <div align='center' style='margin-top:10px;'>
						                			     <div id='map' style='width:100%;height:400px'></div>
						                			     `;
						                			 
						                		   $(place).appendTo($(".main_tab_wrap")); 
						                		   $("#map").append($("<script src='https://maps.googleapis.com/maps/api/js?key=AIzaSyASJkVY1x-BDuG1ySeXbNePbgZ25se-P6w&callback=initMap3' async defer><\/script>")); 
						                		   /* 
						                		   
						                		    */
						                		   
						                		   } ); // each 					                		  
						                	   } // if 3
						                	   
						                	   
						                	   
						                	   
												else if ($(that).data("no")=="4") {
													$('.main_tab_wrap').remove();	
							                	 	$("#ajaxcontentarea").append(`<div class='main_tab_wrap' style=';'><p class='main_tab_title'>환불규정 및 안내사항</p></div>`);
							                	 	
							                	 	$(  data.refViewArr ).each( function (i, elem){
								                		   var ref = `<div class='viewpage_text radius_box' style='margin-top:10px; border-radius: 10px 10px 0 0;'>
											                			   \${elem.ref_rule}
											                			   \${elem.ref_cau}
											                			   \${elem.ref_way}
											                			   </div>`;
								                			 
								                		   $(ref).appendTo($(".main_tab_wrap")); 
								                		   
								                		   } ); // each  */	 
						                	   }// if 4 
						                  }
									
		 }); // ajax				 
	 }); // click
 }) // function 
			
</script>
		

			<!---------------------- 탭 영역 시작 ----------------------->
			<div id="ajaxcontentarea" class="contentstyle1" style="border-radius: 0 0 10px 10px">
				<div class="main_tab_wrap">
			

					<!-- 클래스 안내 배너 -->
					<div 	style="display: none;; width: 700px; height: 95px; margin-bottom: 20px;">
						<img src="img/bnr_class_noti.png"
							style="width: 700px; border-radius: 10px;" alt="예매전 주의사항 - 클래스" />
					</div>

					<div style="margin-top: 10px;">
						<div class="viewpage_noti">예매정보</div>
						<div class="viewpage_text radius_box">${idto.info}</div>
					</div>


				<c:if test="${not empty idto.info_agenc}">
					<div style="margin-top: 25px;">
						<div class="viewpage_noti">기획사 공지사항</div>
						<div class="viewpage_text radius_box">${idto.info_agenc}</div>
					</div>
				</c:if>
				
				
					<div style="margin-top: 25px;">
						<div class="viewpage_noti">이용정보</div>
						<div class="viewpage_text radius_box">${idto.info_use}</div>
					</div>


					<!-- 상세이미지 -->
					<div class="info_detail_poster" alt="상세">
						<div class="info_detail_gradient"></div>
							
          				
						<div class="info_detail_btn" 	id="mdetail_unfold">
							펼쳐보기 
							<img src="/timeticket/timeticket/detail/images/icon_down.png"
							style="width: 13px; vertical-align: 2px; padding-left: 10px;">
						</div>
						<div class="main_img"></div>
						
						
						
						<script>
						   $(function (){
							   $("#mdetail_unfold").on("click", function (event){
	                 
								      document.querySelector('.info_detail_btn').remove();
						              document.querySelector('.info_detail_gradient').remove();
						              document.querySelector('.info_detail_poster').setAttribute("style", "height: 700px;");
						              var params =  "tic_code=${ param.tic_code }" ;
						              $.ajax({
						                  url:"/timeticket/timeticket/detail/showimage_ajax.jsp",
						                  dataType:"json",
						                  type:"GET", 
						                  data:params, 
						                  cache:false,
						                  success:function (data, textStatus, jqXHR){
						                	  // alert( data.tic_pic_in.replaceAll("\"", "\'")  );  
						                	  // alert( data.tic_pic_in   );  
						                	  // $("<div><h1>힘들다</h1></div>").insertAfter($("#mdetail_unfold"))
						                	  // $('.main_img').html( """+ data.tic_pic_in.replaceAll(""","'") + """);
						                	  // $('.main_img').html( "<h1>힘들다 너무 내가 프로젝트를 너무 많이 한다.</h1>");
						                	  $(".main_img").append(data.tic_pic_in);
						                	
						                  }
						              } );
						       
							   }) // click
						   }); 			             
          				</script>          				
					</div>

					


					<div style="margin-top: 25px;">
						<div class="viewpage_noti">유의사항</div>
						<div class="viewpage_text radius_box">${idto.info_note}</div>
					</div>

					<!--------- 장소안내 --------->
					<div style="margin-top: 25px;">
						<div class="viewpage_noti">장소안내</div>
						<div class="viewpage_text radius_box"
							style="border-radius: 10px 10px 0 0;">
							<p>· 장소: ${pdto.place}</p>
							<p>· 주소: ${pdto.place_add}</p>
							<p>· 주차: ${pdto.place_park}</p>
						</div>
						
						<div align="center" style="margin-top: 10px;">
						
						<div id="map" style="width:100%;height:400px"></div>
			


			<script>
				var map;
			
				function initMap() {
			  	map = new google.maps.Map(document.getElementById("map"), {
				    center: new google.maps.LatLng(${pdto.place_lat}, ${pdto.place_lon}),
				    zoom: 15,
			  });
			  	
			  	var myIcon = {
			  		    url: '/timeticket/timeticket/detail/images/default-marker.png',
			  		    size: new google.maps.Size(50, 50),
			  		    origin: new google.maps.Point(0, 0),
			  		    anchor: new google.maps.Point(25, 25)
			  		  };
			  	
			  	var marker = new google.maps.Marker({
	                position: new google.maps.LatLng(${pdto.place_lat}, ${pdto.place_lon}), 
	                map: map,
	                icon: myIcon
	            });
			}
			</script>
			
			<script src="https://maps.googleapis.com/maps/api/js?
			key=AIzaSyASJkVY1x-BDuG1ySeXbNePbgZ25se-P6w&callback=initMap" 
			async defer></script>
									
				    
									
			</div>
	</div>

					<!--------- 판매정보 --------->
					<div style="margin-top: 25px; margin-bottom: 25px;">
						<div class="viewpage_noti">판매정보</div>

						<div class="viewpage_text border_box">
							<div class="viewpage_flex">
								<div>주최/주관</div>
								<div>${idto.info_host}</div>
							</div>
							<div class="viewpage_flex">
								<div>문의전화</div>
								<div>📞 ${idto.info_num}</div>
							</div>
							<c:if test="${not empty idto.info_link}">
							<div class="viewpage_flex" >
								<div>문의링크</div>
								<div>
									🔗 <a href="${idto.info_link}" target="_blank"
										style="text-decoration: underline;">${idto.info_link}</a>
								</div>
								</div>
								</c:if>
							
							<div class="viewpage_flex">
								<div>환불규정</div>
								<div>
									<a href="#tab_view" onClick="loadTab(4, this)"><span>환불규정
											바로가기</span></a>
								</div>
							</div>
							<div class="viewpage_flex">
								<div>환불방법</div>
								<div>마이티켓 &gt; 예매내역에서 직접 취소</div>
							</div>

						</div>
					</div>

				</div>
			</div>
			
		</section> 
		
		
			
	</div>
  </div>
  	

	<div class="scroll-up visible">
    	<img src="/timeticket/timeticket/detail/images/btn_scrollup.png">
  	</div>


<script>
    // 클릭시 scroll 이동
    function moveToSection() {
      setTimeout(() => { // setTimeout 함수를 사용해서 스크롤 동작을 200밀리초 (0.2초) 후에 실행
        let topAreaHeight = (document.querySelector('.top_info_section').scrollHeight) + 
        (document.querySelector('.detail_back').scrollHeight); // 스크롤할 섹션의 높이를 계산 
          window.scroll({ // 실제 스크롤 기능을 수행 : 이 함수에는 스크롤 동작을 제어하는 다양한 옵션이 포함
            behavior: 'smooth', // 부드러운 스크롤
            left: 0, // 가로 방향 스크롤을 0으로 설정
            top: topAreaHeight - 50 // 스크롤할 섹션의 상단 위치를 설정
          });
      }, 200);
    }

    // scroll-up
    const scrollUp = document.querySelector('.scroll-up'); //scroll-up 클래스를 가진 요소를 찾아 scrollUp 변수에 할당
    document.addEventListener('scroll', () => {
      if (window.scrollY > 500) {
        scrollUp.classList.add('visible');
      } else {
        scrollUp.classList.remove('visible');
      }
    });
    scrollUp.addEventListener('click', () => {
      document.documentElement.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
    });
</script>



</body>
</html>