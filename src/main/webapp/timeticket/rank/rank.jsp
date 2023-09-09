<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css' />
<link rel="stylesheet" type="text/css" href="<%=contextPath %>/timeticket/css/common.css" />
<link rel="stylesheet" type="text/css" href="<%=contextPath %>/timeticket/css/ranking.css" />
<style>
a{
	text-decoration: none;
	color:black;
}
</style>
<title>랭킹 - 타임티켓</title>
</head>
<body style="background-color: #000;">
<div style="margin:0 auto; position: relative;">
<c:if test="${empty param.lcate_code }">
	<div class="ranking_section_top">
		<img class="ranking_logo active" src="<%=contextPath %>/timeticket/images/bnr_ranking.png" />
		<div class="ranking_section_top_poster">
		<c:forEach items="${rList }" var="dto">
			<c:if test="${dto.bookrank eq 2 }">
			<div class="podium_poster" style="transform: translateY(60px); opacity: 1;" number=${dto.tic_code }>
				<a href="<%=contextPath%>/timeticket/detail/view.do?tic_code=${dto.tic_code}">
					<img class="product_poster" src="<%=contextPath%>/timeticket/images/${dto.tic_prof}"/>
					<img class="podium_poster_img" src="<%=contextPath%>/timeticket/images/icon_silver.png" />
					<img class="podium_poster_line" src="<%=contextPath%>/timeticket/images/icon_gradation_line.png" />
				</a>
			</div>
			</c:if>
		</c:forEach>
		<c:forEach items="${rList }" var="dto">
			<c:if test="${dto.bookrank eq 1 }">
				<div class="podium_poster" style="transform: translateY(0px); opacity: 1;" number=${dto.tic_code }>
				<a href="<%=contextPath%>/timeticket/detail/view.do?tic_code=${dto.tic_code}">
					<img class="product_poster" src="<%=contextPath%>/timeticket/images/${dto.tic_prof}"/>
					<img class="podium_poster_img" src="<%=contextPath%>/timeticket/images/icon_gold.png" />
					<img class="podium_poster_line" src="<%=contextPath%>/timeticket/images/icon_gradation_line.png" />
				</a>
				</div>
			</c:if>
		</c:forEach>
		<c:forEach items="${rList }" var="dto">
			<c:if test="${dto.bookrank eq 3 }">
				<div class="podium_poster" style="transform: translateY(90px); opacity: 1;" number=${dto.tic_code }>
				<a href="<%=contextPath%>/timeticket/detail/view.do?tic_code=${dto.tic_code}">
					<img class="product_poster" src="<%=contextPath%>/timeticket/images/${dto.tic_prof}"/>
					<img class="podium_poster_img" src="<%=contextPath%>/timeticket/images/icon_bronze.png" />
					<img class="podium_poster_line" src="<%=contextPath%>/timeticket/images/icon_gradation_line.png" />
				</a>
				</div>
			</c:if>
		</c:forEach>
		</div>
		<img src="<%=contextPath%>/timeticket/images/podium.png" style="width: 800px; margin-top: 0px;" />
	</div>
	<div class="list-warp">
		<div class="list-warp-notice">
			<div class="list-warp-notice-title">📢 집계 방식 및 기준</div>
			<div class="list-warp-notice-description">
          - 집계 대상 : 타임티켓 웹/모바일에서 판매된 티켓
          <br>
          - 집계 방식 : 상품별 판매 티켓 수 기반으로 데이터 생성
          <br>
          - 집계 기준 : 일간(지난 24시간), 주간(지난 7일), 월간(지난 달)
			</div>
		</div>
		<div class="list-warp-category">
			<a href="<%=contextPath%>/timeticket/rank/rank.do?lcate_code=all&sort=daily" id="mrank_main_all" style="color: #000;text-decoration: none;">
				<div class="list-warp-category-box">
					<div class="list-warp-category-box-icon">
						<div class="list-warp-category-box-background">
							<img src="<%=contextPath %>/timeticket/images/icon_all.png" class="list-warp-category-box-icon"/>
						</div>
					</div>
					<div class="list-warp-category-box-title">전체 랭킹</div>
					<div class="list-warp-category-box-description"></div>
				</div>
			</a>
			<a href="<%=contextPath%>/timeticket/rank/rank.do?lcate_code=lcate_1&sort=daily" id="mrank_main_perform" style="color: #000;text-decoration: none;">
				<div class="list-warp-category-box">
					<div class="list-warp-category-box-icon">
						<div class="list-warp-category-box-background">
							<img src="<%=contextPath %>/timeticket/images/icon_perform.png" class="list-warp-category-box-icon"/>
						</div>
					</div>
					<div class="list-warp-category-box-title">공연</div>
					<div class="list-warp-category-box-description">연극·뮤지컬·콘서트</div>
				</div>
			</a>
			<a href="<%=contextPath%>/timeticket/rank/rank.do?lcate_code=lcate_2&sort=daily" id="mrank_main_exhibit" style="color: #000;text-decoration: none;">
				<div class="list-warp-category-box">
					<div class="list-warp-category-box-icon">
						<div class="list-warp-category-box-background">
							<img src="<%=contextPath %>/timeticket/images/icon_exhibition.png" class="list-warp-category-box-icon"/>
						</div>
					</div>
					<div class="list-warp-category-box-title">전시</div>
					<div class="list-warp-category-box-description">미술·사진·공간</div>
				</div>
			</a>
			<a href="<%=contextPath%>/timeticket/rank/rank.do?lcate_code=lcate_3&sort=daily" id="mrank_main_activity" style="color: #000;text-decoration: none;">
				<div class="list-warp-category-box">
					<div class="list-warp-category-box-icon">
						<div class="list-warp-category-box-background">
							<img src="<%=contextPath %>/timeticket/images/icon_activity.png" class="list-warp-category-box-icon"/>
						</div>
					</div>
					<div class="list-warp-category-box-title">체험</div>
					<div class="list-warp-category-box-description">투어·여가·액티비티</div>
				</div>
			</a>
			<a href="<%=contextPath%>/timeticket/rank/rank.do?lcate_code=lcate_4&sort=daily" id="mrank_main_kids" style="color: #000;text-decoration: none;">
				<div class="list-warp-category-box">
					<div class="list-warp-category-box-icon">
						<div class="list-warp-category-box-background">
							<img src="<%=contextPath %>/timeticket/images/icon_kid.png" class="list-warp-category-box-icon"/>
						</div>
					</div>
					<div class="list-warp-category-box-title">키즈</div>
					<div class="list-warp-category-box-description">어린이공연·전시·체험</div>
				</div>
			</a>
		</div>
	</div>
