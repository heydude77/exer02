<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mode = request.getParameter("mode");
%>
<%@ include file="/layout/top.jspf"%>
<h3 ><span style="font-size: xx-large;">회원인증</span> | <a href="<%=application.getContextPath()%>/join.jsp">회원가입</a></h3>  

<div class="w3-panel w3-pale-green w3-bottombar w3-border-green w3-border">
  <p>사용자 계정을 통해 인증 후 <b>로그인</b>을 진행합니다.<br/>
	《인증유지하기》시 최대 30일까지 인증절차가 생략됩니다.<br/>
	개인PC나 휴대기기가 아니면 사용을 권장하지 않습니다.</p>
</div>	
<form action="<%=application.getContextPath() %>/logon.jsp" method="post" autocomplete="off">
	<p>
		<b>계정 아이디(*)</b> <br/>
		<input type="text" style="font-size: 16px; padding: 5px" name="logid" placeholder="계정 아이디"/>
	</p>
	<p>
		<b>계정 비밀번호(*)</b><br/>
		<input type="password" style="font-size: 16px; padding: 5px" name="logpass" placeholder="계정 비밀번호"/>
	</p>
	<%if(mode !=null && mode.equals("fail")){ %>
	<p style="color: red; font-size: small;">
		아이디 또는 비밀번호를 확인하세요. 
	</p>
	<%} %>
	<p>
		<input type="checkbox" name="keep" value="on"/>인증유지하기
	</p>
	<p>
		<button type="submit" style="font-size: 16px; padding: 5px">인 증 하 기</button>
	</p>
</form>