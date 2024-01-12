<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>MEMBERSHIP INFORMATION | JIN BAKERY</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="jumbotron bg-white">
		<div class="container bg-white">
			<h1 class="display-3 text-center text-info">MEMBERSHIP
				INFORMATION</h1>
		</div>
		<hr>
		<div class="container">
			<p class="text-center">회원 정보</p>
		</div>
		<hr>
	</div>

	<div class="container" align="center">
		<%
		String msg = request.getParameter("msg");

		if (msg != null) {
			if (msg.equals("0")) {
		%>
		<p>회원 정보 수정이 완료되었습니다!</p>
		<%
		} else if (msg.equals("1")) {
		%>
		<p>회원 가입이 완료되었습니다!</p>
		<a href="./login.jsp" class="btn btn-lg btn-outline-info btn-block">로그인하러
			가기</a>
		<%
		} else if (msg.equals("2")) {
		response.sendRedirect("breadWelcome.jsp");
		}
		} else {
		%>
		<p>회원 탈퇴가 완료되었습니다. 그동안 이용해주셔서 감사합니다.</p>
		<%
		}
		%>
		
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>