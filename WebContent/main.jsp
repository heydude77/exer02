<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf" %>

	
	
			<h2>회원 가입 페이지</h2>
	
	<form action="join.jsp"  method="post">
		<table border="1" ="center", align="center">
		<tr>
			<td> 아이디  :</td>
			<td><input type="text" name="joinid"/>
			<c:if test = "${errors.id}">ID를 입력하세요.</c:if>
			</td>
			</tr>
		<tr>
			<td>비밀번호 :	</td>
			<td><input type="password" name="joinpw"/>
			<c:if test = "${errors.password}">암호를 입력하세요.</c:if>
			</td>
		</tr>
		<tr>
			<td>이름 :</td>
			<td> <input type="text" name="joinname"/>
			<c:if test = "${errors.name}">이름을 입력하세요.</c:if>
			</td>
			
		</tr>
		<tr>
			<td>성별 : </td>
			<td> 남:<input type="radio" name ="gender" value="M">여:<input type="radio" name ="gender" value="F"></input> </td> 
			<td><button type="submit" >회원가입</button></td>
		</tr>	
		
		</table>
	</form>
	
		<small>이미 계정이 있으세요?</small>	<button action="login.jsp">로그인 </button>
	
		
			
</body>
</html>