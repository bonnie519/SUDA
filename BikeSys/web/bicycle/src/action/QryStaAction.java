package action;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;  

import org.apache.struts2.interceptor.SessionAware;

//import com.opensymphony.xwork2.Action; 
import com.opensymphony.xwork2.ActionSupport;
import dao.Dao;
import sta_info.StaInfo;
public class QryStaAction extends ActionSupport implements SessionAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * @param args
	 */
	private List<StaInfo> stainfo;
	private List<StaInfo> tmpInfo=new ArrayList<StaInfo>();
	
	private Map<String,StaInfo> bikenoinfo=new HashMap<String,StaInfo>();
	private Map<String,StaInfo> tinfo=new HashMap<String,StaInfo>();
	private Map mySession;
	public String QrySta ()
	{
		Dao dao=new Dao();
		String sql="select b.city,b.district,b.stationname, b.stationno, LEN(plotflag)-LEN(REPLACE(plotflag,'0',''))as returnable,LEN(REPLACE(plotflag,'0',''))as rentable"+
		" from db_local_parkplot as a, station as b where a.stationno = b.stationno";

		ResultSet rS = dao.executeQuery(sql);
		try {
			while(rS.next())
			{
				StaInfo sta=new StaInfo();
				sta.setCity(rS.getString("city"));
				sta.setDistrict(rS.getString("district"));
				sta.setStationno(rS.getString("stationno"));
				sta.setStationname(rS.getString("stationname"));
				sta.setRentable(rS.getInt("rentable"));
				sta.setReturnable(rS.getInt("returnable"));
				tmpInfo.add(sta);
				
				System.out.println(rS.getString("city")+"|"+rS.getString("district")+"|"
						+rS.getString("stationname")+"|"+rS.getInt("rentable")+"|"
						+rS.getInt("returnable"));
				setStainfo(tmpInfo);
			}
			rS.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//mySession.put("StaInfo", tmpInfo);
		
		return SUCCESS;
	}
	
	public String QryNInfo()
	{
		Dao dao=new Dao();
		//String sql = "select stano, balance, vol from sta_bk_info;";
		String sql="select stationno, LEN(plotflag)-LEN(REPLACE(plotflag,'0',''))as returnable,"+		
"LEN(REPLACE(plotflag,'0',''))as rentable, minreturnable, minrentable "+ 
		"from db_local_parkplot;";
//select b.stationno, LEN(plotflag)-LEN(REPLACE(plotflag,'0',''))as returnable,LEN(REPLACE(plotflag,'0',''))as rentable"+
//		" from db_local_parkplot as a, station as b where a.stationno = b.stationno";
		ResultSet rS =null;
		try {
			rS= dao.executeQuery(sql);
			while(rS.next())
			{
				StaInfo sta=new StaInfo();
				String id;
				int rent,retn;
				id=rS.getString("stationno");
				sta.setStationno(id);
				
				sta.setRentable(rS.getInt("rentable"));
				sta.setReturnable(rS.getInt("returnable"));
				sta.setMinrentable(rS.getInt("minrentable"));
				sta.setMinreturnable(rS.getInt("minreturnable"));
				if(rS.getInt("rentable")<rS.getInt("minrentable")
						&& rS.getInt("returnable")>=rS.getInt("minreturnable"))
				{
					sta.setState("-");
				}
				if(rS.getInt("returnable")<rS.getInt("minreturnable")
						&& rS.getInt("rentable")>=rS.getInt("minrentable"))
				{
					sta.setState("+");
				}
				if(rS.getInt("returnable")>=rS.getInt("minreturnable")
						&& rS.getInt("rentable")>=rS.getInt("minrentable"))
				{
					sta.setState("z");
				}
					bikenoinfo.put(id, sta);
				//setInfo(tinfo);
				//System.out.println(id+"|"+rS.getInt("rentable")+"|"+rS.getInt("returnable"));
				System.out.println(id+"|"+sta.getState());
			}
			rS.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "fail";
		}
		//mySession.put("StaInfo", tmpInfo);
		return "success";
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	@Override
	public void setSession(Map<String,Object> session) {
		// TODO Auto-generated method stub
		this.mySession=session;
	}
	public void setStainfo(List<StaInfo> stainfo) {
		this.stainfo = stainfo;
	}
	public List<StaInfo> getStainfo() {
		return stainfo;
	}
	public void setBikenoinfo(Map<String,StaInfo> info)
	{
		this.bikenoinfo=info;
	}
	public Map<String,StaInfo> getBikenoinfo()
	{
		return this.bikenoinfo;
	}
	/*public int getBal(String stano)
	{
		StaInfo sta=new StaInfo();
		sta=info.get(stano);
		return sta.getBalance();
	}
	public int getVol(String stano)
	{
		StaInfo sta=new StaInfo();
		sta=info.get(stano);
		return sta.getVol();
	}*/

}
