<%@page import="entitys.Users"%>

<%
Users user2 = (Users) session.getAttribute("current-user");

if (user2 == null) {
	session.setAttribute("message", "You Are Not Logged in! Login First!");
	response.sendRedirect("Login.jsp");
	return;
}
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Chart | Checkout</title>

<%@ include file="Components/common_css_js.jsp"%>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/profileStyle.css">

</head>
<body>

	<!-- Top menu -->
	<%@ include file="Components/Topmenu.jsp"%>

	<!-- Navber -->
	<%@ include file="Components/Navber.jsp"%>

	<div class="container-fluid mt-4">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<div class="modal-body cart-body"></div>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<div class="modal-body">
							<form action="Checkout" method="post">
								<div class="mb-3">
									<label for="InputName" class="form-label">Enter Name</label>
									<input type="text" name="InputName" class="form-control" id="InputName" value="<%=user2.getUserName()%>" placeholder="Enter Your Name" required="required">
								</div>

								<div class="mb-3">
									<label for="InputEmail1" class="form-label"> Enter Email</label>
									<input type="email" name="InputEmail1" class="form-control" id="InputEmail1"
										aria-describedby="emailHelp" value="<%=user2.getUserEmail()%>" placeholder="Enter Your Email id" required="required">
									<div id="emailHelp" class="form-text"></div>
								</div>
								
								<div class="mb-3">
									<label for="InputShipingAddress" class="form-label">Enter Shipping Address</label>
									<textarea class="form-control" name="InputShipingAddress" id="InputShipingAddress" rows="3" value="<%=user2.getUserAddress()%>" placeholder="Enter your Address" required="required"></textarea>
								</div>

								<div class="mb-3 form-check">
									<input type="checkbox" class="form-check-input" id="exampleCheck1" required="required">
										<label class="form-check-label" for="exampleCheck1">Agree our term & Condition</label>
								</div>
								<div class="container text-center">
								<a href="#!"><button type="submit" class="btn btn-outline-success">Submit</button></a>
								<a href="index.jsp"><button type="button" class="btn btn-outline-primary">Continue Shopping</button></a>
								</div>
							</form>

						</div>
					</div>

				</div>

			</div>
			</div>
			</div>





			<!-- Common cart modal -->
			<%@ include file="Components/AddToCardModule.jsp"%>


			<!-- User Profile js file -->
			<script src="js/p_jquery-3.3.1.min.js"></script>
			<script src="js/p_popper.min.js"></script>
			<script src="js/p_bootstrap.min.js"></script>
			<script src="js/p_owl.carousel.min.js"></script>
			<script src="js/p_main.js"></script>

			<!-- Script main -->
			<script src="js/script.js"></script>
</body>
</html>