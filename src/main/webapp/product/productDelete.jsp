<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리-관리자전용</title>
<!-- <link rel="stylesheet" type="text/css" href="css/shopping.css"> -->
<script type="text/javascript" src="script/product.js"></script>
<style>
#wrap {
	width: 800px;
	margin: 100px auto;
	text-align: center;
}

table {
	width: 100%;
}

table {
	/* width: 80%; */
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
		<h1>상품 삭제</h1>
		<br><br>
		<form action = "productDelete.do" method="post">
			<table>
				<tr>
					<td>
					<c:choose>
						<c:when test="${empty product.pictureUrl }">
							<img src="upload/noimage.gif">
						</c:when>
						<c:otherwise>
							<img src="upload/${product.pictureUrl }">
						</c:otherwise>
					</c:choose>
					</td>
					<td>
					
						<table>
							<tr>
								<th>상 품 명</th>
								<td>${product.productname }</td>
							</tr>
							<tr>
								<th>가 격</th>
								<td>${product.price }원</td>
							</tr>
							<tr>
								<th>설 명</th>
								<td><div style="height:220px; width:100%">${product.description }</div></td>
							</tr>
						</table>
					
					</td>
				</tr>
			</table>
			<br>
			
			<input type="hidden" name="code" value="${product.code }"> 
			<input class="btn2" type="submit" value="삭제" onclick="return areYouSure()"> 
			<input class="btn1" type="button" value="목록" onclick="location.href='productList.do'"> 
		</form>
	
	</div>
	
	<!-- 히단 -->
<jsp:include page="../footer.jsp" />
</body>
</html>