<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<script type="text/javascript" src="script/board.js"></script>
<link rel="stylesheet" href="css/board.css" type="text/css">
<style>
</style>
</head>
<body>
	<!-- 상단 -->
	<jsp:include page="../header.jsp" />

	<div class="boardBox">
		<h1>문의 하기</h1>
		<form action="BoardServlet" method="post" name="frm">
			<input type="hidden" name="command" value="board_write">
			<!-- board_write -->
			<table>
				<tr>
					<th>작성자</th>
					<td><input class="inputBox" type="text" name="username"
						value="${loginUser.username }"><span class="dot">*
					</span></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input class="inputBox" type="password" name="pass"><span
						class="dot">* 게시물 수정,삭제시 필요합니다.</span></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input class="inputBox" type="text" name="email"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input class="inputBox" type="text" name="title"><span
						class="dot">* </span></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="75" rows="15" name="content"></textarea></td>
				</tr>
			</table>
			<br> <br> <input class="btn2" type="submit" value="등록"
				onclick="return boardCheck()">
			<!-- 등록 버튼을 누르면 게시글 작성/수정시 공백 체크하는 함수 수집한 parameter를 가지고 post방식으로 BoardServlet으로  -->
			<input class="btn1" type="button" value="목록"
				onclick="location.href='BoardServlet?command=board_list'">
			<!--게시글 목록 버튼을 누르면  board_list -->
		</form>
	</div>

	<!-- 하단 -->
	<jsp:include page="../footer.jsp" />
</body>
</html>