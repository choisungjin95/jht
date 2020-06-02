<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1/login.jsp</title>
</head>
<body>

<a href="../main.jsp">메인페이지(상대경로)</a><br>
<a href="/jsp14_path/main.jsp">메인페이지(절대경로)</a><br>

<h1>회원로그인</h1>

<%-- http://localhost:8081/jsp14_path/1/login.jsp
<form method="post" action="../member/loginOk"> --%>
<form method="post" action="/jsp14_path/member/loginOk">
	아이디 <input type="text" name="id"><br>
	비밀번호 <input type="password" name="pwd"><br>
	<input type="submit" value="로그인">
</form>
<br>
</body>
</html>






