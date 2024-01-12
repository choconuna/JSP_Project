<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>ERROR | JIN BAKERY</title>
</head>
<%
String type = request.getParameter("type");
%>
<body>
	<jsp:include page="header.jsp" />

	<div class="jumbotron bg-white">
		<div class="container bg-white">
			<h1 class="display-3 text-center text-info">ERROR</h1>
		</div>
	</div>

	<div class="container" align="center">
		<p>올바르지 않은 접근입니다!</p>
		<%
		if (type.equals("0")) {
		%>
		<p>로그인이 필요합니다!</p>
		<%
		}
		%>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>