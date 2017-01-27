package action;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;  

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
//import 
import dao.Dao;
;@SuppressWarnings("serial")

public class UserAction extends ActionSupport implements SessionAware{

private Dao dao = new Dao();
private String username;
private String password;
private String type;
private Map mySession;


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

	public String login() {
		// if(getUsername()==null||getPassword()==null)
		// return "inputerror";
		String name = null,number,result = null;
		/*
			System.out.println("user:" + getUsername());
			System.out.println("pwd:" + getPassword());
			System.out.println("pwd:" + getType());
		*/
		String sql = "select * from dbuser join roleinfo on dbuser.roleid=roleinfo.roleid and clientid='"
					+ getUsername()
					+ "' and clientpwd='"
					+ getPassword()
					+ "';";//+ "' and rolename='" + getType() 
		ResultSet rS=null;
		try {
			rS = dao.executeQuery(sql);
			/*
			 * try { if (rS!=null && rS.next()==true) {
			 * System.out.println("yes!"); return "loginin"; } return
			 * "loginout"; } catch (SQLException e) { // TODO Auto-generated
			 * catch block e.printStackTrace(); return "loginout"; }
			 */
			System.out.println(sql);

			if (rS.next()) {
				number = rS.getString("clientpwd");
				name = rS.getString("roleid");
				rS.close();
				// String mathScore = result.getString("sgrade");
				// 取得数据库中的数据
				System.out.println(" " + number + " " + name);// + " " +
																// mathScore);
				// mySession =
				// ActionContext.getContext().getSession();//记录用户登录信息
				mySession.put("username", username);
				mySession.put("type", type);
				return SUCCESS;
			}
			else
				return "failure";

		} catch (SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
			return "failure";
		}
		
		
		/*if(name.equals("001"))
			result= "user";
		if(name.equals("002"))
			result="admin";*/
		//System.out.println(name+"||"+result);
		//return result;
	}

private void exit(int i) {
	// TODO Auto-generated method stub
}

public String regist() {
	if(getUsername()!=null && getPassword()!=null)
	{
String sql = "insert into usr(username,password) values('"+getUsername()+"','"+getPassword()+"');";
System.out.println(sql);
System.out.println(getUsername());
System.out.println(getPassword());

int i = dao.executeUpdate(sql);
System.out.println(i);
if (i > -1)
{return "success";}}
return "error";

}


public String add() {
	if(username == null || !username.equals("admin")) {
		//addFieldError 添加错误信息，可以在客户端访问到。
		this.addFieldError("username", "username is error");
		this.addFieldError("username", "username is too long");
		return ERROR;
	} 
	return SUCCESS;
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
public String execute() throws Exception { 
	//Map<String, String> attibutes = ActionContext.getContext().getSession();
    if(mySession!=null)
	{
    	System.out.println(mySession.get("username")+"||"+mySession.get("password"));
    	mySession.remove("username");
	}
    else
    {
    	System.out.println(".....");
    	//session=ActionContext.getContext().getSession();	
    }
    //session.remove("password");
    return SUCCESS; 
}

@Override
public void setSession(Map session) {
	// TODO Auto-generated method stub
	this.mySession=session;
}

public void setType(String type) {
	this.type = type;
}

public String getType() {
	return type;
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
