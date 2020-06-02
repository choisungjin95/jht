<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	if(id.equals("admin") && pwd.equals("1234")){
		session.setAttribute("id",id);
		response.sendRedirect("layout.jsp?file=main.jsp");
	}else{
%>
	<script>
		alert("아이디 또는 비밀번호가 맞지 않아요!");
		history.go(-1);
	</script>
<%		
	}
%>