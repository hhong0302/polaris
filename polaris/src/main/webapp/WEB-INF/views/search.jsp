<%@page import="com.polaris.home.dao.PolarisDAO"%>
<%@page import="com.polaris.home.dto.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 결과</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="resources/css/search.css" />
</head>
<body>
    <%@ include file="include/header.jsp" %>
	<%
		PolarisDAO dao = new PolarisDAO();
		String uid = (String) session.getAttribute("userid");
		HttpSession sessionObj = request.getSession();
		int likeClick = (int) session.getAttribute("likeClick");
	%>
    <div class="container">
        <c:choose>
            <c:when test="${searchType eq 'search'}">
                <c:choose>
                    <c:when test="${not empty searchresult and (fn:length(search) > 0 or fn:length(totalsearch) > 0 or fn:length(genresearch) > 0 or fn:length(ordersearch) > 0)}">
                        <div class="search-result">
                            <div class="result-title">
                                <h3><c:out value="'${searchresult}'" /> 검색결과</h3>
                                <p>총 ${fn:length(search)} 건</p>
                            </div>
                                 <c:forEach var="book" items="${search}" varStatus="status">

                                <div class="book-box">
                                    <div class="search-content">
                                        <div class="book-information">
                                            <div class="search-img">
                                            <a href="detail?bookinfo=${book.bookcode}">
                                                <img src="resources/bookimg/${book.bookcode}.jpg" alt="book" />
                                            </a>
                                            </div>
                                            <div class="search-context">
                                                <h3><a href="detail?bookinfo=${book.bookcode}">${book.booktitle}</a></h3>
                                                <p><a href="search?query=${book.author}">${book.author}</a> • <a href="search?query=${book.publisher}">${book.publisher}</a></p>
                                                <p><a href="search?query=${book.genre}">${book.genre}</a></p>
                                                <p><span class="search-book-context">${book.hash}</span></p>
                                            </div>
                                        </div>
