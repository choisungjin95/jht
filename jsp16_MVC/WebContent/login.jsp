
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login.jsp </title>
<script>

	Cookie cookie1 = new Cookie("id","");
	cookie1.setMaxAge(0); 
	response.addCookie(cookie1);

	Cookie cookie2 = new Cookie("pwd","");
	cookie2.setMaxAge(0); 
	response.addCookie(cookie2);
</script>


</head>
<body>
<%

	String id ="";	
	String pwd ="";
	String box ="";

	Cookie[] cooks = request.getCookies();
	if(cooks!=null){
		for(Cookie cookie : cooks){
			String cookieName = cookie.getName();
			String cookieValue = cookie.getValue();
			System.out.println(cookieName);
			if(cookieName.equals("id")){
				id=cookieValue;		
			}else if(cookieName.equals("pwd")){
				pwd=cookieValue;
			}else if(cookieName.equals("box")){
				box = cookieValue;
			}
			
			
		}
	}
%>

<form method="post" action= "loginOk.jsp">
	아이디<input type="text" name="id" value="<%=id %>" ><br>
	비밀번호<input type="text" name="pwd" value = "<%=pwd %>"><br>	
<%
	if(box.equals("true")){
%>
	<input type="checkbox" name="box" value="true" checked="checked"> 자동로그인<br>
<% 
	}else{
%>				
	<input type="checkbox" name="box" value="true"> 자동로그인<br>
<% 	
	}
%>	
	<input type="submit" value = "login">
	<input type="reset" value ="reset">
</form>

</body>
</html>