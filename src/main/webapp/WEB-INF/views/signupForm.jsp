
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src='<c:url value="/js/jquery-3.4.1.js" />'></script>
<script>
$(function(){
	$('#signupbtn').on('click',signup);
})
function signup(){
	
	var userid = $("#userid").val();
	var userpwd = $("#userpwd").val();
	var userpwd2 = $("#userpwdcertain").val();
	
	if(userid.length<3 || userid.length>10){
		alert("아이디는 3~10 글자를 입력하세요"); 
		return false; 
	}
	if(userpwd.length<3 || userpwd.length>10){
		alert("비밀번호는 3~10 글자를 입력하세요");
		return false; 
	}
	if(userpwd!=userpwd2){
		alert("비밀번호가 일치하지 않습니다.");
		return false; 
	}	
}

</script>
</head>
<body>
	<h1>[회원가입]</h1>
	<form action ="sign" method ="post">
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
			<td>비밀번호확인 </td>
			<td><input type ="password" id ="userpwdcertain"></td>
		</tr>
		<tr>
			<td><input type ="submit" id ="signupbtn" value="가입"></td>
		</tr>
	</table>
	</form>
	&nbsp;&nbsp;<a href="/moneybook/"><input type ="button" id ="cancel" value="취소"></a>
</body>
</html>