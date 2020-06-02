package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.Dao.BoardDao;
import test.vo.BoardVo;

@WebServlet("/board/updateOk.do")
public class UpdateOkController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num=Integer.parseInt(req.getParameter("num"));
		String writer=req.getParameter("writer");
		String email=req.getParameter("email");
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		BoardDao dao=new BoardDao();
		BoardVo vo=new BoardVo(num, writer, email, title, content, null);
		try {
			int n=dao.updateOk(vo);
			resp.sendRedirect(req.getContextPath()+"/board/list.do");
		}catch(Exception e) {
			System.out.println(e.getMessage());
			req.setAttribute("errMsg", "글 수정 실패!!!!");
			req.getRequestDispatcher("/error.jsp").forward(req, resp);
		}
	}
}






