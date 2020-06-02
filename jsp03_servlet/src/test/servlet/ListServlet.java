package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.db.JDBCUtil;

public class ListServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print("<html>");
		pw.print("<head></head>");
		pw.print("<body>");
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			pstmt=con.prepareStatement("select * from myusers");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String id=rs.getString("id");
				String pwd=rs.getString("pwd");
				String email=rs.getString("email");
				Date regdate=rs.getDate("regdate");
				pw.print("<p>"+ id +"," + pwd +"," + email +","+ regdate+
						"<a href='delete.do?id="+ id + "'>삭제</a> "
					+ "<a href='update.do?id=" + id + "'>수정</a></p>");
			}		
		}catch(SQLException se) {
			System.out.println(se.getMessage());
		}finally {
			JDBCUtil.close(rs, pstmt, con);
		}		
		pw.print("</body>");
		pw.print("</html>");
	}
}















