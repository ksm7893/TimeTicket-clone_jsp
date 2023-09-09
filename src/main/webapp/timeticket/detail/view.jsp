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
			
			
<!-- 메뉴영역 버튼 클릭시 에이작스 -->



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
				<c:if test="${ vdto.new_bar <= 7 }">
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
						<span style="font-size: 14px; color: #555; font-weight: 400;">
						오늘은 마감되었어요. 내일을 기다려주세요!
						</span>
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
						<span>${ vdto.reg_name }</span>
						<span>${ vdto.scate_name }</span>
					</div>
					</c:when>
					<c:when test="${vdto.lcate_name eq '클래스'}">
					<div class="icon">
						<span>${ vdto.reg_name }</span>
						<span>${ vdto.lcate_name }</span>
					</div>
					</c:when>
					<c:otherwise>
					<div class="icon">
						<span>${ vdto.reg_name }</span>
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
					<c:when test="${vdto.lcate_name eq '공연' || vdto.lcate_name eq '클래스'}">
					<div class="sale_info">
						<p class="sale_p">최대 ${ vdto.gwon_sale }% 할인</p>					
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
					<c:otherwise>
					<div class="sale_info">
						<p class="sale_p">최대 ${ vdto.gwon_sale }% 할인</p>					
					</div>
					<div class="price_info">
						<span class="sale_price">
						<fmt:formatNumber value="${ vdto.sale_pay }" pattern="#,###원" />
						</span>			
					</div>
					</c:otherwise>
					</c:choose>
					
				</div>
			</div>
		</div>


		<!-------- 우측 옵션선택영역 시작(민종오빠 부분) -------->
		
		<section style="float: right; width: 307px;">
		<div id="calendar_popup" class="calendar_popup_02" style="">
			<div class="popup_warp">
				<div id="datepicker"	style="background: #fff; border-radius: 10px; min-height: 230px;" class="hasDatepicker">
					<div class="ui-datepicker-inline ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" 	style="display: block;">
						<div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all">
							<a class="ui-datepicker-prev ui-corner-all" href="javascript:prevCalendar();" title="Prev">
							<span class="ui-icon ui-icon-circle-triangle-w" data-handler="prev" data-event="click"></span></a> 
							<a href="javascript:nextCalendar();" class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click" title="Next"> 
							<span class="ui-icon ui-icon-circle-triangle-e"></span>	</a>
							<div class="ui-datepicker-title">
								<!-- 년도들어가는곳 -->
								<span class="ui-datepicker-year"></span>. 
								<span class="ui-datepicker-month"></span>
								<!-- 월 들어가는곳 -->
							</div>
						</div>
						
						<table class="ui-datepicker-calendar">
							<thead>
								<tr>
									<th scope="col" class="ui-datepicker-week-end"><span
										title="일">일</span></th>
									<th scope="col"><span title="월">월</span></th>
									<th scope="col"><span title="화">화</span></th>
									<th scope="col"><span title="수">수</span></th>
									<th scope="col"><span title="목">목</span></th>
									<th scope="col"><span title="금">금</span></th>
									<th scope="col"><span title="토">토</span></th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>
			</section>
			
			
<script>
window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
let today = new Date();     // 페이지를 로드한 날짜를 저장
today.setHours(0,0,0,0);    // 비교 편의를 위해 today의 시간을 초기화



// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
function buildCalendar() {

    let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
    let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날
	
    let tbody_Calendar = document.querySelector(".ui-datepicker-calendar > tbody");
    // 연도 숫자 갱신
    $(".ui-datepicker-year").text(nowMonth.getFullYear());
    // 월 숫자 갱신
	$(".ui-datepicker-month").text(leftPad(nowMonth.getMonth() + 1));
    
    while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
        tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
    }

    let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

    for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
        let nowColumn = nowRow.insertCell();        // 열 추가
    }

    for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

        let nowColumn = nowRow.insertCell();        // 새 열을 추가하고

    
        if (nowDay.getDay() == 0) {                 // 일요일인 경우 글자색 빨강으로
            nowColumn.style.color = "#DC143C";
        	nowColumn.className+="ui-datepicker-week-end";
        }
        if (nowDay.getDay() == 6) {                 // 토요일인 경우 글자색 파랑으로 하고
            nowColumn.style.color = "#0000CD";
            nowColumn.className+="ui-datepicker-week-end";        
            nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
        }


        if (nowDay < today) {                       // 지난날인 경우
            nowColumn.className += " ui-datepicker-unselectable ui-state-disabled undefined";
        	nowColumn.innerHTML="<span class='ui-state-default'>"+nowDay.getDate()+"</span>";
        }
        else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
            nowColumn.className += " undefined ui-datepicker-today";
        	nowColumn.setAttribute("data-handler", "selectDay");
        	nowColumn.setAttribute("data-event","click");
        	nowColumn.setAttribute("data-month",nowDay.getMonth());
        	nowColumn.setAttribute("data-year",nowDay.getFullYear());
            nowColumn.innerHTML="<a class='ui-state-default  ui-state-highlight ui-state-active' href='#' aria-current='false' data-date='"+nowDay.getDate()+"'>"+nowDay.getDate()+"</a>";
            nowColumn.onclick = function () { choiceDate($(this).children("a")); }
        }
        else {                                      // 미래인 경우
            nowColumn.className += " undefined";
            nowColumn.setAttribute("data-handler", "selectDay");
        	nowColumn.setAttribute("data-event","click");
        	nowColumn.setAttribute("data-month",nowDay.getMonth()+1);
        	nowColumn.setAttribute("data-year",nowDay.getFullYear());
            nowColumn.innerHTML="<a class='ui-state-default' href='#' aria-current='false' data-date='"+nowDay.getDate()+"'>"+nowDay.getDate()+"</a>";
            nowColumn.onclick = function () { choiceDate($(this).children("a")); }
        }
    }
}
// 날짜 선택
function choiceDate(nowColumn) {
    if ($("a[aria-current=true]").attr("aria-current") == 'true') {  // 기존에 선택한 날짜가 있으면
    	$("a[aria-current=true]").attr("aria-current","false");  // 해당 날짜의 "choiceDay" class 제거
    }
    if($("a.ui-state-active").length != 0){
    	$("a.ui-state-active").removeClass("ui-state-active"); 
    }
    nowColumn.addClass(" ui-state-active"); //클래스 추가
    nowColumn.attr("aria-current","true");// 선택된 날짜에 "aria-current를 true" 변경
    $("div.time_select").attr("style","display:block");
    var year = $(".ui-state-active").parent().data("year");
    var month = $(".ui-state-active").parent().data("month");
    var date = $(".ui-state-active").data("date");
    console.log(year+""+month+""+date);
    //var params="year="+year+"&month="+month+"&date="+date+"&tic_code="+${param.tic_code};
    var params="year="+year+"&month="+month+"&date="+date+"&tic_code=${param.tic_code}";
	$.ajax({
        url:"<%=contextPath%>/timeticket/view/calendar.ajax",
        dataType:"json",
        type:"GET", 
        data:params, 
        cache:false,
        success:function (data, textStatus, jqXHR){
        	$(".time_select > .selectbox_title")
									.empty()
									.text("시간선택")
        	$(data.otime).each(function(i, elem) {
        		let otime = `<button type='button' id='time_btn' class='time_btn' onclick=timebtn(this) value='\${elem}'>
        						<span class='option_title'>\${elem}</span>
        					</button>`
        		$("div.time_select> .selectbox_title").append(otime);
        	})
        	$("div.time_select> .selectbox_title").hide().fadeIn();
        	$('.title2_select').css('display', 'none');
        	$('.choice_select').css('display', 'none');
            $('.title2_select').css('display', 'none');
            $('.submit_btn button').addClass('disabled');
        }, 
        error:function (){alert('에러발생~~~');}
	     })//ajax 
    
}	//choiceDate(nowColumn)

// 이전달 버튼 클릭
function prevCalendar() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
    buildCalendar();    // 달력 다시 생성
}
// 다음달 버튼 클릭
function nextCalendar() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
    buildCalendar();    // 달력 다시 생성
}
// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
function leftPad(value) {
    if (value < 10) {
        value = "0" + value;
        return value;
    }
    return value;
}
</script>



