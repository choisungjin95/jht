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
	int n1=Integer.parseInt(request.getParameter("n1"));
	int n2=Integer.parseInt(request.getParameter("n2"));
%>
<%=n1 %>*<%=n2 %> = <%=n1*n2 %><br>

${param.n1 }*${param.n2 }=${param.n1*param.n2 }<br>
</body>
</html>










