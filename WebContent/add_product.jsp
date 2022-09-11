<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="seller_header.jsp"%>
	<div class="layout_padding contact_section">
		<div class="container">
			<div class="contact_section_inner">
				<div class="contact_main">
					<%
               if(request.getAttribute("msg")!=null){
            	   out.println(request.getAttribute("msg"));
               }
            %>
					<form name="add_product" method="post" action="ProductController" enctype="multipart/form-data">
						<b>
							<h1 class="contact_text">Add Product</h1> <br>
							<div class="input_main">
							
								<div class="row">
								<input type="hidden" name="seller" value="<%=p.getId() %>">
								
								
									<div class="col-sm-6 col-lg-3 col-down-1">
										<div class="form-group">
											<select name=product_type>
												<option>------Select Product Type------</option>
												<option value="chair">Chair</option>
												<option value="table">table</option>
												<option value="sofa">sofa</option>


											</select> <br> <br> <input type="text" class="email-bt"
												placeholder="Product Name" name="product_name"> <br>
											<br> <input type="text" class="email-bt"
												placeholder="Product Price" name="product_price"> <br>
											<br> <input type="file" class="email-bt"
												placeholder="Product Image" name="product_image"> <br>
											<br>
											<textarea class="email-bt" placeholder="Product Description"
												row="5" column="5" name="product_desc"></textarea>
											<br> <br>

										</div>
									</div>
								</div>

								<div class="col-sm-13">
									<button type="submit" name="action" value="add product"
										class="send_bt">Add Product</button>
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