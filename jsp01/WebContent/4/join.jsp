<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
</head>
<body>
<%
    //한글이 깨지지 않도록 인코딩설정하기(post방식인경우)
	request.setCharacterEncoding("utf-8");
	String num=request.getParameter("num");
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	
%>
번호 : <%out.print(num);%><br> <%=num %>
이름 : <%=name %><br>
전화번호 : <%=phone %><br>
</body>
</html>







