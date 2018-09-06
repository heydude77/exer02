<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setStatus(200);
%>
<%@ include file="/layout/top.jspf"%>
<h3 ><span style="font-size: xx-large;">회원가입</span> | <a href="<%=application.getContextPath()%>/login.jsp">회원인증</a></h3>  
<div class="w3-panel w3-pale-green w3-bottombar w3-border-green w3-border">
  <p>이 어플리케이션의 대부분의 서비스는 <br/>
	회원가입을 통해 등록된 사용자에게 제공되고 있습니다.<br/>
	아직 사용자 계정이 없으십니까?<br/>
  </p>
</div>	
<div class="w3-panel w3-pale-blue w3-bottombar w3-border-green w3-border">
  <p>아이디는 영문,숫자 4~12자 내외이며, 이름은 한글만 설정가능하고,<br/>
	비밀번호는 4자 이상으로 설정바랍니다. <br/>
  </p>
</div>	
<form action="<%=application.getContextPath() %>/joined.jsp" method="post" autocomplete="off">
	<p>
		<b>아이디(*)</b> <br/>
		<input type="text" style="font-size: 16px; padding: 5px" name="id" placeholder="pick a account id"/>
	</p>
	<p>
		<b>이름(*)</b> <br/>
		<input type="text" style="font-size: 16px; padding: 5px" name="name" placeholder="tell us your name"/>
	</p>
	<p>
		<b>비밀번호(*)</b><br/>
		<input type="password" style="font-size: 16px; padding: 5px" name="pass" placeholder="create password"/>
	</p>
	<p>
		<b>성별(*)</b><br/>
		<input type="radio" style="font-size: 16px; padding: 5px" name="gender" value="M" checked/><span style="font-size: 16px; padding: 5px">남성</span>
		
		<input type="radio" style="font-size: 16px; padding: 5px" name="gender" value="F"/><span style="font-size: 16px; padding: 5px">여성</span>
	</p>
	<p>
		<button type="submit" style="font-size: 16px; padding: 5px">회 원 가 입</button>
	</p>
</form>
<%@ include file="/layout/bottom.jspf"%>