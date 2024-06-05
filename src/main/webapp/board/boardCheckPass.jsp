<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<style>
	.checkBox{
	height:170px;
	margin:10px auto;
		text-align:center;
		border:1px solid lightgray;
		border-radius:5px;
	}
	.inputBox{
	width: 150px;
	height: 25px;
	margin: 0 auto;
	border: 1px solid lightgray;
	padding: 0 0 0 10px;
	}
</style>
<script type="text/javascript" src="script/board.js"></script>
</head>
<body>
	<div class="checkBox">
		<h2>비밀번호 확인</h2>
		<form action="BoardServlet" method="get" name="frm">
		
			<input type="hidden" name="command" value="board_check_pass">  <!-- board_check_pass -->
			<input type="hidden" name="num" value="${param.num }">   <!-- ${board.num } -->
			
			<br>
					비밀번호 <input class="inputBox"  type="password" name="pass">
					<!-- 수정/삭제시 비밀번호 공백 체크하는 함수 -->
				
				
			<input type="submit" value="확인" onclick="return passCheck()">
			  <!-- 수정/삭제시 비밀번호 공백 체크하는 함수 -->
			<br>
			${message }
		</form>
	</div>
</body>
</html>