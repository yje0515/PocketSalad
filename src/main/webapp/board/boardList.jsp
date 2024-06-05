<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="css/boardList.css" type="text/css">

</head>
<body>
	<!-- 상단 -->
	<jsp:include page="../header.jsp" />

	<div class="boardBox">
		<h1>문의 게시판</h1>
		<div class="listWrap">
			<table class="list">
				<tr>
					<td colspan="5" style="border: white; text-align: right"><input
						type="button" class="btn2" value="글쓰기"
						onclick="location.href='BoardServlet?command=board_write_form'">
						<!--게시글 작성을 누르면 board_write_form  --></td>
				</tr>
				<tr>
					<th>글번호</th>
					<th class="subject">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="board" items="${boardList }">
					<tr class="record">
						<td>${board.num }</td>
						<td class="subject"><a
							href="BoardServlet?command=board_view&num=${board.num }">${board.title }</a></td>



						<td>${board.username }</td>
						<td><fmt:formatDate value="${board.writedate }" /></td>
						<td>${board.readcount }</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<!-- 목록 페이징 -->
		<div class="pageBox">
			<ul class="board_paging">
				<!-- 첫페이지로  -->
				<li><a
					href="http://localhost:8080/Web09_10_11/BoardServlet?command=board_list&page=1${searchStatus}">&lt;&lt;</a></li>
				<!-- 이전 페이지로 -->
				<li><c:choose>
						<c:when test="${page == 1}">
							<a href="javascript:;">&lt;</a>
							<!-- 예외처리 첫번째 페이지일 경우 이전페이지로 이동 비활성화 -->
						</c:when>
						<c:otherwise>
							<a
								href="http://localhost:8080/Web09_10_11/BoardServlet?command=board_list&page=${page-1}${searchStatus}">&lt;</a>
						</c:otherwise>
					</c:choose></li>
				<c:forEach var="p" begin="${pagestart}" end="${pageend}">
					<li><a
						href="http://localhost:8080/Web09_10_11/BoardServlet?command=board_list&page=${p}${searchStatus}"
						<c:if test="${p == page}">
          				class = 'current_page'
      				</c:if>>${p}</a>
					</li>
				</c:forEach>
				<!-- 다음페이지로 -->
				<li><c:choose>
						<c:when test="${page == pagemax}">
							<a href="javascript:;">&gt;</a>
							<!-- 예외처리 마지막페이지인 경우 다음페이지 이동 비활성화 -->
						</c:when>
						<c:otherwise>
							<a
								href="http://localhost:8080/Web09_10_11/BoardServlet?command=board_list&page=${page+1}${searchStatus}">&gt;</a>
						</c:otherwise>
					</c:choose></li>
				<!-- 마지막 페이지로  -->
				<li><a
					href="http://localhost:8080/Web09_10_11/BoardServlet?command=board_list&page=${pagemax}${searchStatus}">&gt;&gt;</a>
				</li>
			</ul>
		</div>

	</div>

	<!-- 하단 -->
	<jsp:include page="../footer.jsp" />

</body>
</html>