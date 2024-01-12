<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>ORDER | JIN BAKERY</title>
</head>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>
<body>
	<%
	if (sessionId == null) {
		response.sendRedirect("errorPage.jsp?type=0");
	} else if (sessionId.equals("admin")) {
		response.sendRedirect("errorPage.jsp?type=1");
	}
	%>

	<jsp:include page="header.jsp" />

	<div class="jumbotron bg-white">
		<div class="container bg-white">
			<h1 class="display-3 text-center text-info">ORDER</h1>
		</div>
		<hr>
		<div class="container">
			<p class="text-center">상품 주문을 취소하실 수 있습니다.</p>
		</div>
		<hr>
	</div>

	<%@ include file="dbconn.jsp"%>

	<div class="container">
		<table class="table">
			<tr>
				<th>주문 번호</th>
				<th>#</th>
				<th>상품 이름</th>
				<th>개수</th>
				<th>가격</th>
				<th>주문 날짜</th>
				<th></th>
			</tr>
			<%
			PreparedStatement pstmt1 = null;
			ResultSet rs1 = null;

			String sql1 = "select * from orders where memid = ?";
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setString(1, sessionId);
			rs1 = pstmt1.executeQuery();

			while (rs1.next()) {
				String b_name = "";
				PreparedStatement pstmt2 = null;
				ResultSet rs2 = null;

				String sql2 = "select * from bread where b_id = ?";
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, rs1.getString("b_id"));
				rs2 = pstmt2.executeQuery();
				if (rs2.next()) {
					b_name = rs2.getString("b_name");
				}
			%>
			<tr>
				<td><%=rs1.getString("orderid")%></td>
				<td><img src="c:/PTJImage/<%=rs1.getString("b_filename")%>"
					style="width: 50%"></td>
				<td><%=b_name%></td>
				<td><%=rs1.getInt("order_count")%></td>
				<td><%=rs1.getInt("total_price")%></td>
				<td><%=rs1.getString("order_day")%></td>
				<td><a
					href="./deleteOrder.jsp?orderid=<%=rs1.getString("orderid")%>"
					class="btn btn-outline-danger">주문 취소</a></td>
			</tr>
			<%
			if (rs2 != null)
				rs2.close();
			if (pstmt2 != null)
				pstmt2.close();
			}
			%>
		</table>
		<hr>
	</div>

	<%
	if (rs1 != null)
		rs1.close();
	if (pstmt1 != null)
		pstmt1.close();
	if (conn != null)
		conn.close();
	%>

	<jsp:include page="footer.jsp" />
</body>
</html>