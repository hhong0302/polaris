<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"  />
<link rel="stylesheet" href="resources/css/mypage.css" />
<link rel="icon" href="resources/images/favicon.png" />
<style>
   p { margin:20px 0px; }
</style>
</head>
<body>
<%
	int loan = (Integer)session.getAttribute("loan");
%>
<%@include file = "include/header.jsp" %>
    <div class="choi-container">
        <div class = "choi-top">
            <span>홈 > 마이페이지</span>
        </div>
        <c:forEach var = "my" items = "${memlist }">
			<c:if test="${my.userid eq userid }">
		        <div class="choi-info">
		            <div class="choi-line1">
		
		                <p>${my.userid }</p>
		                <span>${my.useremail }</span>
		
		            </div>
		            <div class="choi-line2">
		                <span><a href="member">내 정보 수정</a></span>
		            </div>
		        </div>
			</c:if>
</c:forEach>
 
	<div class="row">
        <div class="col">        
            <ul class="nav mt">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#qwe">• 현재 대여 목록</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#asd" onclick="pageAllList();">• 지난 대여 목록</a>
              </li>
            </ul>
            <div class="tab-content">				
              <div class="tab-pane fade show active" id="qwe">
              <c:choose>
	          <c:when test="${empty loanList}">
	                 <div class = "choi-booklist">
	                    <div class="choi-current-book">
	                   		 <div class="choi-book-img">
	                            <img src="resources/images/blankBook.png" alt="bookimg">
	                        </div>
	                     </div>
	                   </div>
	            </c:when>   
	              
	            <c:otherwise>
	               <c:forEach var ="my" items= "${loanList }">
	                    <div class = "choi-booklist">
	                    <div class="choi-current-book">
	                     <div class="choi-book-img">
	                            <img src="resources/bookimg/${my.bookcode }.jpg" alt="bookimg">
	                     </div>
	                     <div class="choi-book-text">
	                       	<div class="choi-book-text-top">
		                           <a href = "detail?bookinfo=${my.bookcode }"><p>${my.booktitle }</p></a>
		                            <span>${my.author } ㆍ ${my.publisher }</span>
	                        </div>
	                            <div class="choi-book-text-mid">
	                            <c:set var = "TextValue" value="${my.loandate }" />
		                            <span>대여 일자</span>
		                            <p>${fn:substring(TextValue, 0,11)}</p>
	                            </div>
		                            <div class="choi-book-text-last">
		                          		<button type="submit" id = "booklook" class="booklook" onclick="ready()">바로보기</button>
		                            	<button type="submit" id = "bookloan" class="bookloan" onclick="returnBook('${my.bookcode}', '${my.num}')" >반납하기</button>
		                            </div>
	                        </div>
	                    </div> 
	                </div>                 
                  </c:forEach> 
	            </c:otherwise>
            	</c:choose> 
             </div>
              <div class="tab-pane fade" id="asd">
              <div class = "choi-booklist">
              <c:choose>
	          <c:when test="${pastloanList eq 0}">
	          	<div class="choi-past-book">
                    <div class="choi-past-book-img">
                        <img src="resources/images/past-nothing.png" alt="book">
                    </div>
                 </div>
	          </c:when>
	           <c:otherwise>

	           <div class="choi-past-book-big">
             <%--   <c:forEach var ="my" items= "${pastloanList }"> 
			
	           <div class="choi-past-book">
                    <div class="choi-past-img">
                        <img src="resources/bookimg/${my.bookcode }.jpg" alt="book">
                    </div>
                    <div class="choi-past-text">
                    	<div class = "choi-past-text-top">
	                        <p>${my.booktitle}</p>
                    	</div>
    					<div class = "choi-past-text-bottom">
	                        <span>${my.author }</span>
	                        <span>${my.publisher }</span>
    					</div>
                    </div>
                </div>
	            </c:forEach>  --%>
	            </div>
	            <div class="choi-past-book-big">
	            </div>
	            </c:otherwise>
	            </c:choose>
	            <div class = "pageNum">
                	<a href = "#" class = "prv" onclick="rvListPrevNxtBtn(-1, '${bookcode}')">
                		<i class="fa-solid fa-chevron-left"></i>
                	</a>
                	<div class = "pageNum-detail">
                	</div>
                	<a href = "#" class = "nxt" onclick="rvListPrevNxtBtn(1, '${bookcode}'">
                		<i class="fa-solid fa-chevron-right"></i>
                	</a>
                </div>
	            
              </div>             
            </div>
            </div>
         
        </div>
      </div>

	<!-- 찜한목록 -->	
	
        <div class="choi-jjim">
            <p>찜한 목록</p>
            <c:choose>
	        <c:when test="${interest == 0}">
	        <div class="choi-jjim-book" style ="display : none;"></div>
	        <div class="choi-jjim-book" style ="display : none;" ></div>

            <div class="choi-jjim-book">
	       		 <div class="choi-jjim-innerbook-nothing">
                    <div class="choi-jjim-img-nothing">
                        <img src="resources/images/jjim-nothing.png" alt="book">
                    </div>
                </div>
             </div>
              </c:when>
              <c:otherwise>
     	      <div class = "choi-jjim-book">
 <%--     	      <c:forEach var ="my" items= "${interest }"> 
     	  
                <div class="choi-jjim-innerbook">
                    <div class="choi-jjim-img">
                        <img src="resources/bookimg/${my.bookcode }.jpg" alt="book">
                    </div>
                     
                    <div class="choi-jjim-text">
                    	<div class = "choi-close-btn">
                    		<a href="#" class = "deleteBtn" onclick = "deleteBtn();"><img src="resources/images/Vector.png" alt="x" /></a>
                    	</div>
                    	<div class = "choi-jjim-text-top">
	                        <p>${my.booktitle}</p>
                    	</div>
    					<div class = "choi-jjim-text-bottom">
	                        <span>${my.author }</span>
	                        <span>${my.publisher }</span>
    					</div>
                    </div>
                   </div>
 
                </c:forEach> --%>
               </div>
               <div class = "choi-jjim-book">
               </div>
                </c:otherwise>
                </c:choose>
                
                <div class = "pageNum">
                	<a href = "#" class = "prv" onclick="rvListPrevNxtBtn(-1, '${bookcode}')">
                		<i class="fa-solid fa-chevron-left"></i>
                	</a>
                	<div class = "jjim-pageNum-detail">
                	</div>
                	<a href = "#" class = "nxt" onclick="rvListPrevNxtBtn(1, '${bookcode}'">
                		<i class="fa-solid fa-chevron-right"></i>
                	</a>
                </div>
                
                
            </div>
            </div>

 
     
     
     
     
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script src="resources/js/mypage.js"></script>


 <%@include file = "include/footer.jsp" %>

</body>
</html>