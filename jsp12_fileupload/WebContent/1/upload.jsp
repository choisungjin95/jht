<%@page import="test.vo.FileinfoVo"%>
<%@page import="test.dao.FileinfoDao"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload.jsp</title>
</head>
<body>
<%
	//업로드할 폴더 경로 
	String upload=application.getRealPath("/upload");
	System.out.println("path:" + upload);
	/*
	public MultipartRequest(javax.servlet.http.HttpServletRequest request,
                        java.lang.String saveDirectory,
                        int maxPostSize,
                        java.lang.String encoding,
                        FileRenamePolicy policy)
                 throws java.io.IOException */
    MultipartRequest mr=new MultipartRequest(
    			request, //request객체
    			upload, //업로드할 디렉토리
    			1025*1024*5,//최대업로드크기(5MB)
    			"utf-8",//인코딩방식
    			new DefaultFileRenamePolicy()
    		);
	String writer=mr.getParameter("writer");
	String title=mr.getParameter("title");
	String content=mr.getParameter("content");
	String orgfileName=mr.getOriginalFileName("file1");//전송된 파일명
	String savefileName=mr.getFilesystemName("file1");//저장된 파일명
	File file1=mr.getFile("file1");//전송된파일에대한 정보를 갖는 File객체
	long filesize=file1.length();//전송된 파일크기 얻어오기
	
	FileinfoDao dao=new FileinfoDao();
	FileinfoVo vo=
		new FileinfoVo(0,writer,title,content,orgfileName,savefileName,filesize);
	int n=dao.insert(vo);
	if(n>0){
		out.print("<h1>DB저장성공!!!!</h1>");		
	}else{
		out.print("<h1>DB저장실패!!!!</h1>");		
	}
%>
<p>[<%=upload %>]경로에 파일업로드 완료!</p>
<h1>전송된 정보</h1>
작성자 :<%=writer %><br>
제목 :<%=title %><br>
내용 :<%=content %><br>
전송된파일명 :<%=orgfileName %><br>
저장된파일명 :<%=savefileName %><br>
</body>
</html>















