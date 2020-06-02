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
<c:set var="vo" value="${requestScope.vo}"/><!-- 안써도 됨 -->

<h1>회원목록</h1>
<form action="${pageContext.request.contextPath}/updateOk.do" method="post">
	회원번호<input type="text" name="num" value="${vo.num}" readonly="readonly"><br>
	이름<input type="text" name="name" value="${vo.name}"><br>
	전화번호<input type="text" name="phone" value="${vo.phone}"><br>
	주소 <input type="text" name="addr" value="${vo.addr}"><br>
	가입일${vo.regdate} <br>
	<input type="submit" value="저장">
</form>

</body>
</html>