package com.entity;

public class courses {
		
	public courses() {
		super();
		
	}
	private int id;
	private String courseName;
	public courses(int id, String courseName) {
		super();
		this.id = id;
		this.courseName = courseName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	
}
