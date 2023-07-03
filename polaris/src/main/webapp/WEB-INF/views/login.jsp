<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"  />
<link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
<div class="container">
	<div class="logo">
		<a href="/home"><img class="login-logo" src="resources/images/textlogo_black.svg" alt="LOGO" /></a>
	</div>
	<form action="loginok" method="post" name="login-form" class="login-form">
		<input type="text" name="userid" placeholder="아이디" class="id-area">
	<div class="show-pass">
		<input type="password" name="userpass" placeholder="비밀번호" class="pass-area">
		<div class="eye show"><i class="fa-solid fa-eye-slash fa-lg"></i></div>
	</div>
		<button type="submit" class="login-btn">로그인</button>
	</form>
	<input type="checkbox" id="save-id">
	<label for="save-id" class="save-id">아이디 저장</label>

	<ul class="find">
		<li><a style="cursor:pointer;" onclick="findid()">아이디 찾기</a></li>
		<li><a style="cursor:pointer;" onclick="findPw()">비밀번호 찾기</a></li>
		<li><a href="/home/register">회원가입</a></li>
	</ul>
	<div class="sns-login">
		<a class="n-login" href="#">네이버 아이디로 로그인</a>
		<a class="k-login" href="#">카카오 아이디로 로그인</a>
		<a class="g-login" href="#">구글 아이디로 로그인</a>
	</div>
	</div>
	<script src="https://code.jquery.com/jquery.min.js"></script>
	<script src="resources/js/login.js"></script>
	<script src="resources/js/login-page.js"></script>
</body>
</html>