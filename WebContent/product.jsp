<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>JIN BAKERY</title>
</head>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>
<script type="text/javascript">
	function addToOrder() {
		var qtt = document.addForm.quantity;
		var stock_int = parseInt(document.addForm.stock.value);
		if (isNaN(qtt.value)) {
			alert("숫자만 입력할 수 있습니다!");
			(document.addForm.quantity).select();
			(document.addForm.quantity).focus();
			return false;
		} else if (qtt.value == 0) {
			alert("0은 입력할 수 없습니다!");
			(document.addForm.quantity).select();
			(document.addForm.quantity).focus();
			return false;
		} else if (qtt.value > stock_int) {
			alert("재고가 부족합니다!");
			(document.addForm.quantity).select();
			(document.addForm.quantity).focus();
			return false;
		}
		confirm("상품 주문이 완료되었습니다!");
		document.addForm.submit();
	}
</script>
<body>
	<jsp:include page="header.jsp" />

	<%@ include file="dbconn.jsp"%>

	<%
	String id = request.getParameter("id");

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select * from bread where b_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		String title = "";
		String category = rs.getString("b_category");
		if (category.toLowerCase().equals("bread"))
			title = "BREAD";
		else if (category.toLowerCase().equals("cake"))
			title = "CAKE";
		else
			title = "SANDWICH";
	%>

	<div class="jumbotron bg-white">
		<div class="container bg-white">
			<h1 class="display-3 text-info"><%=title%></h1>
		</div>
	</div>

	<div class="container">
		<div class="row col-md-offset-2 col-md-10">
			<ul class="nav">
				<li class="nav-item"><a class="nav-link disabled"
					href="./breadWelcome.jsp">HOME</a></li>
				<li class="nav-item"><a class="nav-link disabled"
					href="./products.jsp">ALL</a></li>
				<%
				if (rs.getString("b_category").toLowerCase().equals("bread")) {
				%>
				<li class="nav-item"><a class="nav-link" href="./bread.jsp">BREAD</a></li>
				<%
				}
				%>
				<%
				if (rs.getString("b_category").toLowerCase().equals("cake")) {
				%>
				<li class="nav-item"><a class="nav-link" href="./cake.jsp">CAKE</a></li>
				<%
				}
				%>
				<%
				if (rs.getString("b_category").toLowerCase().equals("sandwich")) {
				%>
				<li class="nav-item"><a class="nav-link" href="./sandwich.jsp">SANDWICH</a></li>
				<%
				}
				%>
			</ul>
		</div>
		<hr>
		<div class="row">
			<div class="col-sm-6">
				<img src="c:/PTJImage/<%=rs.getString("b_filename")%>"
					style="width: 80%">
			</div>
			<div class="col-md-6">
				<h3>
					<b><%=rs.getString("b_name")%></b>
				</h3>
				<p><%=rs.getString("b_description")%></p>
				<p>
					<b>추가 정보</b>
				<hr>
				<p>
					가격 :
					<%=rs.getString("b_unitPrice")%>원
				<p>
					재고 수 :
					<%=rs.getString("b_unistInStock")%>
				<p>
					<b>영양 정보</b>
				<hr>
				<p>
					총 내용량(<%=rs.getString("b_content")%>g)
					<%=rs.getString("b_calorie")%>
					kcal
				<p>
					<b>알레르기 정보</b>
				<hr>
				<p>
					<small><%=rs.getString("b_allergy")%> 함유</small>
				<p>
					<c:choose>
						<c:when test="${empty sessionId}">
						</c:when>
						<c:when test="${sessionId eq 'admin'}">
						</c:when>
						<c:otherwise>
							<form name="addForm"
								action="./addOrder.jsp?id=<%=rs.getString("b_id")%>"
								method="post">
								<p>
									개수 : <input type="text" name="quantity" size="3"> <input
										type="hidden" name="stock"
										value="<%=rs.getString("b_unistInStock")%>">
								<p>
									<a href="#" class="btn btn-info" onclick="addToOrder()">
										주문하기</a>
							</form>
						</c:otherwise>
					</c:choose>
			</div>
			<hr>
		</div>
		<hr>
	</div>
	<%
	}
	%>

	<jsp:include page="footer.jsp" />
</body>
</html>