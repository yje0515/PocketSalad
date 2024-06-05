<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<div id="logomain">
			<a href="index.jsp"><img src="img/pocketlogo.png" alt="로고이미지"></a>
			<div id="login">
				<ul>
					<!-- 로그인하기전 -->
					<c:if test="${loginUser.userid==null }">
					<li><a href="join.do">회원가입</a></li>
					<li>|</li>
					<li><a href="login.do">로그인</a></li>
					<li>|</li>
					<li><a
						href="http://localhost:8080/PocketSalad/BoardServlet?command=board_list">고객센터</a></li>
					<li></li>
					<li></li>
					<li><a href="login.do"><img src=img/loginicon1.png
							alt="로그인아이콘1"></a></li>
					<li></li>
					<li><a href="login.do"><img src=img/loginicon2.png
							alt="로그인아이콘2"></a></li>
					 <!-- 로그인 후 -->
					</c:if>
					<c:if test="${loginUser.userid!=null }">
					<li><a href="#">${loginUser.username } 님  </a></li>
					<li>|</li>
					<li><a href="logout.do">로그아웃</a></li>
					<li>|</li>
					<li><a
						href="http://localhost:8080/PocketSalad/BoardServlet?command=board_list">고객센터</a></li>
					<li></li>
					<li></li><!-- 쿼리스트링 방식으로 바꾸니까 된다! -->
					<li><a href="http://localhost:8080/PocketSalad/memberUpdate.do?userid=${loginUser.userid}"><img src=img/loginicon1.png
							alt="로그인아이콘1"></a></li>
					<li></li>
					<c:if test="${loginUser.admin==1 }"><!--  관리자라면 설정아이콘이 보이고 상품등록 페이지에 접근 가능 -->
							<li><a 
								href="http://localhost:8080/PocketSalad/productList.do?userid=${loginUser.userid}"><img style="width:30px"
									src=img/settingIcon.png alt="관리자설정"></a></li>
						</c:if>
						<c:if test="${loginUser.admin==0 }"><!-- 일반회원이라면 장바구니아이콘이 보임-->
							<li><a
								href="http://localhost:8080/PocketSalad/memberUpdate.do?userid=${loginUser.userid}"><img
									src=img/loginicon2.png alt="장바구니"></a></li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
	</header>
	<nav>
		<div id="category">
			<ul>
				<li><a href="#" class="allmenu_open"><img
						src=img/allmenu_open.png alt="메뉴"></a>
					<div id="menuwrap">
						<ul class="menu">
							<li><a href="#">정기배송</a>
								<ul class="sub">
									<li><a href="#">식단스타터(1주)</a></li>
									<li><a href="#">6주+식단</a></li>
									<li><a href="#">2주 식단</a></li>
									<li><a href="#">4주 식단</a></li>
									<li><a href="#">채소만</a></li>
									<li><a href="#">간편식</a></li>
									<li><a href="#">너랑 나랑</a></li>
								</ul></li>
							<li><a href="#">정기식단</a>
								<ul class="sub">
									<li><a href="#">짜여진 식단</a></li>
									<li><a href="#">클린핏 식단</a></li>
									<li><a href="#">단기 집중 식단</a></li>
									<li><a href="#">1주 맞춤 식단</a></li>
								</ul></li>
							<li><a href="#">샐러드 23종</a>
								<ul class="sub">
									<li><a href="#">데일리 샐러드</a></li>
									<li><a href="#">테이스티 샐러드</a></li>
									<li><a href="#">그린 샐러드</a></li>
									<li><a href="#">채소만 샐러드</a></li>
									<li><a href="#">맛보기 세트</a></li>
									<li><a href="#">드레싱</a></li>
								</ul></li>
							<li><a href="#">간편식</a>
								<ul class="sub">
									<li><a href="#">라이스 시즌1&2</a></li>
									<li><a href="#">곤약라이스 시즌3</a></li>
									<li><a href="#">미니컵밥</a></li>
								</ul></li>
							<li><a href="#">베스트</a>
								<ul class="sub">
									<li><a href="#">첫 구매 추천</a></li>
									<li><a href="#">베스트 식단 4</a></li>
									<li><a href="#">MD's PICK!</a></li>
								</ul></li>
						</ul></li>
				<li><a href="#">정기배송</a></li>
				<li><a href="#">정기식단</a></li>
				<li><a href="#">샐러드 23종</a></li>
				<li><a href="#">간편식</a></li>
				<li><a href="#">베스트</a></li>
				<li><a href="#">이벤트·혜택</a></li>
			</ul>
		</div>

		</div>

	</nav>
</body>
</html>