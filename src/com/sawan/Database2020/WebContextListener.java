package com.sawan.Database2020;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class WebContextListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent servletContextEvent) {
    	ServletContext context = servletContextEvent.getServletContext();
    	
    	String dbUrl = context.getInitParameter("dbUrl");
    	String dbUser = context.getInitParameter("dbUser");
    	String dbPassword = context.getInitParameter("dbPassword");
    	
    	try {
			DatabaseManager DBconnection = new DatabaseManager(dbUrl, dbUser, dbPassword);
			context.setAttribute("DBConnection", DBconnection.getConnection());
			System.out.println("***Successfull: DBConnection***");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }

    public void contextDestroyed(ServletContextEvent servletContextEvent) {
    	Connection connection = (Connection) servletContextEvent.getServletContext().getAttribute("DBConnection");
    	try {
    		connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
	
}
