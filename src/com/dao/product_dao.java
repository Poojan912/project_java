package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.product;
import com.util.projectutil;

public class product_dao {
   
	public static void insertproduct(product pro)
	{
		try {
			Connection conn=projectutil.createconnection();
			String sql="insert into product(product_type,product_name,product_price,product_image,product_desc,seller) values(?,?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, pro.getProduct_type());
			pst.setString(2, pro.getProduct_name());
			pst.setInt(3, pro.getProduct_price());
			pst.setString(4, pro.getProduct_image());
			pst.setString(5, pro.getProduct_desc());
			pst.setInt(6, pro.getSeller());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static List<product> getproductbyseller(int id)
	{
		List<product> list=new ArrayList<product>();
		try {
			Connection conn=projectutil.createconnection();
			String sql="select * from product where seller=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1,id);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				product pro=new product();
				pro.setId(rs.getInt("id"));
				pro.setProduct_type(rs.getString("product_type"));
				pro.setProduct_name(rs.getString("product_name"));
				pro.setProduct_price(rs.getInt("product_price"));
				pro.setProduct_image(rs.getString("product_image"));
				pro.setProduct_desc(rs.getString("product_desc"));
				list.add(pro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public static product getproductbyid(int id)
	{
		product pro=null;
		try {
			Connection conn=projectutil.createconnection();
			String sql="select * from product where id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1,id);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
			 pro=new product();
				pro.setId(rs.getInt("id"));
				pro.setProduct_type(rs.getString("product_type"));
				pro.setProduct_name(rs.getString("product_name"));
				pro.setProduct_price(rs.getInt("product_price"));
				pro.setProduct_image(rs.getString("product_image"));
				pro.setProduct_desc(rs.getString("product_desc"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pro;
	}
	public static void editproduct(product pro)
	{
		try {
			Connection conn=projectutil.createconnection();
			String sql="update product set product_type=?,product_name=?,product_price=?,product_desc=? where id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, pro.getProduct_type());
			pst.setString(2, pro.getProduct_name());
			pst.setInt(3, pro.getProduct_price());
			pst.setString(4, pro.getProduct_desc());
			pst.setInt(5, pro.getId());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void deleteproduct(int id)
	{
		try {
			Connection conn=projectutil.createconnection();
			String sql="delete from product where id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static List<product> getallproduct()
	{
		List<product> list=new ArrayList<product>();
		try {
			Connection conn=projectutil.createconnection();
			String sql="select * from product";
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				product pro=new product();
				pro.setId(rs.getInt("id"));
				pro.setProduct_type(rs.getString("product_type"));
				pro.setProduct_name(rs.getString("product_name"));
				pro.setProduct_price(rs.getInt("product_price"));
				pro.setProduct_image(rs.getString("product_image"));
				pro.setProduct_desc(rs.getString("product_desc"));
				list.add(pro);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
 }
