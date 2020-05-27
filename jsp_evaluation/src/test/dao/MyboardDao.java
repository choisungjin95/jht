package test.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.db.JDBCUtil;
import test.vo.MyboardVo;

public class MyboardDao {
	//데이터 추가기능
	public int Insert(MyboardVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="insert into myboard values(myboard_seq.nextval,?,?,?,?,sysdate)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			int n=pstmt.executeUpdate();
			return n;
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(con);
		}
	}
	//전체 목록 출력기능
	public ArrayList<MyboardVo> list() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<MyboardVo> list=new ArrayList<>();
		try {
			con=JDBCUtil.getConn();
			String sql="select * from myboard order by regdate desc";
			pstmt=con.prepareStatement(sql);
			//pstmt.setInt(1, startRow);
			//pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int num=rs.getInt("num");
				String writer=rs.getString("writer");
				String pwd=rs.getString("pwd");
				String title=rs.getString("title");
				String content=rs.getString("content");
				Date regdate=rs.getDate("regdate");
				MyboardVo vo=new MyboardVo(num, writer, pwd, title, content, regdate);
				list.add(vo);
			}
			return list;
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(con);
		}
	}
	public MyboardVo detail(String title) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			String sql="select * from myboard where title=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, title);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int num=rs.getInt("num");
				String writer=rs.getString("writer");
				String pwd=rs.getString("pwd");
				//String title=rs.getString("title");
				String content=rs.getString("content");
				Date regdate=rs.getDate("regdate");
				MyboardVo vo=new MyboardVo(num, writer, pwd, title, content, regdate);
				return vo;
			}
			return null;
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(con);
		}
	}
	public void delete(String pwd) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="delete from myboard where pwd=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.executeUpdate();
		}catch (SQLException se) {
			System.out.println(se.getMessage());
		}finally {
			JDBCUtil.close(pstmt);
			JDBCUtil.close(con);
		}
	}
	public int getCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			String sql="select NVL(count(num),0) cnt from myboard";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("cnt");
			}else {
				return -1;
			}
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	public ArrayList<MyboardVo> list(int startRow,int endRow) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<MyboardVo> list=new ArrayList<>();
		try {
			con=JDBCUtil.getConn();
			
			 String sql="select * from\r\n" + "(\r\n" +
			 "    select aa.*,rownum rnum from\r\n" + "    (\r\n" +
			 "        select * from myboard order by regdate desc\r\n" + "    )aa\r\n" +
			 ")\r\n" + "where rnum>=? and rnum<=?;";
			 
			pstmt=con.prepareStatement(sql);
			//pstmt.setInt(1, startRow);
			//pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int num=rs.getInt("num");
				String writer=rs.getString("writer");
				String pwd=rs.getString("pwd");
				String title=rs.getString("title");
				String content=rs.getString("content");
				Date regdate=rs.getDate("regdate");
				MyboardVo vo=new MyboardVo(num, writer, pwd, title, content, regdate);
				list.add(vo);
			}
			return list;
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			JDBCUtil.close(rs);
			JDBCUtil.close(pstmt);
			JDBCUtil.close(con);
		}
	}
}