</c:if>
<c:if test="${not empty param.lcate_code }">
	<div class="ranking_section">
		<div class="ranking_section_top" style="height: 430px;">
			<img src="<%=contextPath %>/timeticket/images/bnr_ranking.png" style="width: 570px; margin: 70px 0 0 0;" />
		</div>
		<div class="list-warp" style="height: auto; padding-bottom: 10px;">
			<div class="list-warp-icon">
				<a href="<%=contextPath%>/timeticket/rank/rank.do?lcate_code=all&sort=daily" id="mrank_list_all">
					<div class="list-warp-icon-all">
						<div class="list-warp-icon-background" >
							<img src="<%=contextPath%>/timeticket/images/icon_all.png" class="list-warp-icon-img" />
							<div class="list-warp-icon-title">전체</div>
						</div>
					</div>
				</a>
				<a href="<%=contextPath%>/timeticket/rank/rank.do?lcate_code=lcate_1&sort=daily" id="mrank_list_perform">
					<div class="list-warp-icon-perform">
						<div class="list-warp-icon-background">
							<img src="<%=contextPath %>/timeticket/images/icon_perform.png" class="list-warp-icon-img" />
							<div class="list-warp-icon-title">공연</div>
						</div>
					</div>
				</a>
				<a href="<%=contextPath%>/timeticket/rank/rank.do?lcate_code=lcate_2&sort=daily" id="mrank_list_exhibit">
					<div class="list-warp-icon-exhibition">
						<div class="list-warp-icon-background">
							<img src="<%=contextPath %>/timeticket/images/icon_exhibition.png" class="list-warp-icon-img" />
							<div class="list-warp-icon-title">전시</div>
						</div>
					</div>
				</a>
				<a href="<%=contextPath%>/timeticket/rank/rank.do?lcate_code=lcate_3&sort=daily" id="mrank_list_activity">
					<div class="list-warp-icon-activity">
						<div class="list-warp-icon-background">
							<img src="<%=contextPath %>/timeticket/images/icon_activity.png" class="list-warp-icon-img" />
							<div class="list-warp-icon-title">체험</div>
						</div>
					</div>
				</a>
				<a href="<%=contextPath%>/timeticket/rank/rank.do?lcate_code=lcate_4&sort=daily" id="mrank_list_kids">
					<div class="list-warp-icon-kid">
						<div class="list-warp-icon-background">
							<img src="<%=contextPath %>/timeticket/images/icon_kid.png" class="list-warp-icon-img" />
							<div class="list-warp-icon-title">키즈</div>
						</div>
					</div>
				</a>
			</div>
			<div class="list-warp-header">
				<div class="list-warp-header-title">전체</div>
				<div class="list-warp-header-sorting">
					<c:if test="${param.lcate_code ne 'lcate_3' and param.lcate_code ne 'lcate_4'}">
					<a href="<%=contextPath%>/timeticket/rank/rank.do?lcate_code=${param.lcate_code }&sort=daily" id="mrank_sort_daily">
						<div class="list-warp-header-sorting-btn daily">· 일간</div>
					</a>
					</c:if>
					<a href="<%=contextPath%>/timeticket/rank/rank.do?lcate_code=${param.lcate_code }&sort=weekly" id="mrank_sort_weekly">
						<div class="list-warp-header-sorting-btn weekly">· 주간</div>
					</a>
					<a href="<%=contextPath%>/timeticket/rank/rank.do?lcate_code=${param.lcate_code }&sort=monthly" id="mrank_sort_monthly">
						<div class="list-warp-header-sorting-btn monthly">· 월간</div>
					</a>
				</div>
			</div>
			<div class="list-warp-notice2">
					<div class="list-warp-notice-title">📢 집계 방식 및 기준</div>
					<div class="list-warp-notice-description">
					- 일간 : 지난 24시간 예매 수량을 일 단위로 집계<br>- 기준 : 2023-06-12 10:00 ~ 2023-06-13 10:00
					</div>
				</div>
			<div class="list_extraction">
				<c:forEach items="${rlList }" var="rldto" varStatus="a">
				<div class="ranking_list_rows">
				<a href="<%=contextPath%>/timeticket/detail/view.do?tic_code=${rldto.tic_code}">
					<div class="rank_thumb" alt="${rldto.tic_name }" style="background-image: url('<%=contextPath%>/timeticket/images/${rldto.tic_prof }');">
						<div class="rank_info_medal">
							<div class="medal_text" style="right: 6.9vw;">${a.count }</div>
							<img class="medal_img" src="<%=contextPath%>/timeticket/images/icon_black_medal.png" />
						</div>
					</div>
				</a>
				<a href="<%=contextPath%>/timeticket/detail/view.do?tic_code=${rldto.tic_code}">
					<div class="rank_info">
						<div class="rank_info_top">
							<div class="rank_info_category">
								<c:choose>
									<c:when test="${rldto.lcate_code eq 'lcate_1' }"> 🗂️ ${rldto.scate_name } &gt; ${rldto.gen_name }</c:when>
									<c:when test="${rldto.lcate_code eq 'lcate_3' }"> 🗂️ ${rldto.lcate_name }·여가</c:when>
									<c:otherwise>
									🗂️ ${rldto.lcate_name }
									</c:otherwise>
								</c:choose>
							</div>
							<div class="rank_info_title">${rldto.tic_name }</div>
						</div>
						<div class="rank_bottom_info">
							<div class="price">
								<p class="origin_price">${rldto.tic_price }원</p>
								<p class="sale_price">
									<span>${rldto.sale }%</span>
									<span class="baro_price">${rldto.stic_price }원</span>
								</p>
							</div>
						</div>
					</div>
				</a>
				</div>
				</c:forEach>
			</div>
		</div>
		
	</div>
