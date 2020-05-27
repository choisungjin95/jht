<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
</head>
<body>
<h1>결과페이지</h1>
<% //스크립트릿
	Date d=new Date();
	out.print("오늘날짜:" + d +"<br>");
	String id=request.getParameter("id");//파라미터가 네임인 요소를 가져와서 리턴해줌
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	out.print("<h1>사용자가 보내온 정보</h1>");
	out.print("id:" + id +"<br>");
	out.print("pwd:" + pwd +"<br>");
	out.print("email:" + email +"<br>");
%>
<h1>사용자가 보내온 정보2</h1>
id : <%=id %><br>
pwd : <%=pwd %><br>
email : <%=email %><br>
</body>
</html>