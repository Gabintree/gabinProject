<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="resources/css/mainPage.css?ver=1.0">
<style>
@import url('https://fonts.googleapis.com/css?family=Gaegu&display=swap');

#wrap {
display: flex;
flex-flow: column;
}

</style>
<title>첫 화면 / 메인페이지</title>
</head>

<body>

<c:if test="${sessionScope.id != null }">
	<c:set var="id" value="${sessionScope.id }" />
</c:if>

<center>
    <nav id="navi">
        <h1><a href="http://localhost:8282/project/"><img src="resources/images/yangach.svg"></a></h1>
        <ul class="main-nav">	
        <c:choose>
        	<c:when test="${id != null }">
        		<li><a href="userUpdateForm">회원정보수정</a></li>
	          	<li><a href="logout">로그아웃</a></li>
	          	<li><a href="board_list">방명록</a></li>
        	</c:when>
        	<c:otherwise>
        		<li><a href="loginForm">로그인</a></li>
	          	<li><a href="joinForm">회원가입</a></li>
	          	<li><a href="board_list">방명록</a></li>
        	</c:otherwise>
        </c:choose>		
	          	
        </ul>
      </nav>    


<br>
<br>
<br>
<br>
<br>
<br>

<hr>
가빈이네 홈페이지에 오신 것을 환영합니다. 
<hr>
	<c:if test="${id != null }">
		<h3>${sessionScope.id}님 방문을 환영합니다. 어서오세요. 이랏샤이마세</h3>
	</c:if>
<img src="resources/images/bearGumi.jpg">
 
</center>
</body>
</html>