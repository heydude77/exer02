<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="/error/default.jsp" %>
<%@ page import="beans.*" %>
<%@ page import="java.util.*" %>
<%
	String logid =request.getParameter("logid");
	if(logid==null) {
		logid = (String)session.getAttribute("logid");
	}
	String logpass = request.getParameter("logpass");
	
 

	AccountDao dao= new AccountDao();
		
	Map acc = dao.getAccountById(logid);
	if(acc== null || !acc.get("pass").equals(logpass)) {
			response.sendRedirect(application.getContextPath()+"/login.jsp?mode=fail");	
	}else {
		List<String> loggedIn = (List<String>)application.getAttribute("loggedIn");
		
		loggedIn.add(logid);
		application.setAttribute("loggedIn", loggedIn);
			
			session.setAttribute("auth", true);
			session.setAttribute("logid", logid);
			
		/*	Cookie t = new Cookie("keepLogin", logid);	
			t.setMaxAge(60*60);	
			response.addCookie(t); */
			
			LoginLogDao ldao = new LoginLogDao();
			Map log = ldao.getLatesetLogById(logid);
			if(log != null) {
				session.setAttribute("latest", log.get("time"));
			}
			
			ldao.addLog(logid);
			String uri = (String)session.getAttribute("current");
			String linkTo = (String)request.getSession().getAttribute("contentLink");
			if (linkTo!=null){
				response.sendRedirect(application.getContextPath()+linkTo);
			}else if (uri ==null) {
				response.sendRedirect(application.getContextPath()+"/index.jsp");
			} else {
				response.sendRedirect(uri);
			}
			
		
	}
	
	

%>
