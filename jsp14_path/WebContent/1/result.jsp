<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1/result.jsp</title>
</head>
<body>
<h1>result.jsp</h1>
<%
	String msg=(String)request.getAttribute("msg");
%>
msg : <%=msg %><br>
<a href="main.jsp">메인페이지(상대)</a><br>
<a href="<%=request.getContextPath()%>/main.jsp">메인페이지(절대)</a><br>

<a href="member/login">goLogin(상대)</a><br>
<a href="/jsp14_path/member/login">goLogin(절대)</a><br>
</body>
</html>













