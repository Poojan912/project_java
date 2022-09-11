<%@page import="com.bean.cart"%>
<%@page import="com.dao.cartdao"%>
<%@page import="com.bean.wishlist"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.wishlistdao"%>
<%
  int proid=Integer.parseInt(request.getParameter("proid"));
  int pid=Integer.parseInt(request.getParameter("pid"));

  cartdao.removefromcart(pid, proid);
  List<cart> list=cartdao.getcartbyuser(pid);
  session.setAttribute("cart_count",list.size());
  response.sendRedirect("mycart.jsp");



%>