package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.db.JDBCUtil;
import test.vo.FileinfoVo;

public class FileinfoDao {
	public int insert(FileinfoVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql=
			"insert into fileinfo values(fileinfo_seq.nextval,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,vo.getWriter());
			pstmt.setString(2,vo.getTitle());
			pstmt.setString(3,vo.getContent());
			pstmt.setString(4,vo.getOrgfilename());
			pstmt.setString(5,vo.getSavefilename());
			pstmt.setLong(6,vo.getFilesize());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JDBCUtil.close(null, pstmt, con);
		}
	}
	public ArrayList<FileinfoVo> fileList(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			pstmt=con.prepareStatement("select * from fileinfo");
			rs=pstmt.executeQuery();
			ArrayList<FileinfoVo> list=new ArrayList<FileinfoVo>();
			while(rs.next()) {
				int filenum=rs.getInt("filenum");
				String writer=rs.getString("writer");
				String title=rs.getString("title");
				String content=rs.getString("content");
				String orgfilename=rs.getString("orgfilename");
				String savefilename=rs.getString("savefilename");
				long filesize=rs.getLong("filesize");
				FileinfoVo vo=new FileinfoVo(filenum, writer, title, content, orgfilename, savefilename, filesize);
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
	public int delete(int filenum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql="delete from fileinfo where filenum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,filenum);
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JDBCUtil.close(null, pstmt, con);
		}
	}
	public FileinfoVo getinfo(int filenum){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=JDBCUtil.getConn();
			pstmt=con.prepareStatement("select * from fileinfo where filenum=?");
			pstmt.setInt(1,filenum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String writer=rs.getString("writer");
				String title=rs.getString("title");
				String content=rs.getString("content");
				String orgfilename=rs.getString("orgfilename");
				String savefilename=rs.getString("savefilename");
				long filesize=rs.getLong("filesize");
				FileinfoVo vo=new FileinfoVo(filenum, writer, title, 
						content, orgfilename, savefilename, filesize);
				return vo;
			}
			return null;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return null;
		}finally {
			JDBCUtil.close(rs, pstmt, con);
		}	
	}
	public int update(FileinfoVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=JDBCUtil.getConn();
			String sql=
			"update fileinfo set "+ 
			"writer=?,title=?,content=?,orgfilename=?,savefilename=?,filesize=? "+
			"where filenum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,vo.getWriter());
			pstmt.setString(2,vo.getTitle());
			pstmt.setString(3,vo.getContent());
			pstmt.setString(4,vo.getOrgfilename());
			pstmt.setString(5,vo.getSavefilename());
			pstmt.setLong(6,vo.getFilesize());
			pstmt.setInt(7,vo.getFilenum());
			return pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JDBCUtil.close(null, pstmt, con);
		}
	}
}