<%
											if (uid == null){
										%>
											<div  class="rental-box">
												<div class="search-like" onclick="reject()">
													<img src="resources/images/emptyheart.png" class="likeimg1" alt="emptyheart" />
													<p>찜 ${likeCount}</p>
												</div>
												<div class="btn-box">
													<div class="detail-btn-box">
														<a href="detail?bookinfo=${book.bookcode}" class="detail-btn">상세보기</a>
													</div>
													<div onclick="reject()" class="rental-btn">
														<button type="button" class="search-rental-btn">대여하기</button>
													</div>
												</div>
											</div>
										<%
										}else{
										%>
											<div  class="rental-box">
												<div class="search-like" >
												    <img src="resources/images/emptyheart.png" class="likeimg1 likeimg1-${book.bookcode}" alt="emptyheart" onclick="likeSuccess('${book.bookcode}', '${uid}', '${book.booktitle}', '${book.author}', '${book.publisher}', this)"/>
												    <p class="likecount likecount-${book.bookcode}">찜 ${likeCount}</p>
												</div>
												<div class="btn-box">
													<div class="detail-btn-box">
														<a href="detail?bookinfo=${book.bookcode}" class="detail-btn">상세보기</a>
													</div>
													<div class="rental-btn">
														<button type="button" class="search-rental-btn">대여하기</button>
													</div>
												</div>
											</div>
											<%
											}
											%>      
                                    </div>
                                </div>
                        </c:forEach>
                        </div>
                        <c:if test="${fn:length(searchResult) > 10}">
                            <div id="loadMoreButton">
                                <button type="submit">더보기 (
                                    <span id="nowcount"></span> /
                                    ${fn:length(search)}) <i class="fa-solid fa-chevron-down che-down"></i>
                                </button>
                            </div>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <div class="search-empty">
                            <h3><c:out value="'${searchresult}'" />검색 결과가 없습니다.</h3>
                            <p>총 ${fn:length(search)} 건</p>       
                        </div>
                        <img class="search-empty-img" src="resources/images/nosearchresult.png" alt="nosearchresult" />
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
                <div class="search-result">
                    <div class="result-title">
                        <h3><c:out value="'${searchresult}'" /> 검색결과</h3>
                        <p>총 <c:choose>
                              <c:when test="${searchType eq 'totalsearch'}">${fn:length(totalsearch)}</c:when>
                              <c:when test="${searchType eq 'genresearch'}">${fn:length(genresearch)}</c:when>
                              <c:when test="${searchType eq 'ordersearch'}">${fn:length(ordersearch)}</c:when>
                              <c:otherwise>0</c:otherwise>
                              </c:choose> 건</p>
                    </div>
                    <c:choose>
                        <c:when test="${searchType eq 'totalsearch'}">
                            <c:set var="searchResult" value="${totalsearch}" />
                        </c:when>
                        <c:when test="${searchType eq 'genresearch'}">
                            <c:set var="searchResult" value="${genresearch}" />
                        </c:when>
                        <c:when test="${searchType eq 'ordersearch'}">
                            <c:set var="searchResult" value="${ordersearch}" />
                        </c:when>
                    </c:choose>
                    <div class="bookRental-detail" >
                    <div id="searchResultsContainer">
                           <c:forEach var="book" items="${searchResult}" varStatus="loop">

                                <form action="bookloan?bookinfo=${book.bookcode}" class="book-box" method="post">
                                    <div class="search-content">
                                        <div class="book-information">
                                            <div class="search-img">
                                            <a href="detail?bookinfo=${book.bookcode}">
                                                <img src="resources/bookimg/${book.bookcode}.jpg" alt="book" />
                                            </a>
                                            </div>
                                            <div class="search-context">
                                                <h3><a href="detail?bookinfo=${book.bookcode}">${book.booktitle}</a></h3>
                                                <p><a href="search?query=${book.author}">${book.author}</a> • <a href="search?query=${book.publisher}">${book.publisher}</a></p>
                                                <p><a href="search?query=${book.genre}">${book.genre}</a></p>
                                                <p><span class="search-book-context">${book.bookcontent}</span></p>
                                            </div>
                                        </div>
                                        
										<%
											if (uid == null){
										%>
											<div  class="rental-box">
												<div class="search-like">
													<img src="resources/images/emptyheart.png" class="likeimg1" alt="emptyheart" onclick="reject()"/>
													<p>찜 ${likeCount}</p>
												</div>
												<div class="btn-box">
													<div class="detail-btn-box">
														<a href="detail?bookinfo=${book.bookcode}" class="detail-btn">상세보기</a>
													</div>
													<div  class="rental-btn">
														<button type="button" class="search-rental-btn" onclick="reject()">대여하기</button>
													</div>
												</div>
											</div>
										<%
										}else{
										%>
											<div  class="rental-box">

											    <c:choose>
											        <c:when test="${userLike == 0}">
											            <div class="search-like">
											                <img src="resources/images/emptyheart.png" class="likeimg1 likeimg1-${book.bookcode}" alt="emptyheart" onclick="likeSuccess('${book.bookcode}', '${uid}', '${book.booktitle}', '${book.author}', '${book.publisher}', this)"/>
											                <p>찜 ${likeCount}</p>
											            </div>
											        </c:when>
											        <c:otherwise>
											            <div class="search-like">
											                <img src="resources/images/fillheart.png" class="likeimg1 likeimg1-${book.bookcode}" alt="emptyheart" onclick="likeSuccess('${book.bookcode}', '${uid}', '${book.booktitle}', '${book.author}', '${book.publisher}', this)"/>
											                <p>찜 ${likeCount}</p>
											            </div>
											        </c:otherwise>
											    </c:choose>

												<div class="btn-box">
													<div class="detail-btn-box">
														<a href="detail?bookinfo=${book.bookcode}" class="detail-btn">상세보기</a>
													</div>
													<div class="rental-btn">
														<button type="button" class="search-rental-btn searchloan-${book.bookcode}" onclick="loanbook('${book.bookcode}','${book.booktitle}')">대여하기</button>
													</div>
												</div>
											</div>
											<%
											}
											%>                                       
	                                    </div>
                                </form>
                        </c:forEach>
                    </div>
                     </div>
                </div>
                <c:if test="${fn:length(searchResult) > 10}">
                    <div id="loadMoreButton">
                        <button type="submit">더보기 (
                            <span id="nowcount"></span> /
                            <c:choose>
                                <c:when test="${searchType eq 'totalsearch'}">${fn:length(totalsearch)}</c:when>
                                <c:when test="${searchType eq 'genresearch'}">${fn:length(genresearch)}</c:when>
                                <c:when test="${searchType eq 'ordersearch'}">${fn:length(ordersearch)}</c:when>
                                <c:otherwise>0</c:otherwise>
                            </c:choose>) <i class="fa-solid fa-chevron-down che-down"></i>
                       </button>
                    </div>
                </c:if>
            </c:otherwise>
        </c:choose>
        <div class="search-banner">
            <img src="resources/banner/banner_band01.jpg" alt="banner" />
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="path/to/jquery.cookie.js"></script>
    <script src="resources/js/searchpage.js"></script>
    <%@ include file="include/rboxfooter.jsp" %>
</body>
</html>
