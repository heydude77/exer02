package handlers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/*
 * application Event용 Listener 2개 
 *  - ServletContextListener : init, destroy
 *  
 *  - ServletContextAttributeListener : setAttribute, removeAttribute
 * 
 * ※ EventListener는 등록이 필요함. (자동으로 등록되지 않는다)
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
