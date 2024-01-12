<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<%
String sessionId = (String) session.getAttribute("sessionId");
String type;

if (sessionId == null) {
	response.sendRedirect("errorPage.jsp?type=0");
}
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/BakeryDB"
	driver="com.mysql.jdbc.Driver" user="root" password="100409" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=?
   <sql:param value="<%=sessionId%>" />
</sql:query>

<title>MODFIFY MEMBER | JIN BAKERY</title>
</head>
<body onload="init()">
	<jsp:include page="header.jsp" />

	<div class="jumbotron bg-white">
		<div class="container bg-white">
			<h1 class="display-3 text-center text-info">MODFIFY MEMBER</h1>
		</div>
		<hr>
		<div class="container">
			<p class="text-center">수정할 정보를 입력해주세요.</p>
		</div>
		<hr>
	</div>

	<c:forEach var="row" items="${resultSet.rows}">
		<c:set var="mail" value="${row.mail}" />
		<c:set var="mail1" value="${mail.split('@')[0]}" />
		<c:set var="mail2" value="${mail.split('@')[1]}" />

		<c:set var="birth" value="${row.birth}" />
		<c:set var="year" value="${birth.split('/')[0]}" />
		<c:set var="month" value="${birth.split('/')[1]}" />
		<c:set var="day" value="${birth.split('/')[2]}" />

		<div class="container">
			<h1 class="h4 mb-3 font-weight-normal">
				<b>회원 정보 수정</b>
				<hr>
			</h1>
			<form name="newMember" class="form-horizontal"
				action="updateMember_process.jsp" method="post"
				onsubmit="return checkForm()">
				<div class="form-group row">
					<label class="col-sm-2 ">아이디</label>
					<div class="col-sm-3">
						<input name="id" type="text" class="form-control"
							placeholder="아이디를 입력해주세요
							value=" <c:out value='${row.id}'/>" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-3">
						<input name="password" type="password" class="form-control"
							placeholder="비밀번호를 입력해주세요"
							value="<c:out value='${row.password}'/>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">비밀번호 확인</label>
					<div class="col-sm-3">
						<input name="password_confirm" type="password"
							class="form-control" placeholder="비밀번호를 한 번 더 입력해주세요">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">이름</label>
					<div class="col-sm-3">
						<input name="name" type="text" class="form-control"
							placeholder="이름을 입력해주세요" value="<c:out value='${row.name}'/>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">성별</label>
					<div class="col-sm-10">
						<c:set var="gender" value="${row.gender}" />
						<input name="gender" type="radio" value="남"
							<c:if test="${gender.equals('남')}"> <c:out value="checked" /> </c:if>>남
						<input name="gender" type="radio" value="여"
							<c:if test="${gender.equals('여')}"> <c:out value="checked" /> </c:if>>여
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">생년월일</label>
					<div class="col-sm-4">
						<input type="text" name="birthyy" maxlength="4" placeholder="YYYY"
							size="6" value="${year}"> <select name="birthmm"
							id="birthmm">
							<option value="">월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select> <input type="text" name="birthdd" maxlength="2" placeholder="DD"
							size="4" value="${day}">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">이메일</label>
					<div class="col-sm-10">
						<input type="text" name="mail1" maxlength="50" value="${mail1}">@
						<select name="mail2" id="mail2">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">휴대폰</label>
					<div class="col-sm-3">
						<input name="phone" type="text" class="form-control"
							placeholder="휴대폰 번호를 입력해주세요"
							value="<c:out value='${row.phone}'/>">

					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 ">주소</label>
					<div class="col-sm-5">
						<input name="address" type="text" class="form-control"
							placeholder="주소를 입력해주세요" value="<c:out value='${row.address}'/>"><small>&bull;
							시-구-동-번지순으로 차례로 입력해주세요</small>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10 ">
						<input type="submit" class="btn btn-info" value="수정"> <a
							href="./deleteMember.jsp" class="btn btn-outline-info">탈퇴</a>
					</div>
				</div>
			</form>
		</div>
	</c:forEach>

	<jsp:include page="footer.jsp" />
</body>
</html>
<script type="text/javascript">
	function init() {
		setComboMailValue("${mail2}");
		setComboBirthValue("${month}");
	}

	function setComboMailValue(val) {
		var selectMail = document.getElementById('mail2');
		for (i = 0, j = selectMail.length; i < j; i++) {
			if (selectMail.options[i].value == val) {
				selectMail.options[i].selected = true;
				break;
			}
		}
	}
	function setComboBirthValue(val) {
		var selectBirth = document.getElementById('birthmm');
		for (i = 0, j = selectBirth.length; i < j; i++) {
			if (selectBirth.options[i].value == val) {
				selectBirth.options[i].selected = true;
				break;
			}
		}
	}
	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력해 주세요!");
			return false;
		}
		if (!document.newMember.password.value) {
			alert("비밀번호를 입력해 주세요!");
			return false;
		}
		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("동일한 비밀번호를 입력해 주세요!");
			return false;
		}
	}
</script>