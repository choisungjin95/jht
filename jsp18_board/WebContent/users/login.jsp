<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/login.jsp</title>
</head>
<body>
<h1>회원로그인</h1>
<form method="post" action="${cp }/users/login.do">
	아이디 <input type="text" name="id"><br>
	비밀번호 <input type="password" name="pwd"><br>
	<div>${requestScope.errMsg }</div>
	<input type="submit" value="로그인">
</form>
<br>
</body>
</html>












