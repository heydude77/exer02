<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%
	response.setStatus(200);
%>
<%@ include file="/layout/top.jspf"%>
	<h3 style="color: red">ERROR</h3>
	<p>
		<%=exception.toString() %>
	</p>
	<a href="<%=application.getContextPath()%>/index.jsp">
	<button class="w3-button w3-round w3-black">메인으로</button></a>
<%@ include file="/layout/bottom.jspf"%>