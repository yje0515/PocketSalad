<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>포켓샐러드 - 새로운 나를 위한 첫 습관, 포켓샐러드</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!-- crossorigin -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.0.min.js"></script>
<script>
	//jQuery
	$(document).ready(function() {
		//슬라이드
		function slide() {
			$(".slide ul").stop().animate({
				marginLeft : -1940
			}, function() {
				$(".slide li:first").appendTo(".slide ul");
				$(".slide ul").css({
					marginLeft : 0
					
				});
			});
		}
		setInterval(slide, 5000);
		
		$("#menuwrap").hide();
	    $(".allmenu_open").on('mouseover', function() {
	    	$("#menuwrap").slideToggle();
	    });
		
	});
</script>
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
								alt="장바구니"></a></li>
						<!-- 로그인 후 -->
					</c:if>
					<c:if test="${loginUser.userid!=null }">
						<li><a href="#">${loginUser.username } 님 </a></li>
						<li>|</li>
						<li><a href="logout.do">로그아웃</a></li>
						<li>|</li>
						<li><a
							href="http://localhost:8080/PocketSalad/BoardServlet?command=board_list">고객센터</a></li>
						<li></li>
						<li></li>
						<!-- 쿼리스트링 방식으로 바꾸니까 된다! -->
						<li><a
							href="http://localhost:8080/PocketSalad/memberUpdate.do?userid=${loginUser.userid}"><img
								src=img/loginicon1.png alt="로그인아이콘1"></a></li>
						<li></li>
						<c:if test="${loginUser.admin==1 }">
							<!--  관리자라면 -->
							<li><a
								href="http://localhost:8080/PocketSalad/productList.do?userid=${loginUser.userid}"><img
									style="width: 30px" src=img/settingIcon.png alt="관리자설정"></a></li>
						</c:if>
						<c:if test="${loginUser.admin==0 }">
							<!-- 일반회원이라면 -->
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
	<!-- 슬라이드 -->

	<div id="slidewrap">
		<div class="slide">
			<ul class="slidelist">
				<li><img src="img/slider3.jpg" alt=""></li>
				<li><img src="img/slider1.jpg" alt=""></li>
				<li><img src="img/slider2.jpg" alt=""></li>
				<li><img src="img/slider3.jpg" alt=""></li>
				<li><img src="img/slider1.jpg" alt=""></li>
				<li><img src="img/slider2.jpg" alt=""></li>
			</ul>

			<span class="prev">&lt;</span> <span class="next">&gt;</span>

		</div>

	</div>


	<section>
		<a class="event" href="#">
			<div class="item_thumbnail">
				<img src="img/event1.gif" alt="신규회원혜택">
			</div>
			<p>신규회원혜택</p>
		</a> <a class="event" href="#">
			<div class="item_thumbnail">
				<img src="img/event2.png" alt="정기배송위크">
			</div>
			<p>정기배송위크</p>
		</a> <a class="event" href="#">
			<div class="item_thumbnail">
				<img src="img/event3.png" alt="모두의 식단">
			</div>
			<p>모두의 식단</p>
		</a> <a class="event" href="#">
			<div class="item_thumbnail">
				<img src="img/event4.png" alt="포켓돋보기">
			</div>
			<p>포켓 돋보기</p>
		</a> <a class="event" href="#">
			<div class="item_thumbnail">
				<img src="img/event5.png" alt="오늘의 식탁">
			</div>
			<p>오늘의 식탁</p>
		</a> <a class="event" href="#">
			<div class="item_thumbnail">
				<img src="img/event6.png" alt="포켓 멤버십">
			</div>
			<p>포켓 멤버십</p>
		</a>
	</section>
	<div class="products">
		<div id="hot_product">
			<br> <br>
			<h1>가장 핫한 샐러드</h1>
			<h2>매일 새벽 신선함을 담은 샐러드</h2>
			<br>
			<div class="hot_box">
				<a href="#"> <img class="product_img" src="img/hot1.jpg"
					alt="hot1">
					<h3>4주 정기배송 샐러드 주5일</h3>
				</a>
				<div class="text_box">
					<span class="discount">25%</span> <span class="dc_price"><strong>92,400원</strong></span>
					<span class="price">124,000원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">1445</span>
			</div>
			<div class="hot_box">
				<a href="#"> <img class="product_img" src="img/hot2.jpg"
					alt="hot2">
					<h3>닭가슴살 샐러드</h3>
				</a>
				<div class="text_box">
					<span class="discount">19%</span> <span class="dc_price"><strong>6,700원</strong></span>
					<span class="price">8,300원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">476</span>
			</div>
			<div class="hot_box">
				<a href="#"> <img class="product_img" src="img/hot3.jpg"
					alt="hot3">
					<h3>크래미 샐러드</h3>
				</a>
				<div class="text_box">
					<span class="discount">23%</span> <span class="dc_price"><strong>6,900원</strong></span>
					<span class="price">9,000원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">870</span>
			</div>
			<div class="hot_box">
				<a href="#"> <img class="product_img" src="img/hot4.jpg"
					alt="hot4">
					<h3>그린 샐러드</h3>
				</a>
				<div class="text_box">
					<span class="discount">24%</span> <span class="dc_price"><strong>4,700원</strong></span>
					<span class="price">6,200원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">477</span>
			</div>
			<div class="hot_box">
				<a href="#"> <img class="product_img" src="img/hot5.jpg"
					alt="hot5">
					<h3>훈제오리 샐러드</h3>
				</a>
				<div class="text_box">
					<span class="discount">21%</span> <span class="dc_price"><strong>7,100원</strong></span>
					<span class="price">9,000원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">647</span>
			</div>
			<div class="hot_box">
				<a href="#"> <img class="product_img" src="img/hot6.jpg"
					alt="hot6">
					<h3>닭가슴살볼 숯불갈비맛 샐러드</h3>
				</a>
				<div class="text_box">
					<span class="discount">23%</span> <span class="dc_price"><strong>6,900원</strong></span>
					<span class="price">9,000원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">370</span>
			</div>
			<div class="hot_box">
				<a href="#"> <img class="product_img" src="img/hot7.jpg"
					alt="hot7">
					<h3>채소만 비타민 믹스 샐러드</h3>
				</a>
				<div class="text_box">
					<span class="discount">35%</span> <span class="dc_price"><strong>3,300원</strong></span>
					<span class="price">5,200원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">13</span>
			</div>
			<div class="hot_box">
				<a href="#"> <img class="product_img" src="img/hot8.jpg"
					alt="hot7">
					<h3>멕시칸 타코 샐러드</h3>
				</a>
				<div class="text_box">
					<span class="discount">21%</span> <span class="dc_price"><strong>8,400원</strong></span>
					<span class="price">10,700원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">13</span>
			</div>

		</div>




		<div id="best_product">
			<br> <br>
			<h1>정기배송 BEST</h1>
			<h2>1주에서 8주, 건강한 습관의 시작</h2>
			<br>
			<div id="best_tab">
				<!--탭버튼(링크)-->
				<button class="tabbutton">2주</button>
				<button class="tabbutton">4주</button>
				<button class="tabbutton">6주+</button>
				<button class="tabbutton">1주</button>
			</div>
			<!--제품사진1-->
			<div class="best_box">
				<a href="#"> <img class="product_img" src="img/best1.jpg"
					alt="good1">
					<h3>2주 정기배송 샐러드 주5일</h3>
				</a>
				<div class="text_box">
					<span class="discount">25%</span> <span class="dc_price"><strong>46,500원</strong></span>
					<span class="price">63,000원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">
					153</span>
			</div>
			<!--제품사진2-->
			<div class="best_box">
				<a href="#"> <img class="product_img" src="img/best2.jpg"
					alt="good1">
					<h3>2주 정기배송 샐러드 주6일</h3>
				</a>
				<div class="text_box">
					<span class="discount">25%</span> <span class="dc_price"><strong>55,800원</strong></span>
					<span class="price">74,400원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">25</span>
			</div>

			<div class="best_box">
				<a href="#"> <img class="product_img" src="img/best3.jpg"
					alt="good1">
					<h3>2주 정기배송 짜여진 식단</h3>
				</a>
				<div class="text_box">
					<span class="discount">15%</span> <span class="dc_price"><strong>81,300원</strong></span>
					<span class="price">95,600원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">14</span>
			</div>
			<div class="best_box">
				<a href="#"> <img class="product_img" src="img/best4.jpg"
					alt="good1">
					<h3>2주 정기배송 샐러드+간편식</h3>
				</a>
				<div class="text_box">
					<span class="discount">28%</span> <span class="dc_price"><strong>81,100원</strong></span>
					<span class="price">112,000원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">8</span>


			</div>
			<div id="best_btn">
				<button>2주 식단 보기 ></button>
			</div>
		</div>



		<div id="good_product">
			<br> <br>
			<h1>새해 맞이 강력 추천 식단</h1>
			<h2>다이어트,건강 모두 드려요</h2>
			<br>
			<div class="good_box">
				<a href="#"> <img class="product_img" src="img/good1.jpg"
					alt="good1">
					<h3>샐러드 23종 골라담기</h3>

				</a>
				<div class="text_box">
					<span class="discount">24%</span> <span class="dc_price"><strong>4,700원</strong></span>
					<span class="price">6,200원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">2111</span>
			</div>
			<div class="good_box">
				<a href="#"> <img class="product_img" src="img/good2.jpg"
					alt="good1">
					<h3>4주 정기배송 샐러드 주5일</h3>
				</a>
				<div class="text_box">
					<span class="discount">25%</span> <span class="dc_price"><strong>92,400원</strong></span>
					<span class="price">124,000원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">1445</span>
			</div>
			<div class="good_box">
				<a href="#"> <img class="product_img" src="img/good3.jpg"
					alt="good1">
					<h3>4주 정기배송 샐러드 주 3일</h3>
				</a>
				<div class="text_box">
					<span class="discount">25%</span> <span class="dc_price"><strong>55,800원</strong></span>
					<span class="price">74,400원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">224</span>
			</div>
			<div class="good_box">
				<a href="#"> <img class="product_img" src="img/good4.jpg"
					alt="good1">
					<h3>2주 정기배송 샐러드 주5일</h3>
				</a>
				<div class="text_box">
					<span class="discount">25%</span> <span class="dc_price"><strong>46,500원</strong></span>
					<span class="price">62,000원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">153</span>
			</div>
		</div>




		<div id="banner1">
			<img src="img/banner1.jpg" alt="중간배너1"> <img
				src="img/banner2.jpg" alt="중간배너2">
		</div>




		<div id="package_product">
			<br> <br>
			<h1>MD 추천! 베스트 패키지 출시</h1>
			<h2>후기가 증명하는 베스트 샐러드 구성</h2>
			<br>
			<div class="package_box">
				<a href="#"> <img class="product_img" src="img/pkg1.jpg"
					alt="package1">
					<h3>샐러드 23종 골라담기</h3>

				</a>
				<div class="text_box">
					<span class="discount">24%</span> <span class="dc_price"><strong>4,700원</strong></span>
					<span class="price">6,200원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">2111</span>
			</div>
			<div class="package_box">
				<a href="#"> <img class="product_img" src="img/pkg2.jpg"
					alt="package2">
					<h3>4주 정기배송 샐러드 주5일</h3>
				</a>
				<div class="text_box">
					<span class="discount">25%</span> <span class="dc_price"><strong>92,400원</strong></span>
					<span class="price">124,000원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">1445</span>
			</div>
			<div class="good_box">
				<a href="#"> <img class="product_img" src="img/pkg3.jpg"
					alt="package3">
					<h3>4주 정기배송 샐러드 주 3일</h3>
				</a>
				<div class="text_box">
					<span class="discount">25%</span> <span class="dc_price"><strong>55,800원</strong></span>
					<span class="price">74,400원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">224</span>
			</div>
			<div class="good_box">
				<a href="#"> <img class="product_img" src="img/pkg4.jpg"
					alt="package4">
					<h3>2주 정기배송 샐러드 주5일</h3>
				</a>
				<div class="text_box">
					<span class="discount">25%</span> <span class="dc_price"><strong>46,500원</strong></span>
					<span class="price">62,000원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">153</span>
			</div>
		</div>


		<!-- 여기부터 clean widebanner1 pick first widebanner2 widebanner3-->
		<!-- text박스는 바꾸지 말기 #product랑 .box는 추후에 수정? -->
		<div id="clean_product">
			<br> <br>
			<h1>클린핏 식단</h1>
			<h2>1,2주로 완성하는 다이어트</h2>
			<br>
			<div class="clean_box">
				<a href="#"> <img class="product_img" src="img/clean1.jpg"
					alt="clean1">
					<h3>1주 클린핏 샐러드+샐러드</h3>

				</a>
				<div class="text_box">
					<span class="discount">22%</span> <span class="dc_price"><strong>91,900원</strong></span>
					<span class="price">117,700원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">9</span>
			</div>
			<div class="clean_box">
				<a href="#"> <img class="product_img" src="img/clean2.jpg"
					alt="clean1">
					<h3>1주 클린핏 샐러드+라이스</h3>
				</a>
				<div class="text_box">
					<span class="discount">22%</span> <span class="dc_price"><strong>74,100원</strong></span>
					<span class="price">94,600원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">6</span>
			</div>
			<div class="clean_box">
				<a href="#"> <img class="product_img" src="img/clean3.jpg"
					alt="clean3">
					<h3>2주 클린핏 샐러드+샐러드</h3>
				</a>
				<div class="text_box">
					<span class="discount">23%</span> <span class="dc_price"><strong>183,600원</strong></span>
					<span class="price">238,100원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">6</span>
			</div>
			<div class="clean_box">
				<a href="#"> <img class="product_img" src="img/clean4.jpg"
					alt="clean4">
					<h3>2주 클린핏 샐러드+라이스</h3>
				</a>
				<div class="text_box">
					<span class="discount">24%</span> <span class="dc_price"><strong>144,500원</strong></span>
					<span class="price">188,900원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">6</span>
			</div>
		</div>



		<!-- 와이드배너1 -->

		<div class="widebanner">
			<img src="img/widebanner1.jpg" alt="widebanner1">
		</div>


		<!-- pick 이미지 사이즈 다르게 2장-->
		<div id="pick_product">
			<br> <br>
			<h1>쏙쏙! 한 팩 골라담기</h1>
			<h2>구매 만족도99% 골라먹는 즐거움</h2>
			<br>
			<div class="pick_box">
				<a href="#"> <img class="product_img3" src="img/pick1.jpg"
					alt="pick1">
					<h3>샐러드 23종 골라담기</h3>

				</a>
				<div class="text_box">
					<span class="discount">24%</span> <span class="dc_price"><strong>4,700원</strong></span>
					<span class="price">6,200원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">2112</span>
			</div>
			<div class="pick_box">
				<a href="#"> <img class="product_img3" src="img/pick2.jpg"
					alt="pick1">
					<h3>간편식 23종 골라담기</h3>
				</a>
				<div class="text_box">
					<span class="discount">36%</span> <span class="dc_price"><strong>3,500원</strong></span>
					<span class="price">5,500원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">718</span>
			</div>
		</div>



		<!-- first -->
		<div id="first_product">
			<br> <br>
			<h1>처음이라면, 맛보기 어때요?</h1>
			<h2>장바구니 단골템</h2>
			<br>
			<div class="first_box">
				<a href="#"> <img class="product_img" src="img/first1.jpg"
					alt="first1">
					<h3>데일리 닭가슴살 샐러드 5종 맛보기</h3>

				</a>
				<div class="text_box">
					<span class="discount">23%</span> <span class="dc_price"><strong>34,100원</strong></span>
					<span class="price">44,300원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">205</span>
			</div>
			<div class="first_box">
				<a href="#"> <img class="product_img" src="img/first2.jpg"
					alt="first2">
					<h3>채소만 샐러드 5종 맛보기</h3>
				</a>
				<div class="text_box">
					<span class="discount">35%</span> <span class="dc_price"><strong>16,000원</strong></span>
					<span class="price">24,800원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">56</span>
			</div>
			<div class="first_box">
				<a href="#"> <img class="product_img" src="img/first3.jpg"
					alt="first3">
					<h3>두부면 샐러드 2종 맛보기</h3>
				</a>
				<div class="text_box">
					<span class="discount">24%</span> <span class="dc_price"><strong>17,700원</strong></span>
					<span class="price">23,400원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">3</span>
			</div>
			<div class="first_box">
				<a href="#"> <img class="product_img" src="img/first4.jpg"
					alt="first4">
					<h3>미니컵밥 5종 세트</h3>
				</a>
				<div class="text_box">
					<span class="discount">34%</span> <span class="dc_price"><strong>18,300원</strong></span>
					<span class="price">27,700원</span>
				</div>
				<br> <br> <span class="reviewcount"><img
					class="hot_icon" src="img/reviewicon.png" alt="reviewicon">255</span>
			</div>
		</div>

		<!-- widebanner2,3 -->
		<div class="widebanner">
			<img src="img/widebanner2.jpg" alt="widebanner2">
		</div>
		<div class="widebanner">
			<img src="img/widebanner3.jpg" alt="widebanner3">
		</div>

	</div>
	<!-- bottombox -->
	<div id="bottom">
		<div id="center">
			<h4>고객센터</h4>
			<ul>
				<li><a
					href="http://localhost:8080/Web09_10_11/BoardServlet?command=board_list">1:1
						문의</a></li>
				<li><a href="#">배송조회</a></li>
			</ul>
			<strong>1833-5722</strong><br> <br> <br> <br>
			<div id="centeropen">
				<ul>
					<li>월~금:오전10시~오후5시</li>
					<li>점심시간:오후12시30분~오후1시30분</li>
					<li>토요일/일요일/공휴일은 휴무입니다.</li>
				</ul>
			</div>
			<p class="etc">고객센터가 종료된 5시 이후와 토요일/일요일/공휴일에는 1:1 문의 게시판을 이용바랍니다.</p>


		</div>
		<div id="bank">
			<h4>입금 계좌 안내</h4>
			<br>
			<ul>
				<li><strong>예금주 : (주)에이타워</strong></li>
				<li>신한은행 100031681034</li>
				<li>농협은행 3010197022371</li>
				<li>국민은행 43183701013928</li>
				<li>우리은행 1005003043705</li>
			</ul>
		</div>
		<div id="notice">
			<h4>공지사항</h4>
			<div id="more">
				<a href="#">더보기</a>
			</div>
			<br>

			<ul>
				<li><a href="#">2024 멤버쉽 변경 사전 안내</a></li>
				<li><a href="#">2024년 설날 및 임시휴일 배송 일정 안내</a></li>
				<li><a href="#">동계 배송 안내</a></li>
				<li><a href="#">전제품 국산 양상추 생산 안내</a></li>
			</ul>
		</div>
	</div>

	<!-- footer -->
	<footer>
		<div id="foot">
			<div id="footlist">
				<ul>
					<li>회사소개</li>
					<li>이용약관</li>
					<li>개인정보처리방침</li>
					<li>이용안내</li>
				</ul>
				<div id="snsicons">
					<a href="#"> <img src="img/snslogo1.png" alt="인스타그램로고">
					</a> <a href="#"> <img src="img/snslogo2.png" alt="페이스북로고">
					</a> <a href="#"> <img src="img/snslogo3.png" alt="유튜브로고">
					</a>
				</div>
			</div>
			<br>
			<div id="infobox">
				<ul>
					<li>법인명(상호) : 주식회사 에이타워 / 대표 : 박혜리 / TEL : 1833-5722</li>
					<li>사업자등록번호 : 346-88-00170 / 통신판매업신고번호 :2023-경기김포-1041 / <a
						id="buisness" href="#">사업자정보확인</a>
					</li>
					<li>주소 :경기도 김포시 월곶면 김포대로2918번길 34 / 개인정보관리책임자 : 박혜리 / E-Mail :
						<a href="#">pocketsalad@atower.co.kr</a>
					</li>
					<li>Copyright©pocketsalad.co.krAll rights reserved.</li>
				</ul>
				<a href="#"> <img src="img/pocketlogo.png" alt="하단로고이미지">
				</a>
			</div>
		</div>
	</footer>


</body>

</html>