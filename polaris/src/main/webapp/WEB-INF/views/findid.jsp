<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/findidpw.css" />
</head>
<body>
	<div class="id-container">
		<div class="ID-logo">
			<img src="resources/images/textlogo_black.svg" alt="logo">
		</div>
	<c:choose>
	<c:when test="${empty userid}">
		<h1>아이디 찾기</h1>
		<form action="findidok" id="findid" method="post" name="findid">
			<div class="mj-namebox">
				<label for="mj-name">이름</label>
				<input type="text" id="mj-name" name="mj-name" placeholder="이름">
				<div class="nameno">
					<span>! 이름을 입력해주세요.</span>
				</div>
			</div>
			<div class="mj-birthbox">
				<label for="mj-birth">생년월일</label>
				<input type="text" id="mj-birth" name="mj-birth" placeholder="생년월일 8자리" maxlength="8" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
				<div class="birthno">
					<span>! 생년월일 8자리를 입력해주세요.</span>
				</div>
			</div>
			<div class="mj-telbox">
				<label for="mj-tel">휴대폰 번호</label>
				<input type="text" id="mj-tel" name="mj-tel" placeholder="숫자만 입력해주세요." maxlength="12" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
				<div class="telno">
					<span>! 번호를 입력해주세요.</span>
				</div>
			</div>
			<button class="findid-btn" type="button" onclick="findidok()">확인</button>
		</form>
		</c:when>
		<c:when test="${userid eq 'NotFoundYourId'}">
	<%-- 정보를 찾을 수 없습니다 --%>
	<span id="mj-notfoundId">등록된 회원님의 정보가 없습니다.</span>
	<div>
		<button class="mj-pwbtn mj-wtagain" onclick="location.href='findid'">다시 입력</button>
		<button class="mj-pwbtn mj-gotoregi" onclick="opener.location.href='register'; self.close();">회원 가입</button>
	</div>
	</c:when>
	<c:otherwise>
	<%-- 아이디 알려주기 --%>
	<div class="mj-newpwforyou">
		<span>회원님의 아이디 정보입니다.</span>
	</div>
	<div id="mj-newpw">${userid}</div>
	</c:otherwise>
	</c:choose>
	</div>

<script src="resources/js/login.js"></script>
</body>
</html>