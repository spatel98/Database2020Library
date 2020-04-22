<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Jsp Sample</title>
    <%@page import="java.sql.*"%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./css/navbar.css"/>
</head>
<header>
    <nav>
        <ul>
            <li><a href="EmployeeHome.jsp">Home</a></li>
            <li><a href="EmployeeSearch.jsp">Search</a></li>
            <li><a href="EmployeeRegistry.jsp">Employee Registry</a></li>
            <li><a href="UserRegistry.jsp">User Registry</a></li>
            <li><form action="LogoutServlet" method="post">
					<input type="submit" value="Logout" >
				</form>
			</li>
        </ul>
    </nav>
</header>
<body>

	<div class="entry-title-wrap">
		<h1 class="title">User Registry</h1>
	</div>
	<br> <br>
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/mylibrary","root","1234");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select UId, Fname, Lname, Email from users;");
    %><table border=1 style= "text-align:center; width: 70%; margin-left:auto;margin-right:auto;"> 
      <thead>
          <tr>
             <th>ID</th>
             <th>First Name</th>
             <th>Last Name</th>
             <th>E-Mail</th>
          </tr>
      </thead>
      <tbody>
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("UId") %></td>
                <td><%=rs.getString("Fname") %></td>
                <td><%=rs.getString("Lname") %></td>
                <td><%=rs.getString("Email") %></td>
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