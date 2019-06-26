<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style>

body {
background-image:url("resources/cloud.png");


}
</style>
<title>첫 화면 / 메인페이지</title>
</head>

<body>

가빈이네 홈페이지에 오신 것을 환영합니다. 
<hr>
<img src="resources/bearGumi.jpg">
 


<%
	String id = null;
	
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	
	if(id == null){
		
	
%>

<br>
<a href="loginForm">로그인</a> <a href="joinForm">회원가입</a>

<%

	}else {
%>
 <h3>${sessionScope.id}님 방문을 환영합니다. 어서오세요. 이랏샤이마세</h3> <a href="logout">로그아웃</a>

<%
	}
%>

<hr>
<a href="board_list">방명록</a>



</body>
</html>