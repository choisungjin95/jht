<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
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
	int num=Integer.parseInt(request.getParameter("num"));
	Connection con=null;
	PreparedStatement pstmt=null;
	int n=0;
	try{
		con=JDBCUtil.getConn();
		String sql="delete from board where num=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, num);
		n=pstmt.executeUpdate();
		System.out.println(n+"-----n");
	}catch(SQLException se){
		se.printStackTrace();
	}finally{
		try{
			if(con!=null) con.close();
			if(pstmt!=null) pstmt.close();
		}catch(SQLException se){
			se.printStackTrace();
		}
	}
	if(n>0){
%>
	<script type="text/javascript">
		alert('삭제성공');
		location.href="list.jsp";
	</script>
<%
	}else {
%>
	<script type="text/javascript">
		alert("삭제실패");
		history.go(-1);//이전페이지로 이동
	</script>
<%
	}
%>
</body>
</html>