<%-- 
    Document   : delete
    Created on : 26 Jan, 2023, 3:11:52 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

        <%
       
         String id = request.getParameter("sid");  
        
        
        Connection con = null;
        PreparedStatement ps;
        ResultSet rs;
        
       Class.forName("com.mysql.jdbc.Driver");
     
        con =DriverManager.getConnection("jdbc:mysql://localhost:3306/nihal","root","root");
        
        String sql1= "DELETE FROM record WHERE id="+id;
//        ps = con.prepareStatement("delete from record where id=?");
        
        ps=con.prepareStatement(sql1);
       
        ps.executeUpdate();
        %>
        <script>
            alert("Record deleted successfully");
        </script> 
       

        