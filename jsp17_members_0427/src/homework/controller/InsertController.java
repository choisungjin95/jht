package homework.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import homework.dao.BoardDao;
import homework.vo.BoardVo;

@WebServlet("/homework/insert.do")
public class InsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num=Integer.parseInt(req.getParameter("num"));
		String title=req.getParameter("title");
		String writer=req.getParameter("writer");
		String content=req.getParameter("content");
		String email=req.getParameter("email");
		ArrayList<BoardVo> list=new ArrayList<BoardVo>();
		//public BoardVo(int num, String title, String writer, String content, Date regdate, String email)
		BoardVo vo=new BoardVo(num,title, writer, content,null, email);
		BoardDao dao=new BoardDao();
		int n=dao.insert(vo);
		String code="success";
		if(n<=0) {
			code="fail";
		}
		//불러온 파라미터 값들 vo에 담기...
		req.setAttribute("code", code);
		System.out.println(n);
		req.getRequestDispatcher("/homework/insertOk.jsp").forward(req, resp);
	
		
	}
}
