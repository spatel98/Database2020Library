<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Test -->
    <title>Jsp Sample</title>
    <%@page import="java.sql.*"%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./css/navbar.css"/>
</head>
<header>
    <nav>
        <ul>
            <li><a href="UserHome.jsp">Home</a></li>
            <li><a href="UserSearch.jsp">Search</a></li>
            <li><form action="LogoutServlet" method="post">
					<input type="submit" value="Logout" >
				</form>
			</li>
        </ul>
    </nav>
</header>
<body>

	<div class="entry-title-wrap">
		<h1 class="title">Bull Books</h1>
	</div>
	<img class="center" src="./img/bullBook.png" />
	<button class="center" onclick="redir()">Add New Book</button>
	
	<script>
	function redir() {
		window.location.href = "addNew.jsp"
	}
	</script>
	
	<br> <br>
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/mylibrary","root","1234");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from library;");
    %><table border=1 style= "text-align:center; width: 70%; margin-left:auto;margin-right:auto;"> 
      <thead>
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
      </thead>
      <tbody>
        <%while(rs.next())
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
            <%}%>
           </tbody>
        </table><br>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }

    %>
</body>
</html>
