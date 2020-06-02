package homework.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import homework.dao.BoardDao;
import homework.vo.BoardVo;

@WebServlet("/homework/select.do")
public class SelectController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDao dao=new BoardDao();
		ArrayList<BoardVo> list=dao.allList();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/homework/select.jsp").forward(req, resp);
	}
}
