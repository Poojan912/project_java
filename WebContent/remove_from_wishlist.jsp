<%@page import="com.bean.wishlist"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.wishlistdao"%>
<%
  int proid=Integer.parseInt(request.getParameter("proid"));
  int pid=Integer.parseInt(request.getParameter("pid"));

  wishlistdao.removefromwishlist(pid, proid);
  List<wishlist> list=wishlistdao.getwishlistbyuser(pid);
  session.setAttribute("wishlist_count",list.size());
  response.sendRedirect("mywishlist.jsp");



%>