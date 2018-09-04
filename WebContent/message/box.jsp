<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
<%@ page import = "beans.*" %>
<%@ page import = "java.util.*" %>
<% 
	String logid =(String) session.getAttribute("logid"); 
	
	MessageDao mDao = new MessageDao();
	
	List<Map> message = mDao.getMessagesByReceiver(logid);
%>
<h1> 메세지함 </h1>  
<p>
	<%=logid %>님에게 온 메세지 리스트</br>
	
===================================
</p>
<p>
	<% if (message==null) {%>
		<%=logid %>님에게 온 메세지가 없습니다.
	<%} else {%>
	<%for (int i =0; i<message.size()-1;i++){
		String sender = (String)message.get(i).get("sender");	// 보낸사람
		String content = (String)message.get(i).get("content"); 	//내용
		Date senddate = (Date)message.get(i).get("senddate");	 //보낸시간		
	%>
		<%=sender %> : <%=content%> (<%=senddate %>) </br>
	<%}%> </br>
	===================================
	<%} %>
</p>
	<a href="<%=application.getContextPath()%>/message/send.jsp"><button type="button">메세지 작성</button></a>
	<a href="<%=application.getContextPath()%>/index.jsp"><button type="button">메인으로</button></a>	
	
<%@ include file="/layout/bottom.jspf"%>