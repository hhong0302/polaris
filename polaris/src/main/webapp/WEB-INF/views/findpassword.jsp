<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<c:choose>
	<c:when test="${empty newpass}">
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
	</c:when>
	<c:when test="${newpass eq 'NotFoundYourId'}">
	<%-- 정보를 찾을 수 없습니다 --%>
	<span id="hg-notfoundId">등록된 회원님의 정보가 없습니다.</span>
	<div>
		<button class="hg-pwbtn hg-wtagain" onclick="location.href='findpassword'">다시 입력</button>
		<button class="hg-pwbtn hg-gotoregi" onclick="opener.location.href='register'; self.close();">회원 가입</button>
	</div>
	</c:when>
	<c:otherwise>
	<%-- 비밀번호 알려주기 --%>
	<div class="hg-newpwforyou">
		<span>신규 임시 비밀번호를 발급했습니다.</span>
		<span>로그인 후 비밀번호를 변경해주세요.</span>
	</div>
	<div id="hg-newpw">${newpass}</div>
	<button id="hg-gotologin" onclick="self.close();">로그인하기</button>
	</c:otherwise>
	</c:choose>
	<input type="hidden" id="mj-name" class="hg-hidden" style="display:none;" />
	<input type="hidden" id="mj-birth" class="hg-hidden" style="display:none;" />
	<input type="hidden" id="mj-tel" class="hg-hidden" style="display:none;" />
	</div>
	<script>
	function noEvent() {
	    if (event.keyCode == 116) {
	        event.keyCode= 2;
	        return false;
	    }
	    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
	    {
	        return false;
	    }
	}
	document.onkeydown = noEvent;
	//스택 추가
	history.pushState(null, null, location.href); 

	// 뒤로라기 이벤트감지 -> 현재페이지로 이동
	window.onpopstate = function() { 
		history.go(1); 
	}
	</script>
	<script src="resources/js/login.js"></script>
</body>
</html>