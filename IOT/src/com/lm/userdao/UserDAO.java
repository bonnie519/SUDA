package com.lm.userdao;

import java.sql.Connection;
import java.sql.PreparedStatement;



public interface UserDAO
{
	public void DBInit();
    public Connection getConnection();
    public PreparedStatement getPreparedStatement(String sql);
    public void DBClose();
    
}
