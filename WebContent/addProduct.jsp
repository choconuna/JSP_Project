<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>ADD PRODUCT | JIN BAKERY</title>
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
			<h1 class="display-3 text-center text-info">ADD PRODUCT</h1>
		</div>
		<hr>
		<div class="container">
			<p class="text-center">추가할 상품의 상세 정보를 입력해주세요.</p>
		</div>
		<hr>
	</div>

	<div class="container">
		<h1 class="h4 mb-3 font-weight-normal">
			<b>상품 등록</b>
			<hr>
		</h1>
		<form name="newProduct" action="./addProduct_process.jsp"
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-3">아이디</label>
				<div class="col-sm-3">
					<input type="text" name="breadId" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">상품명</label>
				<div class="col-sm-3">
					<input type="text" name="bname" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">가격</label>
				<div class="col-sm-3">
					<input type="text" name="breadPrice" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">상세 설명</label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2"
						class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">분류</label>
				<div class="col-sm-5">
					<input type="radio" name="category" value="Bread"> BREAD <input
						type="radio" name="category" value="Cake"> CAKE <input
						type="radio" name="category" value="Sandwich"> SANDWICH
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">재고</label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">내용량</label>
				<div class="col-sm-3">
					<input type="text" name="content" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">칼로리</label>
				<div class="col-sm-3">
					<input type="text" name="calorie" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">알레르기 정보</label>
				<div class="col-sm-6">
					<input type="text" name="allergy" class="form-control">
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
		<hr>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>