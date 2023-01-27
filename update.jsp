<%-- 
    Document   : update
    Created on : 26 Jan, 2023, 2:43:00 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>

<%
    if (request.getParameter("submit") != null) {
        String id = request.getParameter("sid");
        String name = request.getParameter("sname");
        String course = request.getParameter("scourse");
        String fee = request.getParameter("sfee");

        Connection con = null;
        PreparedStatement ps;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");

        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/NIHAL", "root", "root");
        ps = con.prepareStatement("update record set studentname=?,course=?,fee=? where id=?");

        ps.setString(1, name);
        ps.setString(2, course);
        ps.setString(3, fee);
        ps.setString(4, id);
        ps.executeUpdate();

%>
<script>
    alert("Record updated successfully");
</script> 
<%            }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Student Registration System with JSP</h1><br>
        <div class="row">
            <div class="col-sm-4">
                <form method="post" action="#">
                    <div align="left">
                        <label class="form-label"> id </label>
                        <input type="text" class="form-control" placeholder="Id"name="sid" id="sid" required>
                    </div>
                    <div align="left">
                        <label class="form-label"> Student Name </label>
                        <input type="text" class="form-control" placeholder="Student Name" name="sname" id="sname" required>
                    </div>
                    <div align="left">
                        <label class="form-label"> Course </label>
                        <input type="text" class="form-control" placeholder="Course" name="scourse" id="scourse" required>
                    </div>
                    <div align="left">
                        <label class="form-label"> Fee </label>
                        <input type="text" class="form-control" placeholder="Fee" name="sfee" id="sfee" required>
                    </div>
                    <div align="right">
                        <input type="Submit"  id="Submit" value="Submit" name="submit" class="btn btn-info">
                        <input type="reset"  id="reset" value="reset" name="reset" class="btn btn-warning">
                    </div>
                </form>
            </div>
            <div class="tbl-Student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                <thead>
                    <tr>
                        <th>Student Name</th>
                        <th>Course</th>
                        <th>Fee</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    <%--  <% Connection con;
        PreparedStatement ps;
        ResultSet rs;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con =DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","root");
        String query ="select * from records";
        Statement st = con.createStatement();
        rs = st.executeQuery();
        while(rs.next())
        {
        System.out.println(rs.getString(1)+"...."+rs.getString(2)+"...."+rs.getInt(3));
        }
        %> --%>
                    <tr>
                        <%--  <td><%= rs.getString("sname") %></td> --%>
                    </tr>
                </thead>
            </div>
    </body>
</html>
