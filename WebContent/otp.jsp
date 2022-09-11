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

						<h1 class="contact_text">Enter Otp</h1>
						<br><br>

						<div class="input_main">
							<div class="row">
							<input type="hidden" name="otp1" value="<%=request.getAttribute("otp") %>">
							<input type="hidden" name="email" value="<%=request.getAttribute("email") %>">


								<div class="col-sm-6 col-lg-3">
									<div class="form-group">
											 <br> <br> <input
											type="text" class="email-bt" placeholder="Enter Otp"
											name="otp2"> <br> <br>
									</div>
								</div>

							</div>
						</div>


						<div class="col-sm-6">
							<button type="submit" name="action" value="verifyotp" class="send_bt">Send</button>
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