<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "beans.*" %>
<%@ page import = "java.util.*" %>
<%
	MybatisDao mdao = new MybatisDao();
	
	List<Map> list = mdao.getAllResult();
%>
<%@ include file="/layout/top.jspf"%>
	<h1> 게시판 </h1>  
	<a href="<%=application.getContextPath()%>/board/write.jsp"><button type="button">글작성</button></a>	
	<br/>
	<br/>
	
	<%for (int i=0; i<list.size()-1; i++) { %>
    
    	작성자 : <%=list.get(i).get("WRITER") %> 글제목 : <%=list.get(i).get("TITLE")%>
    	작성시간: <%=list.get(i).get("LEFTDATE") %> 추천수 : <%=list.get(i).get("GOOD")%> <br/>
    
    <%} %>
<%@ include file="/layout/bottom.jspf"%>

<% 
	/*
	필요한 사용자측 체이지
	   - 글작성 / 글 작성 처리 (2)
	   - 전체글 확인 (1)
	   - 상세글 페이지 (...)
	 
	 처리할 Datavase작업
	   - 데이터 하나 insert
	   - 전체데이터 select
	   - 특정데이터 select (by no) == 보류
	
	
	*/
%>