<script>
	function timebtn(id){
		$("div.title2_select").attr("style","display:block");
		var year = $(".ui-state-active").parent().data("year");
	    var month = $(".ui-state-active").parent().data("month");
	    var date = $(".ui-state-active").data("date");
	    var time = id.value
	    var param = "year="+year+"&month="+month+"&date="+date+"&tic_code=tic_1&time="+time;
		$.ajax({
	        url:"<%=contextPath%>/view/calendar.ajax",
	        dataType:"json",
	        type:"GET", 
	        data:param, 
	        cache:false,
	        success:function (data, textStatus, jqXHR){
	        	$(".title2_select > .selectbox_title")
	        											.empty()
	        											.text("권종선택");
	        	$(data.gwon).each(function(i, elem) {

	        		let gwon =`<button type='button' class='title2_btn \${param.tic_code}' name='\${param.tic_code}' value='\${data}' onclick=ticCnt(\${year},\${month},\${date},'\${time}','\${elem.gwon_name}',\${elem.gwon_count},\${elem.tic_price},this)>
	        			<span class='option_title' value='\${elem.gwon_name}'>\${elem.gwon_name}</span>
	        			<span class='title2_left' value='\${elem.gwon_count}'>남은티켓 \${elem.gwon_count}매</span>
	        			<span class='title2_price' value='\${elem.tic_price}'>\${elem.tic_price}원</span>
	        		</button>`
	        		$(".title2_select > .selectbox_title").append(gwon);
	        	})
	        	$(".title2_select > .selectbox_title").hide().fadeIn();

	        }, 
	        error:function (){alert('에러발생~~~');}
		     })//ajax 
}
	function ticCnt(year,month,date,time,gwon_name,gwon_count,tic_price,id){
		let seldate = new Date();
		seldate.setFullYear(year);
		seldate.setMonth(month-1);
		seldate.setDate(date);
		let day;
		switch (seldate.getDay()) {
		case 0:
			day="[일]";
			break;
		case 1:
			day="[월]";
			break;
		case 2:
			day="[화]";
			break;
		case 3:
			day="[수]";
			break;
		case 4:
			day="[목]";
			break;
		case 5:
			day="[금]";
			break;
		case 6:
			day="[토]";
			break;
		}
		if(!id.classList.contains('active')){
		$(".choice_select").attr("style","display:block");
		$(".select_list")
						.append($("<div></div>").attr({class:"select_item",id:""})
														/* .append($("<input></input>").attr({type:"hidden",name:"gwon",value:""}))
														.append($("<input></input>").attr({type:"hidden",name:"tic_code",value:"${param.tic_code}"}))
														.append($("<input></input>").attr({type:"hidden",name:"gwon",value:""})) */
														.append($("<div></div>").attr({class:"select_name",style:"float:left;"})
																						.text(month+"."+date+day+" "+time+" "+gwon_name))
														.append($("<div></div>").attr({style:"float:right;display: inline-block;"})
																						.append($("<a></a>").attr({href:"#item_close",class:"close","data-store":""})
																													.append($("<span></span>").attr({class:"remove_ticket",style:"font-size:14px; border:1px solid #888; border-radius:5px; width:16px; padding:0 6px; color:#fff; background:#888;",value:"17900"})
																																							.text("X"))))
														.append($("<div></div>").attr({style:"clear:both;"}))
														.append($("<div></div>").attr({class:"price_warp"})
																						.append($("<div></div>").attr({class:"quantity"})
																														.append($("<button></button>").attr({type:"button",class:"remove_ticket",value:""})
																																									.append($("<img>").attr({src:'<%=contextPath%>/images/btn_minus_square.png'})))
																														.append($("<span></span>").attr({class:"selected_quantity"})
																																								.text("1"))
																														.append($("<button></button>").attr({type:"button",class:"add_ticket",value:""})
																																									.append($("<img>").attr({src:'<%=contextPath%>/images/btn_plus_square.png'}))
																														))
																						.append($("<p></p>").attr("class","price")
																													.text(tic_price)
																													.append($("<input></input>").attr({type:"hidden",name:"tic_code",value:'${param.tic_code}'}))
																													.append($("<input></input>").attr({type:"hidden",class:"item_price",value:tic_price}))
																													.append($("<input></input>").attr({type:"hidden",name:"item_jaego",class:"item_jaego",value:gwon_count}))
																													.append($("<input></input>").attr({type:"hidden",name:"date",class:"cate_date",value:seldate.toLocaleDateString()}))
																													.append($("<input></input>").attr({type:"hidden",name:"want_quantity[]",class:"item_ticket"}))
																													)
														))
		}//if
		id.classList.toggle('active');
		$(".submit_btn > button").removeClass("disabled");
		/* if($(".selected_quantity").length == 1){
			$(".price")
						.empty()
						.html($(".price").html() + $(".item_price").val());
		} *//* else{
			$(".price")
						.empty()
			$(".selected_quantity").each(function(i, ele) {
				$(".price")
							.text($(".item_price")[i].val()*$(".selected_quantity")[i].text());
			})
		}	 */
		alert($(".selected_quantity").text());
	}
	
	/* ajax onclick메서드 파라미터 변경해야함(year,month,date,time) 
	'year','month','date','time','\${elem.gwon_name}',\${elem.tic_price}
	*/
