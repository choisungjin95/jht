package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.MembersDao;
import test.vo.MembersVo;

@WebServlet("/members/update.do")
public class UpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num=Integer.parseInt(req.getParameter("num"));
		MembersDao dao=new MembersDao();
		MembersVo vo=dao.getinfo(num);
		req.setAttribute("vo",vo);
		req.getRequestDispatcher("/members/update.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String num=req.getParameter("num");
		String name=req.getParameter("name");
		String phone=req.getParameter("phone");
		String addr=req.getParameter("addr");
		MembersVo vo=new MembersVo(Integer.parseInt(num), name, phone, addr,null);
		MembersDao dao=new MembersDao();
		int n=dao.update(vo);
		String code="success";
		if(n<=0) {
			code="fail";
		}
		req.setAttribute("code",code);
		req.getRequestDispatcher("/members/result.jsp").forward(req, resp);	
	}
}














