<%-- 
    Document   : index
    Created on : 26 Jan, 2023, 10:12:29 PM
    Author     : nihal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    if (request.getParameter("submit") != null) {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nihal", "root", "root");
        String id = request.getParameter("uid");
        String name = request.getParameter("name1");
        String email = request.getParameter("email1");
        String phone = request.getParameter("phone1");
        String password = request.getParameter("password1");
        PreparedStatement ps = conn.prepareStatement("insert into data01(id, name, email, phone, password) value(?, ?, ?, ?, ?)");
        ps.setString(1, id);
        ps.setString(2,name);
        ps.setString(3, email);
        ps.setString(4, phone);
        ps.setString(5, password);
%>
<script>
    alert("Your Record is Inserted");
</script>
<% } %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <title>JSP Page</title>
        <style>
            *{
                margin: 0%;
                padding: 0%;
                box-sizing: border-box;
            }
            .container{
                width: 100vw;
                height: 100vh;
            }
            h1{
                text-align: center;
                font-weight: bold;
            }
            .form{
                max-width: fit-content;
                box-shadow:  5px 5px 12px rgb(205, 203, 203);
            }
        </style>
    </head>
    <body>
        <div class="container d-flex justify-content-center align-items-center">
            <form action="" method="POST" class="form form-control">
                <h1 class="form-control">Registration Form</h1>
                <div class="mb-3 w-25">
                    <label for="exampleInputId1" class="form-label">Unique Id</label>
                    <input type="number" class="form-control" id="exampleInputId1" name="uid" />
                </div>
                <div class="mb-3">
                    <label for="exampleInputName1" class="form-label">Name</label>
                    <input type="text" class="form-control" id="exampleInputName1" name="name1" />
                </div>
                <div class="mb-3 ">
                    <label for="exampleInputEmail1" class="form-label">Email Address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email1" />
                    <div id="emailHelp" class="form-text">
                        We'll never share your email with anyone else.
                    </div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPhone1" class="form-label">Phone number</label>
                    <input type="tel" name="phone1" class="form-control" pattern="[0-9]" maxlength="10" id="exampleInputPhone1" />
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" name="password1" class="form-control" id="exampleInputPassword1" />
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" />
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                </div>
                <button type="submit" name="submit" class="btn btn-primary">Submit</button>
                <button type="reset" name="reset" class="btn btn-danger">Reset</button>
            </form>
        </div>
    </body>
</html>
