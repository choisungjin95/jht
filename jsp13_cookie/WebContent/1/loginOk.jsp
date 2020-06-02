<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1/loginOk.jsp</title>
</head>
<body>
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	//사용자 정보 쿠키에 담기
	Cookie cookie1=new Cookie("id",id);//쿠키생성
	cookie1.setPath("/");
	cookie1.setMaxAge(60*2);//쿠키유지시간 설정(초단위 - 2분)
	response.addCookie(cookie1);//응답객체에 쿠키 담기
	
	Cookie cookie2=new Cookie("pwd",pwd);
	cookie2.setMaxAge(60*2);
	response.addCookie(cookie2);
%>
<h1>쿠키에 저장완료!</h1>
<a href="main.jsp">메인</a><br>
<a href="getCookie.jsp">쿠키보러가기</a><br>
</body>
</html>