</c:if>
</div>
<script>
  
  let today = new Date();
  let todaysDate = new Date();
  todaysDate.setDate(today.getDate()-1);
  let tsYear = todaysDate.getFullYear();
  let tsMonth = todaysDate.getMonth()+1;
  let tsDate = todaysDate.getDate();
  
  let teYear = today.getFullYear();
  let teMonth = today.getMonth()+1;
  let teDate = today.getDate();
  //주간 년,월,일
  let weeklyeDate = new Date();
  let weeklysDate = new Date();
  weeklyeDate.setDate(today.getDate()-1);
  let eYear = weeklyeDate.getFullYear();
  let eMonth = weeklyeDate.getMonth()+1;
  let eDate = weeklyeDate.getDate();
  
  weeklysDate.setDate(eDate-7)
  let sYear = weeklysDate.getFullYear();
  let sMonth = weeklysDate.getMonth()+1;
  let sDate = weeklysDate.getDate();
  
  //월간 년,월,일
  let monthlyToday = new Date();
  monthlyToday.setDate(1);
  let prevDate = new Date();
  prevDate.setDate(monthlyToday.getDate()-1);
  let monthlyYear = prevDate.getFullYear();
  let monthlyMonth = (prevDate.getMonth()+1);
  let monthlyDate = prevDate.getDate()
  
