package com.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bean.product;
import com.dao.product_dao;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 512, maxFileSize = 1024 * 1024 * 512, 
maxRequestSize = 1024 * 1024 * 512) // 512MB

@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String extractfilename(Part file) {
	    String cd = file.getHeader("content-disposition");
	    System.out.println(cd);
	    String[] items = cd.split(";");
	    for (String string : items) {
	        if (string.trim().startsWith("filename")) {
	            return string.substring(string.indexOf("=") + 2, string.length()-1);
	        }
	    }
	    return "";
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("add product"))
		{
			String savePath = "C:\\Users\\PUJAN\\eclipse-workspace\\project\\WebContent\\productimages";   
			File fileSaveDir=new File(savePath);
	        if(!fileSaveDir.exists()){
	            fileSaveDir.mkdir();
	        }
	        Part file1 = request.getPart("product_image");
		 	String fileName=extractfilename(file1);
		    file1.write(savePath + File.separator + fileName);
		    String filePath= savePath + File.separator + fileName ;
		    
		    String savePath2 = "C:\\Users\\PUJAN\\eclipse-workspace\\project\\WebContent\\productimages";
	        File imgSaveDir=new File(savePath2);
	        if(!imgSaveDir.exists()){
	            imgSaveDir.mkdir();
	        }
	        product pro=new product();
	        pro.setProduct_type(request.getParameter("product_type"));
	        pro.setProduct_name(request.getParameter("product_name"));
	        pro.setProduct_price(Integer.parseInt(request.getParameter("product_price")));
	        pro.setProduct_image(fileName);
	        pro.setProduct_desc(request.getParameter("product_desc"));
	        pro.setSeller(Integer.parseInt(request.getParameter("seller")));
	        product_dao.insertproduct(pro);
	        
	        response.sendRedirect("add_product.jsp");
	}
		else if(action.equalsIgnoreCase("edit product"))
		{
//			String fileName="";
//		String savePath = "C:\\Users\\PUJAN\\eclipse-workspace\\project\\WebContent\\productimages";   
//		File fileSaveDir=new File(savePath);
//        if(!fileSaveDir.exists()){
//            fileSaveDir.mkdir();
//        }
//        try {
//               Part file1 = request.getPart("product_image");
//	 	       String fileNameString=extractfilename(file1);
//	           file1.write(savePath + File.separator + fileName);
//	           String filePath= savePath + File.separator + fileName ;
//        }
//        catch(Exception e){
//        	e.printStackTrace();
//        }
			 product pro=new product();
			 pro.setId(Integer.parseInt(request.getParameter("id")));
		        pro.setProduct_type(request.getParameter("product_type"));
		        pro.setProduct_name(request.getParameter("product_name"));
		        pro.setProduct_price(Integer.parseInt(request.getParameter("product_price")));
//		        if(fileName.equals(""))
//		        {
//		        	pro.setProduct_image(fileName);
//		        }
		        pro.setProduct_desc(request.getParameter("product_desc"));
		       // pro.setSeller(Integer.parseInt(request.getParameter("seller")));
		        product_dao.editproduct(pro);
		        response.sendRedirect("seller_view_product.jsp");
			
		}
		
	}
	

}
