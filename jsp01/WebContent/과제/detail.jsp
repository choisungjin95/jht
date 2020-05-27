<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javafx.collections.SetChangeListener"%>
<%@page import="test.db.JDBCUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		padding: 0px;
		margin: 0px;
	}
	#wrap{
		width:600px;
		height:500px;
		margin: auto;
		border-top: 2px solid gray;
		text-align: center;
		margin-top:30px;
	}
	#a{
		width:100%;
		border-bottom: 2px solid gray;
		margin-bottom: 10px;
	}
	.a{
		display: inline-block;
		padding: 10px;
	}
	table{
		margin: auto;
	}
	table, th, td{
	 	border: 1px solid green;
	}
	td{
		text-align: left;
		padding-left: 5px;
	}
	#table{
		width: 100%;
		border-bottom: 2px solid gray;
	}
	#a2{
		border-bottom: 2px solid gray;
		padding-top: 10px;
		padding-bottom: 10px;
	}
</style>
</head>
<body>
<%
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	request.setCharacterEncoding("utf-8");
	int num=Integer.parseInt(request.getParameter("num"));
	try{
		con=JDBCUtil.getConn();
		String sql="select * from board where num=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String writer=rs.getString("writer");
			String email=rs.getString("email");
			String title=rs.getString("title");
			String content=rs.getString("content");
%>
<div id="wrap">
	<h1>CHOI's GUESTBOOK 내용</h1>
	<div id="a">
		<a href="insert.html" class="a">글쓰기</a>
	</div>
	<div id="table">
		<table>
		<tr>
			<th style="width: 150px">글번호</th>
			<td style="width: 450px"><%=num %></td>
		</tr>
		<tr>
			<th style="width: 150px">글쓴이</th>
			<td style="width: 450px"><%=writer %></td>
		</tr>
		<tr>
			<th style="width: 150px">이메일</th>
			<td style="width: 450px"><%=email %></td>
		</tr>
		<tr>
			<th style="width: 150px">글제목</th>
			<td style="width: 450px"><%=title %></td>
		</tr>
		<tr>
			<th style="width: 150px">글내용</th>
			<td style="width: 450px"><%=content %></td>
		</tr>
		</table><br>
	</div>
	<div id="a2">
		<a href="update.jsp?num=<%=num%>">수정</a>｜
		<a href="delete.jsp?num=<%=num%>">삭제</a>｜
		<a href="list.jsp">목록</a>
	</div>
</div>
<%
		}
	}catch(SQLException se){
		se.getStackTrace();
	}finally{
		JDBCUtil.close(rs,pstmt,con);
	}
%>
</body>
</html>