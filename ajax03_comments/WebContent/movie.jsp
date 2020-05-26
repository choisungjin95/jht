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
	var xhrList=null;
	function getList() {
		xhrList=new XMLHttpRequest();
		xhrList.onreadystatechange=listOk;
		xhrList.open('get','comments.do?mnum=${vo.mnum}',true);
		xhrList.send();
	}
	function listOk(){
		if(xhrList.readyState==4 && xhrList.status==200){
			delAll();//기존댓글 지우기
			var xml=xhrList.responseXML;
			var comm=xml.getElementsByTagName("comm");
			var commList=document.getElementById("commList");
			for(var i=0;i<comm.length;i++){
				var id=comm[i].getElementsByTagName("id")[0].firstChild.nodeValue;
				var num=comm[i].getElementsByTagName("num")[0].firstChild.nodeValue;
				var comments=
					comm[i].getElementsByTagName("comments")[0].firstChild.nodeValue;
				var div=document.createElement("div");
				div.innerHTML="아이디:" + id +"<br>"+
							  "내용:" + comments +"<br>" +
							  "<input type='button' value='삭제' onclick='delComm("+num+")'>";
				div.className="comm";
				commList.appendChild(div);
			}
		}
	}
	var xhrInsert=null;
	function insertComm() {
		var id=document.getElementById("id").value;
		var comments=document.getElementById("comments").value;
		xhrInsert=new XMLHttpRequest();
		xhrInsert.onreadystatechange=insertOk;
		xhrInsert.open('post','insert.do',true);
		//post방식인 경우 콘텐츠타입지정하기
		xhrInsert.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhrInsert.send('id='+ id + '&comments=' + comments + '&mnum=${vo.mnum}');
	}
	function insertOk() {
		if(xhrInsert.readyState==4 && xhrInsert.status==200){
			var xml=xhrInsert.responseXML;
			var code=xml.getElementsByTagName("code")[0].firstChild.nodeValue;
			if(code=="success"){
				//alert('성공');
				getList();
			}else{
				alert('실패');
			}
		}
	}
	function delAll(){//전체댓글지우기
		var commList=document.getElementById("commList");
		var childs=commList.childNodes;//전체 자식노드(전체댓글) 얻어오기
		var len=childs.length;
		for(var i=len-1;i>=0;i--){
			var comments=childs.item(i);
			commList.removeChild(comments);
		}
	}
	var xhrDelete=null
	function delComm(num){
		xhrDelete=new XMLHttpRequest();
		xhrDelete.onreadystatechange=deleteOk;
		xhrDelete.open('get','delete.do?num='+num,true);
		xhrDelete.send();
	}
	function deleteOk(){
		if(xhrDelete.readyState==4 && xhrDelete.status==200){
			var xml=xhrDelete.responseXML;
			var code=xml.getElementsByTagName("code")[0].firstChild.nodeValue;
			if(code=="success"){
				getList();
			}else{
				alert('실패');
			}
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
		<!-- ajax로 댓글등록하고 성공/실패메시지 alert로 보이기 -->
	</div>
</div>
</body>
</html>






