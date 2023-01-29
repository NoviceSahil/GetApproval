package com.dao;

import java.sql.Connection;
import com.entity.courses;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class courseDao {

	private Connection conn;

	public courseDao(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean addCourse(String course)
	{
		boolean f=false;
		try {
			
			String sql="insert into courses(coursename) values(?)";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, course);
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			
		}
		return f;
	}
	public List<courses> getAllCourse() {
		List<courses> list = new ArrayList<courses>();
		courses s = null;
		try {
			String sql = "select * from courses";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s = new courses();
				s.setId(1);
				s.setCourseName(rs.getString(2));
				list.add(s);
			}
		} catch (Exception e) { 
			e.printStackTrace();
		}
		return list;
	}
}

