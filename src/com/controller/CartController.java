package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.cart;
import com.dao.cartdao;

@WebServlet("/CartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("CartController Called");
       int cid=Integer.parseInt(request.getParameter("cid"));
       int qty=Integer.parseInt(request.getParameter("qty"));
       
       System.out.println("CID : "+cid);
       System.out.println("QTY : "+qty);
       cart c=cartdao.getcartbyid(cid);
       int total_price=qty*c.getPrice();
       cartdao.updatecart(cid, qty, total_price);
       response.sendRedirect("mycart.jsp");
	}

}
