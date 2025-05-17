<%-- 
    Document   : profile
    Created on : 9 May 2023, 02:28:27
    Author     : User
--%>

<%@page import="entities.User"%>
<%-- 
    Document   : login
    Created on : 8 May 2023, 14:11:19
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%System.out.println(user.getEmail());%>
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
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div>
                    <form class="d-flex ms-auto order-5">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a  class="nav-link active" href="#"  aria-current="page" data-bs-toggle="modal" data-bs-target="#profileModal"><%= user.getUserName()%></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="index.jsp">Logout</a>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
        </nav>

        <div class="container p-5" style="width: 800px;height: 100px">
            <form id="regForm" action="addCourse" method="post">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Course Code</label>
                    <input required name="courseCode" type="text" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Course Title</label>
                    <input required name="courseTitle" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Credit</label>
                    <input required name="credit" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Teacher ID</label>
                    <input required name="teacherId" type="text" class="form-control" id="exampleInputPassword1">
                </div>
                
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Teacher Name</label>
                    <input required name="teacherName" type="text" class="form-control" id="exampleInputPassword1">
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("Document loaded.");

                $("#regForm").on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $.ajax({
                        url: "addCourse",
                        type: "post",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            swal("Course added successfully", "We are redirecting you to profile page", "success").then((value) => {
                                window.location = "adminProfile.jsp";
                            });
                        },
                        error: function (jqXHR, textStatus, data) {
                            swal("Error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
    </body>
</html>

