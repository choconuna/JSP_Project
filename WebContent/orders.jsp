<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>ORDERS | JIN BAKERY</title>
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
			<h1 class="display-3 text-center text-info">ORDERS</h1>
		</div>
		<hr>
		<div class="container">
			<p class="text-center">상세페이지에서 주문별 상세 정보를 확인하실 수 있습니다.</p>
		</div>
		<hr>
	</div>

	<%@ include file="dbconn.jsp"%>

	<div class="container">
		<table class="table">
			<tr>
				<th>이름</th>
				<th>이메일</th>
				<th>휴대폰</th>
				<th>주소</th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<%
			PreparedStatement pstmt1 = null;
			ResultSet rs1 = null;

			String sql1 = "select * from shipping where memid = ?";
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setString(1, sessionId);
			rs1 = pstmt1.executeQuery();
			%>
			<%
			while (rs1.next()) {
			%>
			<tr>
				<td><%=rs1.getString("name")%></td>
				<td><%=rs1.getString("mail")%></td>
				<td><%=rs1.getString("phone")%></td>
				<td><%=rs1.getString("address")%></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<%
			String b_name = "";
			String b_filename = "";
			PreparedStatement pstmt2 = null;
			ResultSet rs2 = null;

			String sql2 = "select * from Bread where b_id = ?";
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, rs1.getString("b_id"));
			rs2 = pstmt2.executeQuery();
			if (rs2.next()) {
				b_name = rs2.getString("b_name");
				b_filename = rs2.getString("b_filename");
			}

			int order_count = 0, total_price = 0;
			String order_day = "";
			PreparedStatement pstmt3 = null;
			ResultSet rs3 = null;

			String sql3 = "select * from Orders where memid = ?";
			pstmt3 = conn.prepareStatement(sql3);
			pstmt3.setString(1, sessionId);
			rs3 = pstmt3.executeQuery();
			if (rs3.next()) {
				order_count = rs3.getInt("order_count");
				total_price = rs3.getInt("total_price");
				order_day = rs3.getString("order_day");
			}
			%>
			<tr>
				<td><%=rs1.getString("orderid")%></td>
				<td><img src="c:/PTJImage/<%=b_filename%>" style="width: 50%"></td>
				<td><%=b_name%></td>
				<td><%=order_count%></td>
				<td><%=total_price%></td>
				<td><%=order_day%></td>
				<td><a
					href="./deleteOrder.jsp?orderid=<%=rs1.getString("orderid")%>"
					class="btn btn-outline-danger">주문 취소</a></td>
			</tr>
			<%
			if (rs2 != null)
				rs2.close();
			if (pstmt2 != null)
				pstmt2.close();
			if (rs3 != null)
				rs3.close();
			if (pstmt3 != null)
				pstmt3.close();
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