package test.db;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCUtil { //�ٸ� ��Ű�������� ����ϱ� ���ؼ� public���� ����!

	public static Connection getConn() throws SQLException { // �������� �۾��� �ϱ� ������ static�� ����
		Connection con = null;
		try {
			
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@192.168.0.26:1521:xe";
			con = DriverManager.getConnection(url, "scott", "tiger");
			return con; //connection�� ���������� �۵��ϸ� con�� �����ϰ�
		} catch (ClassNotFoundException ce) {
			System.out.println(ce.getMessage());
			return null; //���ܱ����� Ÿ�� �ʱ�ȭ�ߴ� null���� �����ض�
		}
	}

	public static void close(ResultSet rs, Statement stmt, Connection con) { //close�ż��� �����ε�
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (con != null)
				con.close();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
		}
	}

	// rs����ϴ� �ż���
	public static void close(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
		}
	}

	// stmt����ϴ� �ż���
	public static void close(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
		}
	}

	// con����ϴ� �ż���
	public static void close(Connection con) {
		try {
			if (con != null)
				con.close();
		} catch (SQLException se) {
			System.out.println(se.getMessage());
		}
	}
}
