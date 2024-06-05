<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정-관리자전용</title>
<!-- 
<link rel="stylesheet" type="text/css" href="css/shopping.css"> -->
<script type="text/javascript" src="script/product.js"></script>
<style>
@charset "UTF-8";

#wrap {
	width: 900px; /* 수정된 부분: 가로 크기를 100%로 설정 */
	margin: 50px auto;
}

table {
	width: 100%;
}

table {
	width: 80%;
	border-collapse: collapse;
	font-size: 12px;
	line-height: 24px;
}

th {
	background-color: rgb(0, 175, 133);
	color:white;
}

table td, th {
	border: #d3d3d3 solid 1px;
	padding: 5px;
}

/*th {background: lightgray;}*/
td img {
	width: 200px;
	height: 200px;
}

a {
	text-decoration: none;
	color: black;
}

a:HOVER {
	text-decoration: underline;
	color: lightgray;
}

.btn1 { /*배경흰색*/
	width: 60px;
	height: 30px;
	background-color: white;
	color: rgb(0, 175, 133);
	border: 1px solid rgb(0, 175, 133);
	border-radius: 5px;
	margin: 0 0 5px 0px;
}

.btn2 { /*배경시그니처컬러*/
	width: 60px;
	height: 30px;
	background-color: rgb(0, 175, 133);
	color: white;
	border: 1px solid rgb(0, 175, 133);
	border-radius: 5px;
	margin: 0 0 5px 0px;
}
</style>
</head>
<body>
<!-- 상단 -->
<jsp:include page="../header.jsp" />

	<div id="wrap" align="center">
		<h1>상품 수정</h1>
		<br><br>
		<form method="post" enctype="multipart/form-data" name="frm">
			<input type="hidden" name="code" value="${product.code }"> <input
				type="hidden" name="nomakeImg" value="${product.pictureUrl }">

			<table>
				<tr>
					<td><c:choose>
							<c:when test="${empty product.pictureUrl }">
								<img src="upload/noimage.gif">
							</c:when>
							<c:otherwise>
								<img src="upload/${product.pictureUrl }">
							</c:otherwise>
						</c:choose></td>
					<td>
						<table>
							<tr>
								<th>상 품 명</th>
								<td><input type="text" name="productname"
									value="${product.productname }"></td>
							</tr>
							<tr>
								<th>가 격</th>
								<td><input type="text" name="price"
									value="${product.price }">원</td>
							</tr>
							<tr>
								<th>사 진</th>
								<td><input type="file" name="pictureUrl"><br>
									(주의 : 이미지를 변경할 때만 선택하세요.)</td>
							</tr>
							<tr>
								<th>설 명</th>
								<td><textarea cols="90" rows="10" name="description">${product.description }</textarea></td>
							</tr>
						</table> <br> <input class="btn2" type="submit" value="수정"
						onclick="return productCheck()"> <input class="btn1"
						type="button" value="목록" onclick="location.href='productList.do'">


					</td>
				</tr>

			</table>
		</form>
	</div>
	<!-- 히단 -->
<jsp:include page="../footer.jsp" />
</body>
</html>