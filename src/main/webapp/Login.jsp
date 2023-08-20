<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
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
 <link rel="stylesheet" href="css/profileStyle.css">
<link rel="stylesheet" href="css/style.css"> 


<!-- javscript -->
 <script src="js/p_jquery-3.3.1.min.js"></script>
<script src="js/p_popper.min.js"></script>
<script src="js/p_bootstrap.min.js"></script>
<script src="js/p_owl.carousel.min.js"></script>
<script src="js/p_main.js"></script>

<link rel="stylesheet" href="css/registration.css" type="text/css">
</head>
<body>
	<%@ include file="Components/Topmenu.jsp"%>
	<div class="form-control" style="background-color: #152733">
		<div class="container-fluid">
			<div class="col-md-12 offset-md-12">
				<div class="form-body">
					<div class="row">
						<div class="form-holder">
							<div class="form-content">
								<div class="form-items">
									<h3 class="text-center">User Login</h3>
									<p class="text-center">Fill in the data below.</p>
									<%@ include file="Components/Alerts.jsp"%>
									<form class="requires-validation" action="LoginServlet"
										method="post">

										<div class="col-md-12" style="margin-top: 13px">
											<input class="form-control" type="email" name="email"
												placeholder="E-mail Address" required>
											<div class="valid-feedback">Email field is valid!</div>
											<div class="invalid-feedback">Email field cannot be
												blank!</div>
										</div>

										<div class="col-md-12 mt-1">
											<input class="form-control" type="password" name="password"
												placeholder="Password" required>
											<div class="valid-feedback">Password field is valid!</div>
											<div class="invalid-feedback">Password field cannot be
												blank!</div>
										</div>

										<div class="form-button mt-3">
											<button id="submit" type="submit"
												class="btn btn-outline-primary">Login</button>
										</div>
										<div class="form-button mt-1 mb-2">
											<label class="form-check-label">If You Not Have an
												Account Then </label> <a href="Registration.jsp">
												<button id="button" type="button"
													class="btn btn-sm btn-outline-primary">Registration</button>
											</a>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>