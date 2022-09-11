package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bean.contact;
import com.util.projectutil;

public class contactdao {
    
	public static void insertcontact(contact c)
	{
		try {
			Connection conn=projectutil.createconnection();
			String sql="insert into contact (name,phone,email,message) values(?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, c.getName());
			pst.setString(2, c.getPhone());
			pst.setString(3, c.getEmail());
			pst.setString(4, c.getMessage());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
}
