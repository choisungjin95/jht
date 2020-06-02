package test.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/member/mylist")
public class MyList extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ArrayList<String> list=new ArrayList<String>();
		list.add("딸기");
		list.add("바나나");
		req.setAttribute("list",list);
		req.getRequestDispatcher("/member/mylist.jsp").forward(req, resp);
	}
}








