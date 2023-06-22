<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<%@include file="include/header.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"  />
<link rel="stylesheet" href="resources/css/register.css" />
<div class="container my-container">
<h1>회원 정보 입력</h1>
<%
	String id = (String) session.getAttribute("userid");
%>
	<p><%=id %></p>
	<div class="form-con">
		<form action="registerok" method="post" class="registerform" name="registerform" >
			<label class="label-name" for="userid">아이디</label>
			<div class="id-area">
			<input type="text" name="userid" id="userid" class="input-idpart" placeholder="아이디" />
			<button id="idcheck" class="checkid" type="button">중복확인</button>
			</div>
			<div class="idcheckno">
				<span></span><span id="idcheckno-message">올바른 아이디를 입력해주세요.</span>
			</div>
			<div class="alreadyid">
				<span></span><span id="alreadyid-message">이미 존재하는 아이디입니다.</span>
			</div>
			<div class="idcheckok">
				<span></span><span id="idcheckok-message">사용 가능한 아이디입니다.</span>
			</div>
			<p id="check-option0"><span>영문,숫자 조합 5-20자 / 특수문자 포함 불가</span></p>
			
			<label class="label-name" for="userpass">비밀번호</label>
			<div class="show-pass">
			<input type="password" name="userpass" class="passinput" id="userpass" placeholder="비밀번호" />
			<div class="eye show"><img src="resources/images/show-pass.png" alt="show-pass"></div>
			</div>
			<div class="passcheckno">
				<span></span><span id="passcheckno-message">비밀번호를 다시 입력해주세요.</span>
			</div>
			<div class="passcheckok">
				<span></span><span id="passcheckok-message">사용 가능한 비밀번호입니다.</span>
			</div>
			<p id="check-option1" class="option1"><i class="fa-solid fa-check"></i>영문,숫자,특수문자 조합</p>
			<p id="check-option2" class="option2"><i class="fa-solid fa-check"></i>8자리 이상 20자리 이하</p>
			
			<label class="label-name" for="reuserpass">비밀번호 확인</label>
			<div class="show-repass">
			<input type="password" name="reuserpass" class="repassinput" id="reuserpass" placeholder="비밀번호 확인" />
			<div class="eye"><img src="resources/images/show-pass.png" alt="show-pass"></div>
			</div>
			<div class="repasscheckno">
				<span></span><span id="repasscheckno-message">비밀번호가 일치하지 않습니다.</span>
			</div>
			<div class="repasscheckok">
				<span></span><span id="repasscheckok-message">비밀번호가 일치합니다.</span>
			</div>
			
			<label class="label-name" for="username">이름</label>
			<input type="text" name="username" id="username" placeholder="이름" />
			<div class="namecheckno">
				<span></span><span id="namecheckno-message">이름을 입력해주세요.</span>
			</div>
			
			<label class="label-name" for="birth">생년월일</label>
			<input type="tel" name="birth" id="birth" placeholder="생년월일 8자" minlength="8" maxlength="8" />
			<div class="birthcheckno">
				<span></span><span id="namecheckno-message">생년월일 8자를 입력해주세요</span>
			</div>
			
			<label class="label-name" for="tel">휴대폰 번호</label>
			<input type="tel" name="tel" id="tel" placeholder="숫자만 입력 (01012345678)" minlength="11" maxlength="11" />
			<div class="telcheckno">
				<span></span><span id="telcheckno-message">올바른 번호를 입력해주세요.</span>
			</div>
			
			<label class="label-name" for="email">이메일</label>
			<input type="email" name="email" id="email" placeholder="이메일 (example@email.com)" />
			<div class="mailcheckno">
				<span></span><span id="mailcheckno-message">올바른 이메일 형식이 아닙니다.</span>
			</div>
			<button type="button" class="fregister" onclick="register()">입력 완료</button>
		</form>
	</div>
</div>
	
	
	
<%@include file="include/footer.jsp" %>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="resources/js/register.js"></script>
</body>
</html>