package com.alok.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.alok.entity.Category;

public class CategoryDao {
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	
	
	public SessionFactory getFactory() {
		return factory;
	}



	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}



	public int saveCategory(Category cat ) {
		
		Session session=this.factory.openSession();
		Transaction tx=session.beginTransaction();
		int catId=(int)session.save(cat);
		tx.commit();
		
		session.close();
		return catId;
		
	}
	public List<Category> getCategories(){
		Session s=this.factory.openSession();
		Query q=s.createQuery("from Category");
		List<Category> list=q.list();
		return list;
		
	}
	
	public Category getCategoryById(int cid) {
		Category cat=null;
		try {
			Session session=this.factory.openSession();
			cat=session.get(Category.class, cid);
			session.close();
			
		}catch(Exception e) {
			e.printStackTrace();		
		}
		return cat;
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
