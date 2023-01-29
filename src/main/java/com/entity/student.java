package com.entity;

public class student {
	
         private int id;
         private String full_name;
         private String roll_no;
         private String email;
         private String branch;
         private String password;
         
         
		public student() {
			super();
			
		}

		public student(String fullName, String roll_no, String email, String branch, String password) {
			super();
			
			this.full_name = fullName;
			this.roll_no = roll_no;
			this.email = email;
			this.branch=branch;
			this.password = password;
		}
		
		public int getId() {
			return id;
		}
		
		public int setId(int id) {
			return id;
		}
		public String getFullName() {
			return full_name;
		}
		public void setFullName(String fullName) {
			this.full_name = fullName;
		}
		public String getRollno() {
			return roll_no;
		}
		public void setRollno(String rollno) {
			this.roll_no = rollno;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getBranch() {
			return branch;
		}
		public void setBranch(String branch) {
			this.branch = branch;
		}
		
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
       
}
