<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
<%
	boolean hasErr = session.getAttribute("senterror")!=null;
%>
<h1>《쪽지 전송》</h1>  

	<a href="<%=application.getContextPath()%>/message/send.jsp"><button type="button">메세지 작성</button></a>
	<a href="<%=application.getContextPath()%>/message/box.jsp"><button type="button">메세지 함</button></a>
	<a href="<%=application.getContextPath()%>/index.jsp"><button type="button">메인으로</button></a>	

<%@ include file="/layout/bottom.jspf"%>