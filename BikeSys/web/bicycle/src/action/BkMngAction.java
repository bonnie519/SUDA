package action;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;  

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

//import com.opensymphony.xwork2.Action; 
import com.opensymphony.xwork2.ActionSupport;
import dao.Dao;
import sta_info.BikeInfo;
import sta_info.StaInfo;
public class BkMngAction extends ActionSupport implements SessionAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * @param args
	 */
	
	private String bpid;
	private Date pd;
	private String type;
	private Map mySession;
	private List<BikeInfo> bikeinfo=new ArrayList<BikeInfo>();
	private List<BikeInfo> tbikeinfo=new ArrayList<BikeInfo>();
	//注册自行车
	public String bikein_mang()
	{
		Dao dao=new Dao();
		String sql = "insert into bk values('"+getBpid()+"','"+getType()+
		"','"+getPd()+"',0);";

		int count=0; 
		
		count = dao.executeUpdate(sql);
		System.out.println(count);
		if(count>0)
		{
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("returnwords", "车辆入库成功！");
			//return SUCCESS;
				//setStainfo(tmpInfo);
		}
		//mySession.put("StaInfo", tmpInfo);
		else
		{
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("returnwords", "车辆入库失败！");
		}
		return SUCCESS;
	}
	
	public String QryBike()
	{
		Dao dao=new Dao();
		//String sql = "select stano, balance, vol from sta_bk_info;";
		String sql="select bkid, bktype, purchaseday,(case cstatus when 1 then '借出' when 0 then '未借' end)as cstatus from bk";
		ResultSet rS = dao.executeQuery(sql);
		try {
			while(rS.next())
			{
				BikeInfo bk=new BikeInfo();
				String bid;
				bid=rS.getString("bkid");
				bk.setBkid(bid);
				
				bk.setBktype(rS.getString("bktype"));
				bk.setPurchaseday(rS.getDate("purchaseday"));
				bk.setCstatus(rS.getString("cstatus"));
				tbikeinfo.add(bk);
				//setInfo(tinfo);
				//System.out.println(id+"|"+rS.getInt("rentable")+"|"+rS.getInt("returnable"));
				setBikeinfo(tbikeinfo);
			}
			rS.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "failure";
		}
		//mySession.put("StaInfo", tmpInfo);
		//return "success";
	
		return SUCCESS;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	@Override
	public void setSession(Map<String,Object> session) {
		// TODO Auto-generated method stub
		this.mySession=session;
	}

	public void setBpid(String bpid) {
		this.bpid = bpid;
	}


	public String getBpid() {
		return bpid;
	}


	public void setPd(Date pd) {
		this.pd = pd;
	}


	public Date getPd() {
		return pd;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getType() {
		return type;
	}

	public void setBikeinfo(List<BikeInfo> bikeinfo) {
		this.bikeinfo = bikeinfo;
	}

	public List<BikeInfo> getBikeinfo() {
		return bikeinfo;
	}
}
