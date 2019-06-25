<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
table, tr, td {0
border : 1px solid black;
}
</style>

</head>
<body>


<%
	String id = "";
	String pw = "";
	String msg = "";
	
	if(session.getAttribute("id") != null){
		
		id = (String)session.getAttribute("id");
		pw = (String)session.getAttribute("pw");
		
	}
	
%>
<script>

var msg = '${sessionScope.msg}';

$('document').ready(function(){
	if(msg != ''){
		alert(msg);
	}
});

</script>

<p>아이디와 비밀번호를 입력하십시오.</p>
<hr>

 <form action = "login" method = "post">
 	<table>
 		<tr>
 			<td>아이디</td>
 			<td><input type = "text" name="id" value = "<%=id%>"></td>
 		</tr>
 		<tr>
 			<td>비밀번호</td>
 			<td><input type = "password" name="pw" value = "<%=pw%>"></td>
 		</tr>
 		<tr>
 			<td colspan="2" align="right"><input type ="submit" value="로그인"></td>
 		</tr>
 		 
 		
 
 
 
 	</table>
 </form>
 <hr>
 <a href="mainPage">메인으로</a>
 
 <%
 session.removeAttribute("msg"); 
 %>
</body>
</html>