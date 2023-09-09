<%@page import="com.util.JdbcUtil"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String puser_id = request.getParameter("user_id"); 

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT count(*) From mem WHERE mem_id = ?";
	
	JSONObject jsonData = new JSONObject(); 
	int count =0;
	 try{      
	      conn = ConnectionProvider.getConnection();
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, puser_id);
	      rs = pstmt.executeQuery(); 	  
	     	if( rs.next() ){ 
	        	count = rs.getInt(1);
	      }
	     	if(count ==1){
	     		jsonData.put("idcheck", 1);
	     		request.setAttribute("joinIDCheck", "아이디를 다시 확인해주세요.");
	     	} else{
	     		jsonData.put("idcheck", 2);	
	     		request.removeAttribute("joinIDCheck");
	     	}
	 }catch(Exception e){
	      e.printStackTrace();
	   }finally{
	      JdbcUtil.close(rs);
	      JdbcUtil.close(pstmt);
	      JdbcUtil.close(conn);
	   }
%>
<%=jsonData%>