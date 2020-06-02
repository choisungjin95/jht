<%@page import="java.io.File"%>
<%@page import="test.dao.FileinfoDao"%>
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
	int filenum=Integer.parseInt(request.getParameter("filenum"));
	String uploadPath=application.getRealPath("/upload");
	FileinfoDao dao=new FileinfoDao();
	String savefilename=dao.getinfo(filenum).getSavefilename();
	System.out.println("savefilename:" + savefilename);
	File f=new File(uploadPath +"\\" + savefilename);
	try{
		f.delete(); //1. 파일삭제
		dao.delete(filenum); //2. DB에서 삭제
%>
	<h1>파일삭제 성공!!!</h1>
	<a href="main.jsp">메인</a>
<%
	}catch(Exception e){
		System.out.println(e.getMessage());
		out.println("오류로 인해 삭제 실패!!!!");
	}
%>
</body>
</html>











