<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="beans.MybatisDao"%>
<%@page import="java.util.*"%>
<%
	MybatisDao mdao = new MybatisDao();
	String no = (String)request.getParameter("no");
	Number n= Integer.parseInt(no);
	mdao.addGood(n);
%>	
 
    
<%@ include file="/layout/top.jspf"%>
	<h2>해당 게시글의 추천하셨습니다.</h2>
	
	<br/>
		<a href="<%=application.getContextPath()%>/board/index.jsp"><button type="button">게시판으로</button></a>
		<a href="<%=application.getContextPath()%>/index.jsp"><button type="button">메인으로</button></a>	
<%@ include file="/layout/bottom.jspf"%>