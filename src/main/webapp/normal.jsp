<%@page import="com.alok.entity.User"%>
<% 
	User user2=(User)session.getAttribute("current-user");
	if(user2==null){
		session.setAttribute("message", "You are not logged in!!, please log in first");
		response.sendRedirect("login.jsp");
		return;
	}else if(user2.getUserType().equals("admin")){
		session.setAttribute("message", "you are not normal user !!!do not access this page");
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
<title>Normal user</title>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
	<%@include file="components/nav.jsp" %>
	<h1>This is normal user  panel page</h1>
</body>
</html>