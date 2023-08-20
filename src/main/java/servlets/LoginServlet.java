package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import entitys.Users;
import factoryProvider.FactoryProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession httpSession = request.getSession();

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		// Validations
		if(email.isEmpty() || password.isEmpty()) {
			httpSession.setAttribute("message", "Enter Valid Credentials");
			response.sendRedirect("Login.jsp");
			return;
		}

		// Authentication Users
		UserDao userDao = new UserDao(new FactoryProvider().getSessionFactory());
		Users user = userDao.getUserByEmailAndPassword(email, password);


		if(user == null) {
			httpSession.setAttribute("message", "Invalid Details! Try Again! ");
			response.sendRedirect("Login.jsp");
			return;
		} else {
			//out.println("welcome " + user.getUserName());
			httpSession.setAttribute("message", "Login Successfully");

			httpSession.setAttribute("current-user", user);

			if(user.getUserType().equals("normalUser")) {
				response.sendRedirect("NormalUser.jsp");
			} else if(user.getUserType().equals("adminUser")){
				response.sendRedirect("AdminUser.jsp");
			} else {
				httpSession.setAttribute("message", "Sorry! We Can't Identify Your User Type!");
				response.sendRedirect("Login.jsp");
				return;
			}
		}

	}

}
