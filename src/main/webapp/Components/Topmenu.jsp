<%@page import="entitys.Users"%>
<%
Users checkUser = (Users) session.getAttribute("current-user");
%>

<%
if (checkUser == null) {
%>

<div class="header__top">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="header__top__left">
					<ul>
						<li><a href="index.jsp"
							style="color: #050505; text-transform: uppercase; font-weight: bold;">
								E-Cart </a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="header__top__right">
					<div class="header__top__right__social">
						<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"> <i
							class="fa fa-twitter"></i></a> <a href="#"><i
							class="fa fa-linkedin"></i></a> <a href="#"><i
							class="fa fa-pinterest-p"></i></a>
					</div>
					<div class="header__top__right__language">
						<div>English</div>

						<ul>
							<li><a href="#">Spanis</a></li>
							<li><a href="#">English</a></li>
						</ul>
					</div>

					<div class="header__top__right__auth">
						<a href="Login.jsp"><i class="fa fa-user"></i> Login</a>
						<div class="header__top__Left__auth">
							<a href="Registration.jsp"><i class="fa fa-user-plus"></i>
								Signup</a>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
</div>

<%
} else {
%>

<div class="header__top">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="header__top__left">
					<ul>
						<%
						if (checkUser.getUserType().equals("adminUser")) {
						%>
						<li><a href="index.jsp"
							style="color: #050505; text-transform: uppercase; font-weight: bold;">
								E-Cart | Your Online Shopping Mall </a></li>

						<%
						} else if (checkUser.getUserType().equals("normalUser")) {
						%>

						<li><a href="index.jsp"
							style="color: #050505; text-transform: uppercase; font-weight: bold;">
								E-Cart | Your Online Shopping Mall </a></li>
						<%
						}
						%>
					</ul>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="header__top__right">
					<div class="header__top__right__social">
						<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
							class="fa fa-twitter"></i></a> <a href="#"><i
							class="fa fa-linkedin"></i></a> <a href="#"><i
							class="fa fa-pinterest-p"></i></a>
					</div>
					<div class="header__top__right__language">
						<div>English</div>

						<ul>
							<li><a href="#">Bangla</a></li>
							<li><a href="#">English</a></li>
						</ul>
					</div>


					<div class="container">
						<div class="row justify-content-center text-center">
							<div class="col-md-5">
								<div class="dropdown custom-dropdown">
									<a href="#" data-toggle="dropdown"
										class="d-flex align-items-center dropdown-link text-left"
										aria-haspopup="true" aria-expanded="false" data-offset="0, 20">
										<div class="profile-pic mr-3">
											<img src="image/anik_pic.png" alt="Image">
										</div>
										<div class="profile-info">
											<h3><%=checkUser.getUserName()%></h3>
											<span>See More</span>
										</div>
									</a>

									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<%
										 if (checkUser.getUserType().equals("adminUser")) {
										%>
										<a class="dropdown-item" href="index.jsp">
										<span class="icon icon-dashboard"></span> 
											Go Sale Page </a>
										
										<a class="dropdown-item" href="AdminUser.jsp">
										<span class="icon icon-dashboard"></span> 
											Go To Dashboard </a>
										<%
										 } else if (checkUser.getUserType().equals("normalUser")) {
										%>
										<a class="dropdown-item" href="index.jsp">
										<span class="icon icon-dashboard"></span> 
											Go Sale Page </a>
										
										<a class="dropdown-item" href="NormalUser.jsp">
										<span class="icon icon-dashboard"></span> 
											Go To Profile
										</a>
										
										<% } %>
										
										<a class="dropdown-item" href="LogoutServlet">
										<span class="icon icon-sign-out"></span>Log out</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
</div>
