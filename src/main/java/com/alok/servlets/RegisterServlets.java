package com.alok.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.alok.FactoryProvider;
import com.alok.entity.User;

public class RegisterServlets extends HttpServlet {

       
    public RegisterServlets() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String userName=request.getParameter("user_name");
			String userEmail=request.getParameter("user_email");
			String userPassword=request.getParameter("user_password");
			String userPhone=request.getParameter("user_phone");
			String userAddress=request.getParameter("user_address");
			PrintWriter out=response.getWriter();
			//validations
			if(userName.isEmpty()){
				out.println("Name is blank");
				return;
				
			}
			
			User user=new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, "normal");
			Session hibernateSession=FactoryProvider.getFactory().openSession();
			Transaction tx=hibernateSession.beginTransaction();
			int userId=(int)hibernateSession.save(user);
			
			tx.commit();
			hibernateSession.close();
			HttpSession httpSession=request.getSession();
			httpSession.setAttribute("message", "Sussessfully registered "+userId);
			response.sendRedirect("register.jsp");
			return;
		}catch(Exception e) {
			e.printStackTrace();		
			}
	}

}
