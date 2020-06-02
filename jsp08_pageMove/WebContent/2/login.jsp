<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2/login.jsp</title>
</head>
<body>
<%
	String errMsg=(String)request.getAttribute("errMsg");
	if(errMsg==null){
		errMsg="";
	}
	//String id=(String)request.getAttribute("id");
	String id=request.getParameter("id");//가능
	if(id==null) id="";	
	String pwd=(String)request.getAttribute("pwd");
	if(pwd==null) pwd="";	
%>
<h1>회원로그인</h1>
<form method="post" action="loginOk.jsp">
<!--  아이디와 비밀번호가 틀린경우 에러메시지와 함께 입력된 값들이 보여지도록 추가해 보세요.-->
	아이디 <input type="text" name="id" value="<%=id%>"><br>
	비밀번호 <input type="password" name="pwd" value="<%=pwd%>"><br>
	<div id="errMsg"><%=errMsg %></div>
	<input type="submit" value="로그인">
</form>
<br>
</body>
</html>






