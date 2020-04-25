<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Jsp Sample</title>
    <%@page import="java.sql.*"%>
    <%@page import="com.sawan.Database2020.UserClass"%>
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
	<%UserClass user = (UserClass) session.getAttribute("User");
	  String firstName = user.getFirstname();
	%>
	<div class="entry-title-wrap">
		<h1 class="title"> <%=firstName %>'s Favorite Books</h1>
	</div>
	<br> <br>
    <%
    

    //System.out.println(user.getId());
    
    
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/mylibrary","root","1234");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select l.Title, l.Author, l.PublicationYear, l.Genre from users u inner join favoritebooks f on f.UId = u.UId inner join library l on l.BookId = f.BookId WHERE u.UId = " + user.getId() + ";");
    %><table border=1 style= "text-align:center; width: 70%; margin-left:auto;margin-right:auto;"> 
      <thead>
          <tr>
             <th>Title</th>
             <th>Author</th>
             <th>Publication Year</th>
             <th>Genre</th>
          </tr>
      </thead>
      <tbody>
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("Title") %></td>
                <td><%=rs.getString("Author") %></td>
                <td><%=rs.getString("PublicationYear") %></td>
                <td><%=rs.getString("Genre") %></td>
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