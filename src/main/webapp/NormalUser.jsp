<%@page import="entitys.Users"%>
<%
Users user = (Users) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "You Are Not Logged in! Login First!");
	response.sendRedirect("Login.jsp");
	return;
}

if (user.getUserType().equals("adminUser")) {
	session.setAttribute("message", "You are Admin User! Access Denied!");
	response.sendRedirect("AdminUser.jsp");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Cart | Home</title>
<%@ include file="Components/common_css_js.jsp"%>

<link rel="stylesheet" href="css/Topmenu.css" type="text/css">

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,700&display=swap"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=Source+Serif+Pro:400,600&display=swap"
	rel="stylesheet">
<!-- Style -->

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/profileStyle.css">
</head>
<body>

	<%@ include file="Components/Topmenu.jsp"%>
	<h3>Normal User Panel</h3>










	<!-- Common cart modal -->
	<%@ include file="Components/AddToCardModule.jsp"%>
	


	<!-- javscript -->
	<script src="js/p_jquery-3.3.1.min.js"></script>
	<script src="js/p_popper.min.js"></script>
	<script src="js/p_bootstrap.min.js"></script>
	<script src="js/p_owl.carousel.min.js"></script>
	<script src="js/p_main.js"></script> 
	
	<!-- Script main -->
	<script src="js/script.js"></script>

</body>
</html>