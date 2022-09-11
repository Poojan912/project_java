<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>  
var request=new XMLHttpRequest();  
function checkemail()
{  
	var email=document.signup.email.value;  
	var url="AjaxSearch2.jsp?val="+email;  
  	try
  	{  
		request.onreadystatechange=function()
		{  
			if(request.readyState==4)
			{  
				var val=request.responseText;
				document.getElementById('email_error').innerHTML=val;
			}  
		}  
		request.open("GET",url,true);  
		request.send();  
	}
  	catch(e)
  	{
  		alert("Unable to connect to server");
  	}  
}  
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="layout_padding contact_section">
		<div class="container">
			<div class="contact_section_inner">
				<div class="contact_main">
					<form name="signup" method="post" action="ProjectController" >
						<h1 class="contact_text">Sign up</h1>
						<span id="email_error"></span>
						<div class="input_main">
							<div class="row">
								<div class="col-sm-6 col-lg-3 col-down-1">
									<div class="form-group">
									<br>
									<b>
									
									<input type="radio"  name="usertype" value="user">User
									<input type="radio"  name="usertype" value="seller">Seller
									<br><br>
									
										<input type="text" class="email-bt" placeholder="First Name"
											name="fname"> <br>
										<br> <input type="text" class="email-bt"
											placeholder="Last Name" name="lname"> <br>
										<br> <input type="text" class="email-bt"
											placeholder="Email" name="email" onblur="checkemail();"> <br>
										<br> <input type="text" class="email-bt"
											placeholder="Phone Number" name="mobile"> <br>
										<br> <input type="password" class="email-bt"
											placeholder="Password" name="password"> <br>
										<br> <input type="password" class="email-bt"
											placeholder=" Confirm Password" name="cpassword"> <br>
										<br>
										<textarea rows="5" cols="30" class="email-bt"
											placeholder="Address" name="address"></textarea>
											
											

									</div>
								</div>
							</div>

							<div class="col-sm-13">
								<button type="submit" name="action" value="signup"
									class="send_bt">signup</button>
							</div>

						</div>
				</div>
				Already signup?<a href="login.jsp">Click Here</a>
				</b>
				</form>
			</div>
		</div>
	</div>
	</div>

</body>
</html>