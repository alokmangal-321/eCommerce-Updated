<%@page import="com.alok.FactoryProvider"%>
<%@page import="com.alok.Helper"%>
<%@page import="com.alok.dao.ProductDao"%>
<%@page import="com.alok.dao.CategoryDao"%>
<%@page import="com.alok.entity.Product"%>
<%@page import="com.alok.entity.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>mycart-Home</title>
	
	<%@include file="components/common_css_js.jsp" %>
</head>
<body>
	<%@include file="components/nav.jsp" %>
	
	<div class="row mt-3 mx-2" >
	<%
		ProductDao dao=new ProductDao(FactoryProvider.getFactory());
		List<Product> list=dao.getAllProducts();
		CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
		List<Category> clist=cdao.getCategories();
		
		
	%>
		<!-- show categories -->
		<div class="col-md-2">
			<div class="list-group mt-4">
				 <a href="#" class="list-group-item list-group-item-action active">
    All Categories
  </a>
			
			
			<%
				for(Category c:clist){
			%>
		
			<a href="#" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>
		
			<% } %>
			
			</div>
			
		</div>
		
		<!-- show products -->
		<div class="col-md-8">
			
		<!-- row -->
		<div class="row mt-4">
		<!-- col:12 -->
			<div class="col-md-12">
				<div class="card-columns">
				
				<!-- traversing the product -->
				<%
					for(Product p:list){
				%>
				
				<div class="card">
					<div class="card-body">
						<h5 class="card-title"><%= p.getpName() %></h5>
						
						<p class="card-text">
							<%= Helper.get10words(p.getpDesc()) %>
						</p>
						
					</div>
					
					<div class="card-footer">
						<button class="btn custom-bg text-white">Add to Cart</button>
						<button class="btn btn-outline-primary"> &#8377; <%=p.getpPrice()*p.getpQuantity() -(p.getpDiscount()*0.01*p.getpPrice()*p.getpQuantity())%></button>
					</div>
					
					
				</div>
				
				
				
				
				
				<% } %>
				</div>
			</div>
		</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
</body>
</html>