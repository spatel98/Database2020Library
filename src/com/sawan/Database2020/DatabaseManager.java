package com.sawan.Database2020;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseManager {

	private Connection connection;
	
	public DatabaseManager(String dbUrl, String dbUser, String dbPassword) throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.cj.jdbc.Driver");
		this.connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	}
	
	public Connection getConnection(){
		return this.connection;
	}
}
