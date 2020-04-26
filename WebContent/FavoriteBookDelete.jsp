<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<%
String id = request.getParameter("fd");
int no = Integer.parseInt(id);
Class.forName("com.mysql.jdbc.Driver");
String host = "jdbc:mysql://localhost:3306/mylibrary";
Connection con=(Connection)DriverManager.getConnection(host,"root","1234");
Statement stat = con.createStatement();
stat.executeUpdate("delete from favoritebooks where FavBookId = '" +no+"'");
response.sendRedirect("FavoriteBooks.jsp");
%>
