<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-info">
		<div class="container">
			<div class="navbar-header">
				<h1 class="navbar-brand" href="./breadWelcome.jsp">JIN BAKERY</h1>
			</div>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="./breadWelcome.jsp">Home<span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item"><a class="nav-link" href="./story.jsp">Story</a></li>
					<li class="nav-item"><a class="nav-link" href="./products.jsp">Products</a></li>
				</ul>
			</div>
			<div>
				<ul class="navbar-nav mr-auto">
					<c:choose>
						<c:when test="${empty sessionId}">
							<li class="nav-item"><a class="nav-link" href="./join.jsp">Join</a></li>
							<li class="nav-item"><a class="nav-link" href="./login.jsp">Login</a></li>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${sessionId eq 'admin'}">
									<li style="padding-top: 7px; color: white">[<%=sessionId%>]
									</li>
									<li class="nav-item"><a class="nav-link"
										href="./addProduct.jsp">AddProduct</a></li>
									<li class="nav-item"><a class="nav-link"
										href="./editProduct.jsp">EditProduct</a></li>
								</c:when>
								<c:otherwise>
									<li style="padding-top: 7px; color: white">[<%=sessionId%>]
									</li>
									<li class="nav-item"><a class="nav-link"
										href='<c:url value="/updateMember.jsp"/>'> Modify</a>
									<li class="nav-item"><a class="nav-link"
										href="./order.jsp">Order</a></li>
								</c:otherwise>
							</c:choose>
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/logout.jsp"/>">Logout</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>