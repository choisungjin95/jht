<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.comm{width:400px;height: 100px;border:1px solid #aaa;margin-bottom: 5px;}
</style>
<script type="text/javascript">
	var xhrInsert=null;
	function insertComm() {
		var id=document.getElementById("id").value;
		var comments=document.getElementById("comments").value;
		xhrInsert=new XMLHttpRequest();
		xhrInsert.onreadystatechange=insertOk;
		xhrInsert.open('post','insert.do',true);
		xhrInsert.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhrInsert.send('id='+ id + '&comments=' + comments + '&mnum=${vo.mnum}');
	}
	function insertOk() {
		if(xhrInsert.readyState==4 && xhrInsert.status==200){
			var data=xhrInsert.responseText;
			var json=JSON.parse(data);
			getList();
		}
	}
	function getList(){
		delList();
		var xhr=new XMLHttpRequest();
		var commList=document.getElementById("commList");
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				var data=xhr.responseText;
				var json=JSON.parse(data);
				for(var i=0;i<json.length;i++){
					var div=document.createElement("div");
					div.innerHTML="아이디:"+json[i].id+"<br> 내용:"+json[i].comments
					+"<br><input type='button' value='삭제' onclick='del("+json[i].num+")'>";
					commList.appendChild(div);
				}
			}
		}
		xhr.open('get','comments.do?mnum=${vo.mnum}',true);
		xhr.send();
	}
	xhrDelete=null;
	function del(num) {
		xhrDelete=new XMLHttpRequest();
		xhrDelete.onreadystatechange=delOk;
		xhrDelete.open('post','delete.do?num='+num,true);
		xhrDelete.send();
	}
	function delOk() {
		if(xhrDelete.readyState==4 && xhrDelete.status==200){
			var data=xhrDelete.responseText;
			var json=JSON.parse(data);
			getList();
		}
	}
	function delList() {
		var commList=document.getElementById("commList");
		var childs=commList.childNodes;
		for(var i=childs.length-1;i>=0;i--){
			var div=childs.item(i);
			commList.removeChild(div);
		}
	}
</script>
</head>
<body onload="getList()">
<h1>영화 상세페이지</h1>
<div>
	<h1>${vo.title }</h1>
	<p>
		내용 : ${vo.content }<br>
		감독 : ${vo.director }
	</p>
</div>
<div> <!-- 댓글이 보여질 div -->
	<div id="commList"></div>
	<div>
		아이디<br>
		<input type="text" id="id"><br>
		댓글<br>
		<textarea rows="3" cols="30" id="comments"></textarea><br>
		<input type="button" value="등록" onclick="insertComm()">
	</div>
</div>
</body>
</html>






