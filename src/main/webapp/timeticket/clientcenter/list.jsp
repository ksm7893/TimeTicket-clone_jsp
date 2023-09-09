
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel='stylesheet' type='text/css'
	href='<%=contextPath%>/timeticket/css/common.css' />
<!-- 페이지별 선언 : css / js -->

<style>
/* 좌우 영역 나누기 */
.mypage_wrap {
	width: 1100px;
	margin: auto;
	margin-top: 40px;
}

.mypage_left_wrap {
	float: left;
	width: 180px;
	padding: 40px 30px 0 30px;
	background: #fff;
	border-radius: 10px;
}

.mypage_left_wrap ul {
	list-style: none;
	border-top: 1px solid #dddddd;
	margin-top: 25px;
	padding-top: 15px;
}

.mypage_left_title {
	font-size: 24px;
	font-weight: 700;
	color: #555;
}

.mypage_left_sub {
	font-size: 18px;
	font-weight: 700;
	padding: 12px 0;
	cursor: pointer;
}

.mypage_left_sub_on {
	color: #ff4b4b;
	font-weight: 700;
}

.mypage_left_sub_off {
	color: #333;
	font-weight: 400;
}

.mypage_right_wrap {
	float: right;
	width: 780px;
	min-height: 500px;
	padding: 40px 30px;
	background: #fff;
	border-radius: 10px;
}

.mypage_right_title {
	font-size: 24px;
	font-weight: 700;
	color: #555;
}

/* 리스트, 컨텐츠 영역 */
.bbs_list_header {
	list-style: none;
	margin-top: 24px;
	height: 40px;
	background: #eee;
}

.bbs_list_header li {
	float: left;
	padding-top: 11px;
	text-align: center;
	font-size: 15px;
	color: #333;
	font-weight: 600;
}

.bbs_list_contents {
	list-style: none;
}

.bbs_list_contents li {
	float: left;
	padding: 12px 0;
	text-align: center;
	font-size: 13px;
	border-bottom: 1px dotted #e2e2e2;
}

.bbs_list_paging {
	padding: 40px 0 10px 0;
	text-align: center;
}

.bbs_detail_header {
	list-style: none;
	margin-top: 25px;
	height: 62px;
	border-bottom: 1px solid #e2e2e2;
	border-top: 3px solid #ff4b4b;
}

.bbs_detail_header li {
	float: left;
	padding: 20px 0 20px 10px;
	text-align: left;
	font-weight: 600;
	font-size: 18px;
}

.bbs_detail_contents {
	padding: 30px 10px;
	text-align: left;
	font-size: 15px;
	line-height: 1.6em;
	font-weight: 400;
}

.cs_flow {
	color: #fff;
	font-size: 13px;
	padding: 3px 8px;
	border-radius: 20px;
}

.flow0 {
	background: #ccc;
}

.flow10 {
	background: #ff4b4b;
}

.flow20 {
	background: #3E90FF;
}

.flow30 {
	background: #555;
}
</style>


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
<!-- 이미지스타일 -->
<style>
.bbs_list_faq_top_wrap {
	width: 100%;
	border: 1px solid #fddede;
	background: #fff9f9;
	border-radius: 10px;
	margin-bottom: 20px;
}

.bbs_list_faq_top {
	padding: 30px;
	display: flex;
	justify-content: space-around;
}

.bbs_list_faq_top li {
	width: 210px;
	text-align: center;
	font-size: 16px;
	cursor: pointer;
}

.bbs_list_faq_q {
	font-weight: 700;
	color: #ff4b4b;
	padding-right: 3px;
	font-size: 22px;
	vertical-align: -1px;
}

.bbs_list_faq_top img {
	width: 82px;
	height: 83px;
}
</style>

</head>



