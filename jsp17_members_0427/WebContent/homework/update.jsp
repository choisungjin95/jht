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
<form action="${pageContext.request.contextPath}/homework/update.do" method="post">
	글번호<input type="text" name="num" value="${vo.num}"><br>
	글제목<input type="text" name="title" value="${vo.title}"><br>
	작성자<input type="text" name="writer" value="${vo.writer}"><br>
	글내용<input type="text" name="content" value="${vo.content}"><br>
	이메일<input type="text" name="email" value="${vo.email}"><br>
	<input type="submit" value="가입">
</form>


</body>
</html>