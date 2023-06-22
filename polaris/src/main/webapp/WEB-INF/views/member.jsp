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
<c:set var="nowpass" value="${userInfo.userpass }" />
    <div class="container my-container">
        <h1>회원 정보 수정</h1>
        <form action="memberUpdate" method="post" class="memberUpdate" name="memberUpdate" >

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
                            <div class="new-pass">
                                <input type="password" name="new-pass" id="new-pass" placeholder="새 비밀번호">
                            </div>
                            <div class="re-pass">
                                <input type="password" name="re-pass" id="re-pass" placeholder="새 비밀번호 확인">
                            </div>
                                <ul class="condition-box">
                                <li class="condition">• 영문, 숫자, 특수문자 조합</li>
                                <li class="condition">• 8자리 이상</li>
                                <li class="condition">• 이전에 사용했던 비밀번호는 사용할 수 없습니다.</li>
                           		</ul>
                                <a href="#" class="change-pass">비밀번호 변경</a>
                            
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
                                2000년 06월 11일
                            </div>
                            <div class="c-birth">
                                <a href="#" class="change-b">변경하기</a>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="fourth">
                    <div class="block">
                        <div class="left">
                            휴대폰 번호
                        </div>
                        <div class="right">
                            010-1234-5678
                        </div>
                    </div>
                </div>
                <div class="fifth">
                    <div class="block">
                        <div class="left">
                            이메일
                        </div>
                        <div class="right">
                            example@naver.com
                        </div>
                    </div>
                </div>
                <div class="sixth d-flex justify-between align-center">
                    <div class="leave">회원탈퇴</div>
                        <a href="#" class="leave-box">탈퇴하기</a>
                </div>
              </div>
             </div>
        <%@include file="include/footer.jsp" %>
</body>
</html>