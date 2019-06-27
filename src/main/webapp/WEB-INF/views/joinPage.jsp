<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="resources/css/mainPage.css?ver=1.0">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

var msg = '${msg}';

$('document').ready(function(){
	if(msg != ''){
		alert(msg);
	}
});

</script>
</head>
<body>
<center>
	<nav id="navi">
        <h1><a href="http://localhost:8282/project/"><img src="resources/images/yangach.svg"></a></h1>
    </nav>
    <br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
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
		<td><input type="password" id="pw" name="pw"></td>
		</tr>
        <tr>
        <td>이메일</td>
        <td><input type="email" id="mail" name="mail"></td>
        </tr>
        <tr>
		<td>핸드폰번호</td>
        <td><input type="text" id="phone" name="phone1"> - <input type="text" id="phone" name="phone2"> - <input type="text" id="phone" name="phone3"> </td>
        </tr>		
	</table>
	</fieldset>
	<input type="submit" value="회원가입">
	</form>
	
</center>
</body>
</html>
