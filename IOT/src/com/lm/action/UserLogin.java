package com.lm.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lm.info.SimpleInfo;
import com.lm.userdaoimpl.UserDAOImpl;
import com.opensymphony.xwork2.ActionSupport;

public class UserLogin extends ActionSupport implements SessionAware
{
	private String name;
    private String password;
    private String confirm;
    private List<SimpleInfo> simpleInfo;
    private List<SimpleInfo> teInfo=new ArrayList<SimpleInfo>();
    private Map mySession;
    
	public List<SimpleInfo> getSimpleInfo() {
		return simpleInfo;
	}
	public void setSimpleInfo(List<SimpleInfo> simpleInfo) {
		this.simpleInfo = simpleInfo;
	}
	private List<Float> temp;
    private List<Float> humi;
    private List<Float> tempInfo=new ArrayList<Float>();
    private List<Float> humiInfo=new ArrayList<Float>();
	public List<Float> getTemp() {
		return temp;
	}
	public void setTemp(List<Float> temp) {
		this.temp = temp;
	}
	public List<Float> getHumi() {
		return humi;
	}
	public void setHumi(List<Float> humi) {
		this.humi = humi;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
    public String login() throws SQLException
    {
    	UserDAOImpl udi=new UserDAOImpl();
		udi.DBInit();
		udi.getConnection();
		udi.getStatement();
    	udi.getPreparedStatement("select * from user where name=? and password=?");
    	
    	if(udi.checkUser(name,password))//name.equals("Lily")&&password.equals("1234")
		{
    		//连接数据库，拿出数据
    		
    		ResultSet rs=udi.executeSQL("select * from data");
    		while(rs.next())
    		{
//    			tempInfo.add(rs.getFloat("temp"));
//    			humiInfo.add(rs.getFloat("humi"));
    			SimpleInfo temp=new SimpleInfo();
    			temp.setTemp(rs.getFloat("temp"));
    			temp.setHumi(rs.getFloat("humi"));
    			temp.setAddress("苏州大学理工楼517");
    			temp.setIp("192.68.151.64");
    			temp.setTime(new Date().toString());
    			System.out.println(rs.getFloat("temp"));
    			System.out.println(rs.getFloat("humi"));
    			teInfo.add(temp);	
    		}
    		this.setSimpleInfo(teInfo);
//    		this.setTemp(tempInfo);
//    		this.setHumi(humiInfo);
    		mySession.put("mvSession",simpleInfo);
    		//System.out.println("Nice");
			return SUCCESS;
		}
		else
		{
			this.addFieldError("name","User Name Not Exist!");
			return ERROR;
		}
    }
    public String register()
    {
    	return "register";
    }
	public void setSession(Map<String, Object> arg0)
	{
		// TODO Auto-generated method stub
		this.mySession=arg0;
	}
}
