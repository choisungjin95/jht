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
<h1>게시판</h1>
<a href="${cp }/home.do">홈으로</a>
<table border="1">
	<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>제목</th>
	</tr>
	<c:forEach var="vo" items="${requestScope.list }">
		<tr>
			<td>${vo.num }</td>
			<td>${vo.writer }</td>
			<td><a href="${cp }/myboard/detail.do?title=${vo.title }">${vo.title }</a></td>
		</tr>
	</c:forEach>
</table>
<form method="post" action="${cp }/myboard/search.do">
	<select name="select">
		<option>글번호</option>
		<option>작성자</option>
		<option>제목</option>
	</select>
	<input type="text" name="search">
	<input type="button" value="검색">
</form>
</body>
</html>










