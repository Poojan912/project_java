<%@page import="com.util.projectutil"%>
<%@ page import="java.sql.*" %>  
    <%  
    String name=request.getParameter("val");  
    if(name==null||name.trim().equals(""))
    {  
    	out.print("<p>Please Enter Email!</p>");  
    }
    else
    {  
    	try
    	{  
    		Connection conn=projectutil.createconnection();  
    		PreparedStatement ps=conn.prepareStatement("select * from project where email=?");  
    		ps.setString(1, name);
    		ResultSet rs=ps.executeQuery();  
      		if(rs.next()) 
      		{      
     			out.println("<p>Email Id Already Registered</p>");   
    		}
      		else
      		{  
    			out.println("<p>This Email Id Is Not Registered</p>"); 
    		}  
    		conn.close();  
    	}
    	catch(Exception e)
    	{
    		out.print(e);
    	}  
    }  
    %>  