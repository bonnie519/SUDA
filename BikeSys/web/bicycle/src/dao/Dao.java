package dao;
import java.sql.*;
public class Dao {
	Connection con = null;
	Statement stat = null;
	ResultSet rs = null;
//com.microsoft.sqlserver.jdbc.SQLServerDriver
	public Dao() {
		try {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");//MySql:com.mysql.jdbc.Driver
		con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=my","sa","wbsdog");//("jdbc:mysql://localhost:3306/a","root","")
		stat = con.createStatement();
		} catch (Exception e) {
		// TODO: handle exception
		con = null;
		
		}
	}

	public ResultSet executeQuery(String sql) {
		try {
		rs = stat.executeQuery(sql);
		} catch (Exception e) {
		// TODO: handle exception
		rs = null;
		}
		return rs;
	}

	public int executeUpdate(String sql) {
		int count;
		try {
		count = stat.executeUpdate(sql);
		
		} catch (Exception e) {
		count = -1;
		// TODO: handle exception
		}
		return count;
	}
	
	public static void main(String args[]) throws java.lang.ClassNotFoundException {
		try
		{
		//����������ȡ������ʵ��con����con����Statement������ʵ�� sql_statement
		//Connection con = getConnection();
		//Statement sql_statement = con.createStatement();
		Dao dao= new Dao();
		/** *//************ �����ݿ������ز��� ************/
		//���ͬ�����ݿ���ڣ�ɾ��
		//sql_statement.executeUpdate("drop table if exists student");
		//ִ����һ��sql���������һ����Ϊstudent�ı�
		//sql_statement.executeUpdate("create table student (id int not null auto_increment, name varchar(20) not null default 'name', math int not null default 60, primary key (id) ); ");
		//����в�������
		//sql_statement.executeUpdate("insert student values(1, 'liying', 98)");
		//sql_statement.executeUpdate("insert student values(2, 'jiangshan', 88)");
		//sql_statement.executeUpdate("insert student values(3, 'wangjiawu', 78)");
		//sql_statement.executeUpdate("insert student values(4, 'duchangfeng', 100)");
		//---���ϲ�����ʵ�ã������г�����Ϊ�ο�---

		//���Ĳ���ִ�в�ѯ����ResultSet��Ķ��󣬷��ز�ѯ�Ľ��
		String query = "select * from usr";
		ResultSet result = dao.executeQuery(query);
		/** *//************ �����ݿ������ز��� ************/

		System.out.println("usr���е���������:");
		System.out.println("------------------------");
		System.out.println("username" + " " + "password");
		System.out.println("------------------------");

		//�Ի�õĲ�ѯ������д�����Result��Ķ�����в���
		while (result.next())
		{
		String number = result.getString("username");
		String name = result.getString("password");
		//String mathScore = result.getString("sgrade");
		//ȡ�����ݿ��е�����
		System.out.println(" " + number + " " + name);//+ " " + mathScore);
		}

		//�ر����Ӻ�����
		//sql_statement.close();
		//con.close();

		} catch (SQLException ex) {
		//��ʾ���ݿ����Ӵ�����ѯ����
		System.err.println("SQLException: " + ex.getMessage());
		}
		} 
}

