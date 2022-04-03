package com.assignmentplanner.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.assignmentplanner.model.Student;

public class LoginRegisterDAO {

	private Connection conn = null;
	private PreparedStatement prpstmt = null;
	private ResultSet rs = null;
	private DBConnection db = new DBConnection();
	
	public boolean getSingleStudent(String usrname,String pass) {
		boolean validateCheck = false;
		
		try {
			
			String query = "Select * from db1.student where username=LOWER(?) and password=?";

			conn = DBConnection.connectDB();
			prpstmt = conn.prepareStatement(query);
			prpstmt.setString(1, usrname);
			prpstmt.setString(2, pass);
			rs = prpstmt.executeQuery();
			if(rs.next())
				validateCheck = true;
	
				
		} catch (SQLException e) {

		}
		return validateCheck;
	}
	
	public boolean registerStudent(Student s) {
		String query = "insert into db1.student values(LOWER(?),?,?)";
		
		try {
			System.out.println("beforequery" + query) ;
			conn = DBConnection.connectDB();
			prpstmt = conn.prepareStatement(query);
			prpstmt.setString(1, s.getUsername());
			prpstmt.setString(2, s.getStudent_name());
			prpstmt.setString(3, s.getPassword());
			prpstmt.executeUpdate();
			conn.commit();
			
			return true;
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		
	}
}
