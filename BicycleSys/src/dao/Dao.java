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
		//第三步：获取连接类实例con，用con创建Statement对象类实例 sql_statement
		//Connection con = getConnection();
		//Statement sql_statement = con.createStatement();
		Dao dao= new Dao();
		/** *//************ 对数据库进行相关操作 ************/
		//如果同名数据库存在，删除
		//sql_statement.executeUpdate("drop table if exists student");
		//执行了一个sql语句生成了一个名为student的表
		//sql_statement.executeUpdate("create table student (id int not null auto_increment, name varchar(20) not null default 'name', math int not null default 60, primary key (id) ); ");
		//向表中插入数据
		//sql_statement.executeUpdate("insert student values(1, 'liying', 98)");
		//sql_statement.executeUpdate("insert student values(2, 'jiangshan', 88)");
		//sql_statement.executeUpdate("insert student values(3, 'wangjiawu', 78)");
		//sql_statement.executeUpdate("insert student values(4, 'duchangfeng', 100)");
		//---以上操作不实用，但是列出来作为参考---

		//第四步：执行查询，用ResultSet类的对象，返回查询的结果
		String query = "select * from usr";
		ResultSet result = dao.executeQuery(query);
		/** *//************ 对数据库进行相关操作 ************/

		System.out.println("usr表中的数据如下:");
		System.out.println("------------------------");
		System.out.println("username" + " " + "password");
		System.out.println("------------------------");

		//对获得的查询结果进行处理，对Result类的对象进行操作
		while (result.next())
		{
		String number = result.getString("username");
		String name = result.getString("password");
		//String mathScore = result.getString("sgrade");
		//取得数据库中的数据
		System.out.println(" " + number + " " + name);//+ " " + mathScore);
		}

		//关闭连接和声明
		//sql_statement.close();
		//con.close();

		} catch (SQLException ex) {
		//显示数据库连接错误或查询错误
		System.err.println("SQLException: " + ex.getMessage());
		}
		} 
}

