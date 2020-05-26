<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="test.db.ConnectionPool"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email=request.getParameter("email");
	String pwd=request.getParameter("pwd");
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String id="";	
	try{
		con=ConnectionPool.getConn();
		String sql="select * from myusers where pwd=? and email=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, pwd);
		pstmt.setString(2, email);
		rs=pstmt.executeQuery();
		if(rs.next()){
			id=rs.getString("id");
		}else{
			id ="아이디가 없습니다";
		}
	}catch(SQLException se){
		se.getStackTrace();
	}finally{
		try{
			if(rs!=null) rs.close();
			if(pstmt!=null) rs.close();
			if(con!=null) rs.close();
		}catch(SQLException s){
			s.printStackTrace();
		}
	}
	response.setContentType("text/xml;charset=utf-8");
	PrintWriter pw=response.getWriter();
	pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
	pw.print("<result>");
	pw.print("<id>" + id + "</id>");
	pw.print("</result>");
%>













