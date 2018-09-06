<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="beans.MybatisDao"%>
<%@page import="java.util.*"%>
<%
	MybatisDao mdao = new MybatisDao();
	String no = (String)request.getParameter("no");
	String user =(String)session.getAttribute("logid");
	System.out.println(no);
	System.out.println(user);	
	
	
	Integer n= Integer.parseInt(no);
	String uri = (String)session.getAttribute("current");
	
	Map map= new HashMap();
	map.put("actor", user);
	map.put("target",n);
	
	int r = mdao.addGoodLog(map);
	System.out.println(r);
	System.out.println(uri+"?no="+no);
	///exer02/board/getContent.jsp/?no=31
	if (r==1){
		mdao.addGood(n);
		response.sendRedirect(uri+"?no="+no);
	}
	else {%>
	<%@ include file="/layout/top.jspf"%>
		<h2>이미 추천한 글입니다.</h2>
		
		<br/>
			<a href="<%=application.getContextPath()%>/board/index.jsp"><button type="button">게시판으로</button></a>
			<a href="<%=application.getContextPath()%>/index.jsp"><button type="button">메인으로</button></a>	
			
	<%@ include file="/layout/bottom.jspf"%>
	<% }%>	
 
    
