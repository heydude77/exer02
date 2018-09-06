package filters;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthFilter extends HttpFilter{
	
		public void init(FilterConfig filterConfig) throws ServletException {
			System.out.println("[TestFilter]init");
			String ex = filterConfig.getInitParameter("exclude");   
			System.out.println("exclude =" +ex);
		}		

		protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
				throws IOException, ServletException {
			
			String query = request.getQueryString();	
			String uri = request.getRequestURI()+(query!=null ? "?"+query : "");
			
			request.getSession().setAttribute("current",uri);		
			
			Boolean auth = (Boolean)request.getSession().getAttribute("auth");
			
			if (auth !=null && auth.equals(Boolean.TRUE)) {
				chain.doFilter(request, response);
				//response.sendRedirect(uri);
			} else {
			response.sendRedirect(request.getContextPath()+"/login.jsp");
			
			}
		}	
	
		public void destroy() {
			System.out.println("[TestFilter] destroy");
		}
	}