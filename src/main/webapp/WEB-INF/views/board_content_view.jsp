<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_content_view</title>
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

	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="modify_view" method="post">
			<input type="hidden" name="bid" value="${board_content_view.bid}">
			<tr>
				<td> 번호 </td>
				<td> ${board_content_view.bid} </td>
			</tr>
			<tr>
				<td> 히트 </td>
				<td> ${board_content_view.bhit} </td>
			</tr>
			<tr>
				<td> 이름 </td>
				<td> <input type="text" name="bname" value="${board_content_view.bname}" readOnly></td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" name="btitle" value="${board_content_view.btitle}" readOnly></td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td> <textarea rows="10" name="bcontent"  readOnly>${board_content_view.bcontent}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"> 
				<input type="submit" value="수정"> &nbsp;&nbsp; 
				<a href="board_list">목록보기</a> &nbsp;&nbsp; 
				<a href="delete?bid=${board_content_view.bid}">삭제</a>&nbsp;&nbsp; 
				<a href="reply_view?bid=${board_content_view.bid}">답변</a>
				</td>
			</tr>
		</form>
	</table>
	
</body>
</html>