<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/header.css" />
<header>
<div class="container">
	<div class="logo_area">
		<a href="/home">
			<img src="resources/images/textlogo_black.svg" alt="logo" />
		</a>
		<div class="search_box">
	  		<input type="text" class="search" placeholder="검색어를 입력해주세요.">
	  		<a href="search"><img src="resources/images/search.jpg" alt="search-icon" /></a>
		</div>
	</div>
	<div class="menu_area">
		<ul class="menu">
			<li><a href="totalsearch">전체</a></li>
			<li><a href="genresearch?genre=판타지">판타지</a></li>
			<li><a href="#">소설/시</a></li>
			<li><a href="#">추리</a></li>
			<li><a href="#">에세이</a></li>
			<li><a href="#">자기계발</a></li>
			<li><a href="#">미디어 추천</a></li>
		</ul>
		<div class="member">
			<div class="top-nav">
				<c:choose>
					<c:when test="">
						<a href="#">로그인</a>  •
						<a href="#">회원가입</a> 
					</c:when>
				<c:otherwise>	
					<a href="#">로그아웃</a>  •
					<a href="#">회원수정</a>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>
</header>