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
<h1>전체 글 목록</h1>
<table border="1px">
<tr>
	<th>글번호</th><th>작성자</th><th>이메일</th><th>제목</th><th>내용</th><th>작성일</th>
	<th>삭제</th><th>수정</th>
</tr>
	<c:forEach var="vo" items="${requestScope.list}">
		<tr>
			<td>${vo.num }</td>
			<td>${vo.writer }</td>
			<td>${vo.email }</td>
			<td>${vo.title }</td>
			<td>${vo.content }</td>
			<td>${vo.w_date }</td>
			<td><a href="${pageContext.request.contextPath }/board/delete.do?num=${vo.num}">삭제</a></td>
			<td><a href="${pageContext.request.contextPath }/board/update.do?num=${vo.num}">수정</a></td>
		</tr>
	</c:forEach>
</table><br>
<a href="${pageContext.request.contextPath }/main.jsp">메인으로</a>
</body>
</html>