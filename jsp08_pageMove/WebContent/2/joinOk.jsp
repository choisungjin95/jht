<%@page import="java.sql.SQLException"%>
<%@page import="test.db.JDBCUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinOk.jsp</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	
	Connection con=null;
	PreparedStatement pstmt1=null;
	PreparedStatement pstmt2=null;
	ResultSet rs=null;
	
	try{
		con=JDBCUtil.getConn();
		String sql="select * from myusers where id=?";
		pstmt1=con.prepareStatement(sql);
		pstmt1.setString(1,id);
		rs=pstmt1.executeQuery();
		if(rs.next()){//기존에 아이디가 존재하는 경우
			request.setAttribute("errMsg","존재하는 아이디입니다..");
%>
			<jsp:forward page="join.jsp"/>
<%				
		}else{ //아이디가 존재하지 않는 경우 -> 가입하기
			String sql1="insert into myusers values(?,?,?,sysdate)";
			pstmt2=con.prepareStatement(sql1);
			pstmt2.setString(1,id);
			pstmt2.setString(2,pwd);
			pstmt2.setString(3,email);
			pstmt2.executeUpdate();
	%>
		<h1>회원가입성공</h1>
		<a href="login.jsp">로그인하러 가기</a>|
		<a href="main.jsp">메인페이지 가기</a>
	<%
		}	
	}catch(SQLException se){
		se.printStackTrace();
	}finally{
		JDBCUtil.close(rs);
		JDBCUtil.close(pstmt1);
		JDBCUtil.close(pstmt2);
		JDBCUtil.close(con);
	}
%>
</body>
</html>









