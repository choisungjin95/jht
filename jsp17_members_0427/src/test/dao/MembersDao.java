package test.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import test.db.JDBCUtil;
import test.vo.MembersVo;

public class MembersDao {
	//��ü ȸ�������� ArrayList�� ��Ƽ� ����
	public ArrayList<MembersVo> list() { //��ȸ�� �ϸ� �Ǵϱ� �Ķ���ʹ� ��� ��
		ArrayList<MembersVo> list=new ArrayList<MembersVo>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from members";
		try {
			con=JDBCUtil.getConn();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int num=rs.getInt("num");
				String name=rs.getString("name");
				String phone=rs.getString("phone");
				String addr=rs.getString("addr");
				Date regdate=rs.getDate("regdate");
				MembersVo vo=new MembersVo(num,name,phone,addr,regdate);
				list.add(vo);
		}
			return list;
		}catch(SQLException se) {
			se.getMessage();
			return null;
		}finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	
	public int insert(MembersVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="insert into members values(?,?,?,?,sysdate)";
		try {
			con=JDBCUtil.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,vo.getNum());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddr());
			int n=pstmt.executeUpdate();
			return n;
			
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JDBCUtil.close(null, pstmt, con);
		}
	}
	//������ �����ϴ� �޼���
	public int delete(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="delete from members where num=?";
		try {
			con=JDBCUtil.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			int n=pstmt.executeUpdate();
			return n;
		}catch(SQLException se) {
			se.getMessage();
			return -1;
		}finally{
			JDBCUtil.close(null, pstmt, con);
		}
				
	}
	//������ư ������ ȭ�鿡 �����ִ� �޼���
	public MembersVo btnUpdate(int num){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from members where num=?";
		try {
			con=JDBCUtil.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String name=rs.getString("name");
				String phone=rs.getString("phone");
				String addr=rs.getString("addr");
				Date regdate=rs.getDate("regdate");
				//MembersVo vo=new MembersVo(num,name,phone,addr,regdate);
				MembersVo vo=new MembersVo(num,name,phone,addr,regdate);
				return vo;
			}
			return null;
		}catch(SQLException se) {
			se.getMessage();
			return null;
		}finally{
			JDBCUtil.close(null, pstmt, con);
		}
	}
	
	//������ �����ϴ� �޼���
	public int update(MembersVo vo){
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="update members set name=?, phone=?, addr=? where num=?";
		try {
			con=JDBCUtil.getConn();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getAddr());
			pstmt.setInt(4, vo.getNum());
			int n=pstmt.executeUpdate();
			return n;
		}catch(SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally{
			JDBCUtil.close(null, pstmt, con);
		}
	}
}
