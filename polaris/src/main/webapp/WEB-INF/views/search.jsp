<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/search.css" />
</head>
<body>
<%@include file="include/header.jsp" %>

<div class="container">
	<div class="search-result">
		<div class="result-title">
			<h3>'세이노의 가르침' 검색결과</h3>
			<p>총 2건</p>
		</div>
		<div class="search-content">
			<div class="book-information">
				<div class="search-img">
					<img src="resources/bookimg/seino.jpg" alt="book" />
				</div>
				<div class="search-context">
					<h3>세이노의 가르침</h3>
					<p><span class="author">세이노</span> 저자 • 팩토리나인</p>
					<p>자기계발</p>
					<p><span class="search-book-context">재야의 명저 『세이노의 가르침』 2023년판 정식 출간! 순자산 천억 원대 자산가,
					 세이노의 ‘요즘 생각’을 만나다</span></p>
				</div>
			</div>
			<div class="rental-box">
				<div class="search-like">
					<img src="resources/images/heartline.jpg" alt="heart" />
					<p>찜 1,240</p>
				</div>
				<div class="btn-box">
					<div class="detail-btn">
						<a href="detail">상세보기</a>
					</div>
					<div class="rental-btn">
						<button type="submit" class="search-rental-btn">대여하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="search-result">
		<div class="result-title">
			<h3>'세이노의 가르침' 검색결과</h3>
			<p>총 2건</p>
		</div>
		<div class="search-content">
			<div class="book-information">
				<div class="search-img">
					<img src="resources/bookimg/giant.jpg" alt="book" />
				</div>
				<div class="search-context">
					<h3>세이노의 가르침</h3>
					<p><span class="author">세이노</span> 저자 • 팩토리나인</p>
					<p>자기계발</p>
					<p><span class="search-book-context">재야의 명저 『세이노의 가르침』 2023년판 정식 출간! 순자산 천억 원대 자산가,
					 세이노의 ‘요즘 생각’을 만나다</span></p>
				</div>
			</div>
			<div class="rental-box">
				<div class="search-like">
					<img src="resources/images/heartline.jpg" alt="heart" />
					<p>찜 1,240</p>
				</div>
				<div class="btn-box">
					<div class="detail-btn">
						<a href="detail">상세보기</a>
					</div>
					<div class="rental-btn">
						<button type="submit" class="search-rental-btn">대여하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="include/footer.jsp" %>
</body>
</html>