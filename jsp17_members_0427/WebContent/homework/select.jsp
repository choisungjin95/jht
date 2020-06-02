<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select.jsp</title>
</head>
<body>
<table border="1" width="500">
	<tr><th>글번호</th><th>글제목</th><th>작성자</th><th>글내용</th><th>작성일</th><th>이메일</th><th>삭제</th>
	<th>수정</th></tr>
	<c:forEach var="vo" items="${list}">
		<tr>
			<td>${vo.num}</td>
			<td>${vo.title}</td>
			<td>${vo.writer}</td>
			<td>${vo.content}</td>
			<td>${vo.regdate}</td>
			<td>${vo.email}</td>
			<c:set var="cp" value="${pageContext.request.contextPath}"/>
			<td><a href="${cp}/homework/delete.do?num=${vo.num}">삭제</a></td>
			<td><a href="${cp}/homework/update.do?num=${vo.num}">수정</a></td>
		</tr>
	</c:forEach>
</table>

</body>
</html>