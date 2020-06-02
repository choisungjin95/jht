<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
</head>
<body>
<ul>
	<h1>mvc방식 연습하기</h1> 
	<li><a href="insert.jsp">글 등록(추가하기)</a></li>
	<li><a href="update.jsp">수정</a></li>
	<li><a href="delete.jsp">삭제</a></li>
	<li><a href="${pageContext.request.contextPath}/homework/select.do">전체조회</a></li>
</ul>

</body>
</html>