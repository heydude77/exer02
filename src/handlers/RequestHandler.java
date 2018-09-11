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
		// ��û�� ���ͼ� JSP or Servlet�� �۵� ��
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
		// JSP or Servlet �۵� �ؼ� ������ ���� ��
		ServletRequest req = sre.getServletRequest();
	}
	
	// ServletRequestAttributeListener
	// ���� �غ��� �ʾ�����, request ���� attribute �۾��� �� �� �ִ�.
	// ���� ������ �������� ������ ��. ���� ������ �����.�� �̷� ��ȸ�� attribute�� �ϴ°�?
	// MVC ���踦 �ϰԵǸ� ������ �˰� ��. -������ request�� attribute �����ϴٴ°� ���� ��.
	
	
	
	
	@Override
	public void attributeAdded(ServletRequestAttributeEvent srae) {
		
	}@Override
	public void attributeReplaced(ServletRequestAttributeEvent srae) {
	
	}@Override
	public void attributeRemoved(ServletRequestAttributeEvent srae) {
	
	}
	

}