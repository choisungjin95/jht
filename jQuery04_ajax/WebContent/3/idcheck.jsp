<%@page import="java.io.PrintWriter"%>
<%@page import="test.db.ConnectionPool"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	boolean using=false;//아이디 사용중
	try{
		con=ConnectionPool.getConn();
		String sql="select * from myusers where id=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			using=true;
		}
	}catch(SQLException se){
		System.out.println(se.getMessage());
	}finally{
		try{
			if(rs!=null) rs.close();
			if(pstmt!=null) rs.close();
			if(con!=null) rs.close();
		}catch(SQLException s){
			s.printStackTrace();
		}
	}
	//xml로 결과 응답하기
	response.setContentType("text/xml;charset=utf-8");
	PrintWriter pw=response.getWriter();
	pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
	pw.print("<result>");
	pw.print("<using>" + using + "</using>");
	pw.print("</result>");
	//http://localhost:8081/ajax02/1/idcheck.jsp?id=test
%>














