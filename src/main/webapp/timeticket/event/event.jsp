<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String contextPath2 = request.getContextPath();%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src='https://cdn.jsdelivr.net/npm/jquery@1.11.3/dist/jquery.min.js'></script>

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


<script type='text/javascript' src='/timeticket/timeticket/js/jquery-ui.js'></script>
<script src='https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js'></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css' />
</head>
<body>
 
 <div style="width:1100px; margin:auto; margin-bottom:30px; background: #eee;">
 <div style="width:600px; margin:0 auto; padding-top:20px;">
<div>
	<div style="margin-top:0px; width:100%;">
      <table width=100% cellpadding=0 cellspacing=0  border=0>
<tbody>
 <c:choose>
     <c:when test="${ not empty elist }">
     <c:forEach items="${elist}" var="dto">
   <tr>
      <td>
<style>
.event_list_wrap { margin:7px 0; padding:30px 30px 22px 30px; border:1px solid #ccc; border-radius: 15px; background: #fff; color:#000; text-align: left; }
.event_list_left { float:left; }
.event_list_left img { width:135px; height:190px; border-radius: 10px; border:1px solid #ddd; }
.event_list_right { height:190px; margin-left: 170px; margin-top: 7px; }
.event_list_badge { color:#fff; font-size:15px; border-radius:10px; padding:5px 12px; background:#ff4b4b; }
.event_list_title { font-weight:600; font-size:18px; letter-spacing:-0.5px; line-height:30px; }
.event_list_info_menu { color:#fff; background:#ff4b4b; border-radius:5px; padding:2px 8px; }
.event_list_info_txt { margin-left:3px; }
</style>

<a href="<%= contextPath2 %>/timeticket/event/eview.do?eve_code=${ dto.eve_code }" style="text-decoration :none;">

  <div class="event_list_wrap" style="border:2px solid #f1f1f1;">
    <!-- 본문 등록시 '포스터 이미지 URL'을 입력하면 DB에 저장했다가 가져온다 -->
    <div class="event_list_left">
<c:choose>
         <c:when test="${dto.eve_cond eq '이벤트 종료' }">
      <img src="/timeticket/timeticket/images/${ dto.tic_prof }"  style="opacity: 0.5;">
      </c:when>
         <c:otherwise>
           <img src="/timeticket/timeticket/images/${ dto.tic_prof }"  >
         </c:otherwise>
      </c:choose>
    </div>
    <div class="event_list_right">
      <div style="height:35px;">
      <c:choose>
         <c:when test="${dto.eve_cond eq '이벤트 종료' }">
         <span class="event_list_badge" style="background:#777;">${ dto.eve_cond }</span>
         </c:when>
         <c:otherwise>
         <span class="event_list_badge" style="background:#3E90FF;">${ dto.eve_cond }</span>
         </c:otherwise>
      </c:choose>
      </div>
      <div style="height:60px;"><span class="event_list_title" style="color:#777">${ dto.scate_name } &#60;${ dto.tic_name }&#62; 초대</span></div>

      <div style="font-size:14px;">
        <div style="height:32px;">
          <span class="event_list_info_menu" style="background: #ccc;">모집</span>
          <span class="event_list_info_txt">${ dto.eve_stdate } - ${ dto.eve_eddate }</span>
        </div>
        <div style="height:32px;">
          <span class="event_list_info_menu" style="background: #ccc;">대상</span>
          <span class="event_list_info_txt"> 총 ${ dto.eve_tar }쌍 (1인2매)</span>
        </div>
        <div style="height:32px;">
          <span class="event_list_info_menu" style="background: #ccc;">발표</span>
          <span class="event_list_info_txt">${ dto.eve_anno }</span>
        </div>
      </div>

    </div>
  </div>
  </a>
</td></tr>
    </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="5">등록된 이벤트가 없습니다</td>
               </tr>
            </c:otherwise>
         </c:choose>    
	 </tbody>
</table>
</div>
</div>
<table cellpadding="0" cellspacing="0" style="width:100%;">
	<tbody><tr height="0">
		<td align="right" style="padding-top:20px; padding-right:15px;"></td>
	</tr>
</tbody></table>
</div>
</div>
</body>
</html>
