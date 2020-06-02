<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${param.num1 mod 2==0 }">
		${param.num1 }은 짝수!<br>
	</c:when>
	<c:otherwise>
		${param.num1 }은 홀수!<br>
	</c:otherwise>
</c:choose>
</body>
</html>






