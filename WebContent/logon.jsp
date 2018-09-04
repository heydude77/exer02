<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="/error/default.jsp" %>
<%@ page import="beans.*" %>
<%@ page import="java.util.*" %>
<%
	String logid =request.getParameter("logid");
	String logpass = request.getParameter("logpass");
	
 

	AccountDao dao= new AccountDao();
		
	Map acc = dao.getAccountById(logid);
	if(acc== null || !acc.get("pass").equals(logpass)) {
			response.sendRedirect(application.getContextPath()+"/login.jsp?mode=fail");	
	}else {
		List<String> loggedIn = (List<String>)application.getAttribute("loggedIn");
		if(loggedIn.contains(logid)){
			session.setAttribute("logid", logid);
			%>
			<html>
			<body>
				이미 접속중인 아이디 입니다. </br>
				<a href="<%=application.getContextPath()%>/index.jsp"><button type="button">메인으로</button></a>
				<a href="<%=application.getContextPath()%>/forceLogout.jsp"><button type="button">접속끊기</button></a>
			</body>
			</html>
			<%
		}else {
			loggedIn.add(logid);
			application.setAttribute("loggedIn", loggedIn);
			
			session.setAttribute("auth", true);
			session.setAttribute("logid", logid);
			
			LoginLogDao ldao = new LoginLogDao();
			Map log = ldao.getLatesetLogById(logid);
			if(log != null) {
				session.setAttribute("latest", log.get("time"));
			}
			
			ldao.addLog(logid);
			String uri = (String)session.getAttribute("current");
			if (uri ==null) {
				response.sendRedirect(application.getContextPath()+"/index.jsp");
			} else {
				response.sendRedirect(uri);
			}
			
		}
	}
	
	

%>
