<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_list</title>
<link rel="stylesheet" type="text/css" href="resources/css/mainPage.css?ver=1.0">
</head>
<body>
<center>
<c:if test="${sessionScope.id != null }">
	<c:set var="id" value="${sessionScope.id }" />
</c:if>

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
       <hr>
       </nav>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>히트</td>
		</tr>
		<c:forEach items="${board_list}" var="dto">
		<tr>
			<td>${dto.bid}</td>
			<td>${dto.bname}</td>
			<td>
				<c:forEach begin="1" end="${dto.bindent}">-</c:forEach>
				<a href="content_view?bid=${dto.bid}">${dto.btitle}</a></td>
			<td>${dto.bdate}</td>
			<td>${dto.bhit}</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="5"> <a href="write_view">글작성</a> <a href="mainPage">메인으로</a> </td>
		</tr>
	</table>

</body>
</html>