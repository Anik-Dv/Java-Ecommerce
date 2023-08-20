<%@page import="helperClassess.Helper"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.UserDao"%>
<%@page import="entitys.Products"%>
<%@page import="dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="factoryProvider.FactoryProvider"%>
<%@page import="dao.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entitys.Categories"%>
<%@page import="entitys.Users"%>
<%
Users user1 = (Users) session.getAttribute("current-user");

if (user1 == null) {
	session.setAttribute("message", "You Are Not Logged in! Login First!");
	response.sendRedirect("Login.jsp");
	return;
}

if (user1.getUserType().equals("normalUser")) {
	session.setAttribute("message", "Access Denied! You are Normal User!");
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
<title>E-Cart | Admin Panel</title>
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

<link rel="stylesheet" href="css/materialdesignicons.min.css" />
<link rel="stylesheet" href="css/flag-icon.min.css" />
<link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet"
	href="css/bootstrap-datepicker/bootstrap-datepicker.min.css" />

<link rel="stylesheet" href="css/styleAdminPage.css" />
</head>

<%
// get create helper class and call method countUser and get user.
Map<String, Long> map = Helper.CountUser(new FactoryProvider().getSessionFactory());
Long user_count = map.get("usercount");
%>

<body>
	<%@ include file="Components/Topmenu.jsp"%>
	<div class="container-scroller">

		<div class="main-panel">
			<div class="content-wrapper pb-0">
				<div class="page-header flex-wrap">
					<h3 class="mb-0">
						Hi, welcome back!
						<%=user1.getUserName()%><span
							class="pl-0 h6 pl-sm-2 text-muted d-inline-block">Your
							Store analytics Dashboard </span>
					</h3>
					<%@ include file="Components/Alerts.jsp"%>
					<div class="row-reverse"
						style="display: flex; flex-direction: row-reverse;">
						<button type="button"
							class="btn btn-sm bg-white btn-icon-text border">
							<i class="mdi mdi-email btn-icon-prepend"></i> Email
						</button>

						<button type="button"
							class="btn btn-sm bg-white btn-icon-text border ml-3">
							<i class="mdi mdi-printer btn-icon-prepend"></i> Print
						</button>

						<!-- Modal add: Add Categories -->
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-sm ml-3 btn-success"
							data-bs-toggle="modal" data-bs-target="#staticBackdropCat">
							Add Categories</button>

						<!-- Modal -->
						<div class="modal fade" id="staticBackdropCat"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="staticBackdropLabel">Add
											Categories</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>

									<!-- Form start -->
									<form action="AddOperationProductAndCategories" method="post">
										<div class="modal-body">

											<input type="hidden" name="operation"
												value="categoryOperation" />
											<div class="mb-3">
												<label for="exampleInputEmail1" class="form-label">Category
													Title </label> <input type="text" name="categoryTitle"
													class="form-control" id="exampleInputEmail1"
													aria-describedby="emailHelp">
											</div>
											<div class="mb-3">
												<label for="exampleFormControlTextarea1" class="form-label">Category
													Description</label>
												<textarea class="form-control" name="categoryDescription"
													id="exampleFormControlTextarea1" rows="3"></textarea>
											</div>

										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
											<button type="submit" class="btn btn btn-outline-primary">Add
												Category</button>
										</div>
									</form>
									<!-- Form Close -->
								</div>
							</div>
						</div>
						<!-- Modal closed: Add Categories -->

						<!-- Modal add: Add Products -->
						<button type="button" class="btn btn-sm ml-3 btn-success"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop">
							Add Products</button>
						<!-- Modal -->
						<div class="modal fade" id="staticBackdrop"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="staticBackdropLabel">Add
											Products</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<!-- Form start -->
									<form action="AddOperationProductAndCategories" method="post"
										enctype="multipart/form-data">
										<div class="modal-body">

											<input type="hidden" name="operation"
												value="productOperation" />
											<div class="mb-3">
												<label for="exampleInputEmail1" class="form-label">Product
													Title </label> <input type="text" name="productTitle"
													class="form-control" id="exampleInputEmail1"
													aria-describedby="emailHelp">
											</div>
											<div class="mb-3">
												<label for="exampleFormControlTextarea1" class="form-label">Product
													Description</label>
												<textarea class="form-control" name="productDescription"
													id="exampleFormControlTextarea1" rows="3"
													style="height: 140px"></textarea>
											</div>
											<div class="mb-3">
												<label for="formFileSm" class="form-label">Upload
													Product Image</label> <input class="form-control form-control-sm"
													name="productImage" id="formFileSm" type="file">
											</div>
											<div class="mb-3">
												<label for="exampleInputEmail1" class="form-label">Product
													Price </label> <input type="number" class="form-control"
													name="productPrice" id="exampleInputEmail1"
													aria-describedby="emailHelp">
											</div>
											<div class="mb-3">
												<label for="exampleInputEmail1" class="form-label">Product
													Discount </label> <input type="number" class="form-control"
													name="productDiscount" id="exampleInputEmail1"
													aria-describedby="emailHelp">
											</div>
											<div class="mb-3">
												<label for="exampleInputEmail1" class="form-label">Product
													Quantity </label> <input type="number" class="form-control"
													name="productQuantity" id="exampleInputEmail1"
													aria-describedby="emailHelp">
											</div>

											<%
											// product Category
											CategoryDao cdao = new CategoryDao(new FactoryProvider().getSessionFactory());
											List<Categories> clist = cdao.getCategories();
											%>

											<select class="form-select"
												aria-label="Default select example" name="selectCategoryId">
												<%
												for (Categories c : clist) {
												%>
												<option value="<%=c.getCatagoryId()%>"><%=c.getTitle()%></option>

												<%
												}
												%>
											</select>


										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
											<button type="submit" class="btn btn btn-outline-primary">Add
												Product</button>
										</div>
									</form>
									<!-- Form Close -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal closed: Add Products -->
				<div class="row">
					<div class="col-xl-3 col-lg-12 stretch-card grid-margin">
						<div class="row">
							<div
								class="col-xl-12 col-md-6 stretch-card grid-margin grid-margin-sm-0 pb-sm-3">
								<div class="card bg-warning">
									<div class="card-body px-3 py-4">
										<div class="d-flex justify-content-between align-items-start">
											<div class="color-card">
												<p class="mb-0 color-card-head">Sales</p>
												<h2 class="text-white">
													$8,753.<span class="h5">00</span>
												</h2>
											</div>
											<i
												class="card-icon-indicator mdi mdi-basket bg-inverse-icon-warning"></i>
										</div>
										<h6 class="text-white">18.33% Since last month</h6>
									</div>
								</div>
							</div>
							<div
								class="col-xl-12 col-md-6 stretch-card grid-margin grid-margin-sm-0 pb-sm-3">
								<div class="card bg-danger">
									<div class="card-body px-3 py-4">
										<div class="d-flex justify-content-between align-items-start">
											<div class="color-card">
												<p class="mb-0 color-card-head">Categorys</p>
												<h2 class="text-white"><%=clist.size()%></h2>
											</div>

											<i
												class="card-icon-indicator mdi mdi-cube-outline bg-inverse-icon-danger"></i>
										</div>
										<h6 class="text-white">13.21% Since last month</h6>
									</div>
								</div>
							</div>

							<div class="col-xl-12 col-md-6 stretch-card pb-sm-3 pb-lg-0">
								<div class="card bg-success">
									<div class="card-body px-3 py-4">
										<div class="d-flex justify-content-between align-items-start">
											<div class="color-card">
												<p class="mb-0 color-card-head">Affiliate</p>
												<h2 class="text-white">2368</h2>
											</div>
											<i
												class="card-icon-indicator mdi mdi-account-circle bg-inverse-icon-success"></i>
										</div>
										<h6 class="text-white">20.32% Since last month</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-9 stretch-card grid-margin">
						<div class="card">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-7">
										<h5>Business Survey</h5>
										<p class="text-muted">Show overview</p>
									</div>
									<div class="col-sm-5 text-md-right">
										<button type="button"
											class="btn btn-icon-text mb-3 mb-sm-0 btn-inverse-primary font-weight-normal">
											<i class="mdi mdi-email btn-icon-prepend"></i>Download Report
										</button>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-4">
										<div class="card mb-3 mb-sm-0">
											<div class="card-body py-3 px-4">
												<p class="m-0 survey-head">Users</p>
												<div
													class="d-flex justify-content-between align-items-end flot-bar-wrapper">
													<div>
														<h3 class="m-0 survey-value"><%=user_count%></h3>
														<p class="text-success m-0">+3 avg. User</p>
													</div>
													<div id="earningChart" class="flot-chart"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="card mb-3 mb-sm-0">
											<div class="card-body py-3 px-4">
												<p class="m-0 survey-head">Total Product</p>
												<div
													class="d-flex justify-content-between align-items-end flot-bar-wrapper">
													<div>
														<%
														// product
														ProductDao pdao = new ProductDao(new FactoryProvider().getSessionFactory());
														List<Products> plist = pdao.getProducts();
														%>
														<h3 class="m-0 survey-value"><%=plist.size()%></h3>
														<p class="text-success fs-0.1 m-0">Total Added Product</p>
													</div>
													<div id="productChart" class="flot-chart"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="card">
											<div class="card-body py-3 px-4">
												<p class="m-0 survey-head">Orders</p>
												<div
													class="d-flex justify-content-between align-items-end flot-bar-wrapper">
													<div>
														<h3 class="m-0 survey-value">$4,354</h3>
														<p class="text-success m-0">-310 avg. sales</p>
													</div>
													<div id="orderChart" class="flot-chart"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row my-3">
									<div class="col-sm-12">
										<div class="flot-chart-wrapper">
											<div id="flotChart" class="flot-chart">
												<canvas class="flot-base"></canvas>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-8">
										<p class="text-muted mb-0">
											Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
											do eiusmod tempor incididunt ut labore et dolore. <b>Learn
												More</b>
										</p>
									</div>
									<div class="col-sm-4">
										<p class="mb-0 text-muted">Sales Revenue</p>
										<h5 class="d-inline-block survey-value mb-0">$2,45,500</h5>
										<p class="d-inline-block text-danger mb-0">last 8 months</p>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<footer class="footer">
				<h6 class="text-center">
					<span> <b>&copy; E-char </b> | Online Shopping
						Application-2023
					</span>
				</h6>
			</footer>
			<!-- main-panel ends -->

			<!-- Common cart modal -->
			<%@ include file="Components/AddToCardModule.jsp"%>


		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="js/AdminPanel_vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="js/AdminPanel_Chart.min.js"></script>
	<script src="js/jquery.flot.js"></script>
	<script src="js/jquery.flot.resize.js"></script>
	<script src="js/jquery.flot.categories.js"></script>
	<script src="js/jquery.flot.fillbetween.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.pie.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="js/AdminPanel_off-canvas.js"></script>
	<script src="js/AdminPanel_hoverable-collapse.js"></script>
	<script src="js/AdminPanel_misc.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<script src="js/AdminPanel_dashboard.js"></script>
	<!-- End custom js for this page -->


	<!-- User icon Script -->
	<script src="js/p_poper.min.js"></script>
	<script src="js/p_owl.carousel.min.js"></script>
	<script src="js/p_main.js"></script>
	<script src="js/p_jquery-3.3.1.min.js"></script>
	<script src="js/p_bootstrap.min.js"></script>
	<!-- user script close -->

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