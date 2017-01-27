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
import rent_info.RentRecord;
public class QryRentRecordAction extends ActionSupport implements SessionAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * @param args
	 */
	private List<RentRecord> rentr;
	private List<RentRecord> tmpr = new ArrayList<RentRecord>();
	private Date startd,endd;
	private String district;
	//private Map<String,RentRecord> info = new HashMap<String,RentRecord>();
	//private Map<String,RentRecord> tinfo = new HashMap<String,RentRecord>();
	private Map mySession;
	private String cardno;
	private String bal;
	public String QryRr()
	{
		String sql="select cardno, bkno, bbnum, b.stationname as stationb, bdate, rbnum, c.stationname as stationr,rdate "+
		"from rent a, station b, station c	where a.bstano=b.stationno and a.rstano=c.stationno";
		if(startd==null && (endd==null) && (district.equals("")))
			sql+=";";
		else if(startd==null && (endd==null))
			sql+=" and a.bstano in (select stationno from station where district ='"+district+"');";
		else if(district.equals(""))
			sql+=" and bdate >='"+startd+"' and bdate <='"+endd+"';";
		else
			sql+=" and a.bstano in (select stationno from station where district ='"+district+"') and bdate >='"+startd+"' and bdate <='"+endd+"';";
		
		//Dao dao=new Dao();
		
		System.out.println(sql);
		//ResultSet rS = dao.executeQuery(sql);
		try {
			Dao dao=new Dao();
			ResultSet rS = dao.executeQuery(sql);
			if(!rS.next())
			{
				HttpServletRequest request = ServletActionContext.getRequest();
				request.setAttribute("returnv", "F");
				rS.close();
				return SUCCESS;
			}
			while(rS.next())
			{
		
				RentRecord rr=new RentRecord();
				//rr.setRdate(rS.getString("rdate"));
				//rr.setDistrict(rS.getString("district"));
				rr.setBdate(rS.getDate("bdate"));
				rr.setRdate(rS.getDate("rdate"));
				rr.setCardno(rS.getString("cardno"));
				rr.setBbnum(rS.getString("bbnum"));
				rr.setRbnum(rS.getString("rbnum"));
				rr.setStationb(rS.getString("stationb"));
				rr.setStationr(rS.getString("stationr"));
				rr.setBkno(rS.getString("bkno"));
				/*
				
				private Date bdate;
				private Date rdate;
				private String district;
				private String stano;
				private String stationb;
				private String stationr;
				private String cardno;
				private String bbnum;
				private String rbum;*/
				
				tmpr.add(rr);	
				
				setRentr(tmpr);
			}
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("returnv", "S");
			rS.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//mySession.put("StaInfo", tmpInfo);
		
		return SUCCESS;
	}
	
	public String QryBal()
	{
		String sql = "select cardno, balance from card where cardno='"+getCardno()+"';";
			//System.out.println(count);		
			try {
				Dao dao=new Dao();
				ResultSet rS = dao.executeQuery(sql);
				if(rS.next())
				{
					HttpServletRequest request = ServletActionContext.getRequest();
					request.setAttribute("returnwords", "S");
					setBal(rS.getString("balance"));
				}
				else
				{
					HttpServletRequest request = ServletActionContext.getRequest();
					request.setAttribute("returnwords", "F");
				}
			
				rS.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return SUCCESS;
					//setStainfo(tmpInfo);
			
			//mySession.put("StaInfo", tmpInfo);
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		QryRentRecordAction a=new QryRentRecordAction();
		a.setDistrict("ÎâÖÐÇø");
		a.QryRr();
	}
	@Override
	public void setSession(Map<String,Object> session) {
		// TODO Auto-generated method stub
		this.mySession=session;
	}


	public void setStartd(Date startd) {
		this.startd = startd;
	}

	public Date getStartd() {
		return startd;
	}

	public void setEndd(Date endd) {
		this.endd = endd;
	}

	public Date getEndd() {
		return endd;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getDistrict() {
		return district;
	}

	public void setRentr(List<RentRecord> rentr) {
		this.rentr = rentr;
	}

	public List<RentRecord> getRentr() {
		return rentr;
	}

	public void setCardno(String cardno) {
		this.cardno = cardno;
	}

	public String getCardno() {
		return cardno;
	}
	public void setBal(String balance) {
		this.bal = balance;
	}

	public String getBal() {
		return this.bal;
	}

}
