<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>UPDATE PRODUCT | JIN BAKERY</title>
</head>
<%
String sessionId = (String) session.getAttribute("sessionId");
String type;
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
			<h1 class="display-3 text-center text-info">UPDATE PRODUCT</h1>
		</div>
		<hr>
		<div class="container">
			<p class="text-center">수정할 상품의 상세 정보를 입력해주세요.</p>
		</div>
		<hr>
	</div>

	<%@ include file="dbconn.jsp"%>
	<%
	String breadId = request.getParameter("id");

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select * from bread where b_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, breadId);
	rs = pstmt.executeQuery();
	if (rs.next()) {
	%>
	<div class="container">
		<h1 class="h4 mb-3 font-weight-normal">
			<b>상품 수정</b>
			<hr>
		</h1>
		<div class="row">
			<div class="col-sm-5">
				<img src="c:/PTJImage/<%=rs.getString("b_filename")%>"
					style="width: 80%">
			</div>
			<div class="col-md-7">
				<form name="newProduct" action="./updateProduct_process.jsp"
					class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-3">아이디</label>
						<div class="col-sm-3">
							<input type="text" name="breadId" class="form-control"
								value="<%=rs.getString("b_id")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">상품명</label>
						<div class="col-sm-3">
							<input type="text" name="bname" class="form-control"
								value="<%=rs.getString("b_name")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">가격</label>
						<div class="col-sm-3">
							<input type="text" name="breadPrice" class="form-control"
								value="<%=rs.getInt("b_unitPrice")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">상세 설명</label>
						<div class="col-sm-5">
							<textarea name="description" cols="50" rows="2"
								class="form-control"><%=rs.getString("b_description")%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">분류</label>
						<div class="col-sm-5">
							<input type="radio" name="category" value="Bread"> BREAD
							<input type="radio" name="category" value="Cake"> CAKE <input
								type="radio" name="category" value="Sandwich"> SANDWICH
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">재고</label>
						<div class="col-sm-3">
							<input type="text" name="unitsInStock" class="form-control"
								value="<%=rs.getLong("b_unistInStock")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">내용량</label>
						<div class="col-sm-3">
							<input type="text" name="content" class="form-control"
								value="<%=rs.getInt("b_content")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">칼로리</label>
						<div class="col-sm-3">
							<input type="text" name="calorie" class="form-control"
								value="<%=rs.getInt("b_calorie")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">알레르기 정보</label>
						<div class="col-sm-6">
							<input type="text" name="allergy" class="form-control"
								value="<%=rs.getString("b_allergy")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3">이미지 사진</label>
						<div class="col-sm-5">
							<input type="file" name="filename" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="button" class="btn btn-info" value="등록"
								onclick="CheckValidation()">
						</div>
					</div>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<%
	}
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