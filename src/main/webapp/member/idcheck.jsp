<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복체크</title>
<script type="text/javascript" src="script/member.js"></script>
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
</head>
<body>
<div class="checkBox">
<h2>아이디 중복체크</h2>
<form action="idCheck.do" method="get" name="frm">
	아이디 <input class="inputBox" type="text" name="userid" value="${userid }">
	<input type="submit" value="중복체크"><br>
	<c:if test="${result==1 }">
		<script type="text/javascript">
			opener.document.frm.userid.value="";
		</script>
		<br><b>${userid }</b>(은)는 이미 사용 중인 아이디입니다.
	</c:if>
	<c:if test ="${result==-1 }">
		<br><b>${userid }</b>(은)는 사용 가능한 아이디 입니다.
		<input type="button" value="사용" class="cancel" onclick="idok('${userid}')"> <!-- 중복체크 후 중복이 아니라면(result=-1)나오는 사용버튼을 누르면 reid에 value를 주는 메소드 -->
	</c:if>
</form>
</div>
</body>
</html>