<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert.jsp</title>
</head>
<body>
<h1>회원수정</h1>
<form action="${pageContext.request.contextPath }/members/update.do" 
   method="post">
	회원번호 <input type="text" name="num" value="${vo.num }" readonly="readonly"><br>
	이름 <input type="text" name="name" value="${requestScope.vo.name}"><br>
	전화번호 <input type="text" name="phone" value="${requestScope.vo.phone}"><br>
	주소 <input type="text" name="addr" value="${requestScope.vo.addr}"><br>
	가입일 ${vo.regdate }<br>
	<input type="submit" value="저장">
</form>
</body>
</html>






