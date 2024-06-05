<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
</head>
<body>
<script type="text/javascript">

	if(window.name == "update"){ /* open_win(url,name) */
		window.opener.parent.location.href="BoardServlet?command=board_update_form&num=${param.num}"; //open_win()의 부모인 boardView창에서 이동함
	}else if(window.name == "delete"){
		window.opener.parent.location.href="BoardServlet?command=board_delete&num=${param.num}";
	}else if(window.name == "view"){
		window.opener.parent.location.href="BoardServlet?command=board_view&num=${param.num}";
	}
	window.close(); //open.win에서 열린 새창(비밀번호 확인창) 닫힘

</script>
</body>
</html>