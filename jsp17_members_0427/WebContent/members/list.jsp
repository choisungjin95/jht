<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  <!-- 필수!!!foreach문, if문 사용시 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/members/list.jsp</title>
</head>
<body>
<h1>회원목록</h1>
<table border="1" width="500">
	<tr>
		<th>회원번호</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>가입일</th>
		<th>삭제</th>
		<th>수정</th>
	</tr>
	<c:forEach var="vo" items="${requestScope.list}"><!-- //배열에 있는 값 꺼내올때 items속성 이용 -->
		<tr>
			<td>${vo.num}</td> <!-- //private 변수이기 때문에 바로접근x. 어떻게 가능? getter매서드가 실행돼서 가능 -->
			<td>${vo.name}</td>
			<td>${vo.phone}</td>
			<td>${vo.addr}</td>
			<td>${vo.regdate}</td>
			<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
			<td><a href="${cp}/members/delete.do?num=${vo.num}">삭제</a></td>
			<td><a href="${cp}/members/update.do?num=${vo.num}">수정</a></td>
		</tr>
	
	</c:forEach>

</table>
</body>
</html>