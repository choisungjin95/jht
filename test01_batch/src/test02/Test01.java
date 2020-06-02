package test02;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import test.db.JDBCUtil;

class MyJDBC02{
	public MyJDBC02() {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			con.setAutoCommit(false);
			System.out.println("DB접속성공!");
			String sql="update batchtest2 set edate=edate+14";
			pstmt=con.prepareStatement(sql);
			Random rnd=new Random();
			for(int i=1;i<=10000;i++) {
				pstmt.addBatch();
				if(i%1000==0) {
					pstmt.executeBatch();
					pstmt.clearBatch();
					con.commit();
				}
			}
			System.out.println("데이터변경성공!!!!!!!!!!");
		}catch(SQLException se) {
			System.out.println(se.getMessage());
		}finally {
			JDBCUtil.close(null, pstmt, con);
		}
	}
}
public class Test01 {
	public static void main(String[] args) {
		new MyJDBC02();
	}
}








