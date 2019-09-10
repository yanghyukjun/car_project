<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일일 가계부</title>
<style>
table{
	text-align: center;
}
.bookbook{
	font-size: 20px;
}
</style>
<script src='<c:url value="/js/jquery-3.4.1.js"/>'></script>
<script>
$(function(){
	$("#inputdate").on('change',init);
	$("#insert").on('click',insertmoneybook);
	$("#delete").on('click',deletemoneybook);
})
function init(){
	var type = $("#type").val();
	var inputdate = $("#inputdate").val();
	
	date={
		"type" : type,
		"inputdate" :  inputdate
	}
	
	$.ajax({
		type:'GET', 
		url : 'showlist',
		data : date,
		success : moneybookList 
	})
}
function moneybookList(resp){
	var tag = ''
	tag += "<tr><td><b>메모</b>&nbsp;&nbsp;&nbsp;</td>";
	tag += "<td><b>금액</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";
	tag += "<td><b>삭제</b>&nbsp;&nbsp;&nbsp;</td></tr>";
	
	$.each(resp,function(index,item){
		//console.log(item.memo);
		//console.log(item.amount);
		tag += "<tr><td>"+item.memo+"</td>";
		tag += "<td>"+item.amount+"</td>";
		tag += "<td><input type ='radio' class = deletemoney name='delete' data-value="+item.infonum+"></td>";
	})
	$("#moneybookselect").html(tag); 
}

function insertmoneybook(){
	var type = $("#type").val(); 
	var inputdate = $("#inputdate").val(); 
	var memo = $("#memo").val();
	var amount = $("#amount").val(); 
	
	if(inputdate.length==0){
		alert("날짜를 입력하세요");
		return false; 
	}
	
	if(memo.length==0){
		alert("메모를 입력하세요");
		return false; 
	}
	
	if(amount.length==0){
		alert("금액을 입력하세요");
		return false; 
	}
	if(isNaN(amount)){
		alert("숫자를 입력하세요");
		return false; 
	}
	
	var book ={
		"type" : type,
		"inputdate" : inputdate,
		"memo" : memo,
		"amount" : amount
	}
	
	$.ajax({
		type : 'POST',
		data : book, 
		url : 'insertmoneybook',
		success : function(){
			$("#memo").val("");
			$("#amount").val("");
			init();
		}
	})
	
}
function deletemoneybook(infonum){
	var infonum = $("input[name=delete]:checked").attr("data-value");
	var delarea = $("input[name=delete]:checked").parent().parent(); 
	
	if(infonum==null){
		alert("삭제할 항목을 선택해주세요"); 
	}
	
	$.ajax({
		type : 'GET', 
		data : "infonum="+infonum,
		url : 'deletemoney',
		success : function(resp){
			if(resp=='success'){
				delarea.remove(); 
			}
			else{
				alert("삭제 실패했습니다."); 
			}
		}
	})
	
}


</script>
</head>
<body>
	<select id ="type">
		<option value="수입">수입</option>
		<option value="지출">지출</option>
	</select>
	<input type="date" name="inputdate" id ="inputdate">
	<br>
	<table>
		<tr>
			<td><h1>메모&nbsp;</h1></td>
			<td><h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1></td>
			<td><h1>금액&nbsp;</h1></td>
		</tr>	
	</table>
	<input type="text" name="memo" id="memo" placeholder="내용 입력">&nbsp;&nbsp;
	<input type="text" name="amount" id="amount" placeholder="금액 입력">&nbsp;
	<input type="button" id="insert" value="등록">
	<input type="button" id="delete" value="삭제">
	
	<table class="bookbook" id ="moneybookselect"></table>
</body>
</html>
