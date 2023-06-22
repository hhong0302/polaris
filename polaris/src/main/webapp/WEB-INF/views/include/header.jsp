<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/reset.css" />
<link rel="stylesheet" href="resources/css/header.css" />
<%
	String userid = (String)session.getAttribute("userid");
%>
<header>
<div class="container">
	<div class="logo_area">
		<a href="/home">
			<img src="resources/images/textlogo_black.svg" alt="logo" />
		</a>
	<div class="search_box">
	<form id="searchForm" action="search" method="GET" autocomplete="off">
	  <input type="text" name="query" class="search" id="searchInput" placeholder="검색어를 입력해주세요." />
	  <a href="#" onclick="submitSearch()">
	    <img src="resources/images/search.jpg" alt="search-icon" />
	  </a>
	</form>
	</div>
	</div>
	<div class="menu_area">
		<ul class="menu">
			<li><a href="totalsearch">전체</a></li>
			<li><a href="genresearch?genre=판타지">판타지</a></li>
			<li><a href="genresearch?genre=소설/시">소설/시</a></li>
			<li><a href="genresearch?genre=추리">추리</a></li>
			<li><a href="genresearch?genre=에세이">에세이</a></li>
			<li><a href="genresearch?genre=자기계발">자기계발</a></li>
			<li><a href="genresearch?genre=미디어 추천">미디어 추천</a></li>
		</ul>
		<div class="member">
			<div class="top-nav">
				<%
					if(userid == null || userid.equals("")){
				%>
					<a href="#">로그인</a>  •
					<a href="#">회원가입</a>
				<%
					}else{
				%>
					<a href="#">로그아웃</a>  •
					<a href="#">마이페이지</a>
				<%
				}
				%>
			</div>
		</div>
	</div>
</div>
</header>
   <script src="resources/js/search.js"></script>