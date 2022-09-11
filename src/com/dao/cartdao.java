package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.cart;
import com.util.projectutil;

public class cartdao {
   
	public static void insertcart(cart c)
	{
		try {
			Connection conn=projectutil.createconnection();
			String sql="insert into cart(user,product,price,qty,total_price) values(?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, c.getUser());
			pst.setInt(2, c.getProduct());
			pst.setInt(3, c.getPrice());
			pst.setInt(4, c.getQty());
			pst.setInt(5, c.getTotal_price());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static List<cart> getcartbyuser(int pid)
	{
		List<cart> list=new ArrayList<cart>();
		String status="pending";
		try {
			Connection conn=projectutil.createconnection();
			String sql="select * from cart where user=? and status=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.setString(2, status);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				cart c=new cart();
				c.setId(rs.getInt("id"));
				c.setUser(rs.getInt("user"));
				c.setProduct(rs.getInt("product"));
				c.setPrice(rs.getInt("price"));
				c.setQty(rs.getInt("qty"));
				c.setTotal_price(rs.getInt("total_price"));
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static boolean checkcart(int pid,int proid)
	{
		boolean flag=false;
			try {
				Connection conn=projectutil.createconnection();
				String sql="select * from cart where user=? and product=?";
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
	public static void removefromcart(int pid,int proid)
	{
		try {
			Connection conn=projectutil.createconnection();
			String sql="delete from cart where user=? and product=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, pid);
			pst.setInt(2, proid);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static cart getcartbyid(int cid)
	{
		cart c=null;
		try {
			Connection conn=projectutil.createconnection();
			String sql="select * from cart where id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, cid);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
			   c=new cart();
				c.setId(rs.getInt("id"));
				c.setUser(rs.getInt("user"));
				c.setProduct(rs.getInt("product"));
				c.setPrice(rs.getInt("price"));
				c.setQty(rs.getInt("qty"));
				c.setTotal_price(rs.getInt("total_price"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	public static void updatecart(int cid,int qty,int total_price)
	{
		cart c=new cart();
		try {
			Connection conn=projectutil.createconnection();
			String sql="update cart set qty=?,total_price=? where id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, qty);
			pst.setInt(2, total_price);
			pst.setInt(3, cid);
			pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}
	public static void updatecartstatus(int cid)
	{
		String status="complete";
		cart c=new cart();
		try {
			Connection conn=projectutil.createconnection();
			String sql="update cart set status=? where id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, status);
			pst.setInt(2, cid);
			pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}
		
}
