<%-- 
    Document   : profile
    Created on : 9 May 2023, 02:28:27
    Author     : User
--%>

<%@page import="helper.ConnectionProvider"%>
<%@page import="entities.User"%>
<%@page import="dao.userDao"%>
<%-- 
    Document   : login
    Created on : 8 May 2023, 14:11:19
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
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
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="dashboard.jsp">Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="addCourse.jsp">AddCourse</a>
                        </li>
                    </ul>
                </div>
                <div>
                    <form class="d-flex ms-auto order-5">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="generalProfile.jsp"><%= user.getUserName() %></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="index.jsp">Logout</a>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
        </nav>

        <div class="container p-5">

        </div>
    </body>
</html>

