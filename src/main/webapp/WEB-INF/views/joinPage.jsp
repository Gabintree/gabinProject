<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 신청서</title>
</head>

<body>

	<form action="join" method="post">
	<fieldset>
	<legend>회원가입 신청서</legend>
	<table>
		<tr>
		<td>이름</td>
		<td><input type="text" id="name" name="name"></td>
		</tr>
	    <tr>
    	<td>아이디</td>
		<td><input type="text" id="id" name="id"></td>
        </tr>
        <tr>
		<td>비밀번호</td>
		<td><input type="text" id="pw" name="pw"></td>
		</tr>
        <tr>
        <td>이메일</td>
        <td><input type="mail" id="mail" name="mail">@<input type="mail" id="mail" name="mail"></td>
        </tr>
        <tr>
		<td>핸드폰번호</td>
        <td><input type="text" id="phone" name="phone"> - <input type="text" id="phone" name="phone"> - <input type="text" id="phone" name="phone"> </td>
        </tr>		
	</table>
	</fieldset>
	<input type="submit" value="회원가입">
	</form>
	

</body>
</html>
