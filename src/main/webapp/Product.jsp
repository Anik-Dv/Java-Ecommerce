<%@page import="dao.CategoryDao"%>
<%@page import="entitys.Categories"%>
<%@page import="entitys.Products"%>
<%@page import="java.util.List"%>
<%@page import="factoryProvider.FactoryProvider"%>
<%@page import="dao.ProductDao"%>
<%@ include file="Components/common_css_js.jsp"%>
<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
<title>View All Product</title>
<head>
<link rel="stylesheet" href="css/index.css" type="text/css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="css/index.css" type="text/css">
<Link rel="stylesheet" href="css/Productstyle.css" type="text/css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body>
	<%
	String category = request.getParameter("categories");
	ProductDao productdao = new ProductDao(new FactoryProvider().getSessionFactory());

	List<Products> productlist = null;

	if (category == null || category.trim().equals("all")) {
		productlist = productdao.getProducts();
	} else {
		int catId = Integer.parseInt(category.trim());
		productlist = productdao.getProductsByCategoryId(catId);
	}

	CategoryDao categorydao = new CategoryDao(new FactoryProvider().getSessionFactory());
	List<Categories> categoryList = categorydao.getCategories();
	%>

	<%@ include file="Components/Navber.jsp"%>

	<div class="container mt-5">
		<div class="row">
			<div class="col-sm-4 col-md-3">
				<form>
					<div class="well">
						<div class="row">
							<div class="col-sm-12">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search products..."> <span
										class="input-group-btn">
										<button class="btn btn-primary mt-1 mx-1" type="submit">
											<i class="fa fa-search"></i>
										</button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</form>

				<!-- Filter -->
				<form class="shop__filter">
					<!-- Price -->
					<h3 class="headline">
						<span>Price</span>
					</h3>
					<div class="radio">
						<input type="radio" name="shop-filter__price"
							id="shop-filter-price_1" value="" checked=""> <label
							for="shop-filter-price_1">Under $25</label>
					</div>
					<div class="radio">
						<input type="radio" name="shop-filter__price"
							id="shop-filter-price_2" value=""> <label
							for="shop-filter-price_2">$25 to $50</label>
					</div>
					<div class="radio">
						<input type="radio" name="shop-filter__price"
							id="shop-filter-price_3" value=""> <label
							for="shop-filter-price_3">$50 to $100</label>
					</div>
					<div class="radio">
						<input type="radio" name="shop-filter__price"
							id="shop-filter-price_4" value="specify"> <label
							for="shop-filter-price_4">Other (specify)</label>
					</div>
					<form>
						<div class="form-group shop-filter__price">
							<span><b>Customize Your Price Here</b></span>
							<div class="row">
								<div class="col-xs-4">
									<label for="shop-filter-price_from" class="sr-only"></label> <input
										id="shop-filter-price_from" type="number" min="0"
										class="form-control" placeholder="From">
								</div>
								<div class="col-xs-4">
									<label for="shop-filter-price_to" class="sr-only"></label> <input
										id="shop-filter-price_to" type="number" min="0"
										class="form-control" placeholder="To">
								</div>
								<div class="col-xs-4">
									<button type="submit"
										class="btn btn-sm btn-outline-primary btn-default">Search</button>
								</div>
							</div>
						</div>
					</form>
					<!-- Checkboxes -->
					<h3 class="headline">
						<span>Category</span>
					</h3>

					<!-- java code -->
					<%
					for (Categories c : categoryList) {
					%>
					<!-- Java code close -->
					<div class="checkbox">
						<a href="Product.jsp?categories=<%=c.getCatagoryId()%>"
							style="text-decoration: none; line-height: 1px"><h6
								for="shop-filter-checkbox_1"><%=c.getTitle()%></h6></a>
					</div>

					<%
					}
					%>

					<!-- Radios -->
					<h3 class="headline">
						<span>Material</span>
					</h3>
					<div class="radio">
						<input type="radio" name="shop-filter__radio"
							id="shop-filter-radio_1" value="" checked=""> <label
							for="shop-filter-radio_1">100% Cotton</label>
					</div>
					<div class="radio">
						<input type="radio" name="shop-filter__radio"
							id="shop-filter-radio_2" value=""> <label
							for="shop-filter-radio_2">Bamboo</label>
					</div>
					<div class="radio">
						<input type="radio" name="shop-filter__radio"
							id="shop-filter-radio_3" value=""> <label
							for="shop-filter-radio_3">Leather</label>
					</div>
					<div class="radio">
						<input type="radio" name="shop-filter__radio"
							id="shop-filter-radio_4" value=""> <label
							for="shop-filter-radio_4">Polyester</label>
					</div>
					<div class="radio">
						<input type="radio" name="shop-filter__radio"
							id="shop-filter-radio_5" value=""> <label
							for="shop-filter-radio_5">Not specified</label>
					</div>

					<!-- Colors -->
					<h3 class="headline">
						<span>Colors</span>
					</h3>
					<div class="shop-filter__color">
						<input type="text" id="shop-filter-color_1" value=""
							data-input-color="black"> <label
							for="shop-filter-color_1" style="background-color: black;"></label>
					</div>
					<div class="shop-filter__color">
						<input type="text" id="shop-filter-color_2" value=""
							data-input-color="gray"> <label for="shop-filter-color_2"
							style="background-color: gray;"></label>
					</div>
					<div class="shop-filter__color">
						<input type="text" id="shop-filter-color_3" value=""
							data-input-color="brown"> <label
							for="shop-filter-color_3" style="background-color: brown;"></label>
					</div>
					<div class="shop-filter__color">
						<input type="text" id="shop-filter-color_4" value=""
							data-input-color="beige"> <label
							for="shop-filter-color_4" style="background-color: beige;"></label>
					</div>
					<div class="shop-filter__color">
						<input type="text" id="shop-filter-color_5" value=""
							data-input-color="white"> <label
							for="shop-filter-color_5" style="background-color: white;"></label>
					</div>
				</form>
			</div>
			<div class="col-sm-8 col-md-9">

				<div class="row">
					<!-- java code -->
					<%
					for (Products product : productlist) {
					%>
					<!-- Close Code -->
					<div class="col-sm-6 col-md-4">
						<div class="shop__thumb">
								<div class="shop-thumb__img">
									<img src="image/product/<%=product.getpImage()%>"
										class="img-responsive" alt="product image"
										style="width: 237px; height: 200px;">
								</div>
								<h5 class="shop-thumb__title"><%=product.getpTitle()%></h5>
								<div class="shop-thumb__price">
									<span class="shop-thumb-price_old">$ <%=product.getpPrice()%></span>
									<span class="shop-thumb-price_new">$ <%=product.getPriceAfterDiscout()%></span>
								</div>
								<button type="button" class="btn btn-sm btn-outline-info">Check
									Details</button>
								<button type="button" class="btn btn-sm btn-outline-info" onclick="addToCart(<%=product.getpId()%>, <%=product.getpTitle()%>, <%=product.getpPrice()%>)">Add To Card
									Details</button>
							</a>
						</div>
					</div>
					<%
					}
					if (productlist.size() == 0) {
					%>

					<p>No Product has available!</p>

					<%
					}
					%>
				</div>

			</div>


		</div>
		<!-- / .row -->

		<!-- Product Section Close -->

		<!-- Pagination -->
		<div class="row">
			<div class="col-sm-12">

				<nav aria-label="Page navigation example">
					<ul class="pagination mx-5 pull-right">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>

			</div>
		</div>
		<!-- / .row -->

	</div>
	<!-- / .col-sm-8 -->
	</div>
	<!-- / .row -->
	</div>

	<%@ include file="Components/Footer.jsp"%>

</body>
</html>