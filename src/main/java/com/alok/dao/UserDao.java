package com.alok.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.alok.entity.User;

public class UserDao {
	
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	//get user by email and password
	public User getUserByEmailAndPassword(String email, String password) {
		User user=null;
		try {
			String query="from User where userEmail =: e and userPassword=: p";
			Session s=this.factory.openSession();
			Query q =s.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			user=(User)q.uniqueResult();
			
			s.close();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return user;
	}

}
