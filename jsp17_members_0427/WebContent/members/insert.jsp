<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert.jsp</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/members/insert.do" method="post">
	회원번호<input type="text" name="num"><br>
	이름<input type="text" name="name"><br>
	전화번호<input type="text" name="phone"><br>
	주소 <input type="text" name="addr"><br>
	<input type="submit" value="저장">
</form>
</body>
</html>