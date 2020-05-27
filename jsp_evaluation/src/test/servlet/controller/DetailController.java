package test.servlet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.MyboardDao;
import test.vo.MyboardVo;

@WebServlet("/myboard/detail.do")
public class DetailController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title=req.getParameter("title");
		MyboardDao dao=new MyboardDao();
		MyboardVo vo=dao.detail(title);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/myboard/detail.jsp").forward(req, resp);
	}
}










