package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.db.JDBCUtil;
//파라미터로 전달된 데이터를 db에 저장해보세요.
public class InsertServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
		//1. 사용자가 보내온 가입정보 읽어오기
		req.setCharacterEncoding("utf-8");
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		String email=req.getParameter("email");
		//2. db에 저장하기
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="insert into myusers values(?,?,?,sysdate)";
		int n=0;
		try {
			con=JDBCUtil.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pwd);
			pstmt.setString(3,email);
			n=pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
		}finally {
			JDBCUtil.close(null, pstmt, con);
		}
		//3. 결과응답하기
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print("<html>");
		pw.print("<head></head>");
		pw.print("<body>");
		if(n>0) {
			pw.print("<h1>가입성공!!!!</h1>");
		}else {
			pw.print("<h1>가입실패!!!!</h1>");
		}
		pw.print("</body>");
		pw.print("</html>");
		pw.close();
		
	}
}











