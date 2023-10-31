package com.alok.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.alok.FactoryProvider;
import com.alok.dao.CategoryDao;
import com.alok.dao.ProductDao;
import com.alok.entity.Category;
import com.alok.entity.Product;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//servlet 2:
		//add category and add product
		PrintWriter out=response.getWriter();
		String op=request.getParameter("operation");
		if(op.trim().equals("addcategory")) {
			String title=request.getParameter("catTitle");
			String desc=request.getParameter("catDescription");
			Category category=new Category();
			category.setCategoryTitle(title);
			category.setCategoryDescription(desc);
			//save category
			CategoryDao dao=new CategoryDao(FactoryProvider.getFactory());
			int catId=dao.saveCategory(category);
			HttpSession session=request.getSession();
			session.setAttribute("message", "Category added successfully: "+catId);
			response.sendRedirect("admin.jsp");
			return;
			
		}else if(op.trim().equals("addproduct")) {
			//add product work
			String pName=request.getParameter("pName");
			String pDesc=request.getParameter("pDesc");
			int pPrice=Integer.parseInt(request.getParameter("pPrice"));
			int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
			int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
			int catId=Integer.parseInt(request.getParameter("catId"));
			Part part=request.getPart("pPic");
			
			Product p=new Product();
			p.setpTitle(pName);
			p.setpDesc(pDesc);
			p.setpPrice(pPrice);
			p.setpDiscount(pDiscount);
			p.setpQuantity(pQuantity);
			p.setpPhoto(part.getSubmittedFileName());
			
			CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
			Category cat=cdao.getCategoryById(catId);
			p.setCategory(cat);
			
			ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
			pdao.saveProduct(p);
			HttpSession session=request.getSession();
			session.setAttribute("message", "Product added successfully ");
			response.sendRedirect("admin.jsp");
			return;
			
		}
		
		
	}
}
