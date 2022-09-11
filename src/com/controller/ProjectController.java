package com.controller;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.project;
import com.bean.wishlist;
import com.dao.projectdao;
import com.dao.wishlistdao;
import com.service.Services;

@WebServlet("/ProjectController")
public class ProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("signup")) {

			project p = new project();
			p.setFname(request.getParameter("fname"));
			p.setLname(request.getParameter("lname"));
			p.setEmail(request.getParameter("email"));
			p.setMobile(request.getParameter("mobile"));
			p.setPassword(request.getParameter("password"));
			p.setCpassword(request.getParameter("cpassword"));
			p.setAddress(request.getParameter("address"));
			p.setUsertype(request.getParameter("usertype"));
			projectdao.insertproject(p);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} 
		else if (action.equalsIgnoreCase("login")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			project p = projectdao.checklogin(email, password);
			if (p == null) {
				request.setAttribute("msg", "Email or Password is incorrect");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			} 
			else if(p.getUsertype().equalsIgnoreCase("user"))
			{
				
				HttpSession session=request.getSession();
				List<wishlist> list=wishlistdao.getwishlistbyuser(p.getId());
				session.setAttribute("wishlist_count", list.size());
				session.setAttribute("p", p);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			else if(p.getUsertype().equalsIgnoreCase("seller"))
			{
				HttpSession session=request.getSession();
				session.setAttribute("p", p);
				request.getRequestDispatcher("seller_index.jsp").forward(request, response);
			}
			
		}
		else if (action.equalsIgnoreCase("change password")) {
			int id=Integer.parseInt(request.getParameter("id"));
			project p=projectdao.getprojectById(id);
			String old_password=request.getParameter("old_password");
			String new_password=request.getParameter("new_password");
			String cnew_password=request.getParameter("cnew_password");
			
			if(p.getPassword().equals(old_password)) 
			{
			   if(new_password.equals(cnew_password)) {
				   projectdao.changepassword(id, new_password);
				   request.getRequestDispatcher("logout.jsp").forward(request, response);
			   }
			   else
			   {
				   request.setAttribute("msg", "New Password And Confirm New Password Dose Not Match");
				   request.getRequestDispatcher("change_password.jsp").forward(request, response);
			   }
			   
			}
			else
			{
				   request.setAttribute("msg", "Old Password Is Incorrect");
				   request.getRequestDispatcher("change_password.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("sendotp"))
		{
			String email=request.getParameter("email");
			boolean flag=projectdao.checkemail(email);
			if(flag==true) 
			{
				
					Random t = new Random();
				    int minRange = 1000, maxRange= 9999;
			        int value = t.nextInt(maxRange - minRange) + minRange;
			        Services.sendMail(email, value);
					
					request.setAttribute("otp", value);
					request.setAttribute("email", email);
					request.getRequestDispatcher("otp.jsp").forward(request, response);
				
			}
			else
			{
				request.setAttribute("msg", "Email Does Not Exists");
				request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
			}
			
			
		}
		else if(action.equalsIgnoreCase("verifyotp"))
		{
			String email=request.getParameter("email");
			String otp1=request.getParameter("otp1");
			String otp2=request.getParameter("otp2");
			System.out.println(otp1);
			System.out.println(otp2);
			
			if(otp1.equals(otp2))
			{
				request.setAttribute("email", email);
				request.getRequestDispatcher("new_password.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("msg", "invalid otp");
				request.setAttribute("otp", otp1);
				request.setAttribute("email", email);
				request.getRequestDispatcher("otp.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("update password"))
		{
			String email=request.getParameter("email");
			String npassword=request.getParameter("npassword");
			String cnpassword=request.getParameter("cnpassword");
			if(npassword.equals(cnpassword))
			{
				projectdao.updatepassword(email, npassword);
				
			}
			else
			{
				request.setAttribute("msg", "New Password & Confirm New Password Does Not Match  ");
				request.getRequestDispatcher("new_password");
			}
		}
		

	}

}
