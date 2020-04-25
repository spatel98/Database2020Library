<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/navbar.css"/>
</head>
<header>
    <nav>
        <ul>
            <li><a href="UserHome.jsp">Home</a></li>
            <li><a href="UserSearch.jsp">Search</a></li>
            <li><a href="FavoriteBooks.jsp">Favorite Books</a></li>
            <li><form action="LogoutServlet" method="post">
					<input type="submit" value="Logout" >
				</form>
			</li>
        </ul>
    </nav>
</header>
<body>
	<form action ="#" name = "form1">
	    <select id = "searchBy" name = "searchBy" onchange = "submit();">
	    	<option value=""  selected disabled hidden>Search By...</option>
	        <option value="Title">Title</option>
	        <option value="Author">Author</option>
	        <option value="Genre">Genre</option>
	        <option value="Publication Year">Publication Year</option>
	    </select>
    </form>
	<br>
	<form action="" method="POST" >
	<div class ="container" >
		<div class="form-group">
			<div class="col-sm-5" style = "margin: auto;">
				<div class = "input-group" >
					<input type="text" name = "search" class="form-control" placeholder="Type here" >
					<div class="input-group-btn">
						<button type = "submit" value = "Search" class="btn btn-primary"><span class="glyphicon glyphicon-serach"></span> Search</button>
					</div>
				</div>
			</div>
		</div><br><br>
		<table border=1 style= "text-align:center; width: 95%; margin-left:auto;margin-right:auto;"> 
		  <tr>
             <th>BookId</th>
             <th>Title</th>
             <th>Author</th>
             <th>PublicationYear</th>
             <th>Genre</th>
             <th>ItemType</th>
             <th>ItemLocation</th>
             <th>ReportDate</th>
             <th>ItemCount</th>
          </tr>
          <%
		  try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylibrary","root","1234");
			//String Query = "select * from library where title LIKE '%"+request.getParameter("search")+"%'";
			String Query;
			
			String selectValue = request.getParameter("searchBy");	
			System.out.println(request.getParameter("searchBy") + "\n");
			switch(selectValue)
			{
			case "Title":
				Query = "select * from library where title LIKE '%"+request.getParameter("search")+"%'";
				System.out.println("selectValue is Title");
				%> <h4 style="text-align:center;">Searching by Title...</h4>    <%
				break;
			case "Author":
				Query = "select * from library where author LIKE '%"+request.getParameter("search")+"%'";
				%> <h4 style="text-align:center;">Searching by Author...</h4>    <%
				System.out.println("selectValue is Author");
				break;
			case "Genre":
				Query = "select * from library where genre LIKE '%"+request.getParameter("search")+"%'";
				%> <h4 style="text-align:center;">Searching by Genre...</h4>    <%
				System.out.println("selectValue is Genre");
				break;
			case "Publication Year":
				Query = "select * from library where publicationyear LIKE '%"+request.getParameter("search")+"%'";
				%> <h4 style="text-align:center;">Searching by Publication Year...</h4>   <%
				System.out.println("selectValue is Publication Year");
				break;
				
			default:
				Query = "select * from library;";
				%> <h4 style="text-align:center;">Using Default Search...</h4>    <%
				System.out.println("selectValue is null");
			}
			
			Statement stm = conn.createStatement();
			ResultSet rs = stm.executeQuery(Query);
			while(rs.next())
			{
	            %>
	            <tr>
	                <td><%=rs.getString("BookId") %></td>
	                <td><%=rs.getString("Title") %></td>
	                <td><%=rs.getString("Author") %></td>
	                <td><%=rs.getString("PublicationYear") %></td>
	                <td><%=rs.getString("Genre") %></td>
	                <td><%=rs.getString("ItemType") %></td>
	                <td><%=rs.getString("ItemLocation") %></td>
	                <td><%=rs.getString("ReportDate") %></td>
	                <td><%=rs.getString("ItemCount") %></td>
	            </tr>
	            <%
			}
          }
          catch(Exception ex)
          {
        	  ex.printStackTrace();
          }
          %>
		</table>
	</div>
	</form>
</body>
</html>