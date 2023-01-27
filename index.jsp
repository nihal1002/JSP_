<!-- @format -->

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>
<% if (request.getParameter("submit") != null) {
        String id = request.getParameter("sid");
        String name = request.getParameter("sname");
        String course = request.getParameter("scourse");
        String fee = request.getParameter("sfee");
        Connection con = null;
        PreparedStatement ps;
        ResultSet rs;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nihal", "root", "root");
        ps = con.prepareStatement("insert into record(id ,studentname,course,fee)values(?,?,?,?)");
        ps.setString(1, id);
        ps.setString(2, name);
        ps.setString(3, course);
        ps.setString(4, fee);
        ps.executeUpdate(); %>
<script>
    alert("Record inserted successfully");
</script>
<% } %>
<!--                   <a href="update.jsp">Edit</a>-->
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Login Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
              crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body{
                width: 100%;
                height: 100%;
            }
            .table{
                width: 90%;
                margin: 1rem;
            }
        </style>
    </head>

    <body class="container">
        <h1>Student Registration System with JSP</h1>
        <br>
        <div class="row">
            <div class="col-4">
                <form method="post" action="#" class="form form-control">
                    <div align="left">
                        <label class="form-label"> id </label>
                        <input type="text" class="form-control" placeholder="Id" name="sid" id="sid"
                               required />
                    </div>
                    <div align="left">
                        <label class="form-label"> Student Name </label>
                        <input type="text" class="form-control" placeholder="Student Name" name="sname"
                               id="sname" required />
                    </div>
                    <div align="left">
                        <label class="form-label"> Course </label>
                        <input type="text" class="form-control" placeholder="Course" name="scourse"
                               id="scourse" required />
                    </div>
                    <div align="left">
                        <label class="form-label"> Fee </label>
                        <input type="text" class="form-control" placeholder="Fee" name="sfee" id="sfee"
                               required />
                    </div>
                    <br>
                    <div align="right">
                        <input type="Submit" id="Submit" value="Submit" name="submit"
                               class="btn btn-info" />
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning" />
                    </div>
                </form>
            </div>
            <table id="tb" class="table table-responsive table-bordered">
                <thead>
                    <tr>
                        <th>Student Name</th>
                        <th>Course</th>
                        <th>Fee</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    <% Connection con;
                        PreparedStatement ps;
                        ResultSet rs;
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nihal", "root", "root"
                        );
                        String query = "select * from record";
                        Statement st = con.createStatement();
                        rs = st.executeQuery(query);
                        while (rs.next()) {
                            String id = rs.getString("id");
                            //System.out.println(rs.getString(1) + "...." + rs.getString(2) + "...." + rs.getInt(3));%>
                    <tr>
                        <td>
                            <%= rs.getString("studentname")%>
                        </td>
                        <td>
                            <%= rs.getString("course")%>
                        </td>
                        <td>
                            <%= rs.getString("fee")%>
                        </td>
                        <td><a href="update.jsp?" id="<%=id%>">Edit</a></td>
                        <td><a href="delete.jsp?" id="<%=id%>">delete</a></td>
                        <% }%>
                    </tr>
                </thead>
            </table>
        </div>
    </body>
</html>
