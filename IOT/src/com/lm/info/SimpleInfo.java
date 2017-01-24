package com.lm.info;

import java.io.Serializable;

public class SimpleInfo implements Serializable
{
   private Float temp;
   private Float humi;
   private String time;
   private String address;
   private String ip;
	public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getIp() {
	return ip;
}
public void setIp(String ip) {
	this.ip = ip;
}
	public Float getTemp() {
		return temp;
	}
	public void setTemp(Float temp) {
		this.temp = temp;
	}
	public Float getHumi() {
		return humi;
	}
	public void setHumi(Float humi) {
		this.humi = humi;
	}
}
