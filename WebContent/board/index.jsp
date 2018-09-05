<%@page import="java.text.SimpleDateFormat"%>
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
	<a href="<%=application.getContextPath()%>/index.jsp"><button type="button">메인으로</button></a>	
	<br/>
	<br/>
	 <table align="center" border="1">
	   	<thead>
	    	<tr>
	    		<td>글번호</td>
	    		<td>글쓴이</td>
	    		<td>글제목</td>
	    		<td>첨부파일</td>
	    		<td>추천수</td>  
	    		<td>작성시간</td>
	    		  	
	    	</tr>
   		</thead>
   		<tbody>
	<%for (int i=0; i<list.size(); i++) { 
		String title = (String)list.get(i).get("TITLE");
		if (title.length()>10){
			title = title.substring(0, 10);
			title +="···  ";
		}
		
		Date leftDate =(Date)list.get(i).get("LEFTDATE");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String date =format.format(leftDate);
		String attach =(String)list.get(i).get("ATTACH");
		attach = attach.substring(attach.lastIndexOf("/")+1, attach.length());
		String containFile = attach.equals("null") ? "X" : "O";
		
	%>
		<tr>
			<td><%=list.get(i).get("NO")%></td>
			<td><%=list.get(i).get("WRITER") %></td>
			<td><a href="<%=application.getContextPath()%>/board/getContent.jsp?no=<%=list.get(i).get("NO")%>"><%=title%></a></td>
			<td><%=containFile%></td>
			<td><%=list.get(i).get("GOOD")%></td>	
			<td><%=date%></td>
		</tr>	
   
    	
    
    <%} %>
    	</tbody>
     </table>
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