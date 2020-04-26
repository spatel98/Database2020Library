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
 * Servlet implementation class AddNewBookServlet
 */
public class AddNewBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("**AddNewBookServlet doPost() called**");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String year = request.getParameter("year");
		String genre = request.getParameter("genre");
		String type = request.getParameter("type");
		String location = request.getParameter("location");
		String date = request.getParameter("date");
		String count = request.getParameter("count");
		
		String errMsg = null;
		if(title.equals("") || title == null){
			errMsg = "title null/empty";
		}
		if(author.equals("") || author == null){
			errMsg = "author null/empty";
		}
		if(year.equals("") || year == null){
			errMsg = "year null/empty";
		}
		if(genre.equals("") || genre == null){
			errMsg = "genre null/empty";
		}
		if(type.equals("") || type == null){
			errMsg = "type null/empty";
		}
		if(location.equals("") || location == null){
			errMsg = "location null/empty";
		}
		if(date.equals("") || date == null){
			errMsg = "date null/empty";
		}
		if(count.equals("") || count == null){
			errMsg = "count null/empty";
		}
		
		if(errMsg != null){
			RequestDispatcher reqDispatcher = getServletContext().getRequestDispatcher("/addNew.jsp");
			PrintWriter out= response.getWriter();
			out.println("<font color=red>" + errMsg + "</font>");
			reqDispatcher.include(request, response);
		}else{
			Connection connection = (Connection) getServletContext().getAttribute("DBConnection");
			try {
				String query = "insert into library (Title, Author, PublicationYear, Genre, ItemType, ItemLocation, ReportDate, ItemCount) values(?, ?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement statement = connection.prepareStatement(query);
				statement.setString(1, title);
				statement.setString(2, author);
				statement.setString(3, year);
				statement.setString(4, genre);
				statement.setString(5, type);
				statement.setString(6, location);
				statement.setString(7, date);
				statement.setString(8, count);
				
				statement.executeUpdate();
				
				RequestDispatcher reqDispatcher = getServletContext().getRequestDispatcher("/addNew.jsp");
				PrintWriter out= response.getWriter();
				out.println("<font color=green>Book Added Successfully</font>");
				reqDispatcher.include(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
				throw new ServletException("DB Connection problem.");
			}
		}
	}
}
