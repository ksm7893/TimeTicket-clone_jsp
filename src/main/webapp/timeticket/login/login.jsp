<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
	String fail = request.getParameter("fail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>로그인 - 타임티켓</title>
 <style>
    .login_wrap {
      width: 500px;
      padding: 40px 0;
      margin: 0 auto;
    }

    .login_wrap_box {
      background: #fafafa;
      width: 500px;
      border: 1px solid #ddd;
      border-radius: 10px;
      text-align: center;
      padding-top: 45px;
    }

    .input_txt {
      color: #777;
      background: #fff;
      border: 1px solid #ccc;
      font-size: 18px;
      font-weight: 600;
      height: 50px;
      width: 320px;
      padding: 0 20px;
      border-radius: 10px;
      -webkit-appearance: none;
    }

    .login_btn {
      width: 360px;
      height: 55px;
      border: 1px solid #ff4b4b;
      border-radius: 10px;
      background: #ff4b4b;
      color: #fff;
      font-size: 18px;
      font-weight: 400;
      -webkit-appearance: none;
      cursor: pointer;
    }

    .social_login_btn {
      float: left;
      margin: 0 15px;
      width: 70px;
      cursor: pointer;
    }

    .member_noti {
      color: #777;
      font-size: 15px;
      letter-spacing: -0.5px;
      line-height: 180%;
      margin-top: 30px;
      padding-bottom: 40px;
    }

    .member_noti_red {
      color: #ff0000;
    }

    .line {
      height: 1.5px;
      background: #ccc;
      margin: 0 100px;
    }

    .line_text {
      width: 180px;
      background: #fafafa;
      color: #777;
      font-size: 20px;
      text-align: center;
      position: absolute;
      left: 50%;
      top: 450px;
      margin-left: -90px;
    }

    .social_btn {
      display: flex;
      justify-content: center;
    }
  </style>
</head>
<body>
<div class="login_wrap">
	<div class="login_wrap_box">
		<form class="login_form" name="happy_member_login_form" action="<%=contextPath %>/timeticket/login/login.do?login=y" method="post">
			<div><img src="<%= contextPath %>/timeticket/images/logo_120.png" style="width:120px;" /></div>
			<div style="margin-top:30px;">
				<input type="text" name="user_id" value="아이디" onfocus="this.value='';" class="input_txt" />
			</div>
			<div style="margin-top:10px">
				<input type="password" name="user_pass" value="비밀번호" onfocus="this.value='';" class="input_txt"/>
			</div>
			<div style="margin-top:10px;">
				<input type="submit" class="login_btn" value="로그인" name="formimage1" alt="로그인버튼" />
			</div>
			<div style="text-align:center; margin-top:15px; font-size:14px; ">
			<a href="#" onfocus="this.blur()"><span style="color:#888;">아이디 찾기</span></a>
			<span style="color:#ccc; font-size:12px; vertical-align: 2px; margin:0 9px;">|</span>
			<a href="#" onfocus="this.blur()"><span style="color:#888;">비밀번호 찾기</span></a>
			<span style="color:#ccc; font-size:12px; vertical-align: 2px; margin:0 9px;">|</span>
			<a class="web_join_btn" href="<%= contextPath %>/timeticket/login/member.jsp" onfocus="this.blur()"><span style="color:#888;">회원가입</span></a>
			</div>
		</form>
		<div class="member_noti">
			<span class="member_noti_red">※ 로그인 계정에 따라 예매내역이 다르게 조회되니 주의하세요!</span><br />
	        ex) 네이버 로그인으로 예매한 내역을 카카오 로그인에서 확인 불가<br />
	        <br />
	        - 하나의 휴대폰 번호로 하나의 계정만 가입 가능합니다.<br />
	        - 애플 아이디로 로그인 기능은 iOS 앱에서만 이용 가능합니다.<br />
	        - 소셜 로그인은 별도의 아이디/비밀번호 찾기를 제공하지 않습니다.<br />
	        <br />
	        - 로그인/회원가입에 문제가 있다면 <a
	          href="https://docs.google.com/forms/d/e/1FAIpQLSfsvkJ_Xix9dCjpX2vv0BWKd_u9jq-DA48lGihulRomPlroxQ/viewform?usp=sf_link'"
	          target="_blank" alt="불편접수"><span style="text-decoration:underline; color:#777;">여기를 클릭</span></a>해주세요.
		</div>
	</div>
</div>
<script>
	<%
		if(fail != null){
			if(fail.equals("id")){
				%>
				alert("존재하지 않는 아이디 입니다.");
				<%
			}else if(fail.equals("pw")){
				%>
				alert("비밀번호가 틀립니다.");
				<%
			}
		}
	%>
</script>
</body>
</html>