package action;
import java.sql.*;
import java.util.Map;  

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.Action; 
import com.opensymphony.xwork2.ActionSupport;
//import 
import dao.Dao;
;@SuppressWarnings("serial")

public class SetFeeAction extends ActionSupport implements SessionAware{

//private Dao dao = new Dao();
private String freetime;
private String unittime;
private String unittimefee;
private Map mySession;



public String setFee() {

	Dao dao=new Dao();
System.out.println(getFreetime()+getUnittime()+getUnittimefee());
	//System.out.println("user:"+getUsername());
	//System.out.println("pwd:"+getPassword());
//String sql = "update setting set freetime='" + getUsername()+"' and password='"+getPassword()+"'";
String sql="if not exists(select * from setting where freetime=convert(int,'"+getFreetime()+"') "+
"and unittime=CONVERT(int,'"+getUnittime()+"') and unitfee=CONVERT(money,'"+getUnittimefee()+
"')) update setting set freetime =convert(int,'"+getFreetime()+"'),"+
" unittime=CONVERT(int,'"+getUnittime()+"'),unitfee=CONVERT(money,'"+getUnittimefee()+"')";
System.out.println(sql);
if( dao.executeUpdate(sql)>0)
{
	HttpServletRequest request = ServletActionContext.getRequest();
	request.setAttribute("returnwords", "设置费率成功！");
	//return SUCCESS;

}else
{
	HttpServletRequest request = ServletActionContext.getRequest();
	request.setAttribute("returnwords", "设置费率失败！");
	//return "fail";
	//System.out.println(dao.executeUpdate(sql));
}
return SUCCESS;
}

private void exit(int i) {
	// TODO Auto-generated method stub
}




//通用的执行方法
// public String execute() throws Exception {
// if (getUsername().equals("scott") && getPassword().equals("tiger")) {
// System.out.println("我是success");
// return "success";
// }

// else {
// System.out.println("我是error");
// return "error";
// }
// }


@Override
public void setSession(Map session) {
	// TODO Auto-generated method stub
	this.mySession=session;
}

public void setFreetime(String freetime) {
	this.freetime = freetime;
}

public String getFreetime() {
	return freetime;
}

public void setUnittimefee(String unittimefee) {
	this.unittimefee = unittimefee;
}

public String getUnittimefee() {
	return unittimefee;
}

public void setUnittime(String unittime) {
	this.unittime = unittime;
}

public String getUnittime() {
	return unittime;
} 
}

/*
public class UserAction extends ActionSupport{
	 private String username;
	 private String password;
	 
	 public String getUsername() {
	  return username;
	 }
	 public void setUsername(String username) {
	  this.username = username;
	 }
	 public String getPassword() {
	  return password;
	 }
	 public void setPassword(String password) {
	  this.password = password;
	 }

	 @Override
	 public String execute() throws Exception {
	  if("haha".equals(username) && "hehe".equals(password))//如果登录的用户名=haha并且密码=hehe，就返回SUCCESS；否则，返回LOGIN
	   return SUCCESS;
	  return LOGIN;
	 }
}*/
