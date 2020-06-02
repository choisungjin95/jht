package homework.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import homework.vo.BoardVo;
import test.db.JDBCUtil;
import test.vo.MembersVo;

public class BoardDao {

	//글등록 메뉴 클릭 메서드
	public int insert(BoardVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="insert into board values(?,?,?,?,sysdate,?)";
		try {
			con=JDBCUtil.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getNum());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getWriter());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getEmail());
			
			int n=pstmt.executeUpdate();
			return n;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JDBCUtil.close(null, pstmt, con);
		}
		
	}
	
	//전체조회 메뉴 클릭 메서드
	public ArrayList<BoardVo> allList() {
		ArrayList<BoardVo> list=new ArrayList<BoardVo>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from board";
		try {
			con=JDBCUtil.getConn();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int num=rs.getInt("num");
				String title=rs.getString("title");
				String writer=rs.getString("writer");
				String content=rs.getString("content");
				Date regdate=rs.getDate("regdate");
				String email=rs.getString("email");
				
				//	public BoardVo(int num, String title, String writer, String content, Date regdate, String email)
				BoardVo vo=new BoardVo(num, title, writer, content, regdate, email);
				list.add(vo);
			}
			return list;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	
	//삭제 메뉴 클릭 메서드
	public int delete(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="delete from board where num=?";
		try {
			con=JDBCUtil.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			int n=pstmt.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.getMessage();
			return -1;
		}finally {
			JDBCUtil.close(null, pstmt, con);
		}
		
	}
	
	public BoardVo updateOk(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from board where num=?";
		try {
			con=JDBCUtil.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			BoardVo vo=null;
			if(rs.next()) {
				String title=rs.getString("title");
				String writer=rs.getString("writer");
				String content=rs.getString("content");
				Date regdate=rs.getDate("regdate");
				String email=rs.getString("email");
				
				//	public BoardVo(int num, String title, String writer, String content, Date regdate, String email)
				vo=new BoardVo(num, title, writer, content, regdate, email);
				
			}
			return vo;
		}catch(SQLException se) {
			se.getMessage();
			return null;
		}finally {
			JDBCUtil.close(rs, pstmt, con);
		}
		
	}
	
	//수정 메뉴 클릭 메서드
	public int update(BoardVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="update board set title=?, writer=?,content=?,email=? where num=?";
		try {
			con=JDBCUtil.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getEmail());
			pstmt.setInt(5, vo.getNum());
			int n=pstmt.executeUpdate();
			return n;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JDBCUtil.close(null, pstmt, con);
		}
	}
}
