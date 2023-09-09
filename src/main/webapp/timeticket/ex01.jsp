<%@page import="member.service.MemberDTO"%>
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
<title>Insert title here</title>
</head>
<body >
<c:if test=""></c:if>
<%
	MemberDTO meminfo = (MemberDTO)session.getAttribute("meminfo");
if(meminfo == null){
%>
<a href="<%=contextPath %>/timeticket/login/member.jsp">회원가입</a><br>
<a href="<%=contextPath %>/timeticket/login/login.jsp">로그인</a><br>
<%} else{
	%>
	<a href="<%=contextPath %>/timeticket/login/member.jsp">마이티켓</a><br>
	<a href="<%=contextPath %>/timeticket/ex01.jsp" name="logout" id="logout">로그아웃</a><br>
	
	<%
} %>
	<a href="<%=contextPath %>/timeticket/category/list.do?lcate_code=lcate_1">목록보기</a><br>
	<a href="<%=contextPath %>/timeticket/rank/rank.do">랭킹</a><br>
	<a href="<%=contextPath %>/timeticket/sale/sale.do?type=timesale">타임세일</a><br>
	<a href="<%=contextPath %>/timeticket/sale/sale.do?type=todaysale">오늘할인</a><br>
	
	<a href="<%=contextPath%>/timeticket/sale/sale.do">테스트</a>
<script>
	$("#logout").on("click",function(){
		<%
		session.removeAttribute("meminfo");
		%>
	});
</script>
</body>
</html>