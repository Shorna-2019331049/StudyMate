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
                <div>
                    <form class="d-flex ms-auto order-5">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="login.jsp">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="signUp.jsp">SignUp</a>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
        </nav>
        <!--banner-->
        <div class="container p-5" style="width: 800px;height: 100px" >
            <div class="jumbotron">
                <div class="container">
                    <h3 class="display-5">Welcome to StudyMate</h3>
                    <p>This system allows students to register for courses and teachers to manage courses.</p>
                    <p>Already have an account?</p>
                    <form action="indexServlet" method="get">
                        <input class='btn' type="submit" value="Login"  name = "s1">
                    </form>
                    <p>Or signup</p>
                    <form action = "indexServlet" method="get">
                        <input class='btn' type="submit" value = "SignUp" name = "s1">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>