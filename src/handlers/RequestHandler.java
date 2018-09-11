package handlers;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import beans.LoginLogDao;

public class RequestHandler implements ServletRequestListener, ServletRequestAttributeListener{
	// ServletRequestListener's
	@Override
	public void requestInitialized(ServletRequestEvent sre) {
		// 요청이 들어와서 JSP or Servlet이 작동 전
		ServletRequest req = sre.getServletRequest();
		HttpServletRequest request = (HttpServletRequest)req;
						
		String query = request.getQueryString();	
		String uri = request.getRequestURI()+(query!=null ? "?"+query : "");
		if(request.getSession().isNew()) {
		request.getSession().setAttribute("current",uri);			
		
		Cookie[] ar = request.getCookies();
		String user = null;
			if(ar != null) {
				for(int i=0; i<ar.length; i++) {
					if(ar[i].getName().equals("keepLogin")){				
						user = ar[i].getValue();
						request.getSession().setAttribute("auth", true);				
						request.getSession().setAttribute("logid", user);
						
						}
					}
			}
		LoginLogDao ldao = new LoginLogDao();
		Map log = ldao.getLatesetLogById(user);
			if(log != null) {
				request.getSession().setAttribute("latest", log.get("time"));
			}
		}
	
		
	}@Override
	public void requestDestroyed(ServletRequestEvent sre) {
		// JSP or Servlet 작동 해서 응답을 보낸 후
		ServletRequest req = sre.getServletRequest();
	}
	
	// ServletRequestAttributeListener
	// 아직 해보지 않았지만, request 에도 attribute 작업을 할 수 있다.
	// 응답 보내기 전까지만 유지가 됨. 응답 보내면 사라짐.왜 이런 일회성 attribute를 하는가?
	// MVC 설계를 하게되면 이유를 알게 됨. -지금은 request도 attribute 가능하다는걸 보면 됨.
	
	
	
	
	@Override
	public void attributeAdded(ServletRequestAttributeEvent srae) {
		
	}@Override
	public void attributeReplaced(ServletRequestAttributeEvent srae) {
	
	}@Override
	public void attributeRemoved(ServletRequestAttributeEvent srae) {
	
	}
	

}