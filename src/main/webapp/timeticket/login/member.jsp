<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css' />
<style>
    .join_wrap { width: 500px; padding: 40px 0; margin: 0 auto; }

    .join_wrap_box { background:#fafafa; width: 500px; border: 1px solid #ddd; border-radius:10px; text-align: center; padding: 45px 0; }
    .modify_wrap_box { width: 500px; text-align: center; padding: 0; margin-left:40px; }

    .join_logo { width: 120px; }
    .input_txt { color: #777; background: #fff; border: 1px solid #ccc; font-size: 16px; font-weight: 400; height: 40px; width: 350px; padding-left: 20px; margin-top:3px; -webkit-appearance:none; }
    .input_txt_readonly {	color: #777; background: #eee; border: 1px solid #ccc; font-size: 15px; font-weight: 400; height: 40px; width: 350px; padding-left: 20px; margin-top:3px; -webkit-appearance:none; }
    .input_txt_hpcode { color: #777; background: #fff; border: 1px solid #ccc; font-size: 15px; font-weight: 400; height: 40px; width: 35px; padding-left: 10px; margin-top:3px; -webkit-appearance:none; }

    .input_select { color: #777; background: #fff; border: 1px solid #ccc; font-size: 15px; font-weight: 400; height: 40px; width: 372px; padding-left: 15px; margin-top:5px; }
    .input_title { text-align:left; color: #333; font-size: 15px; color:#777; font-weight: 400;	width:350px; padding-left:65px; }
    .input_alret_id, .input_alret_password, .input_alret_name, .input_alret_email { text-align:left; margin-left:65px; font-size:13px; color:#f00; padding-top:3px; }
    .btn_hphone_on { width:80px; height:42px; border:none; background:#ff4b4b; color:#fff; font-size:16px; font-weight:400; margin-left:2px; vertical-align:-1px; -webkit-appearance:none; }
    .btn_hphone_off { width:80px; height:42px; border:1px solid #ccc; background:#f5f5f5; color:#aaa; font-size:16px; font-weight:400; margin-left:2px; vertical-align:-1px; -webkit-appearance:none; }
    .pdtop_10 { padding-top: 10px; }
    .pdtop_20 { padding-top: 20px; }
    .disableBackGround { background-color: #f5f5f5;}
    .loading_img_div { display: none; position: fixed; z-index: 1000; top: 0; left: 0; height: 100%; width: 100%; background: rgba(255, 255, 255, .8) url('../../mobile_img/loading.gif') 50% 40% no-repeat; background-size: 60px 60px; }

    .checkbox_group {
      width:371px; margin-left:63px; margin-top: 10px; text-align: left;
      font-size:14px; border:1px solid #ccc; color: #555; background: #f5f5f5;
    }
    .checkbox { vertical-align:-4px; height:16px; width:16px; }
    .checkbox_line label { padding-left:5px }
    .checkbox_line { margin: 0 18px; padding: 12px 0; border-bottom:1px solid #ddd; }
    .top_line { font-size:14px; font-weight:bold; color:#333; }
    .detail_seperate { display:flex; justify-content: space-between; }
    .check_req { font-size:14px; padding-left:5px; color:#ff4b4b; }
    .check_detail { padding-left:3px; color:#999; font-weight:600; text-decoration:underline; }

  </style>
<title>회원가입 - 타임티켓</title>
</head>
<body>
<div class="join_wrap">
	<div class="join_wrap_box">
		<form action="<%= contextPath %>/timeticket/member/join.do" method="post">
			<div><img src="<%= contextPath %>/timeticket/images/logo_120.png" class="join_logo" /></div>
			<div class="pdtop_20">
				<div style="font-size:20px;color:#333;font-weight:bold;">회원가입</div>
			</div>
						<div class="input_title">아이디</div>
							<input type="text" id="user_id" name="user_id" placeholder="아이디" class="input_txt" style="text-transform:lowercase;">
												<!-- 입력 형식에 맞지 않을 때 / 입력하지 않았을 때 얼럿 -->
							<div class="input_alret_id"></div>
						<div class="pdtop_10">
							<div class="input_title">비밀번호</div>
							<input type="password" id="user_pass" name="user_pass" placeholder="비밀번호" class="input_txt" autocomplete="new-password">
						</div>
						<div class="input_alret_password"></div>
		
						<div class="pdtop_10">
							<div class="input_title">비밀번호 확인</div>
							<input type="password" id="user_pass_verify" name="user_pass_verify" placeholder="비밀번호 재입력" class="input_txt" autocomplete="new-password">
						</div>
						
						<div class="pdtop_10">
							<div class="input_title">이름</div>
							<input type="text" id="user_name" name="user_name" placeholder="이름" value="" class="input_txt">
						</div>
										<div class="input_alret_name"></div>
										<div class="pdtop_10">
							<div class="input_title">이메일</div>
							<input type="text" id="user_email" name="user_email" placeholder="이메일 주소" value="" class="input_txt">
						</div>
						<div class="input_alret_email"></div>
		
						
		
		                <!-- 회원가입 / 휴대폰 인증 + 약관동의 -->
		        <div class="pdtop_10">
		          <div class="input_title">
		            휴대폰 인증
		          </div>
		          <select style="width: 110px; height:42px;" name="country_code" id="country_code" name="country_code" class="input_txt_hpcode">
		            <option selected value="82">대한민국 (+82)</option>
		            <option value="1">United State (+1)</option>
		            <option value="44">United Kingdom (+44)</option>
		            <option value="54">Argentina (+54)</option>
		            <option value="61">Australia (+61)</option>
		            <option value="43">Austria (+43)</option>
		            <option value="994">Azerbaijan (+994)</option>
		            <option value="375">Belarus (+375)</option>
		            <option value="32">Belgium (+32)</option>
		            <option value="55">Brazil (+55)</option>
		            <option value="673">Brunei (+673)</option>
		            <option value="359">Bulgaria (+359)</option>
		            <option value="855">Cambodia (+855)</option>
		            <option value="237">Cameroon (+237)</option>
		            <option value="1">Canada (+1)</option>
		            <option value="56">Chile (+56)</option>
		            <option value="86">China (+86)</option>
		            <option value="57">Colombia (+57)</option>
		            <option value="506">Costa Rica (+506)</option>
		            <option value="385">Croatia (+385)</option>
		            <option value="53">Cuba (+53)</option>
		            <option value="42">Czech Republic (+42)</option>
		            <option value="45">Denmark (+45)</option>
		            <option value="1809">Dominican Republic (+1809)</option>
		            <option value="593">Ecuador (+593)</option>
		            <option value="20">Egypt (+20)</option>
		            <option value="372">Estonia (+372)</option>
		            <option value="33">France (+33)</option>
		            <option value="7880">Georgia (+7880)</option>
		            <option value="49">Germany (+49)</option>
		            <option value="233">Ghana (+233)</option>
		            <option value="30">Greece (+30)</option>
		            <option value="671">Guam (+671)</option>
		            <option value="504">Honduras (+504)</option>
		            <option value="852">Hong Kong (+852)</option>
		            <option value="36">Hungary (+36)</option>
		            <option value="354">Iceland (+354)</option>
		            <option value="91">India (+91)</option>
		            <option value="62">Indonesia (+62)</option>
		            <option value="98">Iran (+98)</option>
		            <option value="353">Ireland (+353)</option>
		            <option value="39">Italy (+39)</option>
		            <option value="1876">Jamaica (+1876)</option>
		            <option value="81">Japan (+81)</option>
		            <option value="7">Kazakhstan (+7)</option>
		            <option value="996">Kyrgyzstan (+996)</option>
		            <option value="856">Laos (+856)</option>
		            <option value="370">Lithuania (+370)</option>
		            <option value="60">Malaysia (+60)</option>
		            <option value="356">Malta (+356)</option>
		            <option value="52">Mexico (+52)</option>
		            <option value="377">Monaco (+377)</option>
		            <option value="976">Mongolia (+976)</option>
		            <option value="212">Morocco (+212)</option>
		            <option value="977">Nepal (+977)</option>
		            <option value="31">Netherlands (+31)</option>
		            <option value="64">New Zealand (+64)</option>
		            <option value="47">Norway (+47)</option>
		            <option value="595">Paraguay (+595)</option>
		            <option value="51">Peru (+51)</option>
		            <option value="63">Philippines (+63)</option>
		            <option value="48">Poland (+48)</option>
		            <option value="351">Portugal (+351)</option>
		            <option value="40">Romania (+40)</option>
		            <option value="7">Russia (+7)</option>
		            <option value="250">Rwanda (+250)</option>
		            <option value="966">Saudi Arabia (+966)</option>
		            <option value="221">Senegal (+221)</option>
		            <option value="381">Serbia (+381)</option>
		            <option value="65">Singapore (+65)</option>
		            <option value="421">Slovak Republic (+421)</option>
		            <option value="386">Slovenia (+386)</option>
		            <option value="27">South Africa (+27)</option>
		            <option value="34">Spain (+34)</option>
		            <option value="94">Sri Lanka (+94)</option>
		            <option value="249">Sudan (+249)</option>
		            <option value="46">Sweden (+46)</option>
		            <option value="41">Switzerland (+41)</option>
		            <option value="963">Syria (+963)</option>
		            <option value="886">Taiwan (+886)</option>
		            <option value="66">Thailand (+66)</option>
		            <option value="228">Togo (+228)</option>
		            <option value="90">Turkey (+90)</option>
		            <option value="993">Turkmenistan (+993)</option>
		            <option value="256">Uganda (+256)</option>
		            <option value="380">Ukraine (+380)</option>
		            <option value="598">Uruguay (+598)</option>
		            <option value="7">Uzbekistan (+7)</option>
		            <option value="58">Venezuela (+58)</option>
		            <option value="84">Vietnam (+84)</option>
		            <option value="260">Zambia (+260)</option>
		          </select>
							<input type="text" id="user_hphone" name="user_hphone" maxlength="13" value="" placeholder="휴대폰 번호" class="input_txt" style="width:153px;" >
							<input style="width: 80px;" type="button" id="input_hphone_btn" class="btn_hphone_on" value="인증요청">
						</div>
						<!-- 인증번호 받기 누르면 나타나는 div // 필요시에만 컬러(btn_hphone_on)로 나오도록 -->
						<div id="pdtop_hphone_verify" style="display: none;">
							<input type="text" id="user_hphone_verify" name="user_hphone_verify" placeholder="인증번호를 입력하세요" onfocus="this.value='';" class="input_txt" style="width:267px;">
							<input style="width: 80px;" type="button" id="submit_hphone_btn" class="btn_hphone_off" value="인증확인">
						</div>
		
		        <div style="font-size:15px; color:#777; padding-top:20px; line-height: 170%;">
							* <span style="color:red;">휴대폰 인증은 필수이며 하나의 아이디만 가입 가능</span>합니다.<br />
							* 인증코드 SMS는 '[국외발신]timeticket.co.kr' 형태로 전송됩니다.<br />
							* 회원가입 중 <span style="text-decoration:underline; color:#777;"><a href="https://docs.google.com/forms/d/e/1FAIpQLSfsvkJ_Xix9dCjpX2vv0BWKd_u9jq-DA48lGihulRomPlroxQ/viewform?usp=sf_link'" target="_blank" alt="불편접수">휴대폰인증에 문제가 있다면 여기를 클릭</span></a>해주세요.
						</div>
		
		        <div style="padding-top:20px;">
		
		          <div class="checkbox_group">
		            <div class="checkbox_line top_line">
		              <input type="checkbox" id="check_all" class="checkbox" >
		              <label for="check_all">전체 동의</label>
		            </div>
		            <div class="checkbox_line">
		              <input type="checkbox" id="check_1" class="checkbox" />
		              <label for="check_1">만 14세 이상입니다<span class="check_req">(필수)</span></label>
		            </div>
		            <div class="checkbox_line detail_seperate">
		              <div>
		                <input type="checkbox" id="check_2" class="checkbox" />
		                <label for="check_2">이용약관 동의<span class="check_req">(필수)</span></label>
		              </div>
		              <div>
		                <a href="/html_file.php?file1=default.html&file2=user_stipulation.html" target="_blank" class="check_detail" id="mjoin_detail_stipulation">내용보기</a>
		              </div>
		            </div>
		            <div class="checkbox_line detail_seperate" style="border-bottom:none;">
		              <div>
		                <input type="checkbox" id="check_3" class="checkbox" />
		                <label for="check_3">개인정보 수집·이용 동의<span class="check_req">(필수)</span></label>
		              </div>
		              <div>
		                <a href="/html_file.php?file1=default.html&file2=user_defend_s.html" target="_blank" class="check_detail" id="mjoin_detail_defend">내용보기</a>
		              </div>
		            </div>
		          </div>
		        </div>
		        <input type="submit" id="submitComplete" style="width: 372px; height:55px; border:none; background:#ff4b4b; color:#fff; font-size:20px; border-radius:10px; font-weight:400; margin-top:25px;" value="회원가입" />
 		</form>
 	</div>
 </div>
 <script>
	//패스워드 정규식
	function isPassword(asValue) {
		var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
	 
		return regExp.test(asValue);
	}
	//아이디 정규식
	function isId(asValue) {
		var regExp = /^[a-z]+[a-z0-9-_]{3,13}$/g;
	 
		return regExp.test(asValue);
	}
	//이메일 정규식
	function isEmail(asValue) {
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	return regExp.test(asValue);
	}
	//전화번호 정규식
	function isPhoneNumber(asValue) {
		var regExp = /^01(?:0|1|[6-9])(?:\d{7}|\d{8})$/;
	 
		return regExp.test(asValue);
	}
	//휴대폰 자도 하이픈 스크립트
	function autoHypenPhone(str){
		str = str.replace(/[^0-9]/g, '');
		var tmp = '';
		if( str.length < 4){
			return str;
		}else if(str.length < 8){
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3);
			return tmp;
		}else if(str.length < 12){
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 4);
			tmp += '-';
			tmp += str.substr(7);
			return tmp;
		}
		return str;
	}
 </script>
 <script>
 	let errorID=null;
 	//아이디체크
 	$("#user_id").on("keyup",function(){
 		var value = $(this).val();
 		var params = "user_id="+value;
 		if(isId(value)){  
	 		$.ajax({
	 	        url:"ajaxTest.jsp",
	 	        dataType:"json",
	 	        type:"GET", 
	 	        data:params, 
	 	        cache:false,
	 	        success:function (data, textStatus, jqXHR){
		        	$(data.idcheck).each(function(i, elem) {
	 	        		if(elem !=1){
	 	        			$("div.input_alret_id")
								.html("사용가능한 아이디입니다.")
								.css("color","blue");
	 	        			errorID=null;
	 	 	        	} else{
	 	 	        		$("div.input_alret_id")
								.html("이미 가입된 아이디입니다.")
								.css("color","red");
	 	 	        		errorID="아이디를 다시 확인해주세요.";
	 	 	        	}
	 	        	})
	 	        }, 
	 	        error:function (){ alert('에러발생~~~'); }
	 	     });
 		} else {
 			$("div.input_alret_id")
 									.html("4~20자의 영문, 숫자, 특수기호(_),(-)만 사용할 수 있어요.")
 									.css("color","red");
 			errorID = "아이디는 4~20자의 영문, 숫자, 특수기호(_),(-)만 사용할 수 있어요.";
 		}
 	});
 	
 	//submit할때 오류확인
 	$(":submit").on("click",function(event){
 		var pw = $("#user_pass").val();
 		var pwCheck =$("#user_pass_verify").val();
 		
 		if( errorID != null){
 			alert(errorID);
 			event.preventDefault();
 		} else  if( pw != pwCheck){
 			console.log(pw +"/" + pwCheck);
 			alert("비밀번호가 일치하지 않습니다.")
 			event.preventDefault();
 		} /* else if(!isPassword(pw)){
 			alert("비밀번호는 8자리 이상 20자리 이하의 영문/숫자/특수문자 조합으로 입력해주세요.");
 			event.preventDefault();
 		} */ else if(!isEmail($("#user_email").val())){
 			alert("이메일 주소를 정확히 입력해주세요.");
 			event.preventDefault();
 		} else if(!isPhoneNumber($("#user_hphone").val().replaceAll("-",""))){
 			alert("핸드폰 번호를 확인해주세요.");
 			event.preventDefault();
 		}
 	});
 	
 	//인증요청
 	$("#input_hphone_btn").on("click",function(event){
 		if(isPhoneNumber($("#user_hphone").val().replaceAll("-",""))){
	 		alert("SMS로 인증번호가 전송되었습니다. 인증번호는 Google 서비스로 발송되며 [국제발신] 또는 [국외발신]으로 표기됩니다.")
	 		$(this).attr("class","btn_hphone_off");
	 		$("#pdtop_hphone_verify").attr("style", "");
	 		$("#submit_hphone_btn").attr("class","btn_hphone_on");
 		} else {
 			alert("휴대폰 번호를 입력해 주세요");
 			event.preventDefault();
 		}
 	});
 	
 </script>
 
 <script>
//약관 체크박스 전체 선택
 $(".checkbox_group").on("click", "#check_all", function () {
   $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
 });

 // 약관 체크박스 개별 선택
 $(".checkbox_group").on("click", ".checkbox", function() {
     var is_checked = true;
     $(".checkbox_group .checkbox").each(function(){
         is_checked = is_checked && $(this).is(":checked");
     });
     $("#check_all").prop("checked", is_checked);
 });
 
//핸드폰번호 하이픈 추가
	$("#user_hphone").on("keyup",function(event){
		addHipen = autoHypenPhone($(this).val());
		$(this).val(addHipen);
	});
 </script>
</body>
</html>