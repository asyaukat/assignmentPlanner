package com.assignmentplanner;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.assignmentplanner.DAO.AssignmentDAO;
import com.assignmentplanner.model.Assignment;
import com.assignmentplanner.model.Lect_Sub;
import com.assignmentplanner.model.Lecturer;
import com.assignmentplanner.model.Subject;

public class AssignmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AssignmentDAO assgDAO = null;
	RequestDispatcher rd = null;
	String clickDelete = "";
	String clickUpdate = "";
	String action = null;
	String singleassignmentName = null;
	String singleassignmentTitle = null;
	Lect_Sub singleLectSub = null;
	String lectSubCode = null;
	
	public AssignmentController() {
		assgDAO = new AssignmentDAO();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		if (request.getParameter("action") != null) // If getParameter not null 
			action = request.getParameter("action");
		else
			action = (String) request.getAttribute("action"); //Else action = getAttribute

		if (getCurrentStudUsrname(request) == null) {
			response.sendRedirect("index.jsp");
		} else {

			switch (action) {
			case "ADDASSIGNMENT":  // Go to Add assignment general menu
				listLectSub(request,response);
				break;
			case "BACK":
				listAssignment(request, response);
				break;
			case "SUBMITASSIGNMENT":
				saveAssignment(request, response);
				break;
			case "SUBMITSUBJECTLECTURER":
				saveSubjectLecturer(request, response);
				break;
			case "ADDNEWSUBJECT":
				redirectLectNewSub(request,response);
				break;
			case "ADDNEWLECTURER":
				saveSubjectLecturer(request,response);
				break;
			case "CHOOSESUBLECT":
				request.setAttribute("subjectCode", request.getParameter("subCode"));
				request.setAttribute("lecturerName", request.getParameter("lecturerName"));
				rd = request.getRequestDispatcher("FormAssignment.jsp");
				rd.forward(request, response);
				break;
			case "UPDATEVIEW": //GO TO Update MENU
				getSingleAssignment(request, response);
				break;
			case "UPDATE":
				updateAssignment(request, response);
				break;
			case "DELETE": // DELETE Assignment
				deleteAssignment(request, response);
				break;
			case "ADDSUB":
				addSubject(request,response);
				break;
			case "ADDLECT":
				addLecturer(request,response);
				break;
			case "REDIRECTSUB":
				rd = request.getRequestDispatcher("FormSubject.jsp");
				rd.forward(request, response);
				break;
			case "SAVELECTONLY":
				saveLecturerOnly(request,response);
			case "LOGOUT":
				request.getSession(false).setAttribute("studusrname",null);
				response.sendRedirect("index.jsp");
				break;
			default:
				listAssignment(request, response);
			}

		}

	}

	private void saveLecturerOnly(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Lecturer l = new Lecturer();
		l.setLect_Name("lecturerName");
		l.setLect_Phone("lecturerPhoneNum");
		
		AssignmentDAO dao = new AssignmentDAO();
		
		if(dao.saveLecturer(lectSubCode, l, getCurrentStudUsrname(request))) {
			//request.setAttribute("NOTIFICATION", "Assignment added");
			RequestDispatcher rd = request.getRequestDispatcher("FormAssignment.jsp");
			request.setAttribute("subjectCode", lectSubCode);
			request.setAttribute("lecturerName", l.getLect_Name());
			rd.forward(request, response);
		}
		
		else {
			request.setAttribute("NOTIFICATION", "Something went wrong");
			RequestDispatcher rd = request.getRequestDispatcher("AssignmentController");
			request.setAttribute("action","BACK");
			rd.forward(request, response);
		}
		
	}

	private void redirectLectNewSub(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("singleSubCode", request.getParameter("subCode"));
		request.getSession().setAttribute("singleSubName", request.getParameter("subjectName"));
		rd = request.getRequestDispatcher("FormLecturer.jsp");
		rd.forward(request, response);
		
	}

	private void addLecturer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("lectOnlySubCode", request.getParameter("subCode"));
		rd = request.getRequestDispatcher("FormLecturer.jsp");
		rd.forward(request, response);
		
		
	}

	private void addSubject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AssignmentDAO dao = new AssignmentDAO();
		List<Subject> subList =  dao.getSubject(getCurrentStudUsrname(request));
		request.setAttribute("Subject", subList);
		rd = request.getRequestDispatcher("FormSubject.jsp");
		rd.forward(request, response);
		
	}

	private void listLectSub(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		AssignmentDAO dao = new AssignmentDAO();
		List<Lect_Sub> Lect_SubList = dao.getLect_Sub(getCurrentStudUsrname(request));
		request.setAttribute("LectSub", Lect_SubList);
		rd = request.getRequestDispatcher("FormSubjectLecturer.jsp");
		rd.forward(request, response);
	}
	
	private void listAssignment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		AssignmentDAO dao = new AssignmentDAO();
		List<Assignment> theList = dao.getAssignment(getCurrentStudUsrname(request));
		request.setAttribute("assignment", theList);
		for(Assignment o: theList) {
			System.out.println(o.getSubject_Name());
		}
		System.out.println("Printing");
		List<Lect_Sub> Lect_SubList = dao.getLect_Sub(getCurrentStudUsrname(request));
		request.setAttribute("Lect_Sub", Lect_SubList);
		for(Lect_Sub o: Lect_SubList) {
			System.out.println(o.getSubjectCode());
		}
		System.out.println("Printing");


		RequestDispatcher rd = request.getRequestDispatcher("AssignmentList.jsp");
		System.out.println("In assignment");
		rd.forward(request, response);

	}
	
	protected void saveAssignment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Assignment u = new Assignment();
		u.setSubject_Name(request.getParameter("subjectCode"));
		u.setTitle(request.getParameter("title"));
		u.setComments(request.getParameter("comments"));
		u.setLect_Name(request.getParameter("lecturerName"));
		u.setStatus(request.getParameter("status"));
		u.setDue(request.getParameter("due"));
		if (assgDAO.saveAssignment(u, getCurrentStudUsrname(request))) {
			request.setAttribute("assignment", u);
			RequestDispatcher rd = request.getRequestDispatcher("AssignmentController");
			request.setAttribute("action", "BACK");
			rd.forward(request, response);
		} else { 
			request.setAttribute("NOTIFICATION", "Assignment not added");
			RequestDispatcher rd = request.getRequestDispatcher("FormAssignment.jsp");
			rd.forward(request, response);
		}
	}

	protected void saveSubjectLecturer(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		singleLectSub = new Lect_Sub();
		if(request.getSession().getAttribute("singleSubCode") != null) {
			
			singleLectSub.setSubjectCode((String)request.getSession().getAttribute("singleSubCode"));
			singleLectSub.setSubjectName((String)request.getSession().getAttribute("singleSubName"));
			singleLectSub.setLecturerName(request.getParameter("lecturerName"));
			singleLectSub.setLecturerPhoneNum(request.getParameter("lecturerPhoneNum"));
			request.getSession().removeAttribute("singleSubCode");
			request.getSession().removeAttribute("singleSubName");
			
			if (assgDAO.saveSubjectLecturer(singleLectSub, getCurrentStudUsrname(request))) {
				request.setAttribute("LectSub", singleLectSub);
				rd = request.getRequestDispatcher("FormAssignment.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("NOTIFICATION", "Subject and Lecturer not added");
				RequestDispatcher rd = request.getRequestDispatcher("FormSubjectLecturer.jsp");
				rd.forward(request, response);
			}
		}
		else {
			Lecturer l = new Lecturer();
			l.setLect_Name(request.getParameter("lecturerName"));
			l.setLect_Phone(request.getParameter("lecturerPhoneNum"));
			singleLectSub.setLecturerName(l.getLect_Name());
			singleLectSub.setSubjectCode((String)request.getSession().getAttribute("lectOnlySubCode"));
			if (assgDAO.saveLecturer((String)request.getSession().getAttribute("lectOnlySubCode"), l, getCurrentStudUsrname(request))) {
				request.setAttribute("LectSub", singleLectSub);
				rd = request.getRequestDispatcher("FormAssignment.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("NOTIFICATION", "Subject and Lecturer not added");
				RequestDispatcher rd = request.getRequestDispatcher("FormSubjectLecturer.jsp");
				rd.forward(request, response);
			}
		}
	}

//	protected void saveLecturer(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		Lecturer u = new Lecturer();
//		u.setLect_ID(request.getParameter("lect_ID"));
//		u.setLect_Name(request.getParameter("lect_Name"));
//		u.setLect_Phone(request.getParameter("lect_Phone"));
//
//		if (assgDAO.saveLecturer(u, getCurrentStudUsrname(request))) {
//			request.setAttribute("lecturer", u);
//			RequestDispatcher rd = request.getRequestDispatcher("AssignmentController");
//			request.setAttribute("action", "BACK");
//			rd.forward(request, response);
//		} else {
//			request.setAttribute("NOTIFICATION", "Lecturer not added");
//			RequestDispatcher rd = request.getRequestDispatcher("FormLecturer.jsp");
//			rd.forward(request, response);
//		}
//	}

	protected void updateAssignment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Assignment u = new Assignment();
		u.setSubject_Name(request.getParameter("subjectCode"));
		u.setTitle(request.getParameter("title"));
		u.setComments(request.getParameter("comments"));
		u.setLect_Name(request.getParameter("lect_Name"));
		u.setStatus(request.getParameter("status"));
		u.setDue(request.getParameter("due"));

		if (assgDAO.updateAssignment(u, getCurrentStudUsrname(request))) {
			rd = request.getRequestDispatcher("AssignmentController");
			request.setAttribute("action", "BACK");
			rd.forward(request, response);
		} else {
			request.setAttribute("NOTIFICATION", "Assignment not updated");
			System.out.println("Update not Succes");
			rd = request.getRequestDispatcher("FormUpdateAssignment.jsp");
			rd.forward(request, response);
		}

	}

	protected void deleteAssignment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * Assignment u = new Assignment();
		 * u.setSubject_Name(request.getParameter("subject_Name"));
		 * u.setTitle(request.getParameter("title"));
		 * 
		 * System.out.println("delete ni"); if (assgDAO.deleteAssignment(u,
		 * getCurrentStudUsrname(request))) { request.setAttribute("NOTIFICATION",
		 * "Assignment deleted Successfully!"); clickDelete = ""; }
		 */
		/*
		 * Assignment u = new Assignment();
		 * u.setSubject_Name(request.getParameter("subject_Name"));
		 * u.setTitle(request.getParameter("title"));
		 * u.setComments(request.getParameter("comments"));
		 * u.setLect_Name(request.getParameter("lect_Name"));
		 * u.setStatus(request.getParameter("status"));
		 * //u.setDue(java.sql.Date.valueOf(request.getParameter("due")));
		 * 
		 * if (assgDAO.deleteAssignment(u, getCurrentStudUsrname(request))) { rd =
		 * request.getRequestDispatcher("AssignmentController");
		 * request.setAttribute("action", "BACK"); rd.forward(request, response); } else
		 * { request.setAttribute("NOTIFICATION", "Assignment cannot be deleted");
		 * System.out.println("Deletion is unsuccessful"); }
		 */
		String studusrname = getCurrentStudUsrname(request);
		String subID= request.getParameter("subID");
		
		if (assgDAO.deleteAssignment(studusrname, subID)) {	
			request.setAttribute("NOTIFICATION", "An assignment has been deleted!");
			rd = request.getRequestDispatcher("AssignmentController");
			request.setAttribute("action", "BACK");
			rd.forward(request, response);
		}
		else {
			request.setAttribute("NOTIFICATION", "Assignment Not Found!");
			rd = request.getRequestDispatcher("AssignmentController");
			request.setAttribute("action", "BACK");
			rd.forward(request, response);
		}
		
	}
	
	protected void getSingleAssignment(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		singleassignmentName = request.getParameter("singleassignmentName");
		singleassignmentTitle = request.getParameter("singleassignmentTitle");
		request.setAttribute("lecturerName", request.getParameter("lecturerName"));

		Assignment a = assgDAO.searchAssignment(getCurrentStudUsrname(request),singleassignmentName);
		request.setAttribute("assignment", a);
		rd = request.getRequestDispatcher("FormUpdateAssignment.jsp");
		rd.forward(request, response);
	}

	private String getCurrentStudUsrname(HttpServletRequest req) {
		HttpSession s = req.getSession();
		return (String) s.getAttribute("studusrname");
	}

}