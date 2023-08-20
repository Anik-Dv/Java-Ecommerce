<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
<%@ include file="Components/common_css_js.jsp"%>
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
									<h3 class="text-center">Register Today</h3>
									<p class="text-center">Fill in the data below.</p>
									<%@ include file="Components/Alerts.jsp"%>
									<form class="requires-validation" action="RegistrationServlet"
										method="post">
										<div class="col-md-12" style="margin-top: 13px">
											<input class="form-control" type="text" name="name"
												placeholder="Full Name" required>
											<div class="valid-feedback">Username field is valid!</div>
											<div class="invalid-feedback">Username field cannot be
												blank!</div>
										</div>
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

										<div class="col-md-12" style="margin-top: 13px">
											<input class="form-control" type="number" name="phoneNumber"
												placeholder="Phone Number" required>
											<div class="valid-feedback">Phone Number field is
												valid!</div>
											<div class="invalid-feedback">Phone Number field cannot
												be blank!</div>
										</div>
										<div class="col-md-12" style="margin-top: 13px">
											<input class="form-control form-control-sm" id="formFileSm"
												type="file" name="userphoto" placeholder="Select Your Photo">
										</div>

										<div class="col-md-12" style="margin-top: 13px">
											<textarea class="form-control"
												id="exampleFormControlTextarea1" name="useraddress" rows="2"
												placeholder="Enter Your Address"></textarea>
										</div>

										<div class="col-md-12" style="margin-top: 13px">
											<label class="mb-3 mr-1" for="gender">Gender: </label> <input
												type="radio" class="btn-check" name="gender" id="male"
												autocomplete="off" required> <label
												class="btn btn-sm btn-outline-secondary" for="male">Male</label>

											<input type="radio" class="btn-check" name="gender"
												id="female" autocomplete="off" required> <label
												class="btn btn-sm btn-outline-secondary" for="female">Female</label>

											<input type="radio" class="btn-check" name="gender"
												id="secret" autocomplete="off" required> <label
												class="btn btn-sm btn-outline-secondary" for="secret">Secret</label>
											<div class="valid-feedback mv-up">You selected a
												gender!</div>
											<div class="invalid-feedback mv-up">Please select a
												gender!</div>
										</div>

										<div class="form-check">
											<input class="form-check-input" type="checkbox" value=""
												id="invalidCheck" required> <label
												class="form-check-label">I confirm that all data are
												correct</label>
											<div class="invalid-feedback">Please confirm that the
												entered data are all correct!</div>
										</div>
										<div class="form-button mt-3">
											<button id="submit" type="submit"
												class="btn btn-outline-primary">Registration</button>
										</div>
										<div class="form-button mt-1 mb-2">
											<label class="form-check-label">If You Have an
												Account Already Then </label> <a href="Login.jsp">
												<button id="button" type="button"
													class="btn btn-sm btn-outline-primary">Login</button>
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