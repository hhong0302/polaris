<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="include/header.jsp" %>
<link rel="stylesheet" href="resources/css/member.css">
</head>
<body>
    <div class="container my-container">
        <h1>회원 정보 수정</h1>
        <form action="passUpdate" method="post" class="memberUpdate" name="memberUpdate" >

                <div class="first">
                    <div class="block">
                        <div class="left">
                            이름
                        </div>
                        <div class="right">
                            ${userInfo.username }
                        </div>
                    </div>
                    <div class="block">
                        <div class="left">
                            아이디
                        </div>
                        <div class="right">
                            ${userInfo.userid }
                        </div>
                    </div>
                </div>
                <div class="second">
                    <div class="block">
                        <div class="left">
                            <span class="pass-position">비밀번호</span>
                        </div>
                        <div class="right">
                            <div class="now-pass">
                                <input type="password" name="now-pass" id="now-pass" placeholder="현재 비밀번호">
                            </div>
                            <div class="passcheckno">
                                <span></span><span id="passcheckno-message">현재 비밀번호와 일치하지 않습니다.</span>
                            </div>
                            <div class="new-pass">
                                <input type="password" name="new-pass" id="new-pass" placeholder="새 비밀번호">
                            </div>
                            <div class="newpassno">
                                <span></span><span id="newpassno-message">새 비밀번호를 다시 입력해주세요.</span>
                            </div>
                            <div class="re-pass">
                                <input type="password" name="re-pass" id="re-pass" placeholder="새 비밀번호 확인">
                            </div>
                            <div class="renewpassno">
                                <span></span><span id="renewpassno-message">비밀번호가 일치하지 않습니다.</span>
                            </div>
                            <input type="hidden" name="current-pass" id="current-pass" value="${ userInfo.userpass }" />
                                <ul class="condition-box">
                                <li class="condition">• 영문, 숫자, 특수문자 조합</li>
                                <li class="condition">• 8자리 이상</li>
                                <li class="condition">• 이전에 사용했던 비밀번호는 사용할 수 없습니다.</li>
                           		</ul>
                                <button type="button" onclick="changePass()" class="change-pass">비밀번호 변경</button>
                            
                        </div>
                    </div>
                    
                </div>
                </form>
			<div class="memberUpdate2">
                <div class="third">
                    <div class="block">
                        <div class="left">
                          <div class="l-birth">
                            생년월일
                          </div>  
                            
                        </div>
                        <div class="right d-flex justify-between align-center">
                            <div class="birth">
                                ${ userInfo.birth }
                            </div>
                            <div class="c-birth">
                                <button type="button" class="change-b">변경하기</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="block">
                    <div class="left"></div>
                    <div class="right">
                        <form action="changeBirth" class="changeBirthArea" name="changeBirthArea" method="post">
                            <input type="number" name="new-birth" id="new-birth" placeholder="생년월일 8자리" >
                            <button type="button" onclick="changeBirth()" class="change-birth">생년월일 변경</button>
                        </form>
                    </div>
                </div>
                <div class="fourth">
                    <div class="block">
                        <div class="left">
                            휴대폰 번호
                        </div>
                        <div class="right">
                            ${userInfo.usertel }
                        </div>
                    </div>
                </div>
                <div class="fifth">
                    <div class="block">
                        <div class="left">
                            이메일
                        </div>
                        <div class="right">
                            ${userInfo.useremail }
                        </div>
                    </div>
                </div>
                <div class="sixth d-flex justify-between align-center">
                    <div class="leave">회원탈퇴</div>
                        <a href="exit" onclick="return confirm('정말로 회원을 탈퇴하시겠습니까?')" class="leave-box">탈퇴하기</a>
                </div>
              </div>
             </div>
<%@include file="include/footer.jsp" %>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="resources/js/member.js"></script>
</body>
</html>