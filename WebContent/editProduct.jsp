<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>EDIT PRODUCT | JIN BAKERY</title>
</head>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 상품을 삭제합니다!") == true)
			location.href = "./deleteProduct.jsp?id=" + id;
		else
			return;
	}
</script>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>
<body>
	<%
	if (sessionId == null) {
		response.sendRedirect("errorPage.jsp?type=0");
	} else if (!sessionId.equals("admin")) {
		response.sendRedirect("errorPage.jsp?type=1");
	}
	%>

	<jsp:include page="header.jsp" />

	<div class="jumbotron bg-white">
		<div class="container bg-white">
			<h1 class="display-3 text-center text-info">EDIT PRODUCT</h1>
		</div>
		<hr>
		<div class="container">
			<p class="text-center">편집할 상품을 선택해주세요.</p>
		</div>
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
					<a href="./updateProduct.jsp?id=<%=rs.getString("b_id")%>"
						class="btn btn-outline-info" role="button">수정</a> <a href="#"
						onclick="deleteConfirm('<%=rs.getString("b_id")%>')"
						class="btn btn-info" role="button">삭제</a>
			</div>
			<%
			}
			}
			%>
		</div>
	</div>

	<div class="container">
		<div class="row col-md-offset-2 col-md-10">
			<h4 class="text-info">
				<b>Cake</b>
			</h4>
		</div>
		<hr>
		<div class="row" align="center">
			<%
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.getString("b_category").toLowerCase().equals(("cake"))) {
			%>
			<div class="col-md-4">
				<img src="c:/PTJImage/<%=rs.getString("b_filename")%>"
					style="width: 80%">
				<h3><%=rs.getString("b_name")%></h3>
				<p>
					<a href="./updateProduct.jsp?id=<%=rs.getString("b_id")%>"
						class="btn btn-outline-info" role="button">수정</a> <a href="#"
						onclick="deleteConfirm('<%=rs.getString("b_id")%>')"
						class="btn btn-info" role="button">삭제</a>
			</div>
			<%
			}
			}
			%>
		</div>
	</div>

	<div class="container">
		<div class="row col-md-offset-2 col-md-10">
			<h4 class="text-info">
				<b>Sandwich</b>
			</h4>
		</div>
		<hr>
		<div class="row" align="center">
			<%
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (rs.getString("b_category").toLowerCase().equals(("sandwich"))) {
			%>
			<div class="col-md-4">
				<img src="c:/PTJImage/<%=rs.getString("b_filename")%>"
					style="width: 80%">
				<h3><%=rs.getString("b_name")%></h3>
				<p>
					<a href="./updateProduct.jsp?id=<%=rs.getString("b_id")%>"
						class="btn btn-outline-info" role="button">수정</a> <a href="#"
						onclick="deleteConfirm('<%=rs.getString("b_id")%>')"
						class="btn btn-info" role="button">삭제</a>
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