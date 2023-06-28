<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/footer.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<div class="hg-rightbox">

	<div class="hg-hidebtn" onclick="hg_hidebtn()">
		<img src="resources/images/slide_right.png" alt="slide" id="hg-slidebtn" />
	</div>

	<h1>내 도서관</h1>
	<c:choose>
	<%-- 로그인 안했을 시 --%>
	<c:when test="${sessionScope.userid eq null || empty sessionScope.userid}">
		<span class="hg-afterlogin">
			<a href="login">로그인</a> 후<br/>이용해주세요.
		</span>
		<div class="hg-returnbox" style="display:none;"></div>
		<div class="hg_returnvalidbox" style="display:none;"></div>
	</c:when>
	<%-- 로그인 안했을 시 --%>
	<%-- 로그인 했을 시 --%>
	<c:otherwise>
		<a class="hg-mmlinks" href="mypage">마이페이지</a>
		<a class="hg-mmlinks" href="member">회원정보 수정</a>
		
		<div class="hg-rightline"></div>
		
		<div class="hg-return">
			대여 중인 도서
		</div>

		<%-- 반납 있을 경우 --%>
		
		<%-- 반납 2개 이상 시 반복 --%>
		<div class="hg_returnvalidbox">
			<div class="hg-returnbox">
				<img src="resources/bookimg/spaceboy.jpg" class="hg-rtimg" alt="spaceboy" />
				
				<span class="hg-righttitle">
					당신은 결국 무엇이든 해내는 사람
				</span>
				
				<span class="hg-howmuch">
					1일 남음
				</span>
			</div>
			<%-- 반납 2개 이상 시 반복 --%>
					
			<%-- 2개 이상일 시 나오는 더보기 버튼 --%>
			<%--<div class="hg-rightline"></div>
			
			<button class="hg-rboxbtn" onclick="rboxbtn(this)">+더보기</button>--%>
			<%-- 2개 이상일 시 나오는 더보기 버튼 --%>
			
			<%-- 반납 있을 경우 --%>
			
			<%-- 반납 도서가 없을 시 --%>
					<%-- <div class="hg-returnbox">
						<img src="resources/images/home_noloan.png" class="hg-rtimg" alt="noloan" />
					</div> --%>
			<%-- 반납 도서가 없을 시 --%>
		</div>
	</c:otherwise>
	<%-- 로그인 했을 시 --%>
	</c:choose>
</div>


<div class="hg-gototop">
	<button class="hg-topbtn" onclick="hg_gototop()">
		<i class=" fa-solid fa-chevron-up"></i><br/>
		TOP
	</button>
</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="resources/js/footer.js"></script>
	
<footer id="hg-footer">
	<div class="container hg-footer">
		<div class="hg-ftop">
			<div>
				<a href="/home">
					<img src="resources/images/textlogo_white.svg" alt="logo" />
				</a>
				<span id="hg-fspan">회사소개</span>
				<span class="hg-span">|</span>
				<span>이용약관</span>
				<span class="hg-span">|</span>
				<span>개인정보처리방침</span>
				<span class="hg-span">|</span>
				<span>청소년 보호정책</span>
			</div>
			<div class="hg-familysite">
				
			</div>
		</div>
		<div class="hg-fbottom">
			<div class="hg-fbtop">
				<span>대표 이사 : 누리최</span>
				<span>경기 김포시 김포한강4로 125 10층, 장기동 1604</span>
				<span>사업자 등록 번호 : 012-34-56789</span>
			</div>
			<div class="hg-fbmid">
				<span>대표 번호 : 0000-0000(발신자 부담 전화)</span>
				<span>개인정보 보호 책임자 : 누리최</span>
				<span>통신판매업 신고 : 제 2023-061123호</span>
			</div>
			<div class="hg-fbbottom">
				<span>Copyright © Polaris Company. All Rights Reserved.</span>
			</div>
		</div>
	</div>
</footer>