<%@page import="test.vo.MembersVo"%>
<%@page import="test.dao.MembersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	MembersDao dao=new MembersDao();
	MembersVo vo=dao.getinfo(num);
%>
<h1>회원수정</h1>
<form method="post" action="updateOk.jsp">
회원번호 <input type="text" name="num" value="<%=vo.getNum()%>" readonly="readonly"><br>
이름 <input type="text" name="name" value="<%=vo.getName()%>" ><br> 
전화번호 <input type="text" name="phone" value="<%=vo.getPhone()%>" ><br> 
주소 <input type="text" name="addr" value="<%=vo.getAddr()%>"><br> 
가입일 <input type="text" value="<%=vo.getRegdate()%>" readonly="readonly"><br> 
<input type="submit" value="저장">
</form>
</body>
</html>








