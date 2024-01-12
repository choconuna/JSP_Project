<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script type="text/javascript">
	function checkForm() {
		var regExpId = /^[a-zA-Z0-9]{4,20}$/;
		var regExpPswd = /[^가-힣ㄱ-ㅎ]{4,20}$/;
		var regExpName = /^[a-zA-Z가-힣]{2,25}$/;
		var regExpYear = /^[0-9]{4}$/;
		var regExpDay = /^[0-9]{1,2}$/;
		var regExpMail = /^[a-zA-Z0-9]{4,20}$/;
		var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
		var regExpAddress = /^[가-힣0-9 ]*$/;

		var id = document.newMember.id;
		var passwd = document.newMember.password;
		var name = document.newMember.name;
		var year = document.newMember.birthyy;
		var day = document.newMember.birthdd;
		var mail = document.newMember.mail1;
		var phone = document.newMember.phone;
		var address = document.newMember.address;

		if (!id.value) {
			alert("아이디를 입력하세요!");
			id.select();
			id.focus();
			return false;
		} else if (!regExpId.test(id.value)) {
			alert("아이디는 숫자/문자만 허용하며, 4~20자만 가능합니다!");
			id.select();
			id.focus();
			return false;
		}

		if (!passwd.value) {
			alert("비밀번호를 입력하세요!");
			return false;
		} else if (!regExpPswd.test(passwd.value)) {
			alert("비밀번호에 한글은 들어갈 수 없습니다!");
			passwd.select();
			passwd.focus();
			return false;
		}

		if (passwd.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요!");
			return false;
		}

		if (!name.value) {
			alert("이름을 입력하세요!");
			name.select();
			name.focus();
			return false;
		} else if (!regExpName.test(name.value)) {
			alert("이름은 영문이나 한글만 허용하며, 2~25자만 가능합니다!");
			name.select();
			name.focus();
			return false;
		}

		if (year.value) {
			if (!regExpYear(year.value)) {
				alert("생년은 숫자 4자만 가능합니다!");
				year.select();
				year.focus();
				return false;
			}
			if (!regExpDay(day.value)) {
				alert("생일은 숫자 4자만 가능합니다!");
				year.select();
				year.focus();
				return false;
			}
		}

		if (!mail.value) {
			alert("메일을 입력하세요!");
			mail.select();
			mail.focus();
			return false;
		} else if (!regExpMail.test(mail.value)) {
			alert("메일은 영문/숫자만 허용하며, 4~20자만 가능합니다!");
			mail.select();
			mail.focus();
			return false;
		}

		if (!phone.value) {
			alert("휴대폰 번호를 입력하세요!");
			phone.select();
			phone.focus();
			return false;
		} else if (!regExpPhone.test(phone.value)) {
			alert("정확한 휴대폰 번호를 입력하세요!");
			mail.select();
			mail.focus();
			return false;
		}

		if (!address.value) {
			alert("주소를 입력하세요!");
			address.select();
			address.focus();
			return false;
		} else if (!regExpAddress.test(address.value)) {
			alert("정확한 주소를 입력하세요!");
			address.select();
			address.focus();
			return false;
		}
	}
</script>
<title>JOIN | JIN BAKERY</title>
</head>
<%
String sessionId = (String) session.getAttribute("sessionId");
String type;
%>
<body>
	<%
	if (sessionId != null) {
		response.sendRedirect("errorPage.jsp?type=1");
	}
	%>

	<jsp:include page="header.jsp" />

	<main role="main">
		<section class="jumbotron text-center bg-white">
			<div class="container bg-white">
				<h1 class="jumbotron-heading text-info">
					<b>JOIN</b>
				</h1>
			</div>
		</section>
	</main>

	<div class="container">
		<h1 class="h4 mb-3 font-weight-normal">
			<b align="left">회원가입</b><br>
			<h6 align="right">
				<small class="text-danger">* </small><small>필수 입력 사항</small>
			</h6>
			<hr>
		</h1>
		<form name="newMember" class="form-horizontal"
			action="join_process.jsp" method="post" onsubmit="return checkForm()">
			<div class="form-group row">
				<label class="col-sm-2">아이디 <span class="text-danger">*</span></label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control"
						placeholder="아이디를 입력해주세요"> <small>&bull; 4자 이상의 영문
						혹은 영문과 숫자를 조합</small>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호 <span class="text-danger">*</span></label>
				<div class="col-sm-3">
					<input name="password" type="password" class="form-control"
						placeholder="비밀번호를 입력해주세요"> <small>&bull; 4자 이상 입력</small>
					<p>
						<small>&bull; 영문/숫자/특수문자(공백 제외)만 허용</small>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호 확인 <span class="text-danger">*</span></label>
				<div class="col-sm-3">
					<input name="password_confirm" type="password" class="form-control"
						placeholder="비밀번호를 한 번 더 입력해주세요"> <small>&bull;
						동일한 비밀번호를 입력해주세요</small>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이름 <span class="text-danger">*</span></label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control"
						placeholder="이름을 입력해주세요">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					<input name="gender" type="radio" value="남" /> 남 <input
						name="gender" type="radio" value="여" /> 여
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생년월일</label>
				<div class="col-sm-4  ">
					<input type="text" name="birthyy" maxlength="4" placeholder="YYYY"
						size="6"> <select name="birthmm">
						<option value="">MM</option>
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
						size="4">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이메일 <span class="text-danger">*</span></label>
				<div class="col-sm-10">
					<input type="text" name="mail1" maxlength="50"
						placeholder="이메일을 입력해주세요"> @ <select name="mail2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">휴대폰 <span class="text-danger">*</span></label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control"
						placeholder="휴대폰 번호를 입력해주세요"> <small>&bull;
						&ndash;를 포함한 휴대폰 번호를 입력해주세요</small>

				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소 <span class="text-danger">*</span></label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control"
						placeholder="주소를 입력해주세요"> <small>&bull;
						시-구-동-번지순으로 차례로 입력해주세요</small>


				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-info" value="등록"> <input
						type="reset" class="btn btn-outline-info" value="취소"
						onclick="reset()">
				</div>
			</div>
		</form>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>