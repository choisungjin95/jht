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
		<input type="button" value="등록">
	</div>
</div>
</body>
<script type="text/javascript" src="js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	
	function getList() {
		delList();
		var commList=document.getElementById("commList");
		$.getJSON("comments.do",{"mnum":'${vo.mnum}'},function(data){
			for(var i=0;i<data.length;i++){
				var id=data[i].id;
				var comments=data[i].comments;
				var num=data[i].num;
				var div=document.createElement("div");
				div.innerHTML="아이디:"+id+"<br> 내용:"+comments
				+"<br><input type='button' value='삭제' onclick='del("+num+")'>";
				commList.appendChild(div);
			}
		});
	}
	
	function del(num){
		$.getJSON("delete.do",{"num":num},function(){
			getList();
		});
	}
	
	$("input[value='등록']").click(function(){
		var id=$("#id").val();
		var comments=$("#comments").val();
		$.getJSON("insert.do",{"id":id,"comments":comments,"mnum":'${vo.mnum}'},function(){
			getList();
			$("#id").val("");
			$("#comments").val("");
			$("#id").focus();
		});
	});
	
	function delList() {
		var commList=document.getElementById("commList");
		var childs=commList.childNodes;
		for(var i=childs.length-1;i>=0;i--){
			var div=childs.item(i);
			commList.removeChild(div);
		}
	}
</script>
</html>






