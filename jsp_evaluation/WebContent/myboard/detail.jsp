<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
	<li><a href="${cp }/home.do">홈으로</a><br></li>
	<li><a href="${cp }/myboard/insert.do">글작성</a><br></li>
	<li><a href="${cp }/myboard/list.do">글목록</a><br></li>
</ul>
<h1>상세글보기</h1>
<table>
	<tr>
		<td>글번호</td>
		<td>${vo.num }</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${vo.writer }</td>
	</tr>
	<tr>
		<td>내용</td>
	</tr>
	<tr>
		<td>${vo.content }</td>
	</tr>
</table>
<br>
<form method="post" action="${cp }/myboard/delete.do?title=${vo.title }&pwd=${vo.pwd}">
	비밀번호
	<input type="text" name="pwdOk">
	<input type="submit" value="삭제">
	${errMsg }
</form>
</body>
</html>


















