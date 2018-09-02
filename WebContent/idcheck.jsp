<%@ page import = "beans.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		Dao dao = new Dao();
		if (dao.checkId(id)){
	%> 
		<script type = "text/javascript">
	   		alert("사용가능한 아이디 입니다.");
	   	 </script>
	   <%
	}else {
		%> 
		<script type = "text/javascript">
	   		alert("이미 사용중인 아이디 입니다.");
	    </script>
	   <%
	}
	
%>
</body>
</html>