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
	<c:when test="${msg=='success'}">
		<h1>작성완료!!!</h1>
	</c:when>
	<c:otherwise>
		<h1>오류발생!!!</h1>
	</c:otherwise>
</c:choose>
<a href="${cp }/home.do">홈으로</a>
</body>
</html>