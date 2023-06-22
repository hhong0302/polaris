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
                <h3><c:out value="'${searchresult}'" /> 검색결과</h3>
			<p>총 <c:choose>
			      <c:when test="${searchType eq 'search'}">${fn:length(search)}</c:when>
			      <c:when test="${searchType eq 'totalsearch'}">${fn:length(totalsearch)}</c:when>
			      <c:when test="${searchType eq 'genresearch'}">${fn:length(genresearch)}</c:when>
			      <c:when test="${searchType eq 'ordersearch'}">${fn:length(ordersearch)}</c:when>
			      <c:otherwise>0</c:otherwise>
			</c:choose> 건</p>
            </div>
            <c:if test="${searchType eq 'genresearch'}">
	  			<c:set var="searchResult" value="${genresearch}" />
			</c:if>
			<c:if test="${searchType eq 'ordersearch'}">
	 			<c:set var="searchResult" value="${ordersearch}" />
			</c:if>
            <c:if test="${searchType eq 'search'}">
            	 <c:set var="searchResult" value="${search}" />
			</c:if>
			<c:if test="${searchType eq 'totalsearch'}">
			     <c:set var="searchResult" value="${totalsearch}" />
			</c:if>
            <c:forEach var="book" items="${searchResult}">
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
	                       <a href="#" class="likeimgsw">
				             <img src="resources/images/emptyheart.png" class="likeimg1" alt="emptyheart" />
				             <img src="resources/images/fillheart.png" class="likeimg2" alt="fillheart" style="display:none"/>
				           </a>
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
        </div>
        </c:when>
         <c:otherwise>
                <div class="search-empty">
                    <h3>검색 결과가 없습니다.</h3>
                    <p>다른 검색어로 다시 시도해주세요.</p>
                </div>
            </c:otherwise>
        </c:choose>
        <div class="search-banner">
            <img src="resources/banner/banner_band01.jpg" alt="banner" />
        </div>
    </div>
<script src="resources/js/searchpage.js"></script>
    <%@ include file="include/rboxfooter.jsp" %>

</body>
</html>
