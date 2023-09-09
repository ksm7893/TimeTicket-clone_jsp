<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%
	String contextPath = request.getContextPath();
%> --%>

<!DOCTYPE html>
<html>
<head>

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
<style>
div{
	position: relative;
}
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
</head>
<body>
<div style="background-color: #f6f6f6; border-top: 1px solid #eee;">

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
        <img src="/timeticket/timeticket/images/logo_web3.png" style="width:140px; margin-top:57px;">
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
          <div>🤔자주묻는질문</div>
        </a>
        <a href="https://timeticket.co.kr/bbs_list.php?tb=board_private">
          <div>📝1:1 문의하기</div>
        </a>
        <a href="https://timeticket.co.kr/bbs_list.php?tb=board_notice">
          <div style="margin-right:0;">📮공지사항</div>
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


<!-- 웹 통계 설정파일 -->
<!--
    - bottom_copyright.html에서 이 파일을 호출함
    - login/html 폴더의 html은 bottom_copyright.html을 호출하지 않기에 직접 include 함
    - 구글, 페이스북 픽셀 등 헤더 호출형은 config.php에서 가져옴
-->

<!-- 네이버 통계 공통 적용 스크립트 , 모든 페이지에 노출되도록 설치. 단 전환페이지 설정값보다 항상 하단에 위치해야함 -->
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_48e319c7dc98";

if (!_nasa) var _nasa={};
wcs.inflow("timeticket.co.kr");

wcs_do(_nasa);
</script>


  <div class="scroll-up visible">
    <img src="/timeticket/timeticket/images/btn_scrollup.png">
  </div>

<script>
  // scroll-up
  const scrollUp = document.querySelector('.scroll-up');
    document.addEventListener('scroll', () => {
    if (window.scrollY > 500) {
      scrollUp.classList.add('visible');
    } else {
      scrollUp.classList.remove('visible');
    }
  });
  scrollUp.addEventListener('click', () => {
    document.querySelector('html').scrollIntoView({ behavior: "smooth", block: "start"});
  });

</script>
</div>


</body>


</html>