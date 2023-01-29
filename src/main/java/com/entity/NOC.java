package com.entity;

public class NOC {
	private int id;
	private int studentid;
	private String fullName;
	private String roll_no;
	private String branch;
	private int coordinator_id;
	private String company;
	private String duration;
	private String email;
	private String phone;
	private String letter;
	private String status;
	public NOC() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NOC(int studentid, String fullName, String roll_no, String branch, int coordinator_id, String company,
			String duration, String email, String phone, String letter, String status) {
		super();
		this.studentid = studentid;
		this.fullName = fullName;
		this.roll_no = roll_no;
		this.branch = branch;
		this.coordinator_id = coordinator_id;
		this.company = company;
		this.duration = duration;
		this.email = email;
		this.phone = phone;
		this.letter = letter;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStudentid() {
		return studentid;
	}
	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getRoll_no() {
		return roll_no;
	}
	public void setRoll_no(String roll_no) {
		this.roll_no = roll_no;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public int getCoordinator_id() {
		return coordinator_id;
	}
	public void setCoordinator_id(int coordinator_id) {
		this.coordinator_id = coordinator_id;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getLetter() {
		return letter;
	}
	public void setLetter(String letter) {
		this.letter = letter;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}