/*   let startDate = periodInfo.substr(22, 16);
  let endDate = periodInfo.substr(48, 16); */
  const rankingDescription = {
		  /* +year+"-"+month+"-01 00:00 ~ "+year+"-"+month+"-"+date+" 23:59" */
    '일간': "- 일간 : 지난 24시간 예매 수량을 일 단위로 집계<br>- 기준 : "+tsYear+"-"+tsMonth+"-"+tsDate+" 15:00 ~ "+teYear+"-"+teMonth+"-"+teDate+" 15:00",
    '주간': "- 주간 : 직전 7일간 예매 수량을 주 단위로 집계<br>- 기준 : "+sYear+"-"+sMonth+"-"+sDate+" 00:00 ~ "+eYear+"-"+eMonth+"-"+eDate+" 23:59",
    '월간': "- 월간 : 지난 달 1일~말일 예매 수량을 월 단위 집계<br>- 기준 : "+monthlyYear+"-"+monthlyMonth+"-1 00:00 ~ "+monthlyYear+"-"+monthlyMonth+"-"+monthlyDate+" 23:59",
  }

  const categoryIcon = document.querySelectorAll('.list-warp-icon-background');
  const sortIcon = document.querySelectorAll('.list-warp-header-sorting-btn');
  const medalIcon = document.querySelectorAll('.medal_img');
  const medalText = document.querySelectorAll('.medal_text');

  for (let i = 0; i < medalText.length; i++) {
    medalText[i].innerText = (i + 1);
    if (i === 0) {
      medalText[0].setAttribute('style', 'right: 6.9vw;')
      medalIcon[0].setAttribute('src', '<%=contextPath%>/timeticket/images/icon_gold_no.png');
    } else if (i === 1) {
      medalText[1].setAttribute('style', 'right: 6.6vw;')
      medalIcon[1].setAttribute('src', '<%=contextPath%>/timeticket/images/icon_silver_no.png');
    } else if (i === 2) {
      medalText[2].setAttribute('style', 'right: 6.5vw;')
      medalIcon[2].setAttribute('src', '<%=contextPath%>/timeticket/images/icon_bronze_no.png');
    } else if (i === 9) {
      medalText[9].setAttribute('style', 'right: 6vw;')
    } else {

    }
  }
  let type = '<%=request.getParameter("lcate_code")%>';
  let sort = '<%=request.getParameter("sort")%>';
  
  if (type === 'all') {
    categoryIcon[0].setAttribute('style', 'background-color:#ff4b4b; color:#ff4b4b; font-weight:700;');
    categoryIcon[0].children[0].setAttribute('src', '<%=contextPath%>/timeticket/images/icon_all_w.png');
  } else if (type === 'lcate_1') {
    categoryIcon[1].setAttribute('style', 'background-color:#ff4b4b; color:#ff4b4b; font-weight:700;');
    categoryIcon[1].children[0].setAttribute('src', '<%=contextPath%>/timeticket/images/icon_perform_w.png');
  } else if (type === 'lcate_2') {
    categoryIcon[2].setAttribute('style', 'background-color:#ff4b4b; color:#ff4b4b; font-weight:700;');
    categoryIcon[2].children[0].setAttribute('src', '<%=contextPath%>/timeticket/images/icon_exhibition_w.png');
  } else if (type === 'lcate_3') {
    sortIcon[0].setAttribute('style', 'display: none');
    // sortIcon[1].setAttribute('style', 'display: none');
    categoryIcon[3].setAttribute('style', 'background-color:#ff4b4b; color:#ff4b4b; font-weight:700;');
    categoryIcon[3].children[0].setAttribute('src', '<%=contextPath%>/timeticket/images/icon_activity_w.png');
  } else if (type === 'lcate_4') {
    sortIcon[0].setAttribute('style', 'display: none');
    // sortIcon[1].setAttribute('style', 'display: none');
    categoryIcon[4].setAttribute('style', 'background-color:#ff4b4b; color:#ff4b4b; font-weight:700;');
    categoryIcon[4].children[0].setAttribute('src', '<%=contextPath%>/timeticket/images/icon_kid_w.png');
  }

  if (sort === 'daily') {
    document.querySelector('.list-warp-notice-description').innerHTML = rankingDescription.일간;
    sortIcon[0].setAttribute('style', 'color: #ff4b4b; font-weight:700;');
  } else if (sort === 'weekly') {
    document.querySelector('.list-warp-notice-description').innerHTML = rankingDescription.주간;
    sortIcon[1].setAttribute('style', 'color: #ff4b4b; font-weight:700;');
  } else if (sort === 'monthly') {
    document.querySelector('.list-warp-notice-description').innerHTML = rankingDescription.월간;
    sortIcon[2].setAttribute('style', 'color: #ff4b4b; font-weight:700;');
  }
 </script>
</body>
</html>