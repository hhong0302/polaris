<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/mypage.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
   p { margin:20px 0px; }
</style>
</head>
<body>
<%@include file = "include/header.jsp" %>
    <div class="container">
        <div class = "choi-top">
            <span>홈 > 메인페이지</span>
        </div>

        <c:forEach var = "my" items = "${memlist }">
        <div class="choi-info">
            <div class="choi-line1">

                <p>${my.userid }</p>
                <span>${my.useremail }</span>

            </div>
            <div class="choi-line2">
                <span><a href="#">내 정보 수정</a></span>
            </div>
        </div>
</c:forEach>
 
	<div class="row">
        <div class="col">
          <p></p>
         
            <ul class="nav mt">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#qwe">• 현재 대여 목록</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#asd">• 지난 대여 목록</a>
              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane fade show active" id="qwe">
	 				<c:forEach var ="my" items= "${loanList }">
	                 <div class = "choi-booklist">
	                    <div class="choi-current-book">
	                        <div class="choi-book-img">
	                            <img src="resources/bookimg/${my.bookcode }.jpg" alt="">
	                        </div>
	                        <div class="choi-book-text">
	                        	<div class="choi-book-text-top">
		                            <p>${my.booktitle }</p>
		                            <span>저자 . 글쓴이</span>
	                            </div>
	                            <div class="choi-book-text-mid">
		                            <span>대여 기간</span>
		                            <p>${my.loandate }</p>
		                            <span class="choi-dday">반납일까지 남았습니다.</span>
	                            </div>
	                            <div class="choi-book-text-last">
	                            	<button type="button">반납하기</button>
	                            </div>
	                        </div>
	                    </div>
	              
	                  </div>
                                  
	                 </c:forEach> 
              </div>
              <div class="tab-pane fade" id="asd">
               <c:forEach var ="my" items= "${pastloanList }"> 
	                    <div class="choi-current-book">
	                        <div class="choi-book-img">
	                            <img src="resources/bookimg/${my.bookcode}.jpg" alt="book">
	                        </div>
	                        <div class="choi-book-text">
	                        	
	                            <p>${my.booktitle}</p>
	                            <span>저자 . 글쓴이</span>
	                            <span>대여 기간</span>
	                            <p>${my.loandate }</p>
	                            <span class="choi-dday"></span>
	                           
	                        </div>
	                    </div>
	                </c:forEach> 
              </div>             
            </div>
         
        </div>
      </div>


		<!--------------찜한목록------------------>
		
		
        <div class="choi-jjim">
            <p>찜한 목록</p>
            <div class="choi-jjim-book">
            <c:forEach var ="my" items= "${interest }"> 
                <div class="choi-jjim-innerbook">
                    <div class="choi-jjim-img">
                        <img src="resources/bookimg/${my.bookcode }.jpg" alt="book">
                    </div>
                    <div class="choi-jjim-text">
                    	<div class = "choi-close-btn">
                    		<img src="resources/images/Vector.png" alt="" />
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
                </c:forEach>
            </div>
        </div>

    </div>
    
     
     
     
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

 <%@include file = "include/footer.jsp" %>

</body>
</html>