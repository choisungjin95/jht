package homework.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import homework.dao.BoardDao;

@WebServlet("/homework/delete.do")
public class DeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num=Integer.parseInt(req.getParameter("num"));
		BoardDao dao=new BoardDao();
		int n=dao.delete(num);
		String code="success";
		if (n<=0) {
			code="fail";
		}
		req.setAttribute("code", code);
		req.getRequestDispatcher("/homework/delete.jsp").forward(req, resp);
	}
}
