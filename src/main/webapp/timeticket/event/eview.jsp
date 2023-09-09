<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">


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
	
	
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>

	<div
		style="width: 1100px; margin: auto; margin-bottom: 30px; background: #eee;">
		<div style="width: 600px; margin: 0 auto; padding-top: 20px;">
			<style>
.event_detail_badge {
	display: inline-block;
	color: #fff;
	background: #ff4b4b;
	font-size: 16px;
	border-radius: 10px;
	padding: 5px 12px;
}

.event_detail_title {
	font-size: 20px;
	font-weight: 600;
	letter-spacing: -0.5px;
	margin-top: 15px;
}

.event_section {
	background: #fff;
	border-radius: 15px;
	margin-top: 20px;
	padding: 25px 0;
}

.event_circle {
	display: inline-block;
	background: #ff4b4b;
	color: #fff;
	font-size: 16px;
	font-weight: 600;
	height: 67px;
	width: 110px;
	padding-top: 42px;
	border-radius: 100px;
}

.event_txt_wrap {
	font-size: 16px;
	text-align: left;
	margin-top: 15px;
	margin-left: 140px;
	line-height: 300%;
}

.event_txt_row .left {
	color: #ff4b4b;
	font-weight: 600;
}

.event_txt_row .right {
	margin-left: 30px;
}

.event_txt_wrap_center {
	text-align: center;
	margin-top: 15px;
	line-height: 250%;
	font-size: 16px;
}

.event_btn_wrap {
	width: 450px;
	height: 70px;
	margin: 0 auto;
	margin-top: 40px;
	box-sizing: border-box;
	border-radius: 50px;
	padding: 10px;
	display: flex;
	align-items: center;
	justify-content: space-around;
	background: linear-gradient(to right, #ff7f7f 15%, #ff6666 30%, #ff4b4b);
	color: #fff;
	box-shadow: 3px 3px 7px rgba(0, 0, 0, 0.3)
}

.event_btn_wrap .share_btn {
	width: 50%;
	cursor: pointer;
}

.event_btn_wrap .share_btn i {
	font-size: 20px;
	backgroud: #ff4b4b;
}

.event_btn_wrap .apply_buy {
	width: 50%;
	border: 0;
	font-size: 20px;
	font-weight: 600;
	cursor: pointer;
}

/* 본문 내 한 줄 강조 */
.event_bold {
	display: inline-block;
	background: #3E90FF;
	color: #fff;
	border-radius: 10px;
	padding: 0 10px;
	margin-bottom: 15px;
}
</style>

			<div
				style="margin-top: 7px; margin-bottom: 15px; padding: 30px 0; text-align: center; background: #fff; border-radius: 15px;">
				<div class="event_detail_badge" style="background: #777;">${ edto.eve_cond }

				</div>
				<div class="event_detail_title">${edto.scate_name }&lt;${ edto.tic_name }&gt;
					초대</div>
			</div>

			<div
				style="background: #eee; padding: 5px 0 50px 0; text-align: center;">

				<!-- 포스터 img -->
				<div>
					<img src="/timeticket/timeticket/images/${ edto.tic_prof }"
						style="width: 100%; border-radius: 15px;">
				</div>

				<!-- hidden section. bbs_review 예외입력 -->
				<section class="event_section">
					<div class="event_circle">안내사항</div>

					<div style="margin-top: 20px;">
						<div class="event_txt_wrap_center">
							&lt; MISSION : 당첨 확률 2X UP! &gt;<br> - 구글 플레이스토어 / 앱스토어에
							'앱리뷰'를 남겨주세요.<br> - 리뷰를 작성하면 2번 응모로 적용되어 당첨확률이 2배로 올라가요!
						</div>
					</div>
				</section>

				<!-- section. auto -->
				<section class="event_section" style="margin-top: 15px;">
					<div class="event_circle">이벤트 안내</div>

					<div class="event_txt_wrap">
						<div class="event_txt_row">
							<span class="left">응모기간</span> <span class="right">${edto.eve_stdate }
								- ${edto.eve_eddate}</span>
						</div>
						<div class="event_txt_row">
							<span class="left">당첨인원</span> <span class="right"
								style="background: #fffac9">총 ${edto.eve_tar}쌍(1인 2매)</span>
						</div>
						<div class="event_txt_row">
							<span class="left">당첨발표</span> <span class="right"
								style="background: #fffac9">${edto.eve_anno }</span><span
								style="font-size: 14px; color: #777;"> * 게시판 및 개별 공지</span>
						</div>
					</div>
				</section>

				<!-- section. is product_number -->
				<section class="event_section">
			  <div class="event_circle">이용안내</div>

    <div class="event_txt_wrap">
      <div class="event_txt_row">
        <span class="left">이용장소</span>
        <span class="right">${edto.place }</span>
      </div>
      <div class="event_txt_row">
        <span class="left">이용등급</span>
        <span class="right" style="background:#fffac9">${edto.tic_age }</span>
      </div>
      <div class="event_txt_row">
        <span class="left">세부정보</span>
 <c:forEach items="${newlist}" var="newdto" >       
        <span class="right" style="background:#fffac9"><a href="<%=contextPath %>/timeticket/detail/view.do?tic_code=${newdto.tic_code}" style="text-decoration: underline; color:#000;">상세페이지에서 확인</a></span>
 </c:forEach>
      </div>
      <div class="event_txt_row" style="display: flex; align-items: baseline;">
      </div>
    </div>
  </section>
  
  <!-- section. is 당첨자발표 -->
    <section class="event_section" style="border:1px solid #3e90ff">
    <div class="event_circle" style="background:#3E90FF;">당첨자 발표</div>

<div class="event_txt_wrap_center" style="white-space: pre; font-size:16px; width: 100%; margin-top:30px; text-align: center;">※ 응모인원 ${dto.allcount }명 / 경쟁률 ${dto.competition } 

<span class="event_bold">${edto.eve_anno}오후 7시30분</span> <!-- 추후 고정값 아닌걸로 하려면 수정필요 -->
     <c:choose>
           <c:when test="${ not empty jlist }"> 
           <c:forEach items="${ jlist }" var="jdto">
${jdto.mem_name}(${jdto.mem_num})
           </c:forEach>
           </c:when>
     </c:choose>
</div>
  </section>
  
  <!-- section. auto -->
  <section class="event_section">
    <div class="event_circle">유의사항</div>
    <div class="event_txt_wrap_center ">
      <p>초대권 판매/양도/대리수령 불가</p>
      <p>초대권 날짜/시간 변경 불가</p>
      <p>관람 당일 본인 신분증 필수 지참</p>
      <p>관람 전 공연 안내사항 필수 확인</p>
      <p style="font-size:14px; color:#777">※ 중복 응모의 경우 1회만 인정됩니다</p>
    </div>
  </section>

  <!-- section. is 응모하기 -->
  
</div>

<div></div>
<script></script>


    </div>
    </div>
    
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
    
</body>
</html>