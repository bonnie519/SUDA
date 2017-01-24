package com.lm.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.lm.info.ClusterState;
import com.lm.userdaoimpl.UserDAOImpl;
import com.opensymphony.xwork2.ActionSupport;

public class DataAnalyze extends ActionSupport implements SessionAware
{
	private List<ClusterState> clusterstate;
	public List<ClusterState> getClusterstate() {
		return clusterstate;
	}
	public void setClusterstate(List<ClusterState> clusterstate) {
		this.clusterstate = clusterstate;
	}
	private List<ClusterState> teclusterstate=new ArrayList<ClusterState>();
	private Map mySession;
	public String clusternum()
	{
		return "clusternum";
	}
	public String nodebroken()
	{
		return "nodebroken";
	}
	public String clusterstate() throws SQLException
	{
		UserDAOImpl udi=new UserDAOImpl();
		udi.DBInit();
		udi.getConnection();
		udi.getStatement();
		ResultSet rs=udi.executeSQL("select * from clusterstate");
		
			while(rs.next())
			{
				ClusterState temp=new ClusterState();
				temp.setCno(rs.getString("cno"));
				temp.setClocation(rs.getString("clocation"));
				temp.setCtype(rs.getString("ctype"));
				temp.setCip(rs.getString("cip"));
				temp.setTavg(rs.getFloat("tavg"));
				temp.setHavg(rs.getFloat("havg"));
				temp.setClong(rs.getDouble("clong"));
				temp.setClati(rs.getDouble("clati"));
				if(rs.getFloat("tavg")>0&&rs.getFloat("havg")>0)
				{
					temp.setCstate("Õý³£");
				}
				else
				{
					temp.setCstate("¹ÊÕÏ");
				}
				teclusterstate.add(temp);
			}
			this.setClusterstate(teclusterstate);
		
		
		return "clusterstate";
	}
	public String baidumap()
	{
		return "baidumap";
	}
	public void setSession(Map<String, Object> arg0)
	{
		// TODO Auto-generated method stub
		this.mySession=arg0;
	}
}
