<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/TableEdit.css"/>
<title>Edit page</title>
</head>
<body>
<%
String host = "jdbc:mysql://localhost:3306/mylibrary";
Connection con = null;
Statement stat = null;
ResultSet res = null;
PreparedStatement stmt = null;
Class.forName("com.mysql.jdbc.Driver");
con=(Connection)DriverManager.getConnection(host,"root","1234");
%>
<div class = "registerbox">
	<form action="" method="post">
		<%
			stat = con.createStatement();
			String u = request.getParameter("u");
			int num = Integer.parseInt(u);
			String data = "select * from library where BookId = '" + num + "';";
			res = stat.executeQuery(data);
			while(res.next()){
				
			
		%>
		<input type="hidden" name ="id" value='<%=res.getString("BookId") %>'/>
		<div class="form-group">
			<label>Title</label>
			<input type="text" class="form-control" name="title" value='<%=res.getString("Title") %>'/>
		</div>
		<div class="form-group">
			<label>Author</label>
			<input type="text" class="form-control" name="author" value='<%=res.getString("Author") %>'/>
		</div>
		<div class="form-group">
			<label>Publication Year</label>
			<input type="text" class="form-control" name="year" value='<%=res.getString("PublicationYear") %>'/>
		</div>
		<div class="form-group">
			<label>Genre</label>
			<input type="text" class="form-control" name="genre" value='<%=res.getString("Genre") %>'/>
		</div>
		<div class="form-group">
			<label>Item Type</label>
			<input type="text" class="form-control" name="type" value='<%=res.getString("ItemType") %>'/>
		</div>
		<div class="form-group">
			<label>Item Location</label>
			<input type="text" class="form-control" name="location" value='<%=res.getString("ItemLocation") %>'/>
		</div>
		<div class="form-group">
			<label>Report Date</label>
			<input type="text" class="form-control" name="date" value='<%=res.getString("ReportDate") %>'/>
		</div>
		<div class="form-group">
			<label>Item Count</label>
			<input type="text" class="form-control" name="count" value='<%=res.getString("ItemCount") %>'/>
		</div>	
		<%
			}
		%>
		<button type="submit" class="btn btn-warning">Update</button>
		<a href="EmployeeHome.jsp" class="btn btn-primary">Back</a>
	</form>
</div>
</body>
</html>
<% 
String a = request.getParameter("id");
String b = request.getParameter("title");
String c = request.getParameter("author");
String d = request.getParameter("year");
String e = request.getParameter("genre");
String f = request.getParameter("type");
String g = request.getParameter("location");
String h = request.getParameter("date");
String i = request.getParameter("count");
if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && g!=null && h!=null && i!=null){
	String query = "update library set Title = ?, Author = ?, PublicationYear = ?, Genre = ?, ItemType = ?, ItemLocation = ?, ReportDate = ?, ItemCount = ? where BookId ='" + a + "'";
	stmt = con.prepareStatement(query);
	stmt.setString(1,b);
	stmt.setString(2,c);
	stmt.setString(3,d);
	stmt.setString(4,e);
	stmt.setString(5,f);
	stmt.setString(6,g);
	stmt.setString(7,h);
	stmt.setString(8,i);
	
	stmt.executeUpdate();
	response.sendRedirect("EmployeeHome.jsp");
}
%>