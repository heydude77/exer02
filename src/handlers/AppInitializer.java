package handlers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/*
 * application Event�� Listener 2�� 
 *  - ServletContextListener : init, destroy
 *  
 *  - ServletContextAttributeListener : setAttribute, removeAttribute
 * 
 * �� EventListener�� ����� �ʿ���. (�ڵ����� ��ϵ��� �ʴ´�)
 * 
 */
public class AppInitializer implements ServletContextListener {
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			e.printStackTrace();
		}
		List<String> loggedIn = new ArrayList<>();
		ServletContext ctx = sce.getServletContext();	
		ctx.setAttribute("loggedIn", loggedIn);
	
		ctx.setRequestCharacterEncoding("UTF-8");	
	}
}