<body style="background: #f4f4f4; height: auto;">

	<div class="mypage_wrap">

		<!------------- S : 왼쪽 메뉴 영역 ----------->
		<div class="mypage_left_wrap" style="height: 837px;">

			<div class="mypage_left_title">고객센터</div>

			<ul>
				<li
					onclick="location.href='<%=contextPath%>/timeticket/clientcenter/list.do?tb=board_notice'"
					class="mypage_left_sub"><span class="mypage_left_sub_off">공지사항</span>
				</li>
				<li
					onclick="location.href='<%=contextPath%>/timeticket/clientcenter/list.do?tb=board_faq'"
					class="mypage_left_sub"><span class="mypage_left_sub_on">자주
						묻는 질문</span></li>
				<li onclick="location.href='bbs_list.php?tb=board_private'"
					class="mypage_left_sub"><span class="mypage_left_sub_off">1:1문의</span>
				</li>
			</ul>
		</div>


		<script>
   let ptb = '${param.tb}';
   console.log( ptb )
   $(".mypage_left_wrap ul li span").removeClass();
   if(   ptb == 'board_notice'){
      $(".mypage_left_wrap ul li span").first().addClass("mypage_left_sub_on");
   } else if( ptb == "" ||   ptb == 'board_faq'){
      $(".mypage_left_wrap ul li span").eq(1).addClass("mypage_left_sub_on");
   }else if(   ptb == 'board_private'){
      $(".mypage_left_wrap ul li span").last().addClass("mypage_left_sub_on");
   }
   

   $("ol li").on("click", function (){
      /* list.do?tb=board_notice 
            list.do?tb=board_faq 
            list.do?tb=board_private */ 
      let param = $(this).text();
            let url = "list.do?tb=board_faq"
      if(param=="공지사항")
            url +="board_notice";
      else   if(param=="자주 묻는 질문")
               url += "board_faq";
      else if(param=="1:1 문의")
               url += "board_private";

      location.href= url;
   });
</script>

		<!------------- E : 왼쪽 메뉴 영역 ----------->




		<!------------- S : 오른쪽 컨텐츠 영역 ----------->

		<div class="mypage_right_wrap">
			<c:if test='${ param.tb eq "board_notice"  }'>
				<div class="mypage_right_title">공지사항</div>
			</c:if>
			
			
			<c:if test='${ ( empty param.tb )  ||  ( param.tb eq "board_faq" )  }'>
			    
				<div class="mypage_right_title"> 자주묻는질문</div>
				<!-- <div>디자인 부분</div> -->
				<style>
	.bbs_list_faq_top_wrap { width: 100%; border:1px solid #fddede; background:#fff9f9; border-radius:10px;margin-bottom:20px; }
	.bbs_list_faq_top { padding:30px; display:flex; justify-content: space-around;}
	.bbs_list_faq_top li { width:210px; text-align:center; font-size:16px; cursor:pointer; }
	.bbs_list_faq_q { font-weight:700; color:#ff4b4b; padding-right:3px; font-size:22px; vertical-align: -1px; }
  .bbs_list_faq_top img { width:82px; height:83px; }
</style>
					<div style="margin-top:25px;"></div>
					<div class="bbs_list_faq_top_wrap"> 				
						<ul class="bbs_list_faq_top">
							<li onclick="location.href= '<%=contextPath%>/timeticket/clientcenter/view.do?freq_code=fq_6 '">
								<div>
									<img src="/timeticket/timeticket/images/icon_circle_refund.png">
								</div>
								<div>
									<span class="bbs_list_faq_q">Q</span> 환불/취소는 어떻게 하나요?
								</div>
							</li>
							<li onclick="location.href= '<%=contextPath%>/timeticket/clientcenter/view.do?freq_code=fq_7 '">
								<div>
									<img src="/timeticket/timeticket/images/icon_circle_ticket.png">
								</div>
								<div>
									<span class="bbs_list_faq_q">Q</span> 기간내 사용하지 못하면?
								</div>
							</li>
							<li onclick="location.href= '<%=contextPath%>/timeticket/clientcenter/view.do?freq_code=fq_8 '">
								<div>
									<img src="/timeticket/timeticket/images/icon_circle_paper.png">
								</div>
								<div>
									<span class="bbs_list_faq_q">Q</span> 영수증은 어떻게 발급받나요?
								</div>
							</li>
						</ul>
						</div>
			</c:if>
<div class="clear"></div>


			<div style="margin-top: 17px;">
				<c:if test='${ param.tb eq "board_notice"  }'>
					<!-- 공지사항 내용 출력 -->

					<div style="margin-top: 17px;">
						<ul class="bbs_list_header">
							<li style="width: 75px;">번호</li>
							<li style="width: 500px;">제목</li>
							<li style="width: 90px">작성일</li>
						</ul>

						<ul class="bbs_list_contents">
							<table width="100%" cellpadding="0" cellspacing="0" border="0">
								<tbody>
									<c:forEach items="${ list }" var="dto">
										<tr>
											<td><a
												href="<%= contextPath %>/timeticket/clientcenter/gview.do?noti_num=${  dto.noti_num }">
													<li
													style="width: 75px; padding: 18px 0; font-size: 15px; font-weight: 300;">
														${ dto.order_num }</li> <!-- 노티넘을 새로운 이름으로 바꾸고 dto 추가 -->
													<li
													style="width: 555px; padding: 18px 0px 18px 15px; font-size: 15px; font-weight: 300; text-align: left;"
													onmouseover="this.style.textDecoration='underline'"
													onmouseout="this.style.textDecoration=''">${ dto.noti_title }</li>
													
													<li style="width: 135px; padding: 18px 0; font-size: 15px; font-weight: 300;">${ dto.noti_date }</li>
											</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</ul>
						<!-- 공지사항출력끝 -->
				</c:if>
				<!--  c -->
				<c:if
					test='${ ( empty param.tb )  ||  ( param.tb eq "board_faq" )  }'>

					<!-- 자주 묻는 질문 출력 시작 -->
					<ul class="bbs_list_header">
						<li style="width: 75px;">번호</li>
						<li style="width: 500px;">제목</li>
					</ul>
					<ul class="bbs_list_contents">
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tbody>
								<c:forEach items="${ list }" var="pdto">
									<tr>
										<td><a
											href="<%= contextPath %>/timeticket/clientcenter/view.do?freq_code=${ pdto.freq_code }">

												<li style="width: 75px; padding: 18px 0; font-size: 15px; font-weight: 300;">
													${ pdto.order_num }</li>

												
												<li style= "width: 555px; padding: 18px 0px 18px 15px; font-size: 15px; font-weight: 300; text-align: left;"
												onmouseover="this.style.textDecoration='underline'"
												onmouseout="this.style.textDecoration=''">
													<%-- ${ pdto.freq_cont} --%>${ pdto.freq_name }</li>
										</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</ul>
					<!-- 자주 묻는 질문 출력 끝 -->

				</c:if>


<div class="bbs_list_paging" ">
	<style type="text/css">
#page {
	text-align: center;
}

#page a, div#page b {
	border: 1px solid #d9d9d9;
	color: #999;
	font: 12px;
	padding: 4px 10px;
	margin: 0 1px;
	background: #fff;
}

