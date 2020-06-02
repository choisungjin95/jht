<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2/list.jsp</title>
</head>
<body>
<h1>판매제품목록</h1>
<ul>
	<li><a href="1.jsp">냉장고</a></li>
	<li><a href="2.jsp">TV</a></li>
	<li><a href="3.jsp">컴퓨터</a></li>
</ul>
<div>
	<h1>최근본상품</h1>
	<!-- 쿠키에 담긴 모든 상품을 출력해 보세요. -->
	<ul>
	<%
		Cookie[] cooks=request.getCookies();
		if(cooks!=null){
			for(Cookie cook:cooks){
				String cookName=cook.getName();
				if(cookName.startsWith("item")){
					String cookValue=cook.getValue();
		%>
			<li><%=cookValue %> <a href="delCookie.jsp?cookName=<%=cookName%>">삭제</a></li>
		<%
				}
			}
		}	
	%>
	</ul>
</div>
</body>
</html>














