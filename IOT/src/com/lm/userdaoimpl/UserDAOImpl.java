package com.lm.userdaoimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.lm.userdao.UserDAO;






public class UserDAOImpl implements UserDAO 
{
    private static Connection connection=null;
    private PreparedStatement ps=null;
    private Statement st=null;
	public Connection getConnection() {
		// TODO Auto-generated method stub
		if(connection!=null)
		{
			return connection;
		}
		else
		{
			 String url = "jdbc:mysql://localhost:3306/wsn" ;    
		     String username ="root" ;   
		     String password ="12345" ;   
		     try{   
		       connection= DriverManager.getConnection(url,username,password);
		       if(connection==null)
		       {
		    	   System.out.println("Shit--------------------------------------");
		       }
		     }catch(SQLException se){   
		        System.out.println("数据库连接失败！");   
		        se.printStackTrace() ;   
		     }   
		     return connection;
		}
		
	}
	public Statement getStatement()
	{
		try{
			st=connection.createStatement();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return st;
	}
	public ResultSet executeSQL(String sql)
	{
		ResultSet rs=null;
		try
		{
		  rs=st.executeQuery(sql);
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rs;
	}

	public PreparedStatement getPreparedStatement(String sql) {
		// TODO Auto-generated method stub
		try
		{
		   ps=connection.prepareStatement(sql);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ps;
	}
	public boolean checkUser(String name,String password)
	{
		try
		{
			ps.setString(1,name);
			ps.setString(2,password);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		ResultSet rs=null;
		try
    	{
    	   rs=ps.executeQuery();
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
		try
		{
			if(rs==null||!rs.next())
			{
				return false;
			}
			else
			{
				return true;
			}
		}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		return false;
	}
	
    public void insertUser(String account,String name,String password,int age,String sex,String address)
    {
    	//System.out.println("InsertUser!!!!!!!!!!!!!!!!!!!!!!!!!!");
    	try
    	{
    	  ps.setString(1,account);
    	  ps.setString(2,name);
    	  ps.setInt(3,age);
    	  ps.setString(4,sex.equals("man")?"男":"女");
    	  ps.setString(5,address);
    	  ps.setString(6,password);
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	try
    	{
    	   ps.execute();
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    }
    public void DBClose()
    {
    	if(connection!=null)
    	{
    		try
    		{
    		connection.close();
    		}
    		catch(Exception e)
    		{e.printStackTrace();}
    	}
    	if(ps!=null)
    	{

    		try
    		{
    		ps.close();
    		}
    		catch(Exception e)
    		{e.printStackTrace();}
    	}
    }
	public void DBInit() 
	{
		// TODO Auto-generated method stub
		   try{   
		    //加载MySql的驱动类   
		    Class.forName("com.mysql.jdbc.Driver") ;   
		    }catch(ClassNotFoundException e){   
		    System.out.println("找不到驱动程序类 ，加载驱动失败！");   
		    e.printStackTrace() ;   
		    }   
		
	}

}
