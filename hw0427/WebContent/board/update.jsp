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
<h1>글 수정</h1>
<form action="${pageContext.request.contextPath }/board/updateOk.do">
	글번호 <input type="text" name="num" value="${vo.num }" readonly="readonly"><br>
	작성자 <input type="text" name="writer" value="${requestScope.vo.writer }"><br>
	이메일 <input type="text" name="email" value="${requestScope.vo.email }"><br>
	제목 <input type="text" name="title" value="${requestScope.vo.title }"><br>
	내용 <input type="text" name="content" value="${requestScope.vo.content }"><br>
	<input type="submit" value="수정">
	<input type="reset" value="취소" onclick="history.go(-1)">
</form>
</body>
</html>