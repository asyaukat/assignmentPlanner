package com.assignmentplanner.model;

public class Assignment {
	private String subject_Name;
	private String title;
	private String comments;
	private String lect_Name;
	private String status;
	private String due;
	public String subID;
	
	public String getSubID() {
		return subID;
	}
	public void setSubID(String subID) {
		subID = subID;
	}
	public String getSubject_Name() {
		return subject_Name;
	}
	public void setSubject_Name(String subject_Name) {
		this.subject_Name = subject_Name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getLect_Name() {
		return lect_Name;
	}
	public void setLect_Name(String lect_Name) {
		this.lect_Name = lect_Name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDue() {
		return due;
	}
	public void setDue(String due) {
		this.due = due;
	}
	
}
