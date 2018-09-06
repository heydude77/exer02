<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
<%
	boolean hasErr = session.getAttribute("senterror")!=null;
%>
<h1>《쪽지 전송》</h1>  
<p style="font-size: small;">
	해당 사용자 계정 (<%=session.getAttribute("logid") %>)을 발신자로<br/>
	서비스 사용중인 다른 사용자에게	쪽지를 전송합니다.<br/>
	내용을 작성후 전송을 눌러주십시요.
</p>
<p style="font-size: small;">
	해당 사용자가 존재하지 않으면 처리되지 않습니다.	
</p>
	<% if(hasErr){ %>
		<small style="color: red"> 전송실패<br/> 수신자를 확인해주세요<</small>
		
	<%	} %>
	<form method="post" action="<%=application.getContextPath()%>/message/sent.jsp">
	<p>
		받을사람(*)<br/>
		<input type="text" placeholder="write a receiver" style="width: 220px; padding: 5px;" name="receiver"/>
	</p>
	<p>
		보낼내용(*)<br/>
		<textarea name="content" style="height: 170px; width: 220px; padding: 5px; resize: none; font-family: inherit;"
			placeholder="write a message"></textarea>	
	</p>
	<button class="w3-button w3-Indigo w3-hover-teal w3-round-large">메세지 전송</button>  

	</form>
	<a href="<%=application.getContextPath()%>/index.jsp">
	<button class="w3-button w3-Indigo w3-hover-teal w3-round-large">메인으로</button></a>	
	
<%@ include file="/layout/bottom.jspf"%>
