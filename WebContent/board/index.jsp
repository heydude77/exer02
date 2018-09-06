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

<div align="center" class="w3-panel w3-black" >
  <h1 class="w3-opacity"> 게시판 </h1>
</div>


<p>
	
	<a href="<%=application.getContextPath()%>/board/write.jsp">
	<button class="w3-button w3-Indigo w3-hover-teal w3-round-large">글작성</button></a>
	<a href="<%=application.getContextPath()%>/index.jsp">
	<button class="w3-button w3-Indigo w3-hover-teal w3-round-large">메인으로</button></a>	
</p>	
	 <table align="center" border="1" padding="1px" >
	   	<thead>
	    	<tr>
	    		<td><b>글번호</b></td>
	    		<td style = "width:200px;" ><b>글제목</b></td>
	    		<td><b>글쓴이</b></td>
	    		<td><b>첨부파일</b></td>
	    		<td><b>추천수</b></td>  
	    		<td><b>작성시간</b></td>
	    		  	
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
			<td style =padding-left:7px;text-align:left; ><a href="<%=application.getContextPath()%>/board/getContent.jsp?no=<%=list.get(i).get("NO")%>"><%=title%></a></td>
			<td><small><%=list.get(i).get("WRITER") %></small></td>
			<td><small><%=containFile%></small></td>
			<td><small><%=list.get(i).get("GOOD")%></small></td>	
			<td><small><%=date%></small></td>
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