package homework.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import homework.dao.BoardDao;
import homework.vo.BoardVo;
@WebServlet("/homework/update.do")
public class UpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//url·Î ¹Þ±â
		int num=Integer.parseInt(req.getParameter("num"));
		BoardDao dao=new BoardDao();
		BoardVo vo=dao.updateOk(num);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/homework/update.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num=Integer.parseInt(req.getParameter("num"));
		String title=req.getParameter("title");
		String writer=req.getParameter("writer");
		String content=req.getParameter("content");
		String email=req.getParameter("email");
		BoardVo vo=new BoardVo(num,title, writer, content,null, email);
		BoardDao dao=new BoardDao();
		int n=dao.update(vo);
		String code="success";
		if (n<=0) {
			code="fail";
		}
		req.setAttribute("code", code);
		req.getRequestDispatcher("/homework/result.jsp").forward(req, resp);
	
	}
}
