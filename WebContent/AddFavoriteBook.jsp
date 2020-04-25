<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.sawan.Database2020.UserClass"%>

<%
String id = request.getParameter("f");
int BookId = Integer.parseInt(id); //getting book id
UserClass user = (UserClass) session.getAttribute("User");
int UId = user.getId(); //getting user id from session
Class.forName("com.mysql.jdbc.Driver");
String host = "jdbc:mysql://localhost:3306/mylibrary";
Connection con=(Connection)DriverManager.getConnection(host,"root","1234");
String query = "INSERT IGNORE INTO favoritebooks (UId, BookId) VALUES(" + UId + "," + BookId +");";
Statement stat = con.createStatement();
stat.executeUpdate(query);


response.sendRedirect("UserHome.jsp");
%>
