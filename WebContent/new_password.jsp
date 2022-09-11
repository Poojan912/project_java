<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="layout_padding contact_section">
		<div class="container">
			<div class="contact_section_inner">
				<div class="contact_main">
					<%
				  if(request.getAttribute("msg")!=null){
					  out.println(request.getAttribute("msg"));
				  }
				
				%>
					<form name="login" method="post" action="ProjectController">
					<b>

						<h1 class="contact_text">New Password</h1>
						<br><br>

						<div class="input_main">
							<div class="row">


								<div class="col-sm-6 col-lg-3">
								<input type="hidden" name="email" value="<%=request.getAttribute("email") %>">
									<div class="form-group">
										<input type="password" class="email-bt" placeholder="New Password"
											name="npassword"> <br> <br> 
											<input type="password" class="email-bt" placeholder="Confirm New Password"
											name="cnpassword"> <br> <br>
									</div>
								</div>

							</div>
						</div>


						<div class="col-sm-6">
							<button type="submit" name="action" value="update password" class="send_bt">Update Password</button>
						</div>
				</div>
			</div>
			</b>

			</form>
		</div>
	</div>
	</div>
	</div>


</body>
</html>