#page a:hover {
	text-decoration: none;
	color: #000;
	background: #e2e2e2;
}

#page a.prev {
	width: 70px;
	padding-left: 10px;
}

#page a.prev:hover {
	
}

#page a.next {
	width: 70px;
	padding-right: 10px;
}

#page a.next:hover {
	
}

#page b.now {
	border: 1px solid #ffaaaa;
	color: #ff4b4b;
	font-weight: bold;
}
</style>

<div id="page">
						<!--  페이징 스타일
         <span onclick="location.reload();" style="cursor:pointer"><b class="now">1</b></span><a href="/bbs_list.php?tb=board_notice&amp;pg=2&amp;number=&amp;category=" class="pgnum">2</a><a href="/bbs_list.php?tb=board_notice&amp;pg=3&amp;number=&amp;category=" class="pgnum">3</a><a href="/bbs_list.php?tb=board_notice&amp;pg=4&amp;number=&amp;category=" class="pgnum">4</a><a href="/bbs_list.php?tb=board_notice&amp;pg=5&amp;number=&amp;category=" class="pgnum">5</a>..<a href="/bbs_list.php?tb=board_notice&amp;pg=6&amp;number=&amp;category=" class="next">다음</a></div></div>
          -->
					</div>
				</div>
				<div></div>
			</div>

			<!------------- E : 오른쪽 컨텐츠 영역 ----------->


			<div class="pagination">

				<c:if test="${ pdto.prev }">
					<a
						href="<%= contextPath %>/timeticket/clientcenter/list.do?tb=${param.tb }&currentpage=${ pdto.start - 1 }">
						&laquo; </a>
				</c:if>

				<c:forEach begin="${ pdto.start }" end="${ pdto.end }" step="1"
					var="i">
					<c:if test="${ pdto.currentPage eq i }">
						<a href="#" class="active"> ${ i } </a>
					</c:if>

					<c:if test="${ pdto.currentPage ne i }">
						<a
							href="<%= contextPath %>/timeticket/clientcenter/list.do?tb=${param.tb }&currentpage=${ i }">
							${ i } </a>
					</c:if>

				</c:forEach>

				<c:if test="${ pdto.next }">
					<a
						href="<%= contextPath %>/timeticket/clientcenter/list.do?tb=${param.tb }&currentpage=${ pdto.end + 1 }">
						&raquo; </a>
				</c:if>
			</div>
		</div>
	</div>


	<script>
  const rightSection = document.querySelector('.mypage_right_wrap');
  const leftSection = document.querySelector('.mypage_left_wrap');
  if (leftSection.scrollHeight !== rightSection.scrollHeight) {
    leftSection.setAttribute('style', 'height: ' + (rightSection.scrollHeight - 40) + 'px;');
    setInterval(() => {
      leftSection.setAttribute('style', 'height: ' + (rightSection.scrollHeight - 40) + 'px;');
    }, 10);
  }
</script>

</body>
</html>