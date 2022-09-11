<%@page import="java.util.Random"%>
<%@page import="com.dao.cartdao"%>
<%@page import="com.bean.cart"%>
<%@page import="com.dao.wishlistdao"%>
<%@page import="com.bean.wishlist"%>
<%@page import="com.bean.product"%>
<%@page import="com.dao.product_dao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<%@ include file="header.jsp"%>
<body>



	<div class="page-content-product">
		<div class="main-product">
			<div class="container">
				<br> <br>

				<h2 align="center" style="color: white;">MY CART</h2>
				
				<br> <br>
				<%
                      List<cart> list=cartdao.getcartbyuser(p.getId());
             
                %>
				<%  
                   if(list.isEmpty())
                   {
               %>
				<h2 align="center" style="color: red;">THERE IS NO ITEM IN YOUR
					CART</h2>
				<%
              
                   }
                
                %>

				<div class="row clearfix">
					<%
					int net_price=0;
                    for(cart c:list)
                    {
                    	net_price=net_price+c.getTotal_price();
                    	product pro=product_dao.getproductbyid(c.getProduct());
                 %>
					<div class="col-lg-3 col-sm-6 col-md-3">
						
							<div class="box-img" style="width: 300px; height: 300px;">

								<img src="productimages/<%=pro.getProduct_image() %>" alt="" />
								<br>
								<br> 
								<form name="change_qty" method="post" action="CartController" style="color: white; ">
									<input type="hidden" name="cid" value="<%=c.getId() %>">
									Price       :       <input type="number" min="1" max="1000" value="<%=c.getPrice() %>" style="color: blue;"> <br>
									Quantity    :    <input type="number"  name="qty" min="1" max="10" value="<%=c.getQty() %>" style="color: blue;" onchange="this.form.submit();"> <br> 
									Total Price : <input type="number" min="1" max="1000" value="<%=c.getTotal_price() %>" style="color: blue;">
								
								</form>
							<br>
								<br>
								 <a href="user_product_details.jsp?proid=<%=pro.getId()%>"> <input
									type="button" name="action" value="More Details"
									class="btn btn-red">

								</a>	

							</div>
						</a>
					</div>
					<%
                    }
                  %>
				</div>
				
			</div>
			 
			<label style="margin-top: 150px; color: white;"><h2>NET PRICE TO PAY : <%=net_price %></h2></label>
			<input type="hidden" name="net_price" value="<%=net_price %>">
			
			
			 <%
 	           Random randomGenerator = new Random();
	           int randomInt = randomGenerator.nextInt(1000000);
             %>
			<form method="post" action="pgRedirect.jsp">
		<table border="1" style="color: red;">
			<tbody>
				<tr>
					<th>S.No</th>
					<th>Label</th>
					<th>Value</th>
				</tr>
				<tr>
					<td>1</td>
					<td><label>ORDER_ID::*</label></td>
					<td><input id="ORDER_ID" tabindex="1" maxlength="20" size="20"
						name="ORDER_ID" autocomplete="off"
						value="ORDS_<%= randomInt %>">
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td><label>CUSTID ::*</label></td>
					<td><input id="CUST_ID" tabindex="2" maxlength="30" size="12" name="CUST_ID" autocomplete="off" value="CUST001"></td>
				</tr>
				<tr>
					<td>3</td>
					<td><label>INDUSTRY_TYPE_ID ::*</label></td>
					<td><input id="INDUSTRY_TYPE_ID" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail"></td>
				</tr>
				<tr>
					<td>4</td>
					<td><label>Channel ::*</label></td>
					<td><input id="CHANNEL_ID" tabindex="4" maxlength="12"
						size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
					</td>
				</tr>
				<tr>
					<td>5</td>
					<td><label>txnAmount*</label></td>
					<td><input title="TXN_AMOUNT" tabindex="10"
						type="text" name="TXN_AMOUNT"
						value="<%=net_price%>">
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><input value="CheckOut" type="submit"	onclick="" class="btn btn-danger"></td>
				</tr>
			</tbody>
		</table>
		* - Mandatory Fields
	</form>
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