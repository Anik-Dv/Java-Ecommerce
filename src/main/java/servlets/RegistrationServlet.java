package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import entitys.Users;
import factoryProvider.FactoryProvider;

public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().println("get");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("request : post");

		// get all parameters
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phoneNumber = request.getParameter("phoneNumber");
		// String userphoto = (String)request.getParameter("userphoto");
		String useraddress = request.getParameter("useraddress");
		String gender = request.getParameter("gender");
		response.getWriter().println(name);

		// creating user object
		Users user = new Users(name, email, password, phoneNumber, "default.jpg", useraddress, gender, "NormalUser");

		// Session Tracking
		HttpSession session = request.getSession();

		if (name.isEmpty() || email.isEmpty() || password.isEmpty() || phoneNumber.isEmpty() || useraddress.isEmpty()
				|| gender.isEmpty()) {
			session.setAttribute("message", "Please Fill All Field!");
			response.sendRedirect("Registration.jsp");
			return;
		} else {

			try {
				// Configuration Hibernate
				Session hibernateSession = new FactoryProvider().getSessionFactory().openSession();

				int userId = (Integer) hibernateSession.save(user);

				Transaction tx = hibernateSession.beginTransaction();
				tx.commit();

				hibernateSession.close();

				session.setAttribute("userId", userId);
				session.setAttribute("message", "Registration SuccessFull");
				response.sendRedirect("Registration.jsp");
				return;

			} catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("message", "Something Went Worng!");
			}
		}
	}

}
