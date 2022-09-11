<%@page import="com.dao.cartdao"%>
<%@page import="com.bean.cart"%>
<%@page import="com.dao.product_dao"%>
<%@page import="com.bean.product"%>
<%@page import="java.util.List"%>
<%

int pid=Integer.parseInt(request.getParameter("pid"));
int proid=Integer.parseInt(request.getParameter("proid"));
product pro=product_dao.getproductbyid(proid);
cart c=new cart();
c.setUser(pid);
c.setProduct(proid);
c.setPrice(pro.getProduct_price());
c.setQty(1);
c.setTotal_price(pro.getProduct_price());
cartdao.insertcart(c);
     
     List<cart> list=cartdao.getcartbyuser(pid);
     session.setAttribute("cart_count",list.size());
     response.sendRedirect("mycart.jsp");
%>