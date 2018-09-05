<%@page import="beans.MybatisDao"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	MybatisDao mdao = new MybatisDao();
	String no = (String)request.getParameter("no");
	Number n= Integer.parseInt(no);
	Map map = mdao.getOneResultByNumber(n);
%>	

<%@ include file="/layout/top.jspf"%>
	<h1> 게시글 보기 </h1> 
	
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
			<%
				String title = (String)map.get("TITLE");
				Date leftDate =(Date)map.get("LEFTDATE");
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				String date =format.format(leftDate);
				String attach =(String)map.get("ATTACH");
				attach = attach.substring(attach.lastIndexOf("/")+1, attach.length());
				String containFile = attach.equals("null") ? "X" : "O";
				String content = (String)map.get("CONTENT");
			%>
				<tr>
					<td><%=map.get("NO")%></td>
					<td><%=map.get("WRITER") %></td>
					<td><%=title%></td>
					<td><%=containFile%></td>
					<td><%=map.get("GOOD")%></td>	
					<td><%=date%></td>
					
				</tr>	
		</tbody>
		</table>
		
		<textarea title="글 내용" style="height: 170px; width: 500px; padding: 5px; resize: none; font-family: inherit;" readonly><%=content%></textarea>
		<br/>
		
		<%if (containFile.equals("O")){ %>
		<table align="center" border="1">
			<td>첨부파일 : <%=attach%> </td>
			<td><a href="<%=application.getContextPath()%>/board/download.jsp">Click to Download</a></td>
		</table>
		<%} %>
		<br/>
		<a href="<%=application.getContextPath()%>/board/addGood.jsp?no=<%=map.get("NO")%>"><button type="button">글 추천하기</button></a> // <small>추천하지않고</small>
		<a href="<%=application.getContextPath()%>/board/index.jsp"><button type="button">게시판으로</button></a>
		<a href="<%=application.getContextPath()%>/index.jsp"><button type="button">메인으로</button></a>	
		
		
			
	
<%@ include file="/layout/bottom.jspf"%>
<%@ include file="/layout/bottom.jspf"%>
