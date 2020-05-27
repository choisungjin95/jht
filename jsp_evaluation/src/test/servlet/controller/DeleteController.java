package test.servlet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.MyboardDao;
import test.vo.MyboardVo;
@WebServlet("/myboard/delete.do")
public class DeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pwd=req.getParameter("pwd");
		String pwdOk=req.getParameter("pwdOk");
		String title=req.getParameter("title");
		MyboardDao dao=new MyboardDao();
		if(pwd.equals(pwdOk)) {
			dao.delete(pwd);
			resp.sendRedirect(req.getContextPath()+"/myboard/list.do");
		}else {
			MyboardVo vo=dao.detail(title);
			req.setAttribute("errMsg", "비밀번호가 일치하지 않습니다.");
			req.setAttribute("vo", vo);
			req.getRequestDispatcher("/myboard/detail.do").forward(req, resp);
		}
	}
}
