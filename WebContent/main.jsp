<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf" %>

	<form action="login.jsp"  method="post">
	<form>
	<p>
		아이디    :	<input type="text" name="id"/> <br/>		
		비밀번호 :	<input type="password" name="pw"/> <button>확인</button><br/>
	</p>
	</form>
	<p>
							 		 <small>계정이 아직 없으세요?</small><button action="join.jsp">회원가입</button>
	</p>
	

		
	
</body>
</html>