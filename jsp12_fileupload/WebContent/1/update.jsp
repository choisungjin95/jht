<%@page import="test.vo.FileinfoVo"%>
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
<h1>파일수정</h1>
<%
	FileinfoDao dao=new FileinfoDao();
	int filenum=Integer.parseInt(request.getParameter("filenum"));
	FileinfoVo vo=dao.getinfo(filenum);	
%>
<form method="post" action="updateOk.jsp" enctype="multipart/form-data">
	<input type="hidden" value="<%=vo.getFilenum() %>" name="filenum">
	작성자<br>
	<input type="text" name="writer" value="<%=vo.getWriter()%>"><br>
	제목<br>
	<input type="text" name="title" value="<%=vo.getTitle()%>"><br>
	내용<br>
	<textarea rows="5" cols="50" name="content"><%=vo.getContent() %></textarea><br>
	첨부파일<br>
	<div>기존파일<%=vo.getOrgfilename()%></div>
	<input type="file" name="file1"><br>
	<input type="submit" value="수정완료">
</form>
</body>
</html>







