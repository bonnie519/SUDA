package sta_info;
import java.io.Serializable;
public class StaInfo implements Serializable{

	/**
	 * @param args
	 */
	private String city;
	private String district;
	private String stationno;
	private String stationname;
	private int rentable;
	private int returnable;
	private int minrentable;
	private int minreturnable;
    private String state;


	public void setCity(String city) {
		this.city = city;
	}

	public String getCity() {
		return city;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getDistrict() {
		return district;
	}

	public void setRentable(int rentable) {
		this.rentable = rentable;
	}

	public int getRentable() {
		return rentable;
	}

	public void setReturnable(int returnable) {
		this.returnable = returnable;
	}

	public int getReturnable() {
		return returnable;
	}

	public void setStationno(String stationno) {
		this.stationno = stationno;
	}

	public String getStationno() {
		return stationno;
	}

	public void setStationname(String stationname) {
		this.stationname = stationname;
	}

	public String getStationname() {
		return stationname;
	}


	public void setMinrentable(int minrentable) {
		this.minrentable = minrentable;
	}

	public int getMinrentable() {
		return minrentable;
	}

	public void setMinreturnable(int minreturnable) {
		this.minreturnable = minreturnable;
	}

	public int getMinreturnable() {
		return minreturnable;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getState() {
		return state;
	}

}
