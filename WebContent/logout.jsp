<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%  
 	List<String> list = (List<String>)application.getAttribute("loggedIn");
	String id = (String)session.getAttribute("logid");
	list.remove(id);
	application.setAttribute("loggedIn", list);
	Cookie t = new Cookie("keepLogin","off");
	t.setMaxAge(0);		
	session.invalidate();
	Thread.sleep(2000);
	response.sendRedirect(application.getContextPath()+"/login.jsp");
%>