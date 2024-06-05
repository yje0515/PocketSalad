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

</head>
<body>
	<!-- 상단 -->
	<jsp:include page="../header.jsp" />

	<div class="boardBox">
		<h1>문의글 수정</h1>
		<form action="BoardServlet" method="post" name="frm">
			<input type="hidden" name="command" value="board_update">
			<!-- board_update -->
			<input type="hidden" name="num" value="${board.num }">
			<table>
				<tr>
					<th>작성자</th>
					<td><input class="inputBox" type="text" size="12"
						name="username" value="${board.username }"><span
						class="dot">* </span></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input class="inputBox" type="password" size="12"
						name="pass"><span
						class="dot">* 게시물 수정,삭제시 필요합니다.</span></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input class="inputBox" type="text" size="40"
						maxlength="50" name="email" value="${board.email }"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input class="inputBox" type="text" size="70" name="title"
						value="${board.title }"><span class="dot">* </span></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="75" rows="15" name="content">${board.content }</textarea></td>
				</tr>
			</table>
			<br>
			<br> <input class="btn2" type="submit" value="수정"
				onclick="return boardCheck()">
			<!-- 게시글 작성/수정시 공백 체크하는 함수 -->

			<input class="btn1" type="button" value="목록"
				onclick="location.href='BoardServlet?command=board_list'">
		</form>
	</div>

	<!-- 하단 -->
	<jsp:include page="../footer.jsp" />
</body>
</html>