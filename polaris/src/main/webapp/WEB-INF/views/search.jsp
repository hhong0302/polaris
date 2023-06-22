<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <c:choose>
    <c:when test="${not empty searchresult}">
        <div class="search-result">
            <div class="result-title">
                <h3><c:out value="'${searchresult}'"/> 검색결과</h3>
                <p>총 <c:out value="${searchType eq 'search' ? fn:length(search) : searchType eq 'totalsearch' ? fn:length(totalsearch) : fn:length(genresearch)}" /> 건</p>
            </div>
            <c:if test="${searchType eq 'search'}">
            <c:forEach var="book" items="${search}">
            	<div class="book-box">
	            <div class="search-content">
	                    <div class="book-information">
	                        <div class="search-img">
	                            <img src="resources/bookimg/${book.bookcode}.jpg" alt="book" />
	                        </div>
	                        <div class="search-context">
	                            <h3>${book.booktitle}</h3>
	                           <p>${book.author} • ${book.publisher}</p>
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
	            </div>
            </c:forEach>
            </c:if>
            <c:if test="${searchType eq 'totalsearch'}">
            <c:forEach var="book" items="${totalsearch}" >
            	<div class="book-box">
	            <div class="search-content">
	                    <div class="book-information">
	                        <div class="search-img">
	                            <img src="resources/bookimg/${book.bookcode}.jpg" alt="book" />
	                        </div>
	                        <div class="search-context">
	                            <h3>${book.booktitle}</h3>
	                            <p>${book.author} • ${book.publisher}</p>
	                            <p>${book.genre}</p>
	                            <p><span class="search-book-context">${book.bookcontent}</span></p>
	                        </div>
	                    </div>
	                
	                <div class="rental-box">
	                    <div class="search-like">
	                        <img src="resources/images/heartline.jpg" alt="heart" />
	                        <p>찜 1,240</p>
	                    </div>
	                    <div class="btn-box">
	                        <div class="detail-btn">
	                            <a href="detail?bookinfo=${book.bookcode}">상세보기</a>
	                        </div>
	                        <div class="rental-btn">
	                            <button type="submit" class="search-rental-btn">대여하기</button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            </div>
            </c:forEach>
            </c:if>
            <c:if test="${searchType eq 'genresearch'}">
            <c:forEach var="book" items="${genresearch}">
            	<div class="book-box">
	            <div class="search-content">
	                    <div class="book-information">
	                        <div class="search-img">
	                            <img src="resources/bookimg/${book.bookcode}.jpg" alt="book" />
	                        </div>
	                        <div class="search-context">
	                            <h3>${book.booktitle}</h3>
	                            <p>${book.author} • ${book.publisher}</p>
	                            <p>${book.genre}</p>
	                            <p><span class="search-book-context">${book.bookcontent}</span></p>
	                        </div>
	                    </div>
	                
	                <div class="rental-box">
	                    <div class="search-like">
	                    	<a href="#" id="likeimg" onclick="switchlike()">
	                        	<img src="resources/images/heartline.jpg" alt="heart" />
	                        </a>
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
            </c:forEach>
            </c:if>
        </div>
        </c:when>
        </c:choose>
        <div class="search-banner">
            <img src="resources/banner/banner_band01.jpg" alt="banner" />
        </div>
    </div>

    <%@ include file="include/rboxfooter.jsp" %>

</body>
</html>
