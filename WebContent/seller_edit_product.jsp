<%@page import="com.dao.product_dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ include file="seller_header.jsp"%>
<body>
<%
   product pro=product_dao.getproductbyid(Integer.parseInt(request.getParameter("proid")));
%>
	
	<div class="layout_padding contact_section">
		<div class="container">
			<div class="contact_section_inner">
				<div class="contact_main">
					<%
               if(request.getAttribute("msg")!=null){
            	   out.println(request.getAttribute("msg"));
               }
            %>
					<form name="edit_product" method="post" action="ProductController" enctype="multipart/form-data">
						<b>
							<h1 class="contact_text">EDIT PRODUCT</h1> <br>
							<div class="input_main">
							
								<div class="row">
								<input type="hidden" name="seller" value="<%=p.getId() %>">
								<input type="hidden" name="id" value="<%=pro.getId() %>">
								
								
								<div class="col-sm-6 col-lg-3">
								<div class="form-group">
								<img src="productimages/<%=pro.getProduct_image() %>">
								</div>
								</div>
								
									<div class="col-sm-6 col-lg-3 col-down-1">
										<div class="form-group">
										<input type="text" name="product_type" value="<%=pro.getProduct_type() %>" readonly="readonly">
											 <br> <br> <input type="text" class="email-bt"
												placeholder="Product Name" name="product_name" value="<%=pro.getProduct_name() %>"> <br>
											<br> <input type="text" class="email-bt"
												placeholder="Product Price" name="product_price" value="<%=pro.getProduct_price() %>"> <br>
											<br> <input type="file" class="email-bt"
												placeholder="Product Image" name="product_image"> <br>
											<br>
											<textarea class="email-bt" placeholder="Product Description"
												row="5" column="5" name="product_desc"><%=pro.getProduct_desc() %></textarea>
											<br> <br>
											<div class="col-sm-13">
									<button type="submit" name="action" value="edit product"
										class="send_bt">Update Product</button>
								</div>

										</div>
									</div>
								</div>

								`

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