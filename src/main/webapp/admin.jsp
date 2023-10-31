<%@page import="com.alok.entity.User"%>
<%@page import="com.alok.dao.CategoryDao"%>
<%@page import="com.alok.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.alok.entity.Category"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! login first");
	response.sendRedirect("login.jsp");
	return;
} else if (user.getUserType().equals("normal")) {
	session.setAttribute("message", "You are not admin ! Do not access this page");
	response.sendRedirect("login.jsp");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin panel</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/nav.jsp"%>
	
	<div class="container admin">
	
	<div class="container-fluid mt-3">
		<%@include file="components/message.jsp"%>
	</div>
	
	
		<div class="row mt-3">
			<div class="col-md-4">
				<!--  1st col -->
				<div class="card">
					<div class="card-body text-center">

						<div class="container">
							<img alt="user_pic" style="max-width: 125px"
								class="img-fluid rounded-circle" src="images/user.png">
						</div>
						<h1>234</h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<!--  2nd col -->
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img alt="category" style="max-width: 125px"
								class="img-fluid rounded-circle" src="images/list.png">
						</div>
						<h1>2344</h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>

			</div>

			<div class="col-md-4">
				<!--  3rd col -->
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img alt="product" style="max-width: 125px"
								class="img-fluid rounded-circle" src="images/product.png">
						</div>
						<h1>2344</h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>


			</div>
		</div>

		<!-- 2nd row -->
		<div class="row mt-3 mb-3">
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle" style="max-width: 125px"
								alt="" src="images/list.png">
						</div>
						<p>click here to add category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img class="img-fluid rounded-circle" style="max-width: 125px"
								alt="" src="images/keys.png">
						</div>
						<p>Click here to add new product</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- add category modal -->
	<!-- Button trigger modal -->
<!--  	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#add-category-modal">Launch demo modal</button> -->

	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">
					<input type="hidden"  name="operation"  value="addcategory">
						<div class="form-group">
							<input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required />
						</div>
						
						<div class="form-group">
							
							 <textarea  class="form-control" style="height:250px" placeholder="Enter category description" name="catDescription" required >
							</textarea>
						</div>
						
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
						</div>
						
					</form>
				</div>
				
			</div>
		</div>
	</div>
	<!-- end of add category modal -->
	
	<!-- add product modal -->
	
	<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- form -->
        
        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
        
        <input type="hidden " name="operation" value="addproduct" />
        	<!-- product title -->
        	<div class="form-group">
        		<input type="text" name="pName" placeholder="Enter title of product" class="form-control" required />
        	</div>
        	
        	<!-- product description -->
        	<div class="form-group">
        		<textarea class="form-control" name="pDesc" placeholder="Enter product description" style="height:250px"></textarea>
        	</div>
        	
        	<!-- product price -->
        	<div class="form-group">
        		<input type="number" name="pPrice" class="form-control" placeholder="enter product price" required/>
        	</div>
        	
        	<!-- product discount -->
        	<div class="form-group">
        		<input type="number" name="pDiscount" class="form-control" placeholder="enter product discout" required />
        	</div>
        	
        	<!-- product quantity -->
        	<div class="form-group">
        		<input type="number" class="form-control" name="pQuantity" placeholder="Enter product quantity" required />
        	</div>
        	
        	<!-- product category -->
        	<%
        		CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
        		List<Category> list=cdao.getCategories();
        		
        	%>
        	<div class="form-group">
        		<select name="catId" class="form-control" id="">
        			<%
        				for(Category c:list){
        					
        			
        			%>
        			<option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle()  %></option>
        			<% } %>
        			
        			
        		</select>
        	</div>
        	
        	<!-- product file -->
        	<div class="form-group">
        		<input type="file" name="pPic " required />
        	</div>
        	
        	<!-- submit button -->
        	<div class="container text-center" >
        		<button class="btn btn-outline-success">Add product</button>
        	</div>
        	
        
        <!-- end form -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
      </form>
    </div>
  </div>
</div>
	
	
	
	
	
	
	
	<!-- end of add product modal -->
</body>
</html>