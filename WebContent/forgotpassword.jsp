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
					<form name="sendotp" method="post" action="ProjectController">
					<b>

						<h1 class="contact_text">Forgot password</h1>
						<br>

						<div class="input_main">
							<div class="row">


								<div class="col-sm-6 col-lg-3">
									<div class="form-group">
										<input type="text" class="email-bt" placeholder="Email"
											name="email"> 
									</div>
								</div>

							</div>
						</div>
						<br>


						<div class="col-sm-6">
							<button type="submit" name="action" value="sendotp" class="send_bt">SEND OTP</button>
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