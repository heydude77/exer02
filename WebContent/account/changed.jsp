<%@ page import="beans.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String oldPw = request.getParameter("oldPw");
	String newPw = request.getParameter("newPw");
	String newPwConfirm = request.getParameter("newPwConfirm");
	String logid = (String)session.getAttribute("logid");
	
	AccountDao dao = new AccountDao();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
	if (!(newPw.equals(newPwConfirm))) { %>
		새암호와 새암호 확인이 일치하지 않습니다. 
	 <a href="<%=application.getContextPath()%>/account/change.jsp">돌아가기</a>
	<%} else {
		dao.setOnesPass(logid, newPw); %>
		비밀번호가 성공적으로 바뀌었습니다.
	 <a href="<%=application.getContextPath()%>/index.jsp">메인으로</a>
	<%}
 %>
</body>
</html>