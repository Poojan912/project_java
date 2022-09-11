package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.wishlist;
import com.util.projectutil;

public class wishlistdao {
	public static void insertwishlist(wishlist w)
	{
		try {
			Connection conn=projectutil.createconnection();
			String sql="insert into wishlist(user,product) values(?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, w.getPid());
			pst.setInt(2, w.getProid());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static List<wishlist> getwishlistbyuser(int pid)
	{
		List<wishlist> list=new ArrayList<wishlist>();
		try {
			Connection conn=projectutil.createconnection();
			String sql="select * from wishlist where user=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, pid);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				wishlist w=new wishlist();
				w.setId(rs.getInt("id"));
				w.setPid(rs.getInt("user"));
				w.setProid(rs.getInt("product"));
				list.add(w);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static boolean checkwishlist(int pid,int proid)
	{
		boolean flag=false;
			try {
				Connection conn=projectutil.createconnection();
				String sql="select * from wishlist where user=? and product=?";
				PreparedStatement pst=conn.prepareStatement(sql);
				pst.setInt(1, pid);
				pst.setInt(2, proid);
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
	public static void removefromwishlist(int pid,int proid)
	{
		try {
			Connection conn=projectutil.createconnection();
			String sql="delete from wishlist where user=? and product=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.setInt(2, proid);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	

}
