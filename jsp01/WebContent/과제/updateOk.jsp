<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test.db.JDBCUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	request.setCharacterEncoding("utf-8");
	int num=Integer.parseInt(request.getParameter("num"));
	String writer=request.getParameter("writer");
	String email=request.getParameter("email");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	int n=0;
	System.out.println("--------------------");
	System.out.println(num+"-----num");
	System.out.println(writer+"-----writer");
	System.out.println(email+"-----email");
	System.out.println(title+"-----title");
	System.out.println(content+"-----content");
	try{
		con=JDBCUtil.getConn();
		String sql="update board set writer=?,email=?,title=?,content=? where num=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, writer);
		pstmt.setString(2, email);
		pstmt.setString(3, title);
		pstmt.setString(4, content);
		pstmt.setInt(5, num);
		n=pstmt.executeUpdate();
		System.out.println(n+"-----n");
	}catch(SQLException se){
		se.getStackTrace();
	}finally{
		JDBCUtil.close(null,pstmt,con);
	}
	if(n>0){
%>
	<script type="text/javascript">
		alert('수정완료');
		location.href="list.jsp";
	</script>
<%
	}else {
%>
	<script type="text/javascript">
		alert("수정실패");
		history.go(-1);
	</script>
<%
	}
%>
</body>
</html>








