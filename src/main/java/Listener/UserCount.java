package Listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class UserCount implements HttpSessionListener {
	ServletContext ctx = null;
	private int totalUser = 0, currentUser = 0;

	public UserCount() {
	}

	public void sessionCreated(HttpSessionEvent se) {
		totalUser++;
		currentUser++;
		ctx = se.getSession().getServletContext();
		ctx.setAttribute("totaluser", totalUser);
		ctx.setAttribute("currentuser", currentUser);

	}

	public void sessionDestroyed(HttpSessionEvent se) {
		currentUser--;
		ctx.setAttribute("currentuser", currentUser);
	}

}
