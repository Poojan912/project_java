<%@page import="com.dao.product_dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
   <head>
     
   </head>
      <%@ include file="seller_header.jsp" %>
   <body>

     <%
       product_dao.deleteproduct(Integer.parseInt(request.getParameter("proid")));
     response.sendRedirect("seller_view_product.jsp");
     %>
      

   </body>
</html>