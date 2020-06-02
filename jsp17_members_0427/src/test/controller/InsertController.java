package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.MembersDao;
import test.vo.MembersVo;
@WebServlet("/members/insert.do")
public class InsertController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1. 사용자가 보내온 정보 읽어오기
		req.setCharacterEncoding("utf-8");//post방식으로 보냈으니까 인코딩 해줘야함
		String num=req.getParameter("num"); //저장된 값을 얻어옴!!
		String name=req.getParameter("name");
		String phone=req.getParameter("phone");
		String addr=req.getParameter("addr");
		
		//2. 사용자정보 db에 저장하기
		MembersVo vo=new MembersVo(0, name, phone, addr,null);
		MembersDao dao=new MembersDao();
		int n=dao.insert(vo);
		String code="success";
		if(n<=0) {
			code="fail";
		}
		//3. 결과를 보여줄 페이지 이동하기
		req.setAttribute("code", code);//success아님 fail을 가지고 이동
		req.getRequestDispatcher("/members/result.jsp").forward(req, resp); //리다이렉스방식만 컨덱스트패스를 써준다
	}
}
