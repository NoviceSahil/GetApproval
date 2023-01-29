package com.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;

import com.entity.NOC;

public class NocDao {
	private Connection conn;

	public NocDao(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean addNOC(NOC noc) {
		boolean f = false;
		try {
			String sql = "insert into noc(studentid, fullName, roll_no, branch, coordinator_id, company, duration, email, phone, letter, status) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement  ps = conn.prepareStatement(sql);
			ps.setInt(1, noc.getStudentid());
			ps.setString(2, noc.getFullName());
			ps.setString(3, noc.getRoll_no());
			ps.setString(4, noc.getBranch());
			ps.setInt(5, noc.getCoordinator_id());
			ps.setString(6, noc.getCompany());
			ps.setString(7, noc.getDuration());
			ps.setString(8, noc.getEmail());
			ps.setString(9, noc.getPhone());
			ps.setString(10, noc.getLetter());
			ps.setString(11, noc.getStatus());
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
	public List<NOC> getAllNocByLoginStudent(int studentId) {
		List<NOC> list = new ArrayList<NOC>();
		NOC noc = null;
		try {
			String sql = "select * from noc where studentid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, studentId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				noc = new NOC();
				noc.setId(rs.getInt(1));
				noc.setStudentid(rs.getInt(2));
				noc.setFullName(rs.getString(3));
				noc.setRoll_no(rs.getString(4));
				noc.setBranch(rs.getString(5));
				noc.setCoordinator_id(rs.getInt(6));
				noc.setCompany(rs.getString(7));
				noc.setDuration(rs.getString(8));
				noc.setEmail(rs.getString(9));
				noc.setPhone(rs.getString(10));
				noc.setLetter(rs.getString(11));
				noc.setStatus(rs.getString(12));
				list.add(noc);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	public List<NOC> getAllNocByCoordinatorLogin(int coordinatorid) {
		List<NOC> list = new ArrayList<NOC>();
		NOC noc = null;
		try {
			String sql = "select * from noc where coordinator_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, coordinatorid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				noc = new NOC();
				noc.setId(rs.getInt(1));
				noc.setStudentid(rs.getInt(2));
				noc.setFullName(rs.getString(3));
				noc.setRoll_no(rs.getString(4));
				noc.setBranch(rs.getString(5));
				noc.setCoordinator_id(rs.getInt(6));
				noc.setCompany(rs.getString(7));
				noc.setDuration(rs.getString(8));
				noc.setEmail(rs.getString(9));
				noc.setPhone(rs.getString(10));
				noc.setLetter(rs.getString(11));
				noc.setStatus(rs.getString(12));
				list.add(noc);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	public NOC getNOCByID(int id) {

		NOC noc = null;
		try {
			String sql = "select * from noc where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				noc = new NOC();
				noc.setId(rs.getInt(1));
				noc.setStudentid(rs.getInt(2));
				noc.setFullName(rs.getString(3));
				noc.setRoll_no(rs.getString(4));
				noc.setBranch(rs.getString(5));
				noc.setCoordinator_id(rs.getInt(6));
				noc.setCompany(rs.getString(7));
				noc.setDuration(rs.getString(8));
				noc.setEmail(rs.getString(9));
				noc.setPhone(rs.getString(10));
				noc.setLetter(rs.getString(11));
				noc.setStatus(rs.getString(12));

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return noc;
	}
	public boolean updateCommentStatus(int id, int coordinatorid, String comment) {
		boolean f = false;
		try {
			String sql = "update noc set status=? where id=? and coordinator_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, comment);
			ps.setInt(2, id);
			ps.setInt(3, coordinatorid);
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
	
	public boolean updateCommentStatus(int id, String comment) {
		boolean f = false;
		try {
			String sql = "update noc set status=? where id=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, comment);
			ps.setInt(2, id);
			
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
	
	public List<NOC> getAllNoc() {
		List<NOC> list = new ArrayList<NOC>();
		NOC noc = null;
		try {
			String sql = "select * from noc  order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				noc = new NOC();
				noc.setId(rs.getInt(1));
				noc.setStudentid(rs.getInt(2));
				noc.setFullName(rs.getString(3));
				noc.setRoll_no(rs.getString(4));
				noc.setBranch(rs.getString(5));
				noc.setCoordinator_id(rs.getInt(6));
				noc.setCompany(rs.getString(7));
				noc.setDuration(rs.getString(8));
				noc.setEmail(rs.getString(9));
				noc.setPhone(rs.getString(10));
				noc.setLetter(rs.getString(11));
				noc.setStatus(rs.getString(12));
				list.add(noc);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
}