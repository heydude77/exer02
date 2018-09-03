package handlers;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionEventHandler implements HttpSessionListener {
	@Override
	public void sessionCreated(HttpSessionEvent se) {
	
	}
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		ServletContext ctx = session.getServletContext();
		String id = (String)session.getAttribute("logid");
		List<String> loggedIn = (List<String>)ctx.getAttribute("loggedIn");
		loggedIn.remove(id);
		ctx.setAttribute("loggedIn", loggedIn);
	}
}
