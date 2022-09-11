<%
  session.removeAttribute("p");
session.removeAttribute("wishlist_count");
  session.invalidate();
  response.sendRedirect("login.jsp");





%>