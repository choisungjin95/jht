<%@page import="javafx.collections.SetChangeListener"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="test.db.JDBCUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
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
	table, th{
	 	border: 1px solid green;
	}
	#table{
		width: 100%;
		border-bottom: 2px solid gray;
		padding-bottom: 10px;
	}
</style>
</head>
<body>
<div id="wrap">
	<h1>CHOI's GUESTBOOK 목록</h1>
	<div id="a">
		<a href="insert.html" class="a">글쓰기</a>
		<a href="" class="a">메인</a>
	</div>
	<div id="table">
		<table>
		<tr>
			<th style="width: 60px">글번호</th>
			<th style="width: 80px">작성자</th>
			<th style="width: 200px">이메일</th>
			<th style="width: 200px">글제목</th>
			<th style="width: 110px">날짜</th>
		</tr>
	<%
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=JDBCUtil.getConn();
			String sql="select * from board";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				int num=rs.getInt("num");
				String writer=rs.getString("writer");
				String email=rs.getString("email");
				String title=rs.getString("title");
				Date w_date=rs.getDate("w_date");
	%>
			<tr>
				<th><%=num %></th>
				<th><%=writer %></th>
				<th><%=email %></th>
				<th><a href="detail.jsp?num=<%=num%>"><%=title %></a></th>
				<th><%=w_date %></th>
			</tr>
	<%
			}
		}catch(SQLException se){
			se.getStackTrace();
		}finally{
			JDBCUtil.close(rs,pstmt,con);
		}
	%>
		</table><br>
	</div>
</div>
</body>
</html>