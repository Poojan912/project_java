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
	var email=document.login.email.value;  
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
					<%
				  if(request.getAttribute("msg")!=null){
					  out.println(request.getAttribute("msg"));
				  }
				
				%>
					<form name="login" method="post" action="ProjectController">
					
					<b>

						<h1 class="contact_text">login</h1>
						
						<span id="email_error"></span>

						<div class="input_main">
							<div class="row">


								<div class="col-sm-6 col-lg-3">
									<div class="form-group">
										<input type="text" class="email-bt" placeholder="Email"
											name="email" onblur="checkemail();"> 
											
											<br> <br> <input
											type="password" class="email-bt" placeholder="Password"
											name="password"> <br> <br>
									</div>
								</div>

							</div>
						</div>


						<div class="col-sm-6">
							<button type="submit" name="action" value="login" class="send_bt">Login</button>
						</div>
						Still Not Signup?<a href="signup.jsp">Click Here</a>
				</div>
				<br> <a href="forgotpassword.jsp">Forgot Password?</a>
			</div>
			</b>

			</form>
		</div>
	</div>
	</div>
	</div>


</body>
</html>