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
<h1>글등록하기</h1>
<form method="post" action="${cp }/myboard/insert.do">
	작성자<br>
	<input type="text" name="writer"><br>
	제목<br>
	<input type="text" name="title"><br>
	내용<br>
	<textarea rows="5" cols="30" name="content"></textarea><br>
	비밀번호<br>
	<input type="text" name="pwd"><br>
	<input type="submit" value="등록">
</form>
</body>
</html>