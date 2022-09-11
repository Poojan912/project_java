<%@page import="com.dao.cartdao"%>
<%@page import="com.dao.wishlistdao"%>
<%@page import="com.bean.product"%>
<%@page import="com.dao.product_dao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
	<%@ include file="header.jsp"%>


	<div class="page-content-product">
		<div class="main-product">
			<div class="container">
				<br>
				<br>

				<h2 align="center" style="color: white;">VIEW PRODUCT</h2>

				<br>
				<br>
				<%
				   int proid= Integer.parseInt(request.getParameter("proid"));
				   int pid=p.getId(); 
                   product pro=product_dao.getproductbyid(Integer.parseInt(request.getParameter("proid")));
                   boolean flag=wishlistdao.checkwishlist(pid, proid);
                   boolean flag1=cartdao.checkcart(pid, proid);
               %>

				<div class="row clearfix">
					<div class="col-lg-3 col-sm-6 col-md-3">
						
						 
							<div class="box-img" >
							<div class="bts bts-red">

								<img src="productimages/<%=pro.getProduct_image()  %>"  alt="" />
								  <br><br>
								<p style="color: red;">Product Name : <%=pro.getProduct_name() %></p>
								<br>
								<p style="color: red;">Product Price : <%=pro.getProduct_price() %></p>
								<br>
								<p style="color: red;">Product Type : <%=pro.getProduct_type() %></p>
								<br>
								<p style="color: red;">Product Description : <%=pro.getProduct_desc() %></p>
								<br>
								<%
								   	if(flag==true)
								   	{
								 %>
								    <a href="remove_from_wishlist.jsp?proid=<%=pro.getId()%>&pid=<%=p.getId()%>">
								    <input type="button" name="action" value="Remove From Wishlist" class="btn btn-red">
							     	</a> 
								 
								 <%   		
								   	}
								   	else
								   	{
								 %>
								 <a href="add_to_wishlist.jsp?proid=<%=pro.getId()%>&pid=<%=p.getId()%>">
								  <input type="button" name="action" value="Add To Wishlist" class="btn btn-red">
								</a>
								 
								 <%   		
								   	}
								%>
								<%
								   	if(flag1==true)
								   	{
								 %>
								    <br><br>
								    <a href="remove_from_cart.jsp?proid=<%=pro.getId()%>&pid=<%=p.getId()%>">
								    <input type="button" name="action" value="Remove From Cart" class="btn btn-red">
							     	</a> 
								 
								 <%   		
								   	}
								   	else
								   	{
								 %>
								 <br><br>
								 <a href="add_to_cart.jsp?proid=<%=pro.getId()%>&pid=<%=p.getId()%>">
								  <input type="button" name="action" value="Add To Cart" class="btn btn-red">
								</a>
								 
								 <%   		
								   	}
								%>
								
								

								
								</div>
                             </div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<div class="main-footer">
			<div class="container">
				<div class="row">
					<div class="footer-top clearfix">
						<div class="col-md-2 col-sm-6">
							<h2>Start a free account today</h2>
						</div>
						<div class="col-md-6 col-sm-6">
							<div class="form-box">
								<input type="text" placeholder="Enter yopur e-mail" />
								<button>Continue</button>
							</div>
						</div>
						<div class="col-md-4 col-sm-12">
							<div class="help-box-f">
								<h4>Question? Call us on 12 34 56 78 for help</h4>
								<p>Easy setup - no payment fees - up to 100 products for
									free</p>
							</div>
						</div>
					</div>
					<div class="footer-link-box clearfix">
						<div class="col-md-6 col-sm-6">
							<div class="left-f-box">
								<div class="col-sm-4">
									<h2>SELL ON chamb</h2>
									<ul>
										<li><a href="#">Create account</a></li>
										<li><a href="howitworks.jsp">How it works suppliers</a></li>
										<li><a href="pricing.jsp">Pricing</a></li>
										<li><a href="#">FAQ for Suppliers</a></li>
									</ul>
								</div>
								<div class="col-sm-4">
									<h2>BUY ON chamb</h2>
									<ul>
										<li><a href="#">Create account</a></li>
										<li><a href="#">How it works buyers</a></li>
										<li><a href="#">Categories</a></li>
										<li><a href="#">FAQ for buyers</a></li>
									</ul>
								</div>
								<div class="col-sm-4">
									<h2>COMPANY</h2>
									<ul>
										<li><a href="about-us.jsp">About chamb</a></li>
										<li><a href="#">Contact us</a></li>
										<li><a href="#">Press</a></li>
										<li><a href="#">Careers</a></li>
										<li><a href="#">Terms of use</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-sm-6">
							<div class="right-f-box">
								<h2>INDUSTRIES</h2>
								<ul class="col-sm-4">
									<li><a href="#">Textiles</a></li>
									<li><a href="#">Furniture</a></li>
									<li><a href="#">Leather</a></li>
									<li><a href="#">Agriculture</a></li>
									<li><a href="#">Food & drinks</a></li>
								</ul>
								<ul class="col-sm-4">
									<li><a href="#">Office</a></li>
									<li><a href="#">Decoratives</a></li>
									<li><a href="#">Electronics</a></li>
									<li><a href="#">Machines</a></li>
									<li><a href="#">Building</a></li>
								</ul>
								<ul class="col-sm-4">
									<li><a href="#">Cosmetics</a></li>
									<li><a href="#">Health</a></li>
									<li><a href="#">Jewelry</a></li>
									<li><a href="#">See all here</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<p>
							<img width="90" src="images/logo.png" alt="#"
								style="margin-top: -5px;" /> All Rights Reserved. Company Name
							© 2018
						</p>
					</div>
					<div class="col-md-4">
						<ul class="list-inline socials">
							<li><a href=""> <i class="fa fa-facebook"
									aria-hidden="true"></i>
							</a></li>
							<li><a href=""> <i class="fa fa-twitter"
									aria-hidden="true"></i>
							</a></li>
							<li><a href=""> <i class="fa fa-instagram"
									aria-hidden="true"></i>
							</a></li>
							<li><a href="#"> <i class="fa fa-linkedin"
									aria-hidden="true"></i>
							</a></li>
						</ul>
						<ul class="right-flag">
							<li><a href="#"><img src="images/flag.png" alt="" /> <span>Change</span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--main js-->
	<script src="js/jquery-1.12.4.min.js"></script>
	<!--bootstrap js-->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/wow.min.js"></script>
	<!--custom js-->
	<script src="js/custom.js"></script>
</body>
</html>