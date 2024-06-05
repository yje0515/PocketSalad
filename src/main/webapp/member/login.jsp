<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="script/member.js"></script>

<style>
#userBox {
	width: 500px;
	height: 600px;
	margin: 140px auto;
	text-align: center;
	padding: 80px 0 0 0px;
	border: 1px solid lightgray;
}

input {
	margin: 5px 0px 10px 0px;
	width: 300px;
	height: 50px;
	border: 1px solid lightgray;
	border-radius: 5px;
	padding: 0 0 0 15px;
}

form {
	margin: 50px auto;
	width: 290px;
}

.loginButton {
	background-color: rgb(0, 175, 133);
	color: white;
	border: 1px solid rgb(0, 175, 133);
	border-radius: 10px;
}

.joinButton {
	background-color: white;
	color: rgb(0, 175, 133);
	border: 1px solid rgb(0, 175, 133);
	border-radius: 10px;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="userBox">
		<h1>로그인</h1>
		<form action="login.do" method="post" name="frm">
			<table>
			<% //cookie에 저장된 값중 원하는 값 저장
			String cookie = "";
				Cookie[] cookies = request.getCookies();
				if(cookies!=null && cookies.length>0){
					for(int i=0; i<cookies.length; i++){
						if(cookies[i].getName().equals("userid")){ //userid라고 저장했던 쿠키! 
							cookie = cookies[i].getValue();
						}
					}
				}
			%>
				<tr><!-- 회원가입 후 session에 저장된 userid값 -->
				<c:if test="${session !=null }">
				<td><input type="text" name="userid" value="${userid }"
						placeholder="아이디"></td>
				</c:if>
				<!-- 로그인중 아이디저장 체크 시 cookie에 저장된 userid값 -->
				<c:if test="${cookie !=null }">
				<td><input type="text" name="userid" value="<%=cookie %>"
						placeholder="아이디"></td>
				</c:if>
					
					
				</tr>
				<tr>
					<td><input type="password" name="pwd" placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td style="float: left; font-size: 14px;"><input
						style="width: 15px; height: 15px; margin:3px 5px 0 0px;float: left;" type="checkbox"
						name="rememberid">아이디 저장</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input class="loginButton"
						type="submit" value="로그인  " onclick="return loginCheck()"></td>
				</tr>
				<tr>
					<td colspan="10"><input class="joinButton" type="button"
						value="회원가입  " onclick="location.href='join.do'"></td>
				</tr>
				<tr>
					<td>${message }</td>
				</tr>
			</table>
		</form>

	</div>
	<br>
	<jsp:include page="../footer.jsp" />
</body>
</html>


