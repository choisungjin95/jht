package test.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import test.dao.MyUsersDao;
import test.vo.MyUsersVo;
@WebServlet("/myusers/info")
public class MyUsersInfo extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String regdate=req.getParameter("regdate");
		String d=regdate.substring(2, regdate.length());
		String date=d.replaceAll("-", "/");
		
		MyUsersDao dao=new MyUsersDao();
		ArrayList<MyUsersVo> list=dao.myusersInfo(date);
		
		JSONArray jarr=new JSONArray();
		for(MyUsersVo vo:list) {
			JSONObject json=new JSONObject();
			json.put("id", vo.getId());
			json.put("pwd", vo.getPwd());
			json.put("email", vo.getEmail());
			json.put("regdate", vo.getRegdate());
			jarr.put(json);
		}
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print(jarr);
	}
}










