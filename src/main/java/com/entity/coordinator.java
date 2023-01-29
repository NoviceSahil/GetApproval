package com.entity;

public class coordinator {
	private int id;
	private String fullName;
	private String department;
	private String deptId;
	private String password;
	private String phoneNo;
	private String email;
	

	public coordinator(String fullName, String department, String deptId,String password, String phoneNo, String email
			) {
		super();
		this.fullName = fullName;
		this.department = department;
		this.deptId = deptId;
		this.password = password;
		this.phoneNo = phoneNo;
		this.email = email;
		
	}

	public coordinator() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public coordinator(int id, String fullName, String department, String deptId,
			String password, String phoneNo, String email) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.department = department;
		this.deptId = deptId;
		this.password = password;
		this.phoneNo = phoneNo;
		this.email = email;
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	

}
