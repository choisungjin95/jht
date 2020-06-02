<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/board/insert.do" method="post">
	작성자 <input type="text" name="writer"><br>
	이메일 <input type="text" name="email"><br>
	제목 <input type="text" name="title"><br>
	내용 <textarea rows="5" cols="10" name="content"></textarea><br>
	<input type="submit" value="전송">
	<input type="reset" value="취소" onclick="history.go(-1)">
</form>
</body>
</html>