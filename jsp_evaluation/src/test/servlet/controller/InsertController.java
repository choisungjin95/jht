package test.servlet.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.MyboardDao;
import test.vo.MyboardVo;
@WebServlet("/myboard/insert.do")
public class InsertController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/myboard/insert.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String writer=req.getParameter("writer");
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		String pwd=req.getParameter("pwd");
	
		MyboardDao dao=new MyboardDao();
		MyboardVo vo=new MyboardVo(0, writer, pwd, title, content, null);
		int n=dao.Insert(vo);
		if(n>0) {
			req.setAttribute("msg", "success");
		}else {
			req.setAttribute("msg", "error");
		}
		req.getRequestDispatcher("/myboard/result.jsp").forward(req, resp);
	}
}






