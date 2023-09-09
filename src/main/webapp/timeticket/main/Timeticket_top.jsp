<%@page import="member.service.MemberDTO"%>
<%@page import="domain.LcateDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String contextPath3 = request.getContextPath();
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon"type="image/x-icon"href="../images/SiSt.ico">
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

<div style="width:100%; background: #fff;">
<div class="gnb_wrap" style="height:45px;">
<%
	MemberDTO meminfo = (MemberDTO)session.getAttribute("meminfo");
%>
<c:choose>
  <c:when test="${not empty sessionScope.meminfo}">
 <!-- 로그인 한 경우 -->
<div style="position:absolute; right:0;">
<script type="text/javascript">
  var timeout         = 100;
  var closetimer      = 0;
  var ddmenuitem      = 0;
  function top_gnb_open() {
    top_gnb_canceltimer();
    top_gnb_close();
    ddmenuitem = $(this).find('ul').eq(0).css('visibility', 'visible');
  }
  function top_gnb_close()
  {
  if(ddmenuitem) ddmenuitem.css('visibility', 'hidden');
  }
  function top_gnb_timer() {
    closetimer = window.setTimeout(top_gnb_close, timeout);
  }
  function top_gnb_canceltimer() {
  if(closetimer)	{
    window.clearTimeout(closetimer);
    closetimer = null;
    }
  }
  $(document).ready(function()
  {
    $('#top_gnb > li').bind('mouseover', top_gnb_open);
    $('#top_gnb > li').bind('mouseout',  top_gnb_timer);
  });
  document.onclick = top_gnb_close;
</script>

<ul id="top_gnb">
  <li style="width:143px;">
    <a href="https://timeticket.co.kr/friend_invite.php">
    <span style="border:1px solid #ff4b4b; border-radius:5px; color:#ff4b4b; letter-spacing:-0.5px; padding:2px 5px;"><img src="/timeticket/timeticket/images/icon_friend_14px.png" style="width:14px; padding-right:2px; vertical-align:-1px;">친구초대 +1000P</span>
    </a>
  </li>
  <li>
    <a href="<%=contextPath3 %>/timeticket/login/login.do?login=n" name="logout" id="logout">로그아웃</a>
  </li>
  <li>
    <a href="<%= contextPath3 %>/timeticket/mypage/review.do">
      마이티켓
    </a>
    <ul style="">
      <li><a href="<%= contextPath3 %>/timeticket/mypage/review.do">예매내역</a></li>
      <li><a href="https://timeticket.co.kr/myticket_point.php?mode=point">포인트내역</a></li>
      <li><a href="https://timeticket.co.kr/myticket.php?mode=modify">회원정보</a></li>
    </ul>
  </li>
  <li>
    <a href="<%= contextPath3 %>/timeticket/clientcenter/list.do?tb=board_faq">
      고객센터
    </a>
    <ul style="">
      <li><a href="<%= contextPath3 %>/timeticket/clientcenter/list.do?tb=board_notice">공지사항</a></li>
      <li><a href="https://timeticket.co.kr/bbs_list.php?tb=board_faq">FAQ</a></li>
      <li><a href="https://timeticket.co.kr/bbs_list.php?tb=board_private">1:1문의</a></li>
    </ul>
  </li>
</ul>
    </div>
<!-- 로그인 한 경우 끝 -->  
  </c:when>
  
  
  
  <c:otherwise>
<!-- 로그인 안 한 경우 -->
<div style="position:absolute; right:0;">
<script type="text/javascript">
  var timeout         = 100;
  var closetimer                = 0;
  var ddmenuitem      = 0;
  function top_gnb_open() {
    top_gnb_canceltimer();
    top_gnb_close();
    ddmenuitem = $(this).find('ul').eq(0).css('visibility', 'visible');
  }
  function top_gnb_close()
  {
  if(ddmenuitem) ddmenuitem.css('visibility', 'hidden');
  }
  function top_gnb_timer() {
    closetimer = window.setTimeout(top_gnb_close, timeout);
  }
  function top_gnb_canceltimer() {
  if(closetimer)	{
    window.clearTimeout(closetimer);
    closetimer = null;
    }
  }
  $(document).ready(function()
  {
    $('#top_gnb > li').bind('mouseover', top_gnb_open);
    $('#top_gnb > li').bind('mouseout',  top_gnb_timer);
  });
  document.onclick = top_gnb_close;
