<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="./css/TableEdit.css"/>
</head>
<header>
    <title>Add New</title>
    <body>
        <div>
               <h1>Add a New Book</h1>
               	<form action="" method="post">
				<div class="form-group">
					<label>Title</label>
					<input type="text" class="form-control" name="title" placeholder="Title"/>
				</div>
				<div class="form-group">
					<label>Author</label>
					<input type="text" class="form-control" name="author" placeholder="Enter Author"/>
				</div>
				<div class="form-group">
					<label>Publication Year</label>
					<input type="text" class="form-control" name="year" placeholder="Enter Publication Year"'/>
				</div>
				<div class="form-group">
					<label>Genre</label>
					<input type="text" class="form-control" name="genre" placeholder="Enter Genre"/>
				</div>
				<div class="form-group">
					<label>Item Type</label>
					<input type="text" class="form-control" name="type" placeholder="Enter Type"/>
				</div>
				<div class="form-group">
					<label>Item Location</label>
					<input type="text" class="form-control" name="location" placeholder="Enter Location"/>
				</div>
				<div class="form-group">
					<label>Report Date</label>
					<input type="text" class="form-control" name="date" placeholder="Enter Report Date"/>
				</div>
				<div class="form-group">
					<label>Item Count</label>
					<input type="text" class="form-control" name="count" placeholder="Enter Count"/>
				</div>
				<button type="button" class="btn btn-warning">Submit</button>
				<a href="EmployeeHome.jsp" class="btn btn-primary">Back</a>
				
			</form>
        </div>    
    </body>
</header>
</html>
