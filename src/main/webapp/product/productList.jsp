<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리-관리자전용</title>

<style>

td img {
	width: 100px;
	height: 100px;
}
@charset "UTF-8";
*{
	margin:0 auto;
	
}
.boardBox {
	width: 1000px;
	height: 700px;
	margin: 100px auto;
	text-align: center;
	border: 1px solid lightgray;
}

h1{
	margin:70px 0 0 0px;
}

form{ /*list랑 view 적용 안됨*/
	margin:60px 0 0 25px;
}

.list{/*boardList의 table*/
	margin:50px auto;
	
}

.listWrap{
/*	background-color: peachpuff;*/
	width:900px;
	height:450px;
	margin: 0 0 100px 45px;
	/*overflow: auto;*/
}


.view{/*boardview의 table*/
	margin:50px auto;
}

/*view 내용*/
.textBox{
	width:615px;
	height:200px;
	overflow: auto;
}

table {
	width: 900px;
	border-collapse: collapse;
	font-size: 12px;
	line-height: 24px;
	text-align:center;
}

	
th{
	background-color:lightgray;
	
	
}
th, td{
	height:30px;
	border-top:lightgray solid 1px;
	border-bottom:lightgray solid 1px;
	
}
.subject{
	width:400px;
}
a {
	text-decoration: none;
	color: black;
}

a:HOVER {
	/*text-decoration: underline;*/
	color: lightgray;
}
input,textarea{
	border:1px solid lightgray;
}
textarea{
	margin:5px 0 0 0px;
	padding:0 0 0 5px;
}
.inputBox{
	width:50%;
	float:left;
	margin: 0 0 0 30px;
	padding:0 0 0 10px;
}
.btn1{ /*배경흰색*/
	width:60px;
	height:30px;
	background-color: white;
	color: rgb(0, 175, 133);
	border: 1px solid rgb(0, 175, 133);
	border-radius: 5px;
	margin:0 0 5px 0px;
}
.btn2{ /*배경시그니처컬러*/
	width:60px;
	height:30px;
	background-color: rgb(0, 175, 133) ;
	color:white;
	border: 1px solid rgb(0, 175, 133);
	border-radius: 5px;
	margin:0 0 5px 0px;
}

.dot{
	float:left;
	color:rgb(0, 175, 133);
}

.board_paging {
    height: 50px;
    line-height: 50px;
    display: flex;
    justify-content: center;
    list-style: none;
    width: 480px;
    margin: auto;
}

.board_paging > li {
    float: left;
}

.board_paging a {
    text-decoration: none;
    color: #282A35;
    width: 40px;
    display: block;
    text-align: center;
}

.board_paging a.current_page {
    border-bottom: 2px solid #282A35;
    font-weight: bold;
}
</style>
</head>
<body>
<!-- 상단 -->
<jsp:include page="../header.jsp" />

	<div id="list" align="center">
		<h1>상품관리</h1>
		<br><br>
		<table class="listWrap">
			<tr>
				<td colspan="6" style="border: white; text-align: right"><input
					class="btn2" type="button" value="등록"
					onclick="location.href='productWrite.do'"></td>
				<!-- <a
					href="productWrite.do">상품등록</a> -->
			</tr>
			<tr>
				<th>상품 번호</th>
				<th>상품 사진</th>
				<th>상품명</th>
				<th>가격</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="product" items="${productList }">
				<tr class="record">
					<td>${product.code }</td>
					<td><c:choose>
							<c:when test="${empty product.pictureUrl }">
								<img src="upload/noimage.gif">
							</c:when>
							<c:otherwise>
								<img src="upload/${product.pictureUrl }">
							</c:otherwise>
						</c:choose></td>
					<td>${product.productname }</td>
					<td>${product.price }</td>
					<td><a href="productUpdate.do?code=${product.code }">상품 수정</a></td>
					<%-- <td><input type="button" value="상품삭제" onclick="location.href='productDelete.do?code=${product.code }'"></td> --%>
					<td><a href="productDelete.do?code=${product.code }">상품 삭제</a></td>

				</tr>
			</c:forEach>
		</table>
	</div>

<!-- 하단 -->
<jsp:include page="../footer.jsp" />
</body>
</html>