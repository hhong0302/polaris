<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/findidpw.css" />
</head>
<body>
	<div class="hg-pwcontainer">
		<div class="hg-logo">
			<img src="resources/images/textlogo_black.svg" alt="logo" />
		</div>
		<h1 class="hg-pwh1">비밀번호 찾기</h1>
		<form id="findpassword" name="findpassword" action="findPasswordController">
			<div class="hg-pwinfobox">
				<label for="pw-userid">아이디</label>
				<input type="text" class="pw-input" id="pw-userid" name="userid" placeholder="아이디"/>				
			</div>
			<span class="hg-findpwalrt">! 아이디를 확인해주세요.</span>
			
			<div class="hg-pwinfobox">
				<label for="pw-username">이름</label>
				<input type="text" class="pw-input" id="pw-username" name="username" placeholder="이름"/>				
			</div>
			<span class="hg-findpwalrt">! 이름을 확인해주세요.</span>
			
			<div class="hg-pwinfobox">
				<label for="pw-birth">생년월일</label>
				<input type="text" class="pw-input" id="pw-birth" name="birth" maxlength="8" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" placeholder="생년월일 8자리"/>				
			</div>
			<span class="hg-findpwalrt">! 생년월일 8자리를 입력해주세요.</span>
			
			<div class="hg-pwinfobox">
				<label for="pw-mobile">휴대폰번호</label>
				<input type="text" class="pw-input" id="pw-mobile" name="mobile" maxlength="12" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" placeholder="숫자만 입력해주세요."/>				
			</div>
			<span class="hg-findpwalrt">! 숫자를 입력해주세요.</span>
			
			<button type="button" id="findpwbtn" onclick="findPwSubmit()">확인</button>
		</form>
	</div>
	
	
	<script src="resources/js/login.js"></script>
</body>
</html>