<%@page import="java.util.concurrent.ExecutionException"%>
<%@page import="test.dao.FileinfoDao"%>
<%@page import="java.io.File"%>
<%@page import="test.vo.FileinfoVo"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
</head>
<body>
<%
	String upload=application.getRealPath("/upload");
	MultipartRequest mr=new MultipartRequest(
			request, //request객체
			upload, //업로드할 디렉토리
			1025*1024*5,//최대업로드크기(5MB)
			"utf-8",//인코딩방식
			new DefaultFileRenamePolicy()
		);
	int filenum=Integer.parseInt(mr.getParameter("filenum"));
	String writer=mr.getParameter("writer");
	String title=mr.getParameter("title");
	String content=mr.getParameter("content");
	String orgfileName=mr.getOriginalFileName("file1");//전송된 파일명
	String savefileName=mr.getFilesystemName("file1");//저장된 파일명
	
	FileinfoVo vo=null;
	FileinfoDao dao=new FileinfoDao();
	try{
		FileinfoVo vo1=dao.getinfo(filenum);//기존 파일정보를 갖는 VO객체
		if(orgfileName!=null){ //수정할 파일이 전송된 경우
			//1.기존파일 삭제하기
			File f=new File(upload +"\\" + vo1.getSavefilename());
			f.delete();
			File file1=mr.getFile("file1");
			long filesize=file1.length();//전송된 파일크기 얻어오기
			//2.수정된 정보로 갱신하기
			vo=
			 new FileinfoVo(filenum,writer,title,content,orgfileName,savefileName,filesize);
		}else{ //수정할 파일이 전송되지 않은 경우- 기존파일 유지
			vo=new FileinfoVo(
		          filenum,writer,title,content,
		          vo1.getOrgfilename(),vo1.getSavefilename(),vo1.getFilesize());
		}
		dao.update(vo);
		out.println("<h1>수정성공!</h1>");
	}catch(Exception e){
		e.printStackTrace();
		out.println("<h1>수정오류!</h1>");
	}
%>
</body>
</html>










