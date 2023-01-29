package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.company;
import com.entity.courses;



public class companyDao {
	private Connection conn;

	public companyDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addCompany(String Company) {
		boolean f = false;
		try {
			String sql = "insert into companylist(companyName) values(?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, Company);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	public List<company> getAllCompany() {
		List<company> list = new ArrayList<company>();
		company s = null;
		try {
			String sql = "select * from companylist";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s = new company();
				s.setId(1);
				s.setCompanyName(rs.getString(2));
				list.add(s);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

}
