<%-- 
    Document   : login
    Created on : 8 May 2023, 14:11:19
    Author     : User
--%>

<%--<%@page import="com.mysql.cj.protocol.Message"%>--%>
<%@page import = "helper.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>StudyMate</title>
        <!--css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body style="background: #f1f8e9">
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp"><span class="fa fa-graduation-cap"></span>StudyMate</a>
            </div>
        </nav>
        <!--<main class="d-flex align-items-center primary-background banner-background" style="height: 70vh">-->
            <div class="container p-5 mt-3">
                <div class="row">
                    <div class="col-md-4 offset-md-4">

                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <br>
                                <p>Login here</p>
                            </div>

                            <div class="card-body">
                                <% Message m = (Message)session.getAttribute("msg");
                                if(m!= null){
                                %>
                                <div class="alert <%=m.getCssClass() %> text-center" role="alert">
                                    <%= m.getInfo() %>
                                    
                                </div>
                                    <%
                                        session.removeAttribute("msg");
                                        }
                                    %>
                                <form action="login" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" autocomplete="off">
                                
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" autocomplete="off">
                                    </div>

                                    <div class="container text-center p-3">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        <!--</main>-->
    </body>
</html>
