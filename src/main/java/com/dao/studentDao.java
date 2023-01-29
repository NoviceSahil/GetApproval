package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.coordinator;
import com.entity.student;

public class studentDao {
	private Connection conn;

	public studentDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean register(student s) {
		boolean f = false;
		try {
			String sql = "insert into student_details(full_name,roll_no,email,branch,password) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, s.getFullName());
			ps.setString(2, s.getRollno());
			ps.setString(3, s.getEmail());
			ps.setString(4, s.getBranch());
			ps.setString(5, s.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public student login(String em, String psw) {
		student s = null;
		try {
			String sql = "select * from student_details where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				s = new student();
				s.setId(rs.getInt(1));
				s.setFullName(rs.getString(2));
				s.setRollno(rs.getString(3));
				s.setEmail(rs.getString(4));
				s.setPassword(rs.getString(5));

			}

		} catch (Exception e) {

		}
		return s;
	}

	public List<student> getAllstudents() {
		List<student> list = new ArrayList<student>();
		student s = null;
		try {

			String sql = "select * from student_details order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s = new student();
				s.setId(rs.getInt(1));
				s.setFullName(rs.getString(2));
				s.setRollno(rs.getString(3));
				s.setBranch(rs.getString(4));
				s.setEmail(rs.getString(5));

				list.add(s);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	public boolean checkOldPassword(int studentid, String oldPassword) {
		boolean f = false;
		try {
			String sql = "select * from student_details where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, studentid);
			ps.setString(2, oldPassword);
			

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean changePassword(int studentid, String newPassword) {
		boolean f = false;
		try {
			String sql = "update student_details set password=? where id=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, studentid);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
