<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>JIN BAKERY</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<%
	String hello = "JIN BAKERY에 오신 것을 환영합니다!";
	String tagline = "맛있는 빵을 여러분에게 선물해드리겠습니다";
	%>

	<main role="main">
		<section class="jumbotron text-center bg-white">
			<div class="container bg-white">
				<h1 class="jumbotron-heading text-info"><%=hello%></h1>
				<p class="lead text-muted"><%=tagline%></p>
			</div>
		</section>

		<div class="album py-5 bg-light">
			<div class="container">
				<img src="./resources/image/home.jpg" style="width: 100%" />
			</div>
		</div>
	</main>

	<jsp:include page="footer.jsp" />
</body>
</html>