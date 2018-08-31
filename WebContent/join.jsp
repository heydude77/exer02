<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	<h2>회원 가입 페이지</h2>
	
	<form action="createAccount.jsp" method="post">
	<table border="1" ="center">
	<tr>
		<td> 아이디  :</td>
		<td><input type="text" name="joinid"/></td>
	</tr>
	<tr>
		<td>비밀번호 :	</td>
		<td><input type="password" name="joinpw"/></td>
	</tr>
	<tr>
		<td>이름 :</td>
		<td> <input type="text" name="joinname"/></td>
	</tr>
	<tr>
		<td>성별 : </td>
		<td> 남:<input type="radio" name ="gender" value="M">여:<input type="radio" name ="gender" value="F"></input> </td> 
	
	</tr>

	<tr>
		<td></td>
		<td>
		<button type="submit" align ="right;">확인</button></td>
	</tr>
	<tr>
	</table>
	</form>

	
</body>
</html>