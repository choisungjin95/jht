<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>loginOk.jsp</title>

</head>
<body>


<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String box = request.getParameter("box");

		
		if(box!=null){
			Cookie cookie1 = new Cookie("id",id);
			cookie1.setMaxAge(60*60*24*30);
			response.addCookie(cookie1);
			
			Cookie cookie2 = new Cookie("pwd",pwd);
			cookie2.setMaxAge(60*60*24*30);
			response.addCookie(cookie2);	
			
			Cookie cookie3 = new Cookie("box",box);
			cookie3.setMaxAge(60*60*24*30);
			response.addCookie(cookie3);	
			
			
		}else{
			Cookie cookie1 = new Cookie("id","");
			cookie1.setMaxAge(0); // ��Ű�� ���̻� ������ ���۵��� ����
			response.addCookie(cookie1);
		
			Cookie cookie2 = new Cookie("pwd","");
			cookie2.setMaxAge(0); 
			response.addCookie(cookie2);
			
			Cookie cookie3 = new Cookie("box","");
			cookie3.setMaxAge(0); 
			response.addCookie(cookie3);
		}
%>
<h1> �α��� �Ǿ����ϴ�. </h1>
<a href="login.jsp">����</a><br>

</body>
</html>