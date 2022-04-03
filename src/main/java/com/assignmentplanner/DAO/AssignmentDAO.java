package com.assignmentplanner.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.assignmentplanner.model.Assignment;
import com.assignmentplanner.model.Lect_Sub;
import com.assignmentplanner.model.Lecturer;
import com.assignmentplanner.model.Subject;

public class AssignmentDAO {
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	PreparedStatement preparedStatement = null;
	DBConnection db = new DBConnection();
	
	public boolean saveAssignment(Assignment a, String studusrname) {
		boolean flag = false;
		try {
			String sql = "INSERT INTO db1.ASSIGNMENT(ASSIGNSUBID,TITLE,COMMENTS,STATUS,DUE)VALUES (?,?,?,?,?) WHERE EXISTS (SELECT SUBID FROM STUD_LECT_SUB WHERE USERNAME=? AND SUBID=?);";

			System.out.println(sql);
			connection = DBConnection.connectDB();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, a.getSubID());
			preparedStatement.setString(2, a.getTitle());
			preparedStatement.setString(3, a.getComments());
			preparedStatement.setString(4, a.getStatus());
			preparedStatement.setDate(5, java.sql.Date.valueOf(a.getDue()));
			preparedStatement.setString(6, studusrname);
			preparedStatement.setString(7, a.getSubID());
			preparedStatement.executeUpdate();
			System.out.println("Saving Assignment");
			connection.commit();
			flag = true;
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return flag;
	}

