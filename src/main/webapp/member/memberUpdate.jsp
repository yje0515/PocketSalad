<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<script type="text/javascript" src="script/member.js"></script>
<style>
#userBox {
	width: 600px;
	height: 800px;
	margin: 150px auto;
	text-align: center;
	padding: 90px 0 0 0px;
	border: 1px solid lightgray;
}

form {
	width: 500px;
	margin: 0px 0 0 60px;
}

td {
	text-aligh: right;
}

.inputBox {
	width: 300px;
	height: 40px;
	margin: 0 auto;
	border: 1px solid lightgray;
	border-radius:7px;
	padding: 0 0 0 10px;
}
.inputBoxReadonly {
	background-color:lightgray;
	width: 300px;
	height: 40px;
	margin: 0 auto;
	border: 1px solid lightgray;
	border-radius:7px;
	padding: 0 0 0 10px;
}

table {
	height: 500px;
	margin: 30px auto;
}

.dot {
	color: rgb(0, 175, 133);
}

.joinButton {
	width: 300px;
	height: 50px;
	margin: 20px 0 0 10px;
	background-color: rgb(0, 175, 133);
	color: white;
	border: 1px solid rgb(0, 175, 133);
	border-radius: 10px;
	font-size:14px;
}

.joinButton:hover {
	cursor: pointer;
}
.btn{
	width:60px;
	height:30px;
	background-color: white;
	color: rgb(0, 175, 133);
	border: 1px solid rgb(0, 175, 133);
	border-radius: 5px;
}
</style>
</head>
<body>
	<!-- 상단 -->
	<jsp:include page="../header.jsp" />
	<div id="userBox">
	<h1>회원 정보 수정</h1>
	<br>
	<br><span class="dot">* </span>표시는 반드시 입력하셔야 하는 항목입니다.
	<form action="memberUpdate.do" method="post" name="frm">
		<table>
			<tr>
				<td>이름<span class="dot">*</span></td>
				<td><input class="inputBoxReadonly" type="text" name="username" size="20"
					value="${mVo.username }" readonly></td>
			</tr>
			<tr>
				<td>아이디<span class="dot">*</span></td>
				<td><input class="inputBoxReadonly" type="text" name="userid" size="20"
					value="${mVo.userid }" readonly></td>
			</tr>
			<tr>
				<td>암 호<span class="dot">*</span></td>
				<td><input class="inputBox" type="password" name="pwd" size="20"></td>
			</tr>
			<tr>
				<td>암호확인<span class="dot">*</span></td>
				<td><input class="inputBox" type="password" name="pwd_check" size="20"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input class="inputBox" type="text" name="email" size="20"
					value="${mVo.email }"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input class="inputBox" type="text" name="phone" size="20"
					value="${mVo.phone }"></td>
			</tr>
			<tr>
				<td>등급<span class="dot">*</span></td>
				<td><c:choose>
						<c:when test="${mVo.admin==0 }">
							<input type="radio" name="admin" value="0" checked="checked">일반회원
							<input type="radio" name="admin" value="1">관리자
						</c:when>
						<c:otherwise>
							<input type="radio" name="admin" value="0">일반회원
							<input type="radio" name="admin" value="1" checked="checked">관리자
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
			<td></td>
				<td>
					<input class="joinButton" type="submit" value="수정" onclick="return joinCheck()"> <!-- 공백,조건체크 하는 메소드 -->
				</td>
			</tr>

			
		</table>
	</form>
	</div>
	<!-- 하단 -->
	<jsp:include page="../footer.jsp" />
</body>
</html>