package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.contact;
import com.dao.contactdao;
import com.util.projectutil;

@WebServlet("/ContactController")
public class ContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action=request.getParameter("action");
    if(action.equalsIgnoreCase("contactus")) {
    	contact c=new contact();
    
    	c.setName(request.getParameter("name"));
    	c.setPhone(request.getParameter("phone"));
    	c.setEmail(request.getParameter("email"));
    	c.setMessage(request.getParameter("message"));
    	contactdao.insertcontact(c);
    	request.setAttribute("msg", "contact saved successfully");
    	request.getRequestDispatcher("contactus.jsp").forward(request, response);
    }
	}

}
