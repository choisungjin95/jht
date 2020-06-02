<%@page import="test.dao.MembersDao"%>
<%@page import="test.vo.MembersVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="members" class="test.vo.MembersVo"/>
<jsp:setProperty property="*" name="members"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateOk.jsp</title>
</head>
<body>
<%
//	MembersDao dao=(MembersDao)session.getAttribute("dao");
	MembersDao dao=new MembersDao();
	int n=dao.update(members);
	if(n>0){
		response.sendRedirect("list.jsp");
	}else{
		out.print("오류발생!!!!!!!!");
	}
%>
</body>
</html>







