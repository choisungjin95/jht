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
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String birth=request.getParameter("birth");
	String addr=request.getParameter("addr");//선택된 라디오버튼 값
	String job=request.getParameter("job");
	String desc=request.getParameter("desc");
%>
<h1>사용자 정보</h1>
아이디 : <%=id %><br>
비밀번호 : <%=pwd %><br>
생년월일 : <%=birth %><br>
사는지역: <%=addr %><br>
직업 : <%=job %><br>
하고싶은말 : <%=desc %><br>
취미<br> 
<%
	//선택된 취미 읽어오기(체크박스-배열)
	String[] hobby=request.getParameterValues("hobby");
	for(String h:hobby){
%>	
	<%=h %> &nbsp;&nbsp;
<%
	}	
%>

<br>
</body>
</html>











