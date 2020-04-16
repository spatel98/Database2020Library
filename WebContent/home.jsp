<%@page import="com.sawan.Database2020.UserClass"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Home Page</title>
</head>
<body>
<%UserClass user = (UserClass) session.getAttribute("User"); %>
<h3>Hi <%=user.getFirstname() %> <%=user.getLastname() %></h3>
<strong>Your Email</strong>: <%=user.getEmail() %><br>
<strong>Your Password</strong>: <%=user.getPassword() %><br>
<strong>Your Id</strong>: <%=user.getId() %><br>
<br>
<form action="LogoutServlet" method="post">
<input type="submit" value="Logout" >
</form>
</body>
</html>