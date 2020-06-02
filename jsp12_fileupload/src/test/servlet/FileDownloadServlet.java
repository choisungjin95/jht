package test.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.FileinfoDao;
import test.vo.FileinfoVo;
@WebServlet("/filedownload")
public class FileDownloadServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int filenum=Integer.parseInt(req.getParameter("filenum"));
		FileinfoDao dao=new FileinfoDao();
		//다운로드할 파일 정보 얻어오기
		FileinfoVo vo=dao.getinfo(filenum);	
		//파일명이 한글인 경우 깨지지 않도록 인코딩설정
		String filename=URLEncoder.encode(vo.getOrgfilename(),"utf-8");
		filename=filename.replaceAll("\\+","%20");
		//1. 다운로드창으로 응답하기
		resp.setContentType("application/octet-stream");
		resp.setContentLengthLong(vo.getFilesize());
		resp.setHeader("Content-Disposition","attachment;filename=" + filename);	
		//2. 클라이언트에 파일 보내기(파일복사)
		ServletContext application=req.getServletContext();
		String upload=application.getRealPath("/upload");
		//전송될 파일을 읽어오기 위한 파일스트림객체
		FileInputStream fis=
			new FileInputStream(upload + File.separator +vo.getSavefilename());
		//클라이언트에 파일데이터를 전송(출력)하기 위한 스트림객체
		OutputStream os=resp.getOutputStream();
		BufferedInputStream bis=new BufferedInputStream(fis);
		BufferedOutputStream bos=new BufferedOutputStream(os);
		byte[] b=new byte[100];
		int n=0;
		while((n=bis.read(b))!=-1) {
			bos.write(b,0,n);
		}
		bos.close();
		bis.close();
	}
}




