	public boolean updateAssignment(Assignment a, String studusrname) {
		boolean flag = false;
		try {
			String sql = "UPDATE assignment SET comments=?,status=?,due=? WHERE ASSIGNSUBID=?";

			System.out.println(sql);
			connection = DBConnection.connectDB();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, a.getComments());
			preparedStatement.setString(2, a.getStatus());
			preparedStatement.setDate(3, java.sql.Date.valueOf(a.getDue()));
			preparedStatement.setString(4, studusrname);
			preparedStatement.setString(5, a.getSubID());
			System.out.println(a.getComments() + a.getStatus() + a.getDue() + a.getSubject_Name() + a.getTitle() + studusrname);
			preparedStatement.executeUpdate();
			connection.commit();
			flag = true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			System.out.println("Returning Eror");
		}
		System.out.println("Returning flag");
		return flag;
	}

	public List<Assignment> getAssignment(String studusrname) {
		List<Assignment> list = null;
		Assignment assignment = new Assignment();

		try {
			list = new ArrayList<Assignment>();
			String sql = "SELECT a.ASSIGNSUBID,a.TITLE,a.COMMENTS,a.STATUS,a.DUE,l.name,s.SUBNAME FROM STUD_LECT_SUB sls JOIN LECTURER l on (l.lectid = sls.lectid) JOIN Assignment a on (a.assignSUBID = sls.subid) JOIN SUBJECT s on(s.subjectID=sls.subid) WHERE SLS.username = ? ";
			connection = DBConnection.connectDB();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, studusrname);
			resultSet = preparedStatement.executeQuery();
			System.out.println("select assignment");
			while (resultSet.next()) {
				assignment = new Assignment();
				assignment.setSubID(resultSet.getString(1));
				assignment.setTitle(resultSet.getString(2));
				assignment.setComments(resultSet.getString(3));
				assignment.setStatus(resultSet.getString(4));
				assignment.setDue(new SimpleDateFormat("dd-MM-yyyy").format(resultSet.getDate(5)));
				assignment.setLect_Name(resultSet.getString(6));
				assignment.setSubject_Name(resultSet.getString(7));
				list.add(assignment);
			}
			
			
		} catch (SQLException e) {
		}
		return list;
	}

	public Assignment searchAssignment(String studusrname, String subID) {
		Assignment assignment = null;
		try {

			String sql = "SELECT s.SUBNAME,a.assignSUBID,a.title,a.comments,a.status,a.due FROM assignment a JOIN SUBJECT S ON (s.subjectID=a.assignSUBID) where s.subjectID = ?";
			connection = DBConnection.connectDB();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, subID);
			resultSet = preparedStatement.executeQuery();
			System.out.println("searching Assignment " + subID);
			if (resultSet.next()) {
				assignment = new Assignment();
				assignment.setSubject_Name(resultSet.getString(1));
				assignment.setSubID(resultSet.getString(2));
				assignment.setTitle(resultSet.getString(3));
				assignment.setComments(resultSet.getString(4));
				assignment.setStatus(resultSet.getString(5));
				assignment.setDue(new SimpleDateFormat("yyyy-MM-dd").format(resultSet.getDate(6)));
			} else
				throw new Exception();

		} catch (Exception e) {

		}

		return assignment;
	}

	public boolean deleteAssignment(String studusrname, String subID) {
		boolean flag = false;

		try {
			String sql = "DELETE FROM assignment WHERE ASSIGNSUBID = '"+"subID"+"'";
			connection = DBConnection.connectDB();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			connection.commit();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;

	}

	public boolean saveSubjectLecturer(Lect_Sub ls, String studusrname) {

		boolean flag = false;
	
		
		try {
			
			String sql = "INSERT INTO LECTURER(NAME,LECTPHONE)VALUES (?,?);"
					+ "    INSERT INTO SUBJECT(SUBCODE,SUBNAME) VALUES (?,?);"
					+ "    INSERT INTO STUD_LECT_SUB(USERNAME,SUBID,LECTID) VALUES (?,?,?);'";
			
//			String sql = " BEGIN\r\n "
//					+ " INSERTSUBLECT(?,?,?,?,LOWER(?)); \r\n"
//					+ " END; ";

			System.out.println(sql);
			connection = DBConnection.connectDB();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, ls.getSubjectCode());
			preparedStatement.setString(2, ls.getSubjectName());
			preparedStatement.setString(3, ls.getLecturerName());
			preparedStatement.setString(4, ls.getLecturerPhoneNum());
			preparedStatement.setString(5, studusrname);
			preparedStatement.executeUpdate();
			System.out.println("Saving Subject and Lecturer");
			connection.commit();
			flag = true;
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return flag;
	}

	public boolean saveLecturer(String subID,Lecturer l, String studusrname) {
		boolean flag = false;
		try {
			String sql = " BEGIN \r\n"
					+ " INSERTLECT(?,?,?,?); \r\n"
					+ " END; ";

			System.out.println(sql);
			connection = DBConnection.connectDB();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, subID);
			preparedStatement.setString(2, l.getLect_Name());
			preparedStatement.setString(3, l.getLect_Phone());
			preparedStatement.setString(4, studusrname);
			preparedStatement.executeUpdate();
			System.out.println("Saving Lecturer");
			connection.commit();
			flag = true;
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return flag;
	}

	public List<Lect_Sub> getLect_Sub(String studusrname) {

		List<Lect_Sub> list = null;
		Lect_Sub lectsub = new Lect_Sub();

		try {
			list = new ArrayList<Lect_Sub>();
			String sql = "SELECT s.subcode,s.subName,l.name,l.lectphone\r\n" + "FROM STUD_LECT_SUB sls\r\n"
					+ "JOIN lecturer l ON(sls.lectid=l.lectID)\r\n" + "JOIN subject s ON(sls.SUBID = s.subjectID)\r\n" + "WHERE sls.USERNAME = LOWER('" + studusrname
					+ "')";
			System.out.println(sql + "THIS IS IN GETLECT_SUB");
			connection = DBConnection.connectDB();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				lectsub = new Lect_Sub();
				lectsub.setSubjectCode(resultSet.getString(1));
				lectsub.setSubjectName(resultSet.getString(2));
				lectsub.setLecturerName(resultSet.getString(3));
				lectsub.setLecturerPhoneNum(resultSet.getString(4));
				list.add(lectsub);
			}
		} catch (SQLException e) {
		}
		return list;
	}

	public List<Subject> getSubject(String studusrname) {
		List<Subject> list = null;
		Subject sub = null;
		try {
			list = new ArrayList<Subject>();
			String sql = "select subCode,subName from subject";
			connection = DBConnection.connectDB();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			System.out.println("get list of subject");
			while (resultSet.next()) {
				sub = new Subject();
				sub.setSubjectCode(resultSet.getString(1));
				sub.setSubjectName(resultSet.getString(2));
				list.add(sub);
			}
		} catch (SQLException e) {
		}
		return list;
	}

	/*public boolean deleteLectSub(Lect_Sub ls,String studusrname) {
		boolean flag = false;
	
		try {
			String sql = "DELETE FROM lect_sub WHERE studusrname=LOWER('" + studusrname + "') AND subject_code='"
					+ subjName + "' AND title='" + title + "'";
			connection = DBConnection.connectDB();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			connection.commit();
			
			String sql = "DELETE FROM assignment WHERE studusrname=LOWER('" + studusrname + "') AND subject_code='"
					+ subjName + "' AND title='" + title + "'";
			connection = DBConnection.connectDB();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			connection.commit();
			
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;*/

	//}
	
}

