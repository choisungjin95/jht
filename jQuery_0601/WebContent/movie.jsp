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
		delAll();
		$.ajax({
			url:"comments.do",
			data:{"mnum":'${vo.mnum}'},
			success:function(data){
				$(data).find("comm").each(function(i){
					var num=$(this).find("num").text();
					var id=$(this).find("id").text();
					var comments=$(this).find("id").text();
					var div=$("<div></div>").appendTo($("#commList"));
					div.addClass("comm");
					div.html("아이디:" + id +"<br>"+
							  "내용:" + comments +"<br>" +
							  "번호:" + num +"<br>" +
							  "<input type='button' value='삭제' onclick='delComm("+num+")'>");
				});
			}
		});
	}
	
	function delComm(num){
		$.ajax({
			url:"delete.do",
			data:{"num":num},
			success:function(data){
				var code=$(data).find("code").text();
				if(code=="success"){
					getList();
				}else{
					alert('실패');
				}
			}
		});
	}
	
	$("input[value='등록']").click(function(){
		var id=$("#id").val();
		var comments=$("#comments").val();
		$.ajax({
			url:"insert.do",
			data:{"id":id,"comments":comments,"mnum":'${vo.mnum}'},
			success:function(data){
				var code=$(data).find("code").text();
				if(code=="success"){
					alert('성공');
					getList();
					$("#id").val("");
					$("#comments").val("");
					$("#id").focus();
				}else{
					alert('실패');
				}
			}
		});
	});
	
	function delAll(){//전체댓글지우기
		var commList=document.getElementById("commList");
		var childs=commList.childNodes;//전체 자식노드(전체댓글) 얻어오기
		var len=childs.length;
		for(var i=len-1;i>=0;i--){
			var comments=childs.item(i);
			commList.removeChild(comments);
		}
	}
</script>
</html>







