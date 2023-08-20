
<%@page import="java.util.List"%>
<%@page import="factoryProvider.FactoryProvider"%>
<%@page import="dao.CategoryDao"%>
<%@page import="entitys.Categories"%>
<%@page import="entitys.Products"%>
<head>
 <!-- Css Styles -->
</head>

<%
CategoryDao cat_dao = new CategoryDao(new FactoryProvider().getSessionFactory());
List<Categories> cat_list = cat_dao.getCategories();

%>

 <!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="index.jsp" style="text-decoration: none"><h3>E-Cart</h3></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="index.jsp">Shop</a></li>
                            <li><a href="index.jsp#filterProduct">Categories</a>
                                <ul class="header__menu__dropdown">
                            		<% for(Categories cg : cat_list) { %>
                                    <li><a href="index.jsp?categoris=<%=cg.getCatagoryId()%>#filterProduct"><%=cg.getTitle()%></a></li>
                            		<% } %>
                                </ul>
                            </li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li data-bs-toggle="modal" data-bs-target="#staticBackdrop"><a href="#"><i class="fa fa-shopping-bag"></i> <span class="cart-items" onclick="updatecart()"> </span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$150.00</span></div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
    
    <!-- Js Plugins -->
<!-- <script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/main.js"></script> -->