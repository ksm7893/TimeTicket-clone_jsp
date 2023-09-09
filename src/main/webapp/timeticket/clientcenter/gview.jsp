<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel='stylesheet' type='text/css' href='<%=contextPath %>/timeticket/css/common.css' />
<link rel='stylesheet' type='text/css' href='<%=contextPath %>/timeticket/css/calendar_theme.css' />
<link rel='stylesheet' type='text/css' href='<%=contextPath %>/timeticket/css/detail.css' />
<link rel='stylesheet' type='text/css' href='<%=contextPath %>/timeticket/css/layout_swiper.css' />
<link rel='stylesheet' type='text/css' href='<%=contextPath %>/timeticket/css/user_review.css' />
<!-- 페이지별 선언 : css / js -->

  <style>
    /* 좌우 영역 나누기 */
    .mypage_wrap {width:1100px;  margin:auto; margin-top:40px;}

    .mypage_left_wrap { float:left; width:180px; padding:40px 30px 0 30px; background:#fff; border-radius: 10px;}
    .mypage_left_wrap ul { list-style:none; border-top:1px solid #dddddd; margin-top:25px; padding-top:15px; }
    .mypage_left_title { font-size:24px; font-weight:700; color:#555; }
    .mypage_left_sub { font-size:18px; font-weight:700; padding:12px 0; cursor:pointer; }
    .mypage_left_sub_on { color:#ff4b4b; font-weight: 700; }
    .mypage_left_sub_off { color:#333; font-weight: 400; }

    .mypage_right_wrap { float:right; width:780px; min-height:500px; padding:40px 30px; background:#fff; border-radius: 10px; }
    .mypage_right_title { font-size:24px; font-weight:700; color:#555; }

    /* 리스트, 컨텐츠 영역 */
    .bbs_list_header { list-style:none; margin-top:24px; height:40px; background:#eee; }
    .bbs_list_header li { float:left; padding-top:11px; text-align:center; font-size:15px; color:#333; font-weight:600; }

    .bbs_list_contents { list-style:none; }
    .bbs_list_contents li { float:left; padding:12px 0; text-align:center; font-size:13px; border-bottom:1px dotted #e2e2e2; }

    .bbs_list_paging { padding:40px 0 10px 0; text-align:center; }
    .bbs_detail_header { list-style:none; margin-top:25px; height:62px; border-bottom: 1px solid #e2e2e2; border-top:3px solid #ff4b4b; }
    .bbs_detail_header li { float:left; padding:20px 0 20px 10px; text-align:left; font-weight:600; font-size:18px;}
    .bbs_detail_contents { padding:30px 10px; text-align:left; font-size:15px; line-height:1.6em; font-weight: 400;}

    .cs_flow { color:#fff; font-size: 13px; padding: 3px 8px; border-radius: 20px; }
    .flow0 { background: #ccc; }
    .flow10 { background: #ff4b4b; }
    .flow20 { background: #3E90FF; }
    .flow30 { background: #555; }

  </style>
  </head>
  
<!-- 페이징 처리 style -->
<style>
.pagination {
   margin: 0 auto;
   display: flex;
   justify-content: center;
}

.pagination a {
   color: black;
   float: left;
   padding: 4px 8px;
   text-decoration: none;
   transition: background-color .3s;
}

.pagination a.active {
   background-color: dodgerblue;
   color: white;
}

.pagination a:hover:not (.active ) {
   background-color: #ddd;
}
</style>
<style>
.searchWord {
   background-color: yellow;
   color: red;
}
</style>
<style>
.title {
   display: inline-block;
   white-space: nowrap;
   width: 90%;
   overflow: hidden;
   text-overflow: ellipsis;
}
</style> 
</head>


<body style="background:#f4f4f4; height:auto; ">
<h1>${param.tb }</h1>
  <div style="width:100%; background: #fff;">
  <div class="mypage_wrap">
    <!------------- S : 왼쪽 메뉴 영역 ----------->
    <div class="mypage_left_wrap" >
      <div class="mypage_left_title"> 
      고객센터 </div>
      
      <ul>
        <li onclick="location.href='<%= contextPath %>/timeticket/clientcenter/list.do?tb=board_notice '" class="mypage_left_sub">
                  <span class="mypage_left_sub_on">공지사항</span>
                </li>
        <li onclick="location.href='<%= contextPath %>/timeticket/clientcenter/list.do?tb=board_faq'" class="mypage_left_sub">
                  <span class="mypage_left_sub_off">자주 묻는 질문</span>
        
        <li onclick="location.href='bbs_list.php?tb=board_private'" class="mypage_left_sub">
                  <span class="mypage_left_sub_off">1:1문의</span>
                </li>
      </ul>
    </div>
<div class="mypage_right_wrap">
		
      <div class="mypage_right_title"> 공지사항 </div>

      <div style="margin-top:17px; border-bottom:1px solid #e2e2e2;">

	<ul class="bbs_detail_header">
		<li style="width:665px;">${ dto.noti_title }</li>
		<li style="width:90px; line-height:22px; font-size:14px; font-weight:400; color:#777;">${ dto.noti_date }</li>
	</ul>

	<div class="clear"></div>

	<div class="bbs_detail_contents">
		<div></div>
	
		<div>${ dto.noti_cont}</div>
			
<!-- <a href="https://timeticket.co.kr/ranking.php" style="text-decoration:underline; color:blue;">[타임티켓 랭킹] 바로가기</a></div> -->

	</div>

</div>

<div style="margin-top:20px;">
	<a href="<%= contextPath %>/timeticket/clientcenter/list.do?tb=board_notice">
	<div class="cs_btn_gray">목록</div>
</a>


</div>



    </div>

 
</body>
</html>