<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%
	List<String> loggedIn = (List<String>)application.getAttribute("loggedIn");
	String user = (String)session.getAttribute("logid");
	loggedIn.remove(user);
	System.out.println(user);
	System.out.println("user :"+ user);
	application.setAttribute("loggedIn", loggedIn);
	
	
%>
<html>
<body>
	접속중인 계정을 강제종료 시켰습니다. </br>
	<a href="<%=application.getContextPath()%>/login.jsp"><button type="button">로그인페이지</button></a>
</body>
</html>

