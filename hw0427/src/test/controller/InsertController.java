package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.Dao.BoardDao;
import test.vo.BoardVo;

@WebServlet("/board/insert.do")
public class InsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String writer=req.getParameter("writer");
		String email=req.getParameter("email");
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		
		BoardDao dao=new BoardDao();
		BoardVo vo=new BoardVo(0, writer, email, title, content, null);
		int n=dao.insert(vo);
		String code="success";
		if(n<=0) {
			code="fail";
		}
		
		req.setAttribute("code", code);
		req.getRequestDispatcher("/board/insertOk.jsp").forward(req, resp);
		
	}
}










