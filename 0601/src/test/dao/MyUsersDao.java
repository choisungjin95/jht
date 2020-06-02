package test.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.db.ConnectionPool;
import test.vo.MyUsersVo;

public class MyUsersDao {

	public ArrayList<MyUsersVo> myusersInfo(String date) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<MyUsersVo> list=new ArrayList<>();
		try {
			con=ConnectionPool.getConn();
			String sql="select * from myusers where to_char(regdate)=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, date);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String id=rs.getString("id");
				String pwd=rs.getString("pwd");
				String email=rs.getString("email");
				Date regdate=rs.getDate("regdate");
				list.add(new MyUsersVo(id, pwd, email, regdate));
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
