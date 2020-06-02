package test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.Dao.BoardDao;
import test.vo.BoardVo;

@WebServlet("/board/list.do")
public class ListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDao dao=new BoardDao();
		ArrayList<BoardVo> list=dao.list();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/board/list.jsp").forward(req, resp);
	}
}
