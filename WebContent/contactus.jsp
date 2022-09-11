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
					<form name="contactus" method="post" action="ContactController">
					<b>
						<h1 class="contact_text">Contact Us</h1>
				
						<div class="input_main">
							<div class="row">
								<div class="col-sm-6 col-lg-3 col-down-1">
									<div class="form-group">
										<input type="text" class="email-bt" placeholder="Name"
											name="name"> <br>
										<br> <input type="text" class="email-bt"
											placeholder="Phone Number" name="phone"> <br>
										<br> <input type="text" class="email-bt"
											placeholder="Email" name="email"> <br>
										<br> <input type="text" class="email-bt"
											placeholder="Message" name="message"> <br>
										<br>

									</div>
								</div>
							</div>

							<div class="col-sm-13">
								<button type="submit" name="action" value="contactus"
									class="send_bt">Send</button>
							</div>

						</div>
						</b>
					

				</div>
				</form>
			</div>
		</div>
	</div>
	</div>

</body>
</html>