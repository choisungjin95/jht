<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test.db.JDBCUtil"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
</head>
<body>
<%
	Connection con=null;
	PreparedStatement pstmt=null;
	request.setCharacterEncoding("utf-8");
	String writer=request.getParameter("writer");
	String email=request.getParameter("email");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	int num=0;
	try{
		con=JDBCUtil.getConn();
		String sql="insert into board values(board_seq.nextval,?,?,?,?,sysdate)";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, writer);
		pstmt.setString(2, email);
		pstmt.setString(3, title);
		pstmt.setString(4, content);
		int n=pstmt.executeUpdate();
		if(n>0){
%>
		<script type="text/javascript">
			alert('등록성공');
			location.href="list.jsp";
		</script>
<%
		}else{
			out.print("<h1>오류로 인해 회원가입실패!</h1>");
		}
	}catch(SQLException se){
		se.getStackTrace();
	}finally{
		JDBCUtil.close(null,pstmt,con);
	}
%>
</body>
</html>







