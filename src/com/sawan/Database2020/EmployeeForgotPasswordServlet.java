package com.sawan.Database2020;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmployeeForgotPasswordServlet
 */
public class EmployeeForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("**EmployeeForgotPasswordServlet doPost() called**");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String errMsg = null;
		
		if(email.equals("") || email == null) {
			errMsg = "Email null/empty";
		}
		
		if(password.equals("") || password == null) {
			errMsg = "Password null/empty";
		}
		
		if(confirmPassword.equals("") || confirmPassword == null) {
			errMsg = "confirmPassword null/empty";
		}
		
		if(!confirmPassword.equals(password)) {
			errMsg = "confirmPassword and Password doesnot match!!!";
		}
		
		if(errMsg != null) {
			RequestDispatcher reqDispatcher = getServletContext().getRequestDispatcher("/EmployeeForgotPassword.jsp");
			PrintWriter out= response.getWriter();
			out.println("<font color=red>" + errMsg + "</font>");
			reqDispatcher.include(request, response);
		}else {
			Connection connection = (Connection) getServletContext().getAttribute("DBConnection");
			try {
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery("select * from employees where email='" + email + "'");
				if(resultSet.next()) {
					int result = statement.executeUpdate("update employees set password='"+password+"' where email='"+email+"'");
					RequestDispatcher reqDispatcher = getServletContext().getRequestDispatcher("/EmployeeLogin.html");
					PrintWriter out = response.getWriter();
					if(result > 0) {
						out.println("<font color=green>Password Updated Successfully</font>");
						reqDispatcher.include(request, response);
					}else {
						out.println("<font color=red>Password Update Failed</font>");
						reqDispatcher.include(request, response);
					}
				}else {
					RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/EmployeeLogin.html");
					PrintWriter out= response.getWriter();
					out.println("<font color=red>Email not found in the database</font>");
					requestDispatcher.include(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new ServletException("DB Connection problem.");
			}
		}
	}
}
