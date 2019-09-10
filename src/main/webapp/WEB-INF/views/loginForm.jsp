
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src='<c:url value="/js/jquery-3.4.1.js" />'></script>
<script>
$(function(){
	$('#loginbtn').on('click',login);
})	
function login(){
	var userid = $("#userid").val();
	var userpwd = $("#userpwd").val();
	
	if(userid.length<3 || userid.length>10){
		alert("아이디는 3~10 글자를 입력하세요"); 
	}
	if(userpwd.length<3 || userpwd.length>10){
		alert("비밀번호는 3~10 글자를 입력하세요"); 
	}	
}

</script>
</head>
<body>
	<h1>[로그인]</h1>
	<form action ="loginmember" method ="post">
	<table>
		<tr>
			<td>아이디  </td>
			<td><input type ="text" id ="userid" name="userid"></td>
		</tr>
		<tr>
			<td>비밀번호 </td>
			<td><input type ="password" id ="userpwd" name="userpwd"></td>
		</tr>
		<tr>
			<td><input type ="submit" id ="loginbtn" value="로그인"></td>
			<td><a href="/moneybook/"><input type ="button" id ="cancel" value="취소"></a></td>
		</tr>
	</table>
	</form>
</body>
</html>
