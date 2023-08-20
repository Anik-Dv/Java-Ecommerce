<%@page import="dao.CategoryDao"%>
<%@page import="entitys.Products"%>
<%@page import="java.util.List"%>
<%@page import="factoryProvider.FactoryProvider"%>
<%@page import="dao.ProductDao"%>
<%@page import="entitys.Categories"%>
<%@ include file="Components/common_css_js.jsp"%>
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">

<%
ProductDao prdao = new ProductDao(new FactoryProvider().getSessionFactory());
List<Products> prlist = prdao.getProducts();
%>

<!-- Latest Product Section Begin -->
<section class="latest-product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>Latest Products</h4>
					<div class="latest-product__slider owl-carousel">
						
						<%
						for (Products p : prlist) {
						%>
						<div class="latest-prdouct__slider__item">
							<a href="Product.jsp" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="image/product/<%=p.getpImage()%>" alt="product image">
								</div>
								<div class="latest-product__item__text">
									<h6><%=p.getpTitle()%></h6>
									<span>$ <%=p.getpPrice()%></span>
								</div>
							</a>
						</div>
						<%
						};
						%>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>Top Rated Products</h4>
					<div class="latest-product__slider owl-carousel">
							<%
						for (Products p : prlist) {
						%>
						<div class="latest-prdouct__slider__item">
							
							<a href="Product.jsp" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="image/product/<%=p.getpImage()%>" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6><%=p.getpTitle()%></h6>
									<span>$ <%=p.getpPrice()%></span>
								</div>
							</a> 
							
						</div>
						<%
						};
						%>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>Review Products</h4>
					<div class="latest-product__slider owl-carousel">
					<%
						for (Products p : prlist) {
						%>
						<div class="latest-prdouct__slider__item">
							<a href="Product.jsp" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="image/product/<%=p.getpImage()%>" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6><%=p.getpTitle()%></h6>
									<span>$ <%=p.getpPrice()%></span>
								</div>
							</a>
						</div>
						<% } %>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Latest Product Section End -->


