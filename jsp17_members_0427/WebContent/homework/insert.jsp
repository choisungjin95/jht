<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert.jsp</title>
</head>
<body>
<!-- pageContext.request.contextPath}/members/insert.do -->

<form action="${pageContext.request.contextPath}/homework/insert.do" method="post">
	글번호<input type="text" name="num"><br>
	글제목<input type="text" name="title"><br>
	작성자<input type="text" name="writer"><br>
	글내용<input type="text" name="content"><br>
	이메일<input type="text" name="email"><br>
	<input type="submit" value="가입">
</form>
</body>
</html>