</script>

<ul id="top_gnb">
  <li>
    <a href="<%=contextPath3 %>/timeticket/login/login.jsp">로그인</a>
  </li>
  <li>
    <a href="<%=contextPath3 %>/timeticket/login/member.jsp">회원가입</a>
  </li>
  <li>
    <a href="<%= contextPath3 %>/timeticket/clientcenter/list.do?tb=board_faq">
      고객센터
    </a>
    <ul style="visibility: hidden;">
      <li><a href="<%= contextPath3 %>/timeticket/clientcenter/list.do?tb=board_notice">공지사항</a></li>
      <li><a href="https://timeticket.co.kr/bbs_list.php?tb=board_faq">FAQ</a></li>
      <li><a href="https://timeticket.co.kr/bbs_list.php?tb=board_private">1:1문의</a></li>
    </ul>
  </li>
</ul>
    </div>
<!-- 로그인 안 한 경우 끝 --> 
      </c:otherwise>
</c:choose> 
    </div>



  <div class="gnb_wrap" style="height:55px; padding-top:2px;">
    <a href="http://localhost/timeticket/timeticket/main/main.do">
      <img src="/timeticket/timeticket/images/logo_web.png" style="cursor:pointer; width:300px; image-rendering: optimizeQuality;" alt="로고">
    </a>
    <div style="position:absolute; top:2px; left:335px;">
      <style type="text/css">
  input:focus {outline: none;}
  .search_box {font-size:15px; height:38px; line-height:38px; padding:0 20px; vertical-align:top; border:1px solid #e0e0e0; width:240px; border-radius:20px; color:#999; background: #f9f9f9;}
</style>

<form name="frm" method="get" action="<%= contextPath3 %>/timeticket/main/search.do" onsubmit="return">
  <div style="vertical-align:top; position:relative;">
    <input type="text" name="searchword" id="search_word" value="" class="search_box">

    <div style="position:absolute; top:2px; left:230px;">
      <input name="image" type="image" src="/timeticket/timeticket/images/search_btn.png" alt="검색하기" onfocus="this.blur();" style="padding: 8px;">
    </div>
  </div>
</form>
    </div>
  </div>

  <!-- GNB 하단 -->
  <div class="gnb_wrap" style="margin-top:7px;">
    <ul class="gnb_nav">
   <c:forEach items="${llist}" var= "ldto">
      <li class="">
  		<a href="<%=contextPath3 %>/timeticket/category/list.do?lcate_code=${ldto.lcate_code}">${ldto.lcate_name}</a>
    	</li>
  	</c:forEach>
    
      <li class="nav_divide">
        |
      </li>
      <li style="padding-right:7px;">
        <a href="<%=contextPath3 %>/timeticket/sale/sale.do?type=timesale" style="color:#ff4b4b">
          타임세일
        </a>
      </li>
      <li>
        <a href="<%=contextPath3 %>/timeticket/sale/sale.do?type=todaysale" style="color:#318b14">
          오늘할인
        </a>
      </li>
      <li class="nav_divide">
        |
      </li>
      <li style="padding-right:10px;">
        <a href="<%=contextPath3 %>/timeticket/rank/rank.do">
          랭킹
        </a>
      </li>
      <li>
        <a href="<%=contextPath3 %>/timeticket/event/event.do">
          이벤트
        </a>
      </li>
    </ul>
  </div>

</div>

<%-- <script>
	$("#logout").on("click",function(){
		<%
		session.removeAttribute("meminfo");
		%>
	});
</script> --%>

</body>
</html>