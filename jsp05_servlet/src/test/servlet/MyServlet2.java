package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet2 extends HttpServlet{
	String url;
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init메소드 호출....");
		ServletContext sc=config.getServletContext();
		url=sc.getInitParameter("url");
	}	
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service메소드 호출");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.write("<h1>MyServlet2의 service메소 호출..!</h1>");
		pw.write("url=>" + url +"<br>");
		pw.close();
	}
}










