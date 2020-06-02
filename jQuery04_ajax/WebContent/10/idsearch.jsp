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
	boolean using=false;
	try{
		con=ConnectionPool.getConn();
		//select rpad( substr(id,1,3), length(id), '*') id from myusers where pwd=? and email=?;
		String sql="select rpad( substr(id,1,3), length(id), '*') id from myusers where pwd=? and email=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, pwd);
		rs=pstmt.executeQuery();
		if(rs.next()){
			id=rs.getString("id");
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
	response.setContentType("text/xml;charset=utf-8");
	PrintWriter pw=response.getWriter();
	pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
	pw.print("<result>");
	pw.print("<using>"+using+"</using>");
	pw.print("<id>"+id+"</id>");
	pw.print("</result>");
	
%>










