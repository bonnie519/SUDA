package com.lm.info;

public class ClusterState
{
	   private String cno;
	   private String clocation;
	   private String ctype;
	   private float tavg;
	   private float havg;
	   private String cip;
	   private double clong;
	   private double clati;
	   private String cstate; //ÊÇ·ñÕý³£
		public String getCstate() {
		return cstate;
	}
	public void setCstate(String cstate) {
		this.cstate = cstate;
	}
		public String getCno() {
			return cno;
		}
		public float getTavg() {
			return tavg;
		}
		public void setTavg(float tavg) {
			this.tavg = tavg;
		}
		public float getHavg() {
			return havg;
		}
		public void setHavg(float havg) {
			this.havg = havg;
		}
		public double getClong() {
			return clong;
		}
		public void setClong(double clong) {
			this.clong = clong;
		}
		public double getClati() {
			return clati;
		}
		public void setClati(double clati) {
			this.clati = clati;
		}
		public void setCno(String cno) {
			this.cno = cno;
		}
		public String getClocation() {
			return clocation;
		}
		public void setClocation(String clocation) {
			this.clocation = clocation;
		}
		public String getCtype() {
			return ctype;
		}
		public void setCtype(String ctype) {
			this.ctype = ctype;
		}
		
		public String getCip() {
			return cip;
		}
		public void setCip(String cip) {
			this.cip = cip;
		}
		
   
}
