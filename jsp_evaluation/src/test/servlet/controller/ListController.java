package test.servlet.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.MyboardDao;
import test.vo.MyboardVo;
@WebServlet("/myboard/list.do")
public class ListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 
		 
		/*
		 * MyboardDao dao=new MyboardDao(); ArrayList<MyboardVo> list=dao.list();
		 * req.setAttribute("list", list);
		 * req.getRequestDispatcher("/myboard/list.jsp").forward(req, resp);
		 */
	}
}
