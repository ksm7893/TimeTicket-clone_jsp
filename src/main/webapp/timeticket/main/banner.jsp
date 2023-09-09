<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath4 = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%-- <link href= '<%= contextPath %>/timeticket/css/layout.css' rel='stylesheet' type='text/css'>
<link href= '<%= contextPath %>/timeticket/css/detail.css' rel='stylesheet' type='text/css'>
<link href= '<%= contextPath %>/timeticket/css/calendar_theme.css' rel='stylesheet' type='text/css'>
<link href= '<%= contextPath %>/timeticket/css/layout_swiper.css' rel='stylesheet' type='text/css'>
<link href= '<%= contextPath %>/timeticket/css/user_review.css' rel='stylesheet' type='text/css'> 
<link href= '<%= contextPath %>/timeticket/css/common.css' rel='stylesheet' type='text/css'>
 --%>
<title></title>

  <style>
  .swiper {
    width: 100%;
    margin-top: 0;
    padding-top: 20px;
  }
  .swiper-slide .noselect img {
    border-radius: 10px;
    display: block;
    width: 100%;
    height: 462px;
    object-fit: cover;
  }
  .swiper-pagination-bullet {
    width: 15px;
    height: 15px;
    background: rgba(0, 0, 0, 0.5);
  }
  .swiper-pagination-bullet-active {
    color: #fff;
    background: #ff4b4b;
  }
</style>
</head>
<body>

<section style="background: #FFF7EB">
  <div class="wrap_1100" style="padding-top:20px; padding-bottom: 40px; text-align:center;">


<section class="main_rolling">
  <div class="swiper mySwiper swiper-initialized swiper-horizontal swiper-pointer-events">
    <div class="swiper-wrapper" id="swiper-wrapper-15dbc845210d51c2c" aria-live="off" style="transition-duration: 400ms; transform: translate3d(-2889.83px, 0px, 0px);">
    
       
          <c:forEach items="${blist}" var="dto" varStatus="i">
          <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="i" role="group" style="width: 755.517px; margin-right: 10px;">
		    	<a href="<%=contextPath4 %>/timeticket/${dto.ban_link}" class="noselect">
		        <img src="/timeticket/timeticket/images/${dto.ban_img}" class="wmain_rolling_bnr"></a>
		    </div>
		  </c:forEach>
		  
		 
		<c:forEach items="${blist}" var="dto" varStatus="i">      
				<div class="swiper-slide" data-swiper-slide-index="i" role="group"  style="width: 755.517px; margin-right: 10px;">
		    	<a href="<%=contextPath4 %>/timeticket/${dto.ban_link}" class="noselect">
		        <img src="/timeticket/timeticket/images/${dto.ban_img}" class="wmain_rolling_bnr"></a>
		        </div>
		  </c:forEach>
      
      </div>
    </div>

    <div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-horizontal" style="opacity:0.7">
    	<span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 1"></span>
    	<span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 2"></span>
    	<span class="swiper-pagination-bullet swiper-pagination-bullet-active" tabindex="0" role="button" aria-label="Go to slide 3" aria-current="true"></span>
    	<span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 4"></span>
    	<span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 5"></span>
    	<span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 6"></span>
    	<span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 7"></span>
    	<span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 8"></span>
    </div>

    <a href="recommend.php" id="wmain_rolling_bnr_all">
      <div style="position: absolute; bottom:20px; right:200px; z-index:999; color:#fff; background-color: rgba(160,160,160,0.3); border-radius:50px; border:1px solid rgba(255,255,255,0.3); padding:4px 10px; font-size:15px; cursor: pointer;">
        +모두보기
      </div>
    </a>

  <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
</section>

<script>
  var swiper = new Swiper('.main_rolling .mySwiper', {
      slidesPerView: 1.45,
      centeredSlides: true,
      speed: 400,
      spaceBetween: 10,
      centeredSlides: true,
        autoplay: {
          delay: 2000,
          disableOnInteraction: false,
        },
      pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
      loop: true
  });
</script>

  </div>
</section>

</body>
</html>