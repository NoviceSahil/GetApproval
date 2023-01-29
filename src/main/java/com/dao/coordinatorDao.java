package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.coordinator;
import com.mysql.cj.protocol.Resultset;

public class coordinatorDao {

	private Connection conn;

	public coordinatorDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean registerCoordinator(coordinator c)
	{
		boolean f=false;
		
		try {
			
			String sql="insert into coordinator(fullName,department,deptId,password,phoneNo,email) values(?,?,?,?,?,?)";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, c.getFullName());
			ps.setString(2, c.getDepartment());
			ps.setString(3, c.getDeptId());
			ps.setString(4, c.getPassword());
			ps.setString(5, c.getPhoneNo());
			ps.setString(6, c.getEmail());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<coordinator> getAllcoordinator()
	{
		List<coordinator> list=new ArrayList<coordinator>();
		coordinator c=null;
		try {
			

			String sql = "select * from coordinator order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new coordinator();
				c.setId(rs.getInt(1));
				c.setFullName(rs.getString(2));
				c.setDepartment(rs.getString(3));
				c.setDeptId(rs.getString(4));
				c.setPassword(rs.getString(5));
				c.setPhoneNo(rs.getString(6));
				c.setEmail(rs.getString(7));
				
				list.add(c);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	
	public coordinator getCoordinatorById(int id)
	{
		coordinator c=null;
		try {
			
			String sql="select * from coordinator where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				c=new coordinator();
				c.setId(rs.getInt(1));
				c.setFullName(rs.getString(2));
				c.setDepartment(rs.getString(3));
				c.setDeptId(rs.getString(4));
				c.setPassword(rs.getString(5));
				c.setPhoneNo(rs.getString(6));
				c.setEmail(rs.getString(7));
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return c;
	}
	
	public boolean updateCoordinator(coordinator d) {
		boolean f = false;
		try {
			String sql = "update coordinator set fullName=?,department=?,deptId=?,password=?,phoneNo=?,email=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getDepartment());
			ps.setString(3, d.getDeptId());
			ps.setString(4, d.getPassword());
			ps.setString(5, d.getPhoneNo());
			ps.setString(6, d.getEmail());
			ps.setInt(7, d.getId());
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
	
	public boolean checkOldPassword(int coordinatorId, String oldPassword) {
		boolean f = false;
		try {
			String sql = "select * from coordinator where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, coordinatorId);
			ps.setString(2, oldPassword);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}

	public boolean changePassword(int coordinatorId, String newPassword) {
		boolean f = false;
		try {
			String sql = "update coordinator set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, coordinatorId);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
	}

	

	
	public boolean deletecoordinator(int id) {
		
		boolean f=false;
		try {
			
			String sql="delete from coordinator where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	
	public coordinator login(String email, String psw)
	{
		coordinator c=null;
		try {
			
			String sql="select * from coordinator where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, psw);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				c=new coordinator();
				c.setId(rs.getInt(1));
				c.setFullName(rs.getString(2));
				c.setDepartment(rs.getString(3));
				c.setDeptId(rs.getString(4));
				c.setPassword(rs.getString(5));
				c.setPhoneNo(rs.getString(6));
				c.setEmail(rs.getString(7));
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	
	public int countCoordinator() {
		int i=0;
		try {
			
			String sql="select * from coordinator";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				i++;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
		
	}
	
	public int countNOC() {
		int i=0;
		try {
			
			String sql="select * from noc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				i++;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
		
	}
	

	public int countNocByCoordinatorId(int cid) {
		int i = 0;
		try {
			String sql = "select * from noc where coordinator_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	public int countStudent() {
		int i = 0;
		try {
			String sql = "select * from student_details";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	public int countCourse() {
		int i = 0;
		try {
			String sql = "select * from courses";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	
	public int countcompany() {
		int i = 0;
		try {
			String sql = "select * from companylist";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	
	}

	

