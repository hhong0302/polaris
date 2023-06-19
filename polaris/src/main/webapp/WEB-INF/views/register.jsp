<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"  />
<link rel="stylesheet" href="resources/css/register.css" />
</head>
<body>
<%@include file="include/header.jsp" %>
<div class="container my-container">
<h1>회원 정보 입력</h1>
	<div class="form-con">
		<form action="registerok" method="post" class="formbox" >
			<label class="label-name" for="userid">아이디</label>
			<div class="id-area">
			<input type="text" name="userid" id="userid" class="input-idpart" placeholder="아이디" />
			<button class="checkid" type="button">중복확인</button>
			</div>
			
			<label class="label-name" for="userpass">비밀번호</label>
			<div class="show-pass">
			<input type="password" name="userpass" class="passinput" id="userpass" placeholder="비밀번호" />
			<div class="eye"><i class="fa-solid fa-eye"></i></div>
			</div>
			<p id="check-option"><i class="fa-solid fa-check"></i><span>영문,숫자,특수문자 조합</span></p>
			<p id="check-option"><i class="fa-solid fa-check"></i><span>8자리 이상</span></p>
			
			<label class="label-name" for="reuserpass">비밀번호 확인</label>
			<div class="show-repass">
			<input type="password" name="reuserpass" class="repassinput" id="reuserpass" placeholder="비밀번호 확인" />
			<div class="eye"><i class="fa-solid fa-eye"></i></div>
			</div>
			
			<label class="label-name" for="username">이름</label>
			<input type="text" name="username" id="username" placeholder="이름" />
			
			<label class="label-name" for="birth">생년월일</label>
			<input type="number" name="birth" id="birth" placeholder="생년월일 8자" />
			
			<label class="label-name" for="tel">휴대폰 번호</label>
			<input type="number" name="tel" id="tel" placeholder="숫자만 입력 (01012345678)" />
			
			<label class="label-name" for="email">이메일</label>
			<input type="email" name="email" id="email" placeholder="이메일 (example@email.com)" />
			
			<button class="fregister" type="button">입력 완료</button>
		</form>
	</div>
</div>
	
	
	
	
<%@include file="include/footer.jsp" %>
</body>
</html>
</body>
</html>