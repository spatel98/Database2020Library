package com.sawan.Database2020;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/ValidateUserSession")
public class ValidateUserSession implements Filter {
	
	public void init(FilterConfig fConfig) throws ServletException {
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String uri = req.getRequestURI();
		
		HttpSession session = req.getSession(false);
		
		if(session == null && !(uri.endsWith("html") || uri.endsWith("LoginServlet") || uri.endsWith("RegistrationServlet"))){
			res.sendRedirect("UserLogin.html");
		}else if(session == null && !(uri.endsWith("html") || uri.endsWith("EmployeeLoginServlet"))){
			res.sendRedirect("EmployeeLogin.html");
		}else{
			chain.doFilter(request, response);
		}	
	}

	public void destroy() {
	}
}

