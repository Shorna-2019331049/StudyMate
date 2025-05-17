<%-- 
    Document   : signUp
    Created on : 8 May 2023, 23:56:18
    Author     : User
--%>

<%-- 
    Document   : index
    Created on : 8 May 2023, 13:06:14
    Author     : User
--%>

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
        
        <div class="container p-5" style="width: 800px;height: 100px">
            <form id="regForm" action="signUp" method="post">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Name</label>
                    <input required name="userName" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    <!--<div id="emailHelp" class="form-text"></div>-->
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">User Name</label>
                    <input required name="userUserName" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    <div id="emailHelp" class="form-text"></div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                    <input required name="userEmail" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    <div id="emailHelp" class="form-text"></div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input required name="userPassword" type="password" class="form-control" id="exampleInputPassword1">
                </div>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">User Type</label>
                    <select required name="userRole" class="form-control">
                        <option value="">Select Role</option>
                        <option value="Teacher">Teacher</option>
                        <option value="Student">Student</option>
                        <option value="Admin">Admin</option>
                    </select>
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
                        url: "signUp",
                        type: "post",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            swal("Registration Successfull", "We are redirecting you to login page", "success").then((value) => {
                                window.location = "login.jsp";
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

