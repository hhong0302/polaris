<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 결과</title>
    <link rel="stylesheet" href="resources/css/search.css" />
</head>
<body>
    <%@ include file="include/header.jsp" %>

    <div class="container">
    <c:if test="${not empty search}">
        <div class="search-result">
            <div class="result-title">
                <h3>'세이노의 가르침' 검색결과</h3>
                <p>총 ${search.size()}건</p>
            </div>
            <c:if test="${searchType eq 'search'}">
            <c:forEach var="book" items="${search}">
	            <div class="search-content">
	                    <div class="book-information">
	                        <div class="search-img">
	                            <img src="resources/bookimg/${book.bookcode}.jpg" alt="book" />
	                        </div>
	                        <div class="search-context">
	                            <h3>${book.booktitle}</h3>
	                            <p><span class="author">${book.author}</span> ${book.publisher}</p>
	                            <p>${book.genre}</p>
	                            <p><span class="search-book-context">${book.hash}</span></p>
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
            </c:forEach>
            </c:if>
            <c:if test="${searchType eq 'totalsearch'}">
            <c:forEach var="book" items="${totalsearch}">
	            <div class="search-content">
	                    <div class="book-information">
	                        <div class="search-img">
	                            <img src="resources/bookimg/${book.bookcode}.jpg" alt="book" />
	                        </div>
	                        <div class="search-context">
	                            <h3>${book.booktitle}</h3>
	                            <p><span class="author">${book.author}</span> ${book.publisher}</p>
	                            <p>${book.genre}</p>
	                            <p><span class="search-book-context">${book.hash}</span></p>
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
            </c:forEach>
            </c:if>
        </div>
        </c:if>
        <div class="search-banner">
            <img src="resources/banner/banner_band01.jpg" alt="banner" />
        </div>
    </div>

    <%@ include file="include/footer.jsp" %>
</body>
</html>
