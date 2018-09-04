<%@ page import="java.sql.Date"%>
<%@ page import="java.util.UUID"%>
<%@ page import="beans.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String receiver = request.getParameter("receiver");
	String content = request.getParameter("content");
	String sender = (String) session.getAttribute("logid");
	Date senddate = new Date(System.currentTimeMillis());
	String code = UUID.randomUUID().toString().split("-")[0];

	MessageDao mdao = new MessageDao();
	int r = mdao.addMessage(code, sender, receiver, content, senddate);

	if (r != 1) {
		session.setAttribute("senterror",1);
		//response.sendRedirect(application.getContextPath() + "/message/send.jsp?rst=fail");
	} else {
%>
<%@ include file="/layout/top.jspf"%>
<h1>《쪽지 전송》</h1>
<p>
	<%=receiver %> 님에게 쪽지를 발송하였습니다.<br/>
</p>
<p>
	<a href="<%=application.getContextPath()%>/message/box.jsp"><button type="button">메세지목록</button></a>
	<a href="<%=application.getContextPath()%>/message/send.jsp"><button type="button">메세지작성</button></a>
</p>
<%@ include file="/layout/bottom.jspf"%>
<%
	}
%>

