<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1/main.jsp</title>
</head>
<body>
<div id="header">
	<%@include file="header.jsp" %>
</div>
<div id="content">
	<h1>중앙HTA</h1>
	<p>환영합니다!!!!</p>
	<!-- header.jsp에서 선언된 변수를 사용할 수 있다. -->
	<p>프로젝트명: <%=context %></p>
</div>
<div id="footer"></div>
</body>
</html>







