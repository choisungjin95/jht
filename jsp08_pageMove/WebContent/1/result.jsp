<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result.jsp</title>
</head>
<body>
<h1>result.jsp페이지....</h1>
<%
	//리퀘스트스코프에 담긴 값 꺼내오기
	String id=(String)request.getAttribute("id");
	String pwd=(String)request.getAttribute("pwd");
%>
<p>id : <%=id %></p>
<p>pwd : <%=pwd %></p>
</body>
</html>













