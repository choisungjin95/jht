<%@page import="test.vo.MembersVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.dao.MembersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
</head>
<body>
<h1>전체회원목록</h1>
<table border="1" width="500">
	<tr>
		<th>번호</th><th>이름</th><th>전화번호</th><th>주소</th><th>가입일</th>
		<th>삭제</th><th>수정</th>
	</tr>
		<%
			MembersDao dao=new MembersDao();
			ArrayList<MembersVo> list=dao.list();
			for(MembersVo vo:list){
		%>
	<tr>
		<td><%=vo.getNum() %></td>
		<td><%=vo.getName() %></td>
		<td><%=vo.getPhone() %></td>
		<td><%=vo.getAddr() %></td>
		<td><%=vo.getRegdate() %></td>
		<td><a href="delete.jsp?num=<%=vo.getNum()%>">삭제</a></td>
		<td><a href="update.jsp?num=<%=vo.getNum()%>">수정</a></td>
	</tr>		
		<%				
			}
		%>
</table>

</body>
</html>












