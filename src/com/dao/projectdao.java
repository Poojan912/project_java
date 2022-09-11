package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bean.project;
import com.util.projectutil;

public class projectdao {

	public static void insertproject(project p) {
		try {
			Connection conn = projectutil.createconnection();
			String sql = "insert into project(fname,lname,email,mobile,password,cpassword,address,usertype) values(?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, p.getFname());
			pst.setString(2, p.getLname());
			pst.setString(3, p.getEmail());
			pst.setString(4, p.getMobile());
			pst.setString(5, p.getPassword());
			pst.setString(6, p.getCpassword());
			pst.setString(7, p.getAddress());
			pst.setString(8, p.getUsertype());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public static project checklogin(String email,String password) {
		project p=null;
		try {
	      Connection conn=projectutil.createconnection();
	      String sql="select * from project where email=? and password=?";
	      PreparedStatement pst=conn.prepareStatement(sql);
	      pst.setString(1, email);
	      pst.setString(2, password);
	      ResultSet rs=pst.executeQuery();
	      if(rs.next()) {
	    	  p=new project();
	    	  p.setId(rs.getInt("id"));
	    	  p.setFname(rs.getString("fname"));
	    	  p.setLname(rs.getString("lname"));
	    	  p.setEmail(rs.getString("email"));
	    	  p.setMobile(rs.getString("mobile"));
	    	  p.setPassword(rs.getString("password"));
	    	  p.setCpassword(rs.getString("cpassword"));
	    	  p.setAddress(rs.getString("address"));
	    	  p.setUsertype(rs.getString("usertype"));
	      }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}
	public static project getprojectById(int id ) {
		project p=null;
		try {
	      Connection conn=projectutil.createconnection();
	      String sql="select * from project where id=?";
	      PreparedStatement pst=conn.prepareStatement(sql);
	      pst.setInt(1, id);
	      ResultSet rs=pst.executeQuery();
	      if(rs.next()) {
	    	  p=new project();
	    	  p.setId(rs.getInt("id"));
	    	  p.setFname(rs.getString("fname"));
	    	  p.setLname(rs.getString("lname"));
	    	  p.setEmail(rs.getString("email"));
	    	  p.setMobile(rs.getString("mobile"));
	    	  p.setPassword(rs.getString("password"));
	    	  p.setCpassword(rs.getString("cpassword"));
	    	  p.setAddress(rs.getString("address"));
	      }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}
	public static void changepassword(int id,String password) {
		try {
			Connection conn=projectutil.createconnection();
			String sql="update project set password=?,cpassword=? where id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, password);
			pst.setString(2, password);
			pst.setInt(3, id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static boolean checkemail(String email)
	{
		boolean flag=false;
		try {
			Connection conn=projectutil.createconnection();
			String sql="select * from project where email=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, email);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	public static void updatepassword(String email,String password) {
		try {
			Connection conn=projectutil.createconnection();
			String sql="update project set password=?,cpassword=? where email=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, password);
			pst.setString(2, password);
			pst.setString(3, email);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

