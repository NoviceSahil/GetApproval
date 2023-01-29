package com.entity;

public class company {
	public int id;
	public String companyName;

	public company() {
		super();
		// TODO Auto-generated constructor stub
	}

	public company(int id, String companyName) {
		super();
		this.id = id;
		this.companyName = companyName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
}
