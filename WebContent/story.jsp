<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>STORY | JIN BAKERY</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="jumbotron bg-white">
		<div class="container bg-white">
			<h1 class="display-3 text-center text-info">STORY</h1>
		</div>
	</div>

	<div class="container">
		<ul class="nav">
			<li class="nav-item"><a class="nav-link disabled"
				href="./story.jsp">STORY</a>
		</ul>
		<hr>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<img src="./resources/image/introduce.jpg" style="width: 80%" />
			</div>
			<div class="col-sm-6">
				<h3 class="display-4 text-left">소개</h3>
				<hr>
				<p>JIN BAKERY는 빵을 좋아한다는 마음 하나로 시작하였습니다.</p>
				<p>내가 직접 먹는다는 생각으로 빵을 만듭니다.</p>
				<p>고객님들께 좋은 재료로 좋은 품질의 빵을 만들어 선물해드리겠습니다.</p>
			</div>
		</div>
		<hr>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>