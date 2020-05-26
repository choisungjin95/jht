<%@page import="org.json.JSONObject"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id="test";
	String pwd="1234";
	String email="test@daum.net";
	JSONObject json=new JSONObject();
	json.put("id",id);
	json.put("pwd",id);
	json.put("email",id);
	response.setContentType("text/plain;charset=utf-8");
	PrintWriter pw=response.getWriter();
	pw.print(json);//json문자열로 응답
	
%>