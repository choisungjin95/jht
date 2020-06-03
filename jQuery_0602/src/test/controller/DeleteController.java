package test.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import test.dao.CommentsDao;
@WebServlet("/delete.do")
public class DeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int num=Integer.parseInt(req.getParameter("num"));
		CommentsDao dao=CommentsDao.getInstance();
		int n=dao.delete(num);
		resp.setContentType("text/plian; charset=utf-8");
		JSONObject json=new JSONObject();
		boolean bl=false;
		if(n>0) {
			bl=true;
		}
		json.put("result", bl);
		PrintWriter pw=resp.getWriter();
		pw.print(json);
	}
}
