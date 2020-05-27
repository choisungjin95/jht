<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test.db.JDBCUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/board.css">
<title>Insert title here</title>
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
	<h1>회원정보수정하기</h1>
		<form method="post" action="updateOk.jsp">
			<input type="hidden" name="num" value="<%=num%>">
			글번호 <input type="text" name="num" value="<%=num%>" disabled="disabled"><br>
			글쓴이 <input type="text" name="writer" value="<%=writer%>"><br>
			이메일 <input type="text" name="email" value="<%=email%>"><br>
			글제목 <input type="text" name="title" value="<%=title%>"><br>
			글내용 <input type="text" name="content" value="<%=content%>"><br>
			<input type="submit" value="저장">
			<input type="reset" value="취소" onclick="history.go(-1)">
		</form>
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