</script>



<script>
/* //구매할 티켓 수량 추가
$(document).on('click', '.add_ticket', function () {
  adjust_ticket('plus', this);
});

//구매할 티켓 수량 제거
$(document).on('click', '.remove_ticket', function () {
  adjust_ticket('minus', this);
});

//전체 금액
function setTotalPrice() {
  document.querySelector('.total_warp').setAttribute('style', 'display: flex;');
  let total_price = 0;
  $('.select_item .item_price').each((i, v) => {
    total_price += parseInt($(v).val());
  });
  $('.total_price').html(total_price.toLocaleString() + '원');
};

function adjust_ticket(mode, t) {
    let price = parseInt($(t).val());
    if (mode == 'plus') {
      let addedTicket = parseInt($(t).parents('.price_warp').children('.item_ticket').val());
      let jaego = parseInt($(t).parents('.price_warp').children('.item_jaego').val());
      if (addedTicket == jaego) {
        window.alert('남은 티켓 수량이 부족합니다.');
        return;
      }
      setJaego(mode, t);
      let item_price = parseInt($(t).parents('.price_warp').children('.item_price').val()) + price;
      $(t).parents('.price_warp').children('.item_price').val(item_price);
      $(t).parents('.price_warp').children('.price').html(item_price.toLocaleString() + '원');
      setTotalPrice();
    }

    if (mode == 'minus') {
      let item_price = parseInt($(t).parents('.price_warp').children('.item_price').val()) - price;
      if (item_price <= 0) {
        return;
      }
      setJaego(mode, t);
      $(t).parents('.price_warp').children('.item_price').val(item_price);
      $(t).parents('.price_warp').children('.price').html(item_price.toLocaleString() + '원');
      setTotalPrice();
    }
  };

//재고 카운트
  function setJaego(mode, t) {
    let jaegoObj = $(t).parents('.price_warp').children('.item_jaego');
    let ticket = $(t).parents('.price_warp').children('.item_ticket');
    let addedTicket = parseInt($(t).parents('.price_warp').children('.item_ticket').val());
    if (mode == 'plus') {
      if (addedTicket < parseInt(jaegoObj.val())) {
        ticket.val(addedTicket + 1);
        $(t).parents('.quantity').children('span').html(addedTicket + 1);
      }
    }
    if (mode == 'minus') {
      if (addedTicket > 1) {
        ticket.val(addedTicket - 1);
        $(t).parents('.quantity').children('span').html(addedTicket - 1);
      }
    }
  }
   */
   
   
