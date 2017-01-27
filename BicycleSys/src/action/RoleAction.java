package action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import dao.Dao;

public class RoleAction extends ActionSupport implements SessionAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Dao dao = new Dao();
	private List<String> client =new ArrayList<String>();
	private List<String> role =new ArrayList<String>();
	private String[] checkbox;
	public String Qry()
	{
		String sqlclt="select * from dbuser";
		String sqlrl="select * from roleinfo";
		ResultSet rSclt=null,rSrl=null;
		try{
			rSclt=dao.executeQuery(sqlclt);
			
			List<String> t=new ArrayList<String>();
			
			while(rSclt.next())
			{
				t.add(rSclt.getString("clientid"));
				//System.out.println(rSclt.getString("clientid"));
			}
			setClient(t);
			rSclt.close();
			rSrl=dao.executeQuery(sqlrl);
			while(rSrl.next())
			{
				role.add(rSrl.getString("rolename"));
				//System.out.println(rSrl.getString("rolename"));
			}
			
			rSrl.close();
			setRole(role);
		}
		catch(SQLException ex){
			System.out.println();
		}
		return SUCCESS;
	}
	
	public String Set()
	{
		//String str =Request.Form["checkbox"];
		//request.getParameterValues("checkbox");
		for(int i=0;i<checkbox.length;i++)
			System.out.println(i+":"+checkbox[i]+"value.");
		return SUCCESS;
	}
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}
	public void setClient(List<String> client) {
		this.client = client;
	}
	public List<String> getClient() {
		return client;
	}

	public void setRole(List<String> role) {
		this.role = role;
	}

	public List<String> getRole() {
		return role;
	}

	public void setCheckbox(String[] checkbox) {
		this.checkbox = checkbox;
	}

	public String[] getCheckbox() {
		return checkbox;
	} 

}
