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
	String errMsg=(String)request.getAttribute("errMsg");
	if(errMsg==null) errMsg="";
	String id=(String)request.getParameter("id");
	String pwd=(String)request.getParameter("pwd");
	String email=(String)request.getParameter("email");
	if(id==null){
		id="";		pwd="";		email="";
	}
%>
<h1>회원가입</h1>
<form method="post" action="joinOk.jsp" onsubmit="return validate();">
	아이디(*) <input type="text" name="id" value="<%=id%>">
	<span id="errMsg"><%=errMsg %></span>
	<br>
	비밀번호(*) <input type="password" name="pwd" value="<%=pwd%>"><br>
	이메일 <input type="text" name="email" value="<%=email%>"><br>
	<!-- 회원가입 기능을 구현해 보세요.
		 기존에 가입된 아이디가 있는경우는 span#errMsg에 아이디가 존재합니다
		 라고 출력되도록 해보세요. 
	 -->
	<input type="submit" value="가입">
	<input type="reset" value="취소">
</form>
</body>
<!-- 아이디와 비밀번호가 입력되었는지 확인하기 -->
<script type="text/javascript">
	function validate(){
		var id=document.getElementsByName("id")[0];
		var pwd=document.getElementsByName("pwd")[0];
		if(id.value==""){
			alert("아이디를 입력하세요!");
			id.focus();
			return false;
		}
		if(pwd.value==""){
			alert("비밀번호를 입력하세요!");
			pwd.focus();
			return false;
		}
		return true;
	}
</script>
</html>









