package com.sawan.Database2020;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("**RegistrationServlet doPost() called**");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		String errMsg = null;
		if(firstname.equals("") || firstname == null){
			errMsg = "Firstname null/empty";
		}
		if(lastname.equals("") || lastname == null){
			errMsg = "Lastname null/empty";
		}
		if(username.equals("") || username == null){
			errMsg = "Email null/empty";
		}
		if(password.equals("") || password == null){
			errMsg = "Password null/empty";
		}
		
		if(errMsg != null){
			RequestDispatcher reqDispatcher = getServletContext().getRequestDispatcher("/UserRegistration.html");
			PrintWriter out= response.getWriter();
			out.println("<font color=red>" + errMsg + "</font>");
			reqDispatcher.include(request, response);
		}else{
			Connection connection = (Connection) getServletContext().getAttribute("DBConnection");
			try {
				String query = "insert into users (Fname, Lname, Email, Password) values(?, ?, ?, ?)";
				PreparedStatement statement = connection.prepareStatement(query);
				statement.setString(1, firstname);
				statement.setString(2, lastname);
				statement.setString(3, username);
				statement.setString(4, password);
				
				statement.executeUpdate();
				
				RequestDispatcher reqDispatcher = getServletContext().getRequestDispatcher("/UserLogin.html");
				PrintWriter out= response.getWriter();
				out.println("<font color=green>Successfully Registered</font>");
				reqDispatcher.include(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
				throw new ServletException("DB Connection problem.");
			}
		}
	}
}
