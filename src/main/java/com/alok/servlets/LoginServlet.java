package com.alok.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alok.FactoryProvider;
import com.alok.dao.UserDao;
import com.alok.entity.User;
 
public class LoginServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			//validations
			//authentication
			UserDao userDao=new UserDao(FactoryProvider.getFactory());
			User user=userDao.getUserByEmailAndPassword(email, password);
			//System.out.println(user);
			PrintWriter out=response.getWriter();
			
			HttpSession httpSession=request.getSession();
			
			if(user==null) {
				httpSession.setAttribute("message", "Invalid details!! please try with another one");
				response.sendRedirect("login.jsp");
				return;
			}else {
				out.println("<h1>Welcome "+user.getUserName() +"</h1>");
				
				//login - As long as current-user is associated with httpSession, user remains logged in
				httpSession.setAttribute("current-user", user);
				if(user.getUserType().equals("admin")) {
					response.sendRedirect("admin.jsp");
				}else if(user.getUserType().equals("normal")) {     
					response.sendRedirect("normal.jsp");
				}else {
					out.println("We have not identified the user type!!!");
				}
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
