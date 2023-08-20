package servlets;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserCount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserCount() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		ServletContext ctx = getServletContext();

		int totalUser = (Integer) ctx.getAttribute("totaluser");
		int currUser = (Integer) ctx.getAttribute("currentuser");
		int destroyUser = (Integer) ctx.getAttribute("currentuser");

		session.setAttribute("totaluser", totalUser);
		session.setAttribute("curruser", currUser);
		session.setAttribute("destroyuser", destroyUser);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
