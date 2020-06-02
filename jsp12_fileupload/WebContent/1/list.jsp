<%@page import="test.vo.FileinfoVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.dao.FileinfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
</head>
<body>
<h1>파일목록</h1>
<table border="1" width="500" >
	<tr>
		<th>파일번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>파일명</th>
		<th>파일크기</th>
		<th>삭제</th>
		<th>수정</th>
		<th>이미지</th>
		<th>다운로드</th>
	</tr>
	<%
		FileinfoDao dao=new FileinfoDao();
		ArrayList<FileinfoVo> list=dao.fileList();
		for(FileinfoVo vo:list){
	%>
		<tr>
			<td><%=vo.getFilenum() %></td>
			<td><%=vo.getWriter() %></td>
			<td><%=vo.getTitle() %></td>
			<td><%=vo.getOrgfilename() %></td>
			<td><%=vo.getFilesize() %> bytes</td>
			<td><a href="delete.jsp?filenum=<%=vo.getFilenum() %>">삭제</a></td>
			<td><a href="update.jsp?filenum=<%=vo.getFilenum() %>">수정</a></td>
			<td><img src="upload/<%=vo.getSavefilename()%>" 
							               style="width:100px;height:100px"></td>
			<td><a href="filedownload?filenum=<%=vo.getFilenum()%>">파일다운로드</a></td>				               
		</tr>
	<%		
		}
	%>
</table>
</body>
</html>







