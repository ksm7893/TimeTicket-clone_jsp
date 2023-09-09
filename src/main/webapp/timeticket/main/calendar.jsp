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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type='text/javascript' src='https://timeticket.co.kr/m/js/jquery-ui.js'></script>
<script src='https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js'></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css' />
<link rel='stylesheet' type='text/css' href='<%=contextPath %>/css/common.css' />

<title>Insert title here</title>
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
	
</head>

<body>
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
						<button href="?year=2023&month=06&date=20&time=19:00&gwon_name=타임세일&tic_price=24000&tic_count=1" class="disabled">결제하기</button>
					</div>
				</form>
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
    var params="year="+year+"&month="+month+"&date="+date+"&tic_code=tic_1";
	$.ajax({
        url:"<%=contextPath%>/view/calendar.ajax",
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
</body>
</html>