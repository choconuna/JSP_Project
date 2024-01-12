<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>BREAD | JIN BAKERY</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="jumbotron bg-white">
		<div class="container bg-white">
			<h1 class="display-3 text-center text-info">BREAD</h1>
		</div>
		<hr>
		<div class="container">
			<p class="text-center">상세페이지에서 제품별 상세 정보를 확인하실 수 있습니다.</p>
		</div>
		<hr>
	</div>

	<div class="container">
		<ul class="nav">
			<li class="nav-item"><a class="nav-link disabled"
				href="./products.jsp">ALL</a></li>
			<li class="nav-item"><a class="nav-link" href="./bread.jsp">BREAD</a>
			</li>
			<li class="nav-item"><a class="nav-link disabled"
				href="./cake.jsp">CAKE</a></li>
			<li class="nav-item"><a class="nav-link disabled"
				href="./sandwich.jsp">SANDWICH</a></li>
		</ul>
		<hr>
	</div>

	<%@ include file="dbconn.jsp"%>

	<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from bread";
	%>

	<div class="container">
		<div class="row col-md-offset-3 col-md-9">
			<h4 class="text-info">
				<b>Bread</b>
			</h4>
		</div>
		<hr>
		<div class="row" align="center">
			<%
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.getString("b_category").toLowerCase().equals(("bread"))) {
			%>
			<div class="col-md-4">
				<img src="c:/PTJImage/<%=rs.getString("b_filename")%>"
					style="width: 80%">
				<h3><%=rs.getString("b_name")%></h3>
				<p>
					<a href="./product.jsp?id=<%=rs.getString("b_id")%>"
						class="btn btn-outline-info" role="button">상세 정보</a>
			</div>
			<%
			}
			}
			%>
		</div>
	</div>

	<%
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	%>

	<jsp:include page="footer.jsp" />
</body>
</html>