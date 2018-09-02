<%@ page import = beans.* %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%  
	DAO dao = new DAO();
		
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	
	String secure = (String) session.getAttribute("secure");
	/* 
	if (contact.matches("\\d{3}-\\d{3,4}-\\d{4}") && code.equals(secure)) {
		session.setAttribute("pass", "on");
		session.setAttribute("contact", contact);
		response.sendRedirect("buy.jsp");
	} else {
		 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	<h2>회원 가입 페이지</h2>
	
	

	
</body>
</html>