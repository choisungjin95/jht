package test.Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.db.JDBCUtil;
import test.vo.BoardVo;

public class BoardDao {
	//제목으로 검색
	public ArrayList<BoardVo> search(String title) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		ArrayList<BoardVo> list=new ArrayList<>();
		try {
			con=JDBCUtil.getConn();
			String sql="select * from board where title like ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+title+"%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int num=rs.getInt("num");
				String writer=rs.getString("writer");
				String email=rs.getString("email");
				String title1=rs.getString("title");
				String content=rs.getString("content");
				Date w_date=rs.getDate("w_date");
				BoardVo vo=new BoardVo(num, writer, email, title1, content, w_date);
				list.add(vo);
			}
			return list;
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			JDBCUtil.close(null, pstmt, con);
		}
	}
	
	//글 수정
	public int updateOk(BoardVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=JDBCUtil.getConn();
			String sql="update board set writer=?,email=?,title=?,content=? where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			pstmt.setInt(5, vo.getNum());
			int n=pstmt.executeUpdate();
			return n;
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JDBCUtil.close(null, pstmt, con);
		}
	}
	
	//글 상세보기
	public BoardVo update(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=JDBCUtil.getConn();
			String sql="select * from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String writer=rs.getString("writer");
				String email=rs.getString("email");
				String title=rs.getString("title");
				String content=rs.getString("content");
				Date w_date=rs.getDate("w_date");
				BoardVo vo=new BoardVo(num, writer, email, title, content, w_date);
				return vo;
			}
			return null;
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	
	//글 삭제
	public int delete(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="delete from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			int n=pstmt.executeUpdate();
			return n;
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JDBCUtil.close(null, pstmt, con);
		}
		
	}
	
	//전체조회
	public ArrayList<BoardVo> list() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		ArrayList<BoardVo> list=new ArrayList<>();
		try {
			con=JDBCUtil.getConn();
			String sql="select * from board";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int num=rs.getInt("num");
				String writer=rs.getString("writer");
				String email=rs.getString("email");
				String title=rs.getString("title");
				String content=rs.getString("content");
				Date w_date=rs.getDate("w_date");
				BoardVo vo=new BoardVo(num, writer, email, title, content, w_date);
				list.add(vo);
			}
			return list;
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	
	//글 등록
	public int insert(BoardVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="insert into board values(board_seq.nextval,?,?,?,?,sysdate)";
		try {
			con=JDBCUtil.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			int n=pstmt.executeUpdate();
			return n;
		}catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JDBCUtil.close(null, pstmt, con);
		}
		
	}
}
