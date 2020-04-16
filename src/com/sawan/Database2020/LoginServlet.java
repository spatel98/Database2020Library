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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("**LoginServlet doPost() called**");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String errMsg = null;
		
		if(username.equals("") || username == null) {
			errMsg = "Email null/empty";
		}
		
		if(password.equals("") || password == null) {
			errMsg = "Password null/empty";
		}
		
		if(errMsg != null) {
			RequestDispatcher reqDispatcher = getServletContext().getRequestDispatcher("/UserLogin.html");
			PrintWriter out= response.getWriter();
			out.println("<font color=red>" + errMsg + "</font>");
			reqDispatcher.include(request, response);
		}else {
			Connection connection = (Connection) getServletContext().getAttribute("DBConnection");
			try {
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery("select * from users where email='" + username + "' and password='" + password + "'");
//				RequestDispatcher requestDispatcher = request.getRequestDispatcher("HomeServlet");
				if(resultSet.next()) {
					UserClass user = new UserClass(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5));
					HttpSession session = request.getSession();
					session.setAttribute("User", user);
					response.sendRedirect("HomeServlet");;
//					request.setAttribute("message", "Welcome to Database2020 Library "+username);
//					requestDispatcher.forward(request, response);
				}else {
					RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/UserLogin.html");
					PrintWriter out= response.getWriter();
					out.println("<font color=red>User Not Found</font>");
					requestDispatcher.include(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new ServletException("DB Connection problem.");
			}
		}
	}
}
