<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
    <head>
        <title>Forgot Password Design</title>
        <link rel = "stylesheet" type="text/css" href="./css/loginstyle.css">
        <link rel="stylesheet" type="text/css" href="./css/navbar.css">
        <body>
            <div class = "forgotpasswordbox">
                    <h1>Forgot Password?</h1>
                    <form action="ForgotPasswordServlet" method="post">
                        <p>E-mail</p>
                        <input type = "text" name = "email" placeholder="Enter E-mail">
                        <p>Password</p>
                        <input type = "password" name = "password" placeholder="Enter Password">
                        <p>Confirm Password</p>
                        <input type = "password" name = "confirmPassword" placeholder="Confirm Password">                        
                        <input type = "submit" name = "" value="Submit">
                    </form>

            </div>    
        </body>
    </head>
</html>