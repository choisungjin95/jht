<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cookName=request.getParameter("cookName");
	Cookie cook=new Cookie(cookName,"");
	cook.setMaxAge(0);
	response.addCookie(cook);
	response.sendRedirect("list.jsp");
%>