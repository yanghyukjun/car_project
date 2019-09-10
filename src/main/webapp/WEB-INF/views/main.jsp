<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<script src='<c:url value="/js/jquery-3.4.1.js" />'></script>
</head>
<body>
	<h1>[일일 가계부]</h1>
	
	<c:if test="${empty sessionScope.loginId}">
		<a href="signup">회원가입</a><br>
		<a href="login">로그인</a><br>
	</c:if>
	
	
	<c:if test="${not empty sessionScope.loginId}">
	<h3>${sessionScope.loginId}님 환영합니다</h3>
		<a href="gobook">내 가계부</a><br>
		<a href="logout">로그아웃</a>
	</c:if>
	
	
</body>
</html>