</script>
			
				<form action="" id="regiform" name="regiform" method="post">
					<div class="time_select selectBox" style="display: none">
						<p class="selectbox_title" style="display: block;"></p>
					</div>
					<div class="title2_select selectBox" style="display:none">
						<p class="selectbox_title" style="display: block;"></p>
					</div>
					<div class="choice_select" style="display: none;">
						<p class="title">수량선택</p>
						<div class="select_list">
						
						</div>
					</div>
					<div class="submit_btn">
						<%-- <button href="<%=contextPath %>/timeticket/pay.do?year=2023&month=06&date=20&time=19:00&gwon_name=타임세일&tic_price=24000&tic_count=1" class="disabled">결제하기</button>
 --%>					</div>
				</form>
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
									<div class="review_text_area" id="text_862432">
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



<!-- 나중에 지울거 -->

<div style="background-color: #ffffff; border-top: 1px solid #eee;">

  <div style="width: 1100px; margin: auto; display:flex; padding: 40px 0;">
    <!-- 1열 -->
    <div style="width:290px; border-right: 1px solid #e5e5e5">
      <div style="font-size:20px; font-weight:600; color:#000;">
        <a href="https://timeticket.co.kr/bbs_list.php?tb=board_faq">
          고객센터 <span style="vertical-align:1px; padding-left:3px;">&gt;</span>
        </a>
      </div>
      <div style="font-size:24px; font-weight:800; color:#000; margin-top:20px;">
        1599-3089
      </div>
      <div style="font-size:14px; color:#444; margin-top:7px;">
        월-금 10:00-18:00 (주말·공휴일 휴무)
      </div>
      <div>
        <img src="img/logo/logo_web3.png" style="width:140px; margin-top:57px;">
      </div>
    </div>

    <!-- 2열 -->
    <div style="width:260px; margin-left:30px; border-right: 1px solid #e5e5e5" "="">
      <div class="bottom_menu">
        <a href="https://timeticket.co.kr/section.php?page=company">회사소개</a>
      </div>
      <div class="bottom_menu">
        <a href="https://timeticket.co.kr/html_file.php?file1=default.html&amp;file2=user_stipulation.html">이용약관</a>
      </div>
      <div class="bottom_menu">
        <a href="https://timeticket.co.kr/html_file.php?file1=default.html&amp;file2=user_defend.html">개인정보처리방침</a>
      </div>
      <div class="bottom_menu" style="color:#ff4b4b; font-weight:700;">
        <a href="https://timeticket.co.kr/section.php?page=partner" style="color:#ff4b4b;">제휴문의</a>
      </div>
      <div class="bottom_menu" style="margin-bottom:0;">
        <a href="https://timeticket.co.kr/bbs_list.php?tb=board_notice">공지사항</a>
      </div>
    </div>

    <!-- 3열 -->
    <div style="margin-left:30px;">

      <div class="bottom_btns">
        <a href="https://timeticket.co.kr/bbs_list.php?tb=board_faq">
          <!-- <div>🤔자주묻는질문</div> -->
        </a>
        <a href="https://timeticket.co.kr/bbs_list.php?tb=board_private">
          <!-- <div>📝1:1 문의하기</div> -->
        </a>
        <a href="https://timeticket.co.kr/bbs_list.php?tb=board_notice">
          <!-- <div style="margin-right:0;">📮공지사항</div> -->
        </a>
      </div>

      <div style="margin-top:25px; font-size:14px; color:#888; line-height:160%;">
        (주)타임티켓&nbsp;|&nbsp;대표이사: 김성우&nbsp;|&nbsp;서울특별시 영등포구 영등포로22길 3-3, 201호<br>
        사업자등록번호: 105-87-89446 <a href="https://www.ftc.go.kr/bizCommPop.do?wrkr_no=1058789446" target="_blank"><span style="color:#666; text-decoration:underline; font-size:12px; vertical-align:1px; margin-left:2px;">사업자정보확인</span></a><br>
        통신판매업신고: 2021-서울금천-2574<br>
				개인정보관리책임자 : 장인범 (help@timeticket.co.kr)<br>
        Hosting by 심플렉스인터넷(주)&nbsp;&nbsp;|&nbsp;&nbsp;Copyright @ Time Ticket All Rights Reserved
      </div>

    </div>
  </div>

<!-- 지울거 여기까지 -->


</div>


</body>
</html>