<%@page import="com.util.projectutil"%>
<%@ page import="java.sql.*" %>  
    <%  
    String name=request.getParameter("val");  
    if(name==null||name.trim().equals(""))
    {  
    	out.print("<p>Please Enter Something To Search!</p>");  
    }
    else
    {  
    	try
    	{  
    		Connection conn=projectutil.createconnection();
    		PreparedStatement ps=conn.prepareStatement("select * from product where product_type like '"+name+"%'");  
    		ResultSet rs=ps.executeQuery();  
      		if(!rs.isBeforeFirst()) 
      		{      
     			out.println("<p>No Record Found!</p>");   
    		}
      		else
      		{  
    			out.print("<table border='1' cellpadding='2' width='100%'>");  
    			out.print("<tr><th>Id</th><th>Product Type</th><th>Product Name</th><th>Product Price</th><th>Product Desc</th></tr>");  
    			while(rs.next())
    			{  
    				out.print("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(6)+"</td></tr>");  
    			}  
    			out.print("</table>");  
    		}  
    		conn.close();  
    	}
    	catch(Exception e)
    	{
    		out.print(e);
    	}  
    }  
    %>  