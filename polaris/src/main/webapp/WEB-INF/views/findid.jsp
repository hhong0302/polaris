<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<img src="resources/textlogo_black.svg" alt="logo">
		</div>
		<h1>아이디 찾기</h1>
		<form action="findid">
			<div class="mj-namebox">
				<label class="mj-name" for="mj-name">이름</label>
				<input type="text" id="mj-name" name="mj-name">
				<div class="nameno">
					<span>! 이름을 입력해주세요.</span>
				</div>
			</div>
			<div class="mj-birthbox">
				<label class="mj-name" for="mj-name">생년월일</label>
				<input type="text" id="mj-name" name="mj-name">
				<div class="birthno">
					<span>! 생년월일 8자리를 입력해주세요.</span>
				</div>
			</div>
			<div class="mj-telbox">
				<label class="mj-name" for="mj-name">휴대폰 번호</label>
				<input type="text" id="mj-name" name="mj-name">
				<div class="telno">
					<span>! 번호를 입력해주세요.</span>
				</div>
			</div>
		</form>
	</div>
<script src="resources/js/login.js"></script>
</body>
</html>