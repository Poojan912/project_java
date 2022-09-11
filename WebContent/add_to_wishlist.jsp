<%@page import="java.util.List"%>
<%@page import="com.bean.wishlist"%>
<%@page import="com.dao.wishlistdao"%>
<%
     int pid=Integer.parseInt(request.getParameter("pid"));
     int proid=Integer.parseInt(request.getParameter("proid"));
     wishlist w=new wishlist();
     w.setPid(pid);
     w.setProid(proid);
     wishlistdao.insertwishlist(w);
     List<wishlist> list=wishlistdao.getwishlistbyuser(pid);
     session.setAttribute("wishlist_count",list.size());
     response.sendRedirect("mywishlist.jsp");



%>