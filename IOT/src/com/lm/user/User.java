package com.lm.user;

import com.lm.userdaoimpl.UserDAOImpl;

public class User
{
    private String account;
    private String name;
    private String password;
    private int age;
    private String sex;
    private String address;
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String register()
	{
		//System.out.println(name+" "+account+" "+age+" "+address+" "+sex+" ");
		//将name,account,password,age,sex,address写入到数据库中
		UserDAOImpl udi=new UserDAOImpl();
		udi.DBInit();
		udi.getConnection();
		udi.getPreparedStatement("insert into user values(?,?,?,?,?,?)");
		udi.insertUser(account,name,password,age,sex,address);
		udi.DBClose();
		return "success";
	}
    
}
