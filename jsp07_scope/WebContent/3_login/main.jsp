<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
</head>
<body>
<!-- 
	1.로그인이 안되었으면 회원로그인링크가 보이고
	   로그인되었으면 로그아웃링크가 보여지게 하기
	
	2.로그아웃기능 추가하기 -> 로그아웃되었습니다. 라고 출력하기
 -->
<ul>
<%
	//세션의 id얻어오기
	String id=(String)session.getAttribute("id");
	if(id==null){//로그인안한 경우
%>
	<li><a href="login.jsp">회원로그인</a></li>
<%		
	}else{//로그인한 경우
%>
	<li><%=id %>님 반가워요 <a href="logout.jsp">로그아웃</a></li>
<%		
	}
%>
	<li><a href="items.jsp">상품목록</a></li>
	<li><a href="mypage.jsp">마이페이지</a></li>
</ul>
</body>
</html>







