<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setStatus(200);
%>
<%@ include file="/layout/top.jspf"%>
<h1>비밀번호 변경</h1>  
<p style="font-size: small;">
	해당 사용자 계정의 비밀번호를 변경합니다.<br/>
	현재 사용중인 비밀번호와 변경하실 비밀번호를 입력후<br/>
	변경 적용 을 눌러주십시오. 
</p>
<form action="<%=application.getContextPath() %>/account/changed.jsp" method="post" autocomplete="off">
	<p>
		<b>기존 비밀번호(*)</b> <br/>
		<input type="password" style="font-size: 16px; padding: 5px" name="oldPw" placeholder="old password"/>
	</p>
	<p>
		<b>새로운 비밀번호(*)</b> <br/>
		<input type="password" style="font-size: 16px; padding: 5px" name="newPw" placeholder="new password"/>
	</p>
	<p>
		<b>비밀번호 재확인(*)</b><br/>
		<input type="password" style="font-size: 16px; padding: 5px" name="newPwConfirm" placeholder="password confirm"/>
	</p>
	<p>
		<button type="submit" style="font-size: 16px; padding: 5px">변 경 적 용</button>
	</p>
</form>
<%@ include file="/layout/bottom.jspf"%>