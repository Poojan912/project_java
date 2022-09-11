<%@page import="com.bean.project"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<title>Chamb - Responsive E-commerce HTML5 Template</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--enable mobile device-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--fontawesome css-->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!--bootstrap css-->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!--animate css-->
<link rel="stylesheet" href="css/animate-wow.css">
<!--main css-->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap-select.min.css">
<link rel="stylesheet" href="css/slick.min.css">
<!--responsive css-->
<link rel="stylesheet" href="css/responsive.css">
</head>
<body>
	<header id="header" class="top-head">
		<!-- Static navbar -->
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-4 col-sm-12 left-rs">
						<div class="navbar-header">
							<button type="button" id="top-menu"
								class="navbar-toggle collapsed" data-toggle="collapse"
								data-target="#navbar" aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a href="index.jsp" class="navbar-brand"><img
								src="images/logo.png" alt="" /></a>
						</div>
						<div class="navbar-form navbar-left web-sh">
							<div class="form">
							<div class="form-control">
								<li><a href="user_search_product.jsp">Search For Product</a></li>
									</div>
							</div>
						</div>
					</div>

					<%
					project p=null;
					int wishlist_count=0;
											
					try{
						if(session.getAttribute("p")!=null){
	                    	 p=(project)session.getAttribute("p");
	                     }
                    wishlist_count=Integer.parseInt(session.getAttribute("wishlist_count").toString());  					
                     
                     
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
                     %>
					<div class="col-md-8 col-sm-12">
						<div class="right-nav">
							<%
                          if(p!=null)
                          {
                       %>
							<div class="login-sr">
								<div class="login-signup">
									<div class="logout">
										<div class="change-password">
											<ul>


												<li><a class="custom-r" href="change_password.jsp">Change
														Password </a></li>
												<li><a class="custom-b" href="logout.jsp">Logout</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>


							<% 	  
                          }
                          else
                          {
                       %>
							<div class="login-sr">
								<div class="login-signup">
									<ul>
										<li><a href="login.jsp">Login</a></li>
										<li><a class="custom-b" href="signup.jsp">Sign up</a></li>
									</ul>
								</div>
							</div>

							<% 	  
                          }
                     
                     
                     %>


							<div class="help-r hidden-xs">
								<div class="help-box">
									<ul>
										<li><a data-toggle="modal" data-target="#myModal"
											href="#"> <span>Change</span> <img src="images/flag.png"
												alt="" />
										</a></li>
										
									</ul>
								</div>
							</div>
							<div class="nav-b hidden-xs">
								<div class="nav-box">
									<ul>
										<li><a href="user_view_product.jsp">Product</a></li>
										<li><a href="about-us.jsp">about us</a></li>
										<li><a href="contactus.jsp">Contact Us</a></li>
										<%if(p!=null){ %>
										<li><a href="mywishlist.jsp">My Wishlist
										<%
										  if(wishlist_count !=0)
										  {
											  out.print(wishlist_count);
											  
										  }
 											  
										
										%>
										
										</a></li>
									    <li><a href="mycart.jsp">Cart</a></li>
									    <%} %>
                                   </ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/.container-fluid -->
		</nav>
	</header>

</body>
</html>