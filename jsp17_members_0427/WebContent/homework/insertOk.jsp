<%@page import="homework.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertOk.jsp</title>
</head>
<body>
	<c:choose>
		<c:when test="${code=='success'}">
			<h1>글추가 성공!!!!</h1>
		</c:when>
		<c:otherwise>
			<h1>실패실패..</h1>
		</c:otherwise>
	</c:choose>
<a href="${pageContext.request.contextPath}/homework/main.jsp">메인으로 이동</a>
</body>
</html>