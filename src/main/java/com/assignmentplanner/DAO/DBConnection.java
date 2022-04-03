package com.assignmentplanner.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private static Connection conn;
	public DBConnection() {
		
	}
	public static Connection connectDB() {
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1?" +
				    	                                   "user=root&password=abcd1234&serverTimezone=UTC");
			 conn.setAutoCommit(false);
			 System.out.println("Database success");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return conn;
	}
	

}
