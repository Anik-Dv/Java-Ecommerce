<%@page import="helperClassess.Helper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>E-Cart | Home</title>

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

<!-- Java Code -->
<%
String c = request.getParameter("categoris");
ProductDao prdao = new ProductDao(new FactoryProvider().getSessionFactory());
List<Products> prList = null;

if (c == null || c.trim().equals("all")) {
	prList = prdao.getProducts();
} else {
	int cid = Integer.parseInt(c.trim());
	prList = prdao.getProductsByCategoryId(cid);
}

CategoryDao catdao = new CategoryDao(new FactoryProvider().getSessionFactory());
List<Categories> catlist = catdao.getCategories();
%>
<!-- Java Code Close -->


<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	
	<!-- Top menu -->
	<%@ include file="Components/Topmenu.jsp"%>
	
	<!-- Navber -->
	<%@ include file="Components/Navber.jsp"%>

	<!-- Hero Section Begin -->
	<%@ include file="Components/HeroSection.jsp"%>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="image/banner/banner3.jpeg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2 class="text-light">E-Cart Shop</h2>
						<div class="breadcrumb__option">
							 <span class="text-light">Home</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->


	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">

						<div class="sidebar__item">
							<h4>Price</h4>
							<div class="price-range-wrap">
								<div
									class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
									data-min="10" data-max="540">
									<div class="ui-slider-range ui-corner-all ui-widget-header"></div>
									<span tabindex="0"
										class="ui-slider-handle ui-corner-all ui-state-default"></span>
									<span tabindex="0"
										class="ui-slider-handle ui-corner-all ui-state-default"></span>
								</div>
								<div class="range-slider">
									<div class="price-input">
										<input type="text" id="minamount"> <input type="text"
											id="maxamount">
									</div>
								</div>
							</div>
						</div>
						<div class="sidebar__item sidebar__item__color--option">
							<h4>Colors</h4>
							<div class="sidebar__item__color sidebar__item__color--white">
								<label for="white"> White <input type="radio" id="white">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--gray">
								<label for="gray"> Gray <input type="radio" id="gray">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--red">
								<label for="red"> Red <input type="radio" id="red">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--black">
								<label for="black"> Black <input type="radio" id="black">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--blue">
								<label for="blue"> Blue <input type="radio" id="blue">
								</label>
							</div>
							<div class="sidebar__item__color sidebar__item__color--green">
								<label for="green"> Green <input type="radio" id="green">
								</label>
							</div>
						</div>

						<div class="sidebar__item">
							<h4>Popular Size</h4>
							<div class="sidebar__item__size">
								<label for="large"> Large <input type="radio" id="large">
								</label>
							</div>
							<div class="sidebar__item__size">
								<label for="medium"> Medium <input type="radio"
									id="medium">
								</label>
							</div>
							<div class="sidebar__item__size">
								<label for="small"> Small <input type="radio" id="small">
								</label>
							</div>
							<div class="sidebar__item__size">
								<label for="tiny"> Tiny <input type="radio" id="tiny">
								</label>
							</div>
						</div>
						<div class="sidebar__item">
							<h4>Categories</h4>
							<ul>
								<li><a href="index.jsp?categoris=all">All Category</a></li>
								<%
								for (Categories cat : catlist) {
								%>
								<li><a href="index.jsp?categoris=<%=cat.getCatagoryId()%>"><%=cat.getTitle()%></a></li>
								<%
								}
								%>
							</ul>
						</div>
						<div class="sidebar__item">
							<div class="latest-product__text">
								<h4>Latest Products</h4>
								<div class="latest-product__slider owl-carousel">
									<%
									for (Products p : prList) {
									%>
									<div class="latest-prdouct__slider__item">
										<a href="#" class="latest-product__item">
											<div class="latest-product__item__pic">
												<img src="image/product/<%=p.getpImage()%>"
													alt="product image">
											</div>
											<div class="latest-product__item__text">
												<h6><%=Helper.getProduct10Word(p.getpTitle())%></h6>
												<span>$ <%=p.getpPrice()%></span>
											</div>
										</a>
									</div>
									<%
									}
									if (prList.size() == 0) {
									%>
									<p>No Offer Available now!</p>
									<%
									}
									%>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-9 col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>Sale Off</h2>
						</div>
						<div class="row">
							<div class="product__discount__slider owl-carousel">
								<%
								ProductDao proddao = new ProductDao(new FactoryProvider().getSessionFactory());
								List<Products> prodList = proddao.getProducts();
								for (Products p : prodList) {
								%>
								<div class="col-lg-4">
									<div class="product__discount__item">
										<div class="product__discount__item__pic set-bg"
											data-setbg="image/product/<%=p.getpImage()%>">
											<div class="product__discount__percent"><%=p.getpDiscount()%>%
											</div>
											<ul class="product__item__pic__hover">
												<li><a href="#!"><i class="fa fa-heart"></i></a></li>
												<li><a href="#!"><i class="fa fa-retweet"></i></a></li>
												<li onclick="addToCart('<%=p.getpId()%>','<%=p.getpTitle()%>', '<%=p.getPriceAfterDiscout()%>')">
													<a href="#!"><i class="fa fa-shopping-cart"></i></a>
												</li>
											</ul>
										</div>
										<div class="product__discount__item__text">
											<span>Mobile</span>
											<h5>
												<a href="#"><%=Helper.getProduct10Word(p.getpTitle())%></a>
											</h5>
											<div class="product__item__price">
												$<%=p.getPriceAfterDiscout()%>
												<span>$ <%=p.getpPrice()%></span>
											</div>
											<a href="#"><button type="button"
													class="btn btn-sm btn-outline-success mt-2">Buy
													Now</button></a>
											<button type="button"
												onclick="addToCart('<%=p.getpId()%>','<%=p.getpTitle()%>', '<%=p.getPriceAfterDiscout()%>')"
												class="btn btn-sm btn-outline-success mt-2">Add
												Cart</button>

										</div>
									</div>
								</div>
								<%
								}
								if (prList.size() == 0) {
								%>
								<p>No Product Available!</p>
								<%
								}
								%>
							</div>
						</div>
					</div>
					<h2 class="text-center" id="filterProduct">Filter Product</h2>
					<div class="filter__item">
						<div class="row">
							<div class="col-lg-4 col-md-5">
								<div class="filter__sort">
									<span>Sort By</span> <select>
										<option value="0">Default</option>
										<option value="5">Only 5 Product</option>
									</select>
								</div>
							</div>
							<div class="col-lg-4 col-md-4">
								<div class="filter__found">
									<h6>
										<span><%=prList.size()%></span> Products found
									</h6>
								</div>
							</div>
							<div class="col-lg-4 col-md-3">
								<div class="filter__option">
									<span class="icon_grid-2x2"></span> <span class="icon_ul"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<%
						for (Products p : prList) {
						%>
						<div class="col-lg-4 col-md-6 col-sm-6">
							<div class="product__item">
								<div class="product__item__pic set-bg"
									data-setbg="image/product/<%=p.getpImage()%>">
									<ul class="product__item__pic__hover">
										<li><a href="#"><i class="fa fa-heart"></i></a></li>
										<li><a href="#"><i class="fa fa-retweet"></i></a></li>
										<li onclick="addToCart('<%=p.getpId()%>', 'image/product/<%=p.getpImage()%>', '<%=p.getpTitle()%>', '<%=p.getPriceAfterDiscout()%>')">
											<a href="#!"><i class="fa fa-shopping-cart"></i></a>
										</li>
									</ul>
								</div>
								<div class="product__item__text">
									<h6>
										<a href="#"><%=Helper.getProduct10Word(p.getpTitle())%></a>
									</h6>
									<h5>
										$<%=p.getpPrice()%></h5>
									<a href="#"><button type="button"
											class="btn btn-sm btn-outline-success mt-2">Buy Now</button></a>

									<button type="button"
										class="btn btn-sm btn-outline-success mt-2"
										onclick="addToCart('<%=p.getpId()%>','<%=Helper.getProduct10Word(p.getpTitle())%>', '<%=p.getPriceAfterDiscout()%>')">Add
										Cart</button>

								</div>
							</div>
						</div>
						<%
						}
						if (prList.size() == 0) {
						%>
						<p>No Product Available!</p>
						<%
						}
						%>
					</div>
					<div class="product__pagination">
						<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"><i
							class="fa fa-long-arrow-right"></i></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Section End -->

	<%@ include file="Components/AddToCardModule.jsp"%>

	<!-- Footer Section Begin -->
	<%@ include file="Components/Footer.jsp"%>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="js/herosection_jquery-3.3.1.min.js"></script>
	<script src="js/herosection_bootstrap.min.js"></script>
	<script src="js/herosection_jquery.nice-select.min.js"></script>
	<script src="js/herosection_jquery-ui.min.js"></script>
	<script src="js/herosection_jquery.slicknav.js"></script>
	<script src="js/herosection_mixitup.min.js"></script>
	<script src="js/herosection_owl.carousel.min.js"></script>
	<script src="js/herosection_main.js"></script>
	<script src="js/script.js"></script>
	
	<!-- User icon Script -->
	<script src="js/p_poper.min.js"></script>
	<script src="js/p_owl.carousel.min.js"></script>
	<script src="js/p_main.js"></script>
	<script src="js/p_jquery-3.3.1.min.js"></script>
	<script src="js/p_bootstrap.min.js"></script>
	<!-- user script close -->
	
	<!-- User Profile js file -->
	 <script src="js/p_jquery-3.3.1.min.js"></script>
	<script src="js/p_popper.min.js"></script>
	<script src="js/p_bootstrap.min.js"></script>
	<script src="js/p_owl.carousel.min.js"></script>
	<script src="js/p_main.js"></script>
	
	


</body>

</html>