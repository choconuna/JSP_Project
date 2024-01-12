<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>LOGIN | JIN BAKERY</title>
</head>

<%
String sessionId = (String) session.getAttribute("sessionId");
String type;
%>
<body>
	<%
	if (sessionId != null) {
		response.sendRedirect("errorPage.jsp?type=1");
	}
	%>

	<jsp:include page="header.jsp" />

	<main role="main">
		<section class="jumbotron text-center bg-white">
			<div class="container bg-white">
				<h1 class="jumbotron-heading text-info">LOGIN</h1>
			</div>
		</section>
	</main>

	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h1 class="h4 mb-3 font-weight-normal">
				<b>로그인</b>
			</h1>
			<%
			String error = request.getParameter("error");
			if (error != null) {
				out.println("<div class='alert alert-info'>");
				out.println("아이디와 비밀번호를 다시 확인해 주세요!");
				out.println("</div>");
			}
			%>
			<form class="form-signin" action="login_process.jsp" method="post">
				<div class="form-group">
					<label for="inputId" class="sr-only">ID</label> <input type="text"
						id="inputId" class="form-control" name="id"
						placeholder="아이디를 입력해주세요" required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">PASSWORD</label> <input
						type="password" name="password" id="inputPassword"
						class="form-control" placeholder="비밀번호를 입력해주세요" required>
				</div>
				<button class="btn btn-lg btn-info btn-block" type="submit">로그인</button>
				<a href="./join.jsp" class="btn btn-lg btn-block btn-outline-info">회원가입</a>
			</form>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>

</html>