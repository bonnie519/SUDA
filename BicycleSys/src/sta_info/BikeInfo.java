package sta_info;

import java.sql.Date;

public class BikeInfo {
private String bkid;
private String bktype;
private Date purchaseday;
private String cstatus;
public void setBkid(String bkid) {
	this.bkid = bkid;
}
public String getBkid() {
	return bkid;
}
public void setPurchaseday(Date purchaseday) {
	this.purchaseday = purchaseday;
}
public Date getPurchaseday() {
	return purchaseday;
}
public void setBktype(String bktype) {
	this.bktype = bktype;
}
public String getBktype() {
	return bktype;
}
public void setCstatus(String cstatus) {
	this.cstatus = cstatus;
}
public String getCstatus() {
	return cstatus;
}
}
