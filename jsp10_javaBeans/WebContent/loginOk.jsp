<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginOk.jsp</title>
</head>
<body>
<jsp:useBean id="user" class="test.beans.Login" scope="session"/>
<jsp:setProperty property="*" name="user"/>
<h1>사용자정보</h1>
id : <jsp:getProperty property="id" name="user"/><br>
password : <jsp:getProperty property="pwd" name="user"/>
</body>
</html>











