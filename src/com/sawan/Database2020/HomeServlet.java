package com.sawan.Database2020;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class HomeServlet
 */
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	
	public void init(ServletConfig config) {
		try {
			System.out.println("**HomeServlet init() called**");
			ServletContext context = config.getServletContext();
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(context.getInitParameter("dbUrl"), context.getInitParameter("dbUser"), context.getInitParameter("dbPassword"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from library");
			
			HttpSession session = request.getSession();
			UserClass user = (UserClass) session.getAttribute("User");
			
			System.out.println(user.getFirstname());
			System.out.println(user.getLastname());
			System.out.println(user.getEmail());
			System.out.println(user.getPassword());
			System.out.println(user.getId());
			
			PrintWriter out = response.getWriter();
			out.print("<table>");
			
			out.print("<tr>");
			
			out.print("<th>");
			out.println("Book Id");
			out.print("</th>");
			
			out.print("<th>");
			out.println("Title");
			out.print("</th>");
			
			out.print("<th>");
			out.println("Author");
			out.print("</th>");
			
			out.print("<th>");
			out.println("Publication Year");
			out.print("</th>");
			
			out.print("<th>");
			out.println("Genre");
			out.print("</th>");
			
			out.print("<th>");
			out.println("Item Type");
			out.print("</th>");
			
			out.print("<th>");
			out.println("Item Count");
			out.print("</th>");
			
			out.print("</tr>");
			
			while(resultSet.next()) {
				out.println("<tr>");
				
				out.println("<td>");
				out.print(resultSet.getInt(1));
				out.println("</td>");
				
				out.println("<td>");
				out.print(resultSet.getString(2));
				out.println("</td>");
				
				out.println("<td>");
				out.print(resultSet.getString(3));
				out.println("</td>");
				
				out.println("<td>");
				out.print(resultSet.getInt(4));
				out.println("</td>");
				
				out.println("<td>");
				out.print(resultSet.getString(5));
				out.println("</td>");
				
				out.println("<td>");
				out.print(resultSet.getString(6));
				out.println("</td>");
				
				out.println("<td>");
				out.print(resultSet.getInt(9));
				out.println("</td>");
				out.println("</tr>");
			}
			
			out.print("</table>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("**HomeServlet doPost() called**");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println(request.getAttribute("message"));
		doGet(request, response);
	}

}
