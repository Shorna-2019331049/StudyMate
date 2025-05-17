<%-- 
    Document   : profile
    Created on : 9 May 2023, 02:28:27
    Author     : User
--%>

<%@page import="entities.Course"%>
<%@page import="java.util.List"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="dao.userDao"%>
<%@page import="helper.Message"%>
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

        <% userDao uD = new userDao(ConnectionProvider.getConnection());
            List<Course> courseList = uD.getCourses();
        %>
        <!--main body-->
        <div class="container-fluid mt-3">
            <div class="row">
                <div class="col-md-6">
                    <!-- Left column content -->
                    <!--Start of sliding window code-->
                    <div class ="row">
                        <div class ="col-md-6">

                            <div id="slidewindow">

                                <div class="text-center mt-3">
                                    <h4> <strong> <u> Dashboard </u> </strong> </h4>
                                </div>

                                <table class="table mt-3">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Code</th>
                                            <th>Title</th>
                                            <th>TeacherID</th>
                                            <th>Credit</th>
                                            <!-- Add more columns as needed -->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (int i = 0; i < courseList.size(); i++) {
                                                Course item = courseList.get(i);
                                        %>
                                        <tr>
                                            <td><%=item.getIdaddCourse()%></td>
                                            <td><%=item.getCourseCode()%></td>
                                            <td><%=item.getTitle()%></td>
                                            <td><%=item.getTeacherId()%></td>
                                            <td><%=item.getCredit()%></td>
                                            <!-- Add more columns as needed -->
                                        </tr>
                                        <%
                                                System.out.println(item);
                                            }
                                        %>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                    <img src="img/adminProfile.jpg" class="img-fluid" style="width: 700px">

                </div>
                <div class="col-md-6">
                    <!-- Right column content -->
                    <div class="d-flex align-items-center vh-100">
                        <div class="container">
                            <div class="text-center">
                                <div class="row">
                                    <div class="col-md-6">
                                        <button type="button" class="btn" id="dashboard-btn" style="width:200px; height:200px;background-color: #f1f8e9; color: black">
                                            <img src="img/dashboard.png" class="img-fluid" style="width:100px; height: 100px;">
                                            <br><br>
                                            Dashboard
                                        </button>
                                    </div>
                                    <div class="col-md-6">
                                        <form action="addCourse.jsp" method="post"> 
                                            <button type="submit" class="btn" id="redirectButton" style="width:200px; height:200px;background-color: #f1f8e9; color: black">
                                                <img src="img/add.png" class="img-fluid" style="width:100px; height: 100px;">
                                                <br>
                                                <br>
                                                Add Course
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--start of profile modal -->
        <!-- Modal -->
        <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">StudyMate</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">

                            <img src="img/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%; width: 150px;">
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getUserName()%></h5>
                            <!--details-->
                            <div id="profile-details">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">Name:</th>
                                            <td><%=user.getName()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">UserName:</th>
                                            <td><%= user.getUserName()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Role:</th>
                                            <td><%= user.getUserRole()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email:</th>
                                            <td><%= user.getEmail()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--edit-profile-->
                            <div id="edit-profile" style="display: none;">
                                <h4>Please edit carefully!</h4>
                                <form action="EditServlet" method = "post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td>UserName :</td>
                                                <td> <input type="text" class="form-control" name="userName" value="<%= user.getUserName()%>" > </td>
                                            </tr>
                                            <tr>
                                                <td>Name:</td>
                                                <td> <input type="text" class="form-control" name="name" value="<%= user.getName()%>" > </td>
                                            </tr>
                                            <tr>
                                                <td>Password:</td>
                                                <td> <input type="password" class="form-control" name="userPassword" value="<%= user.getUserPassword()%>" > </td>
                                            </tr>
                                            <tr>
                                                <td>New image:</td>
                                                <td> <input type="file" class="form-control" name="userProfile"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="container mr-right" style="text-align: right;">
                                        <button type="submit" class="btn btn-outline-success">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id = "close-btn" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button id="edit-profile-btn"type="button" class="btn btn-success">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--End of profile modal-->
        <div class="container p-5">

        </div>

        <!--java script-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#edit-profile-btn').click(function ()
                {
                    if (editStatus === false)
                    {
                        $("#profile-details").hide();
                        $("#edit-profile").show();
                        editStatus = true;
                        $(this).text("Back");
                    } else
                    {
                        $("#profile-details").show();
                        $("#edit-profile").hide();
                        editStatus = false;
                        $(this).text("Edit");
                    }
                });
            });
        </script>

        <!--Sliding window-->
        <script>
            $(document).ready(function () {
                $('#dashboard-btn').click(function () {

                    $('#slidewindow').toggleClass('active');
                });
            });
        </script>

    </body>
</html>

