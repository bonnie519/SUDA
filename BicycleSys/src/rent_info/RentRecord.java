package rent_info;

import java.sql.Date;

public class RentRecord {
	private Date bdate;
	private Date rdate;
	private String district;
	private String stano;
	private String stationb;
	private String stationr;
	private String cardno;
	private String bbnum;
	private String rbnum;
	private String bkno;
	//private String rdate;
	//private Date ddemo;
	private int status;
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getDistrict() {
		return district;
	}
	public void setStano(String stano) {
		this.stano = stano;
	}
	public String getStano() {
		return stano;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	public int getStatus() {
		return status;
	}
	public void setCardno(String cardno) {
		this.cardno = cardno;
	}
	public String getCardno() {
		return cardno;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setStationb(String stationb) {
		this.stationb = stationb;
	}
	public String getStationb() {
		return stationb;
	}
	public void setStationr(String stationr) {
		this.stationr = stationr;
	}
	public String getStationr() {
		return stationr;
	}
	public void setBbnum(String bbnum) {
		this.bbnum = bbnum;
	}
	public String getBbnum() {
		return bbnum;
	}
	public void setRbnum(String rbnum) {
		this.rbnum = rbnum;
	}
	public String getRbnum() {
		return rbnum;
	}
	public void setBkno(String bkno) {
		this.bkno = bkno;
	}
	public String getBkno() {
		return bkno;
	}
	
	
	
}
