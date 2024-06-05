<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<h1>게시글 상세보기</h1>
		<table class="view">
		<tr>
				<td colspan="5" style="border: white; text-align: right"><input type="button" class="btn2" value="문의하기"
					onclick="location.href='BoardServlet?command=board_write_form'"><!--게시글 작성을 누르면 board_write_form  -->
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${board.username }</td>
				<th>이메일</th>
				<td>${board.email }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td> <fmt:formatDate value="${board.writedate }"/> </td>
				<th>조회수</th>
				<td>${board.readcount }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">${board.title }</td>
			</tr>
			<tr class="detail">
				<th>내용</th>
				<td colspan="3"><div class="textBox">${board.content }</div></td>
			</tr>
		</table>
		<br>
		<br>
		<input class="btn2" type="button" value="수정" onclick="open_win('BoardServlet?command=board_check_pass_form&num=${board.num}','update')"> <!-- openwin() 새창이 열림 board_check_pass_form(url) / num / update(name) -->
		<input class="btn2" type="button" value="삭제" onclick="open_win('BoardServlet?command=board_check_pass_form&num=${board.num}','delete')">  <!-- board_check_pass_form                                delete -->
		<input class="btn1" type="button" value="목록" onclick="location.href='BoardServlet?command=board_list'"> <!-- board_list -->
		<!-- <input class="btn2" type="button" value="새로 문의하기" onclick="location.href='BoardServlet?command=board_write_form'"> board_write_form -->
	</div>
	
	<!-- 하단 -->
	<jsp:include page="../footer.jsp" />
</body>
</html>