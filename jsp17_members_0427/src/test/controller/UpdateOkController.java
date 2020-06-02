package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.MembersDao;
import test.vo.MembersVo;
@WebServlet("/updateOk.do")	
public class UpdateOkController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int num=Integer.parseInt(req.getParameter("num"));
		String name=req.getParameter("name");
		String phone=req.getParameter("phone");
		String addr=req.getParameter("addr");
		MembersVo vo=new MembersVo(num,name,phone,addr,null);
		MembersDao dao=new MembersDao();
		int n=dao.update(vo);
		String code="success";
		if(n<=0) {
			code="fail";
			//resp.sendRedirect(req.getContextPath()+"/members/list.do");
		}
		req.setAttribute("code",code);
		req.getRequestDispatcher("/members/updateOk.jsp").forward(req, resp);

		
		
		
	}
}
