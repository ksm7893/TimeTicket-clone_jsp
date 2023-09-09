<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="<%=contextPath %>/timeticket/js/swiper-bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=contextPath %>/timeticket/css/swiper-bundle.min.css" />
<link rel="stylesheet" type="text/css" href="<%=contextPath %>/timeticket/css/common.css" />
<title>프로모션 특가 - 타임티켓</title>
  <style>

    .top_section {
      background-color: #FDC567;
      transition: all ease 800ms;
      height: 1320px;
    }

    .top_section_bg {
      width: 100%;
      height: 220px;
      background-color: rgb(255, 75, 75);
      transition: background-color ease 800ms;
    }

    .top_section_bg_round {
      margin-top: -0.2vw;
      width: 100%;
      height: 300px;
      background-color: rgb(255, 75, 75);
      transition: background-color ease 800ms;
      border-bottom-left-radius: 65%;
      border-bottom-right-radius: 65%;
    }

    .top_section_content {
      position: absolute;
      top: 50px;
      left: 440px;
    }

    .content_toggle {
      width: 230px;
      height: 70px;
      background-color: rgba(255, 255, 255, 0.5);
      border-radius: 100px;
      display: flex;
      align-items: center;
      justify-content: space-around;
      cursor: pointer;
    }

    .content_toggle_title {
      font-family: 'Pretendard', 'Pretendard Variable';
      font-size: 18px;
      font-weight: 700;
      margin: 20px;
      z-index: 1;
      transition: color ease 800ms;
    }

    .content_toggle_btn {
      width: 105px;
      height: 60px;
      background-color: rgb(255, 255, 255);
      border-radius: 100px;
      position: absolute;
      top: 5px;
      left: 5px;
      transition: transform ease 800ms;
    }

    .center_title {
      transition: color ease 800ms;
      font-family: 'Pretendard', 'Pretendard Variable';
      font-size: 90px;
      font-weight: 900;
      text-shadow: 8px 8px 0 rgb(90, 90, 90);
      color: #FDC567;
    }

    .center_title_sold_out {
      font-family: 'Pretendard', 'Pretendard Variable';
      margin-top: 80px;
      font-size: 36px;
      font-weight: 800;
      color: rgb(234, 235, 131);
    }

    .center_title_sold_out_timer {
      font-family: 'Pretendard', 'Pretendard Variable';
      margin-top: 130px;
      font-size: 30px;
      font-weight: 600;
      text-shadow: 2px 2px 7px #555;
      color: rgb(255, 255, 255);
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    #today_timer {
      width: 300px;
      height: 60px;
      margin: 30px;
      padding: 20px 0px 20px 50px;
      border: 1px solid rgb(49, 139, 20);
      border-radius: 10px;
      background-color: rgb(69, 158, 38);
      font-family: 'Pretendard', 'Pretendard Variable';
      font-weight: 900;
      font-size: 46px;
      text-align: start;
    }

    .center_title_area {
      text-align: center;
      position: relative;
      top: -370px;
    }

    .center_content {
      transition: background-color ease 800ms;
      font-family: 'Pretendard', 'Pretendard Variable';
      font-size: 26px;
      border-radius: 100px;
      font-weight: 900;
      background:#FDC567;
      color: #FF4B4B;
      width: 290px;
      margin:0 auto;
      margin-top: 15px;
      height: 45px;
      line-height: 45px;
    }

    .timesale_period {
      transition: color ease 800ms;
      font-family: 'Pretendard', 'Pretendard Variable';
    }

    .ts_slide {
      position: relative;
      top: -315px;
      display: flex;
      height: 650px;
      transition: all ease 800ms;
    }

    .white_ticket_area {
      text-align: center;
      position: relative;
      top: -580px;
    }

    .white_ticket_info {
      position: relative;
      top: -550px;
      margin: 280px 410px;
    }

    .white_ticket_text {
      transition: all ease 300ms;
    }

    .white_ticket_text div {
      display: flex;
      justify-content: space-between;
      margin-top: 3px;
      margin-bottom: 3px;
    }

    .price {
      color: #999;
      font-family: 'Pretendard', 'Pretendard Variable';
      font-weight: 600;
      font-size: 20px;
    }

    .discounted_price {
      color: #FF4B4B;
      font-family: 'Pretendard', 'Pretendard Variable';
      font-weight: 600;;
      font-size: 20px;
    }

    .final_price {
      font-family: 'Pretendard', 'Pretendard Variable';
      font-size: 20px;
      font-weight: 800;
    }

    .white_ticket_btn {
      background-color: #000;
      color: white;
      height: 55px;
      font-family: 'Pretendard', 'Pretendard Variable';
      font-size: 20px;
      border-radius: 15px;
      width: 280px;
      margin: 0 auto;
      margin-top: 25px;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .notice {
      position: relative;
      top: -1305px;
      width: 980px;
      background: rgba(255, 255, 255, 0.3);
      margin: 0 auto;
      font-family: 'Pretendard', 'Pretendard Variable';
      font-size: 14px;
      color: #555;
      font-weight: 500;
      line-height: 180%;
      padding: 20px 0;
      text-align: center;
    }

    .list-warp {
      position: relative;
      top: -12px;
      padding: 10px;
    }

    .list-warp-head {
      padding: 40px 0 40px 10px;
      font-family: 'Pretendard', 'Pretendard Variable';
      font-size: 24px;
      font-weight: 700;
    }

    .scale_up {
      transition: transform ease 800ms;
      transform: scale(1.1) !important;
    }

    .swiper-slide {
      transition: all ease 800ms;
    }

    .today_sale_toggle_active {
      transform: translateX(109%);
    }

    .today_sale_color1_active_bg {
      background-color: rgb(143, 198, 71);
    }

    .today_sale_color2_active_bg {
      background-color: rgb(234, 235, 131);
    }

    .today_sale_color1_active {
      color: rgb(143, 198, 71);
    }

    .today_sale_color2_active {
      color: rgb(234, 235, 131);
    }

    .ticket_info {
      transition: background-color ease 800ms;
      z-index: 999;
      color: white;
      width: 55px;
      height: 55px;
      background-color: #818181;
      border-radius: 50%;
      display: flex;
      justify-content: center;
      position: relative;
      top: 30px;
      left: 170px;
      letter-spacing: -1.5px;
      box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px;
    }

    .active_slide {
      /* background-color: #6436CC */
      background-color: #36BBD3;
    }

    .inactive_slide_cover {
      background-color: rgb(0, 0, 0, 0.5);
    }

    .ticket_info_discount {
      font-family: 'Pretendard', 'Pretendard Variable';
      font-size: 18px;
      font-weight:600;
      line-height: 18px;
      align-self: center;
    }

    .timesale_thum img {
      width: 200px;
      border-radius: 10px;
    }

    .timesale_thum div {
      position: absolute;
      width: 200px;
      /* height: 279.64px; */
      border-radius: 10px;
      transition: background-color ease 900ms;
    }

    .today_more_btn {
      background-color: #3DCE9D;
      color: white;
      border-radius: 10px;
      height:80px; font-size:28px; font-weight:600;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .category_rows_title { font-size:18px; color:#000; font-weight:400; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; word-break: break-all; letter-spacing: -0.5px; }
    .category_rows_sale { font-weight: 600; color:#ff4b4b; font-size:16px; margin-right:3px; letter-spacing: -0.5px; }
    .category_rows_price { font-size:18px; color:#000; font-weight:600; letter-spacing: -0.5px; }
    .category_rows_span span{ display:inline-block; padding:4px 8px; margin-right:3px; color:#777; font-size:14px; background:#eee;  border-radius:7px; }


  </style>
</head>
<body>
<div style="margin:0 auto; width:1100px; position: relative;">

    <div class="top_section">
      <div class="top_section_bg"></div>
      <div class="top_section_bg_round"></div>

      <section class="top_section_content">
        <div class="content_toggle_btn" value="${param.type}"></div>
        <div class="content_toggle">
          <div class="content_toggle_title">타임세일</div>
          <div class="content_toggle_title" style="color: white">오늘할인</div>
        </div>
      </section>

      <section class="center_title_area">
        <div class="center_title">TIME SALE</div>
        <div class="center_content">
          <div class="timesale_period"></div>
        </div>
        <div class="center_title_sold_out" style="display: none;">오늘할인 티켓이 모두 마감되었어요!</div>
        <div class="center_title_sold_out_timer" style="display: none;">
          <%-- <c:if test="${param.type eq 'todaysale' }"> --%>
           <div>다음 오늘할인 오픈까지</div>
          <div id="today_timer"></div>
          <%-- </c:if> --%>
        </div>
      </section>

      <section class="ts_slide">
        <div class="swiper mySwiper" style="max-height: 400px;">
        </div>
      </section>

      <section class="white_ticket_area">
        <img src="/timeticket/timeticket/images/white_ticket_web.png" style="width: 360px;">
        <div class="white_ticket_info">
          <div class="white_ticket_text">
            <div class="price">
              <div>정가</div>
              <div></div>
            </div>
            <div class="discounted_price">
              <div>할인</div>
              <div></div>
            </div>
            <div class="final_price" style="margin-bottom: 0;">
              <div> </div>
              <div></div>
            </div>
            <div class="timesale_condition" style="margin:0; margin-top: 0.5vw;">
              <div></div>
              <div style="margin: 0;"></div>
            </div>
          </div>
          <a class="moveto_product_page" href="">
            <div class="white_ticket_btn">예매하기</div>
          </a>
        </div>
      </section>

      <section class="notice">
        · 타임세일은 [회차당 선착순 2~3매]만 제공되는 특별할인 티켓입니다.<br />
        · 타임세일 티켓의 좌석배정 및 이용방식은 일반 티켓과 동일합니다.<br />
        · 다른 권종과 혼합해서 예매해도 무방하며 동시에 사용 가능합니다.<br />
        &nbsp;&nbsp;ex) 타임세일 1매 + 일반 1매 예약시 : 두 자리 연석 배정
      </section>


    </div>

    <section class="list-warp">
      <div class="list-warp-head">⏰ 타임세일 진행 중 티켓</div>
      
      <table></table>
    </section>
    <div class="today_btn" style="display: none;">
      <a href="https://timeticket.co.kr/list.php?mode=today">
        <div class="today_more_btn">오늘티켓 모두보기</div>
      </a>
    </div>

  </div>

	<script>
//이달 1일 ~ 말일 구하기
const WEEKDAY = ['(일)', '(월)', '(화)', '(수)', '(목)', '(금)', '(토)'];
let date = new Date();
let year = date.getFullYear();
let month = date.getMonth() + 1;
let day = date.getDate();
let last = new Date(year, month);
last = new Date(last - 1);
let lastD = last.getDate();
let timeSaleText = month+'월 1일 ~ '+month+'월 '+lastD+'일';
let todaySaleText = year+'.'+month+'.'+day+' '+WEEKDAY[date.getDay()];
<%
	if(request.getParameter("type").equals("timesale")){
	%>
	document.querySelector('.timesale_period').innerHTML = timeSaleText;
	<%		
	} else if(request.getParameter("type").equals("todaysale")){
		%>
		document.querySelector('.timesale_period').innerHTML = todaySaleText;
		<%
	}
%> 
   // 배너 티켓정보
	const SLIDE_CONTENT={
			timesale:`<%=request.getAttribute("timecontent")%>`,
			todaysale:`<%=request.getAttribute("todaycontent")%>`,
	};
    // 
	const LIST_CONTENT = {
			timesale:`<%=request.getAttribute("timeList")%>`,
			todaysale:`<%=request.getAttribute("todayList")%>`,
	}

	const NOTICE_CONTENT = {
		      timesale: '· 타임세일은 [회차당 선착순 2~3매]만 제공되는 특별할인 티켓입니다.<br /\>· 타임세일 티켓의 좌석배정 및 이용방식은 일반 티켓과 동일합니다.<br /\>· 다른 권종과 혼합해서 예매해도 무방하며 동시에 사용 가능합니다.<br /\>&nbsp;&nbsp;ex) 타임세일 1매 + 일반 1매 예약시 : 두 자리 연석 배정',
		      todaysale: '· 오늘할인은 [당일관람 티켓]에 추가할인을 제공하는 프로모션입니다.<br /\>· 오늘할인 티켓의 좌석배정 및 이용방식은 일반 티켓과 동일합니다.<br /\>· 다른 권종과 혼합해서 예매해도 무방하며 동시에 사용 가능합니다.<br /\>&nbsp;&nbsp;ex) 오늘할인 1매 + 일반 1매 예약시 : 두 자리 연석 배정',
		    };

	const toggleBtn = document.querySelector('.content_toggle_btn');
    const toggleTitle = document.querySelectorAll('.content_toggle_title');
    const centerTitle = document.querySelector('.center_title');
    const centerContent = document.querySelector('.center_content');
    const centerContentText = document.querySelector('.timesale_period');
    const listTitle = document.querySelector('.list-warp-head');
    const noticeText = document.querySelector('.notice');
    let type = document.URL.split('type=')[1];
	
    function removeAllSlide() {
        while (document.querySelector('.mySwiper').hasChildNodes()) {
          document.querySelector('.mySwiper').removeChild(document.querySelector('.mySwiper').firstChild);
        }
      }
    
    function setPriceInfo(type) {
        setTimeout(() => {
          let priceInfo, fullPrice, salePrice, discountedPrice, productNumber;
          priceInfo = document.querySelector('.swiper-slide-active');
          fullPrice = parseInt(priceInfo.children[1].value);
          productNumber = priceInfo.children[0].getAttribute('value');

          document.querySelector('.moveto_product_page').setAttribute('href', '/timeticket/timeticket/detail/view.do?tic_code='+productNumber);

          if (type === 'timesale') {
            salePrice = parseInt(priceInfo.children[2].value);
            discountedPrice = (fullPrice - salePrice);
            document.querySelector('.final_price').children[0].innerText = '타임세일가';
            document.querySelector('.timesale_condition').children[1].innerText = priceInfo.children[4].value;
          } else if (type === 'todaysale') {
            document.querySelector('.timesale_condition').children[1].innerText = '오늘의 최저가격 기준';
            salePrice = parseInt(priceInfo.children[3].value);
            discountedPrice = (fullPrice - salePrice);
            document.querySelector('.final_price').children[0].innerText = '오늘할인가';
          }

          document.querySelector('.white_ticket_text').classList.remove('hidden_active');
          document.querySelector('.price').children[1].innerText = fullPrice.toLocaleString('ko-KR')+'원';
          document.querySelector('.discounted_price').children[1].innerText = '-'+discountedPrice.toLocaleString('ko-KR')+'원';
          document.querySelector('.final_price').children[1].innerText = salePrice.toLocaleString('ko-KR')+'원';

        }, 200);
      }
    
 // in useToggle
    function setSwiper() {
      let swiperStartFoam;
      let swiper = new Swiper('.ts_slide .mySwiper', {
        slidesPerView: 4.4,
        centeredSlides: false,
        slidesOffsetBefore: 453,
        loop: true,
        initialSlide: 0,
        on: {
          slideChange: () => {
            let currentMode = toggleBtn.getAttribute('value');
            setPriceInfo(currentMode);

            // 상품 슬라이드 변경시 비동기로 데이터 변경해야함
            setTimeout(() => {
              let activeSlide, allSlide;
              allSlide = document.querySelectorAll('.swiper-slide');
              activeSlide = document.querySelector('.swiper-slide-active');

              if (activeSlide !== null) {
                for (let i = 0; i < allSlide.length; i++) {
                  allSlide[i].children[0].children[0].classList.remove('active_slide');
                  allSlide[i].children[0].children[1].children[0].children[0].classList.add('inactive_slide_cover');
                  allSlide[i].classList.remove('scale_up');
                }

                activeSlide.children[0].children[0].classList.add('active_slide');
                activeSlide.children[0].children[1].children[0].children[0].classList.remove('inactive_slide_cover');
                activeSlide.classList.add('scale_up');
              }
            });
          }
        }
      });
    }
    
    // in useToggle
    function createSwiper(type) {
      setTimeout(() => {
      let promoContent;
      if (type === 'timesale') {
        promoContent = SLIDE_CONTENT.timesale;
      } else if (type === 'todaysale') {
        promoContent = SLIDE_CONTENT.todaysale;
      }
      if (promoContent.length < 400) {
        document.querySelector('.white_ticket_area').setAttribute('style', 'display: none;');
        document.querySelector('.center_title_sold_out').setAttribute('style', 'display: block;')
        document.querySelector('.ts_slide').setAttribute('style', 'display: none;');
        document.querySelector('.list-warp').setAttribute('style', 'display: none;');
        document.querySelector('.center_title_sold_out_timer').setAttribute('style', 'display: flex;');
        document.querySelector('.notice').setAttribute('style', 'display: none;');
        document.querySelector('.top_section').setAttribute('style', 'height: 1320px;');
      } else {
        document.querySelector('.white_ticket_area').setAttribute('style', 'display: block;');
        document.querySelector('.center_title_sold_out').setAttribute('style', 'display: none;')
        document.querySelector('.ts_slide').setAttribute('style', 'display: flex;');
        document.querySelector('.list-warp').setAttribute('style', 'display: block;');
        document.querySelector('.center_title_sold_out_timer').setAttribute('style', 'display: none;');
        document.querySelector('.notice').setAttribute('style', 'display: block;');
        document.querySelector('.top_section').setAttribute('style', '');
      }

      let createUlDom = document.createElement('ul');
      document.querySelector('.mySwiper').appendChild(createUlDom);
      document.querySelector('.mySwiper').children[0].classList.add('swiper-wrapper')
      document.querySelector('.mySwiper').children[0].innerHTML = promoContent;
      setSwiper();
     replaceListContent(type);
    }, 400);
    }
    
	 // in useToggle
    function slideCoverSet() {
      setTimeout(() => {
        activeSlide = document.querySelector('.swiper-slide-active');
        allSlide = document.querySelectorAll('.swiper-slide');

        for (let i = 0; i < allSlide.length; i++) {
          allSlide[i].children[0].children[0].classList.remove('active_slide');
          allSlide[i].children[0].children[1].children[0].children[0].classList.add('inactive_slide_cover');
        }
        activeSlide.children[0].children[0].classList.add('active_slide');
        activeSlide.children[0].children[1].children[0].children[0].classList.remove('inactive_slide_cover');
      }, 600);
    }
 
    function useToggle() {
        document.querySelector('.top_section').classList.toggle('today_sale_color2_active_bg');
        document.querySelector('.top_section_bg').classList.toggle('today_sale_color1_active_bg');
        document.querySelector('.top_section_bg_round').classList.toggle('today_sale_color1_active_bg');
        toggleBtn.classList.toggle('today_sale_toggle_active');
        centerTitle.classList.toggle('today_sale_color2_active');
        centerContent.classList.toggle('today_sale_color2_active_bg');
        centerContentText.classList.toggle('today_sale_color1_active');
        
        if (toggleBtn.getAttribute('value') === 'timesale' ) {
          toggleBtn.setAttribute('value', 'todaysale')
          toggleTitle[0].setAttribute('style', 'color: white');
          toggleTitle[1].setAttribute('style', 'color: black');
          removeAllSlide();
          centerTitle.innerText = 'TODAY SALE';
          centerContentText.innerHTML = todaySaleText;
          listTitle.innerHTML = '📅 오늘할인 진행 중 티켓';
          noticeText.innerHTML = NOTICE_CONTENT.todaysale;
          setPriceInfo('todaysale');
          createSwiper('todaysale');
          slideCoverSet();
		 
          setTimeout(() => {
            if ((document.querySelector('.list-warp').getAttribute('style').includes('none;'))) {
              document.querySelector('.today_btn').setAttribute('style', 'display: block; width:300px; position:absolute; top:810px; left: 400px;');
            } else {
              document.querySelector('.today_btn').setAttribute('style', 'display: block; margin: 0 auto; width: 300px; padding-bottom: 50px;');
            }
          }, 1000);

        } else if (toggleBtn.getAttribute('value') === 'todaysale' ) {
          toggleBtn.setAttribute('value', 'timesale')
          toggleTitle[0].setAttribute('style', 'color: black');
          toggleTitle[1].setAttribute('style', 'color: white');
          removeAllSlide();
          centerTitle.innerText = 'TIME SALE';
          centerContentText.innerHTML = timeSaleText;
          listTitle.innerHTML = '타임세일 진행 중 티켓';
          noticeText.innerHTML = NOTICE_CONTENT.timesale;
          setPriceInfo('timesale');
          createSwiper('timesale');
          slideCoverSet();

          document.querySelector('.today_btn').setAttribute('style', 'display: none');
        }
      }

      // in createSwiper
     function replaceListContent(type) {
        let promoContent;
        if (type === 'timesale') {
          promoContent = LIST_CONTENT.timesale;
        } else if (type === 'todaysale') {
          promoContent = LIST_CONTENT.todaysale;
        }
        let createTableDom = document.createElement('table');
        document.querySelector('.list-warp').children[1].appendChild(createTableDom);
        document.querySelector('.list-warp').children[1].setAttribute('style', 'width: 100%;');
        document.querySelector('.list-warp').children[1].innerHTML = promoContent;
      } 

      // indiviual func
      function activeSlide() {
        setTimeout(() => {
          activeSlide = document.querySelector('.swiper-slide-active');
          activeSlide.children[0].children[0].classList.add('active_slide');
          activeSlide.children[0].children[1].children[0].children[0].classList.add('active_slide_bg');
          activeSlide.classList.add('scale_up');
        }, 500);
      }

      document.querySelector('.content_toggle').addEventListener('click', () => {
        useToggle();
      })

      toggleBtn.addEventListener('click', () => {
        useToggle();
      })


      window.onload = () => {
    	  console.log( ">>> 이창익  : " + type); // timesale, todaysale
        if (type === 'todaysale') {
          useToggle();
          createSwiper('todaysale');
          activeSlide();
        } else if (type === 'timesale') {
          slideCoverSet();
          createSwiper('timesale');
          activeSlide();
        }

      }

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
</body>
</html>