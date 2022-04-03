package com.assignmentplanner;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.assignmentplanner.DAO.LoginRegisterDAO;
import com.assignmentplanner.model.Student;


public class LoginRegisterController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	LoginRegisterDAO LogRegDAO = null;
	
	public LoginRegisterController(){
		LogRegDAO = new LoginRegisterDAO();
	}
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException {
		String action = req.getParameter("action");
		
		switch(action){
			case "LOGIN":
				System.out.println("Hello");
				loginStudent(req,res);
				break;
			case "REGISTER":
				RequestDispatcher rd = req.getRequestDispatcher("Registration.jsp");
				rd.forward(req, res);
				break;
			case "REGISTERUSER":
				registerStudent(req,res);
		}
		
		}
	
	public void loginStudent(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
		String usrname = req.getParameter("usrname");
		String pass = req.getParameter("password");
		if(LogRegDAO.getSingleStudent(usrname,pass)) {
			HttpSession session = req.getSession();
			session.setAttribute("studusrname",usrname);
			req.setAttribute("action", new String("login"));
			System.out.println("LogRegController.LoginStudent()" + req.getParameter("action") + req.getAttribute("action")); // Printing the value of action
			RequestDispatcher rd = req.getRequestDispatcher("AssignmentController");
			rd.forward(req, res);
		}
		else {
			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			rd.forward(req, res);
		}
	}
	public void registerStudent(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{
		
		String usrname = req.getParameter("usrname");
		String name = req.getParameter("name");
		String pass = req.getParameter("password");
		
		Student newStudent = new Student();
		newStudent.setUsername(usrname);
		newStudent.setStudent_name(name);
		newStudent.setPassword(pass);
		
		if(LogRegDAO.registerStudent(newStudent)) {
			req.setAttribute("NOTIFICATION", "Student Registered");
			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, res);
		}
		else {
			req.setAttribute("NOTIFICATION", "Registration Unsuccessful");
			RequestDispatcher rd = req.getRequestDispatcher("/Registration.jsp");
			rd.forward(req, res);
		}
		
	}
}
