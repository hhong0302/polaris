<%@page import="com.polaris.home.dto.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<% pageContext.setAttribute("replaceHash", "\n\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Polaris</title>
<link rel="stylesheet" href="resources/css/detail.css" />
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body>
<%@include file="include/header.jsp" %>
	
	
	<div class="container-detail">
		
		<c:forEach var="book" items="${bookinfo}">
		<div class="bookInfo-detail">
		
			<div class="infoNav-detail">
				<img alt="homeIcon" src="resources/images/home-detail.png">
				<p>메인<i class="ri-arrow-drop-right-line"></i><span class="ftBlack-detail">${book.genre}</span></p>
			</div>
			
			<form class="bookRental-detail">
				<div class="hash-detail">					
					<p class="bookHash-detail">
					${fn:replace(book.hash, replaceHash, "</p> <p>")}
					</p>
				</div>
				<div class="infoImg-detail">
					<img alt="bookImg" src="resources/bookimg/${book.bookcode}.jpg" class="bookImg-detail">
				</div>
				<div class="rentalBox-detail">
				<c:if test="${empty book.trans}">
					<div class="bookInfoBox-detail">
						<h2>${book.booktitle}</h2>
						<p>${book.author} 저자<br>
							${book.publisher} 출판</p>
						<p>${book.date} 출간</p>
					</div>
				</c:if>
				<c:if test="${ not empty book.trans}">
					<div class="bookInfoBox-detail">
						<h2>${book.booktitle}</h2>
						<p>${book.author} 저자 · ${book.trans} 옮김<br>
							${book.publisher} 출판</p>
						<p>${book.date} 출간</p>
					</div>
				</c:if>
					<div class="rentalBtn-detail">
						<div class="likeBtn-detail">
							<img alt="like" src="resources/images/emptyheart.png">
							찜 1,240
						</div>
						<button type="submit" class="rental-detail">대여하기</button>
						<button type="button" class="readNow-detail">바로 읽기</button>
					</div>
				</div>
			</form>
			
		</div>
		</c:forEach>
	</div>
	<div class="middleNav-detail sticky">
		<div class="container-detail">
			<a class="info active" onclick="scroll_move('1')">
				<span class="navMenu-detail action"></span>
				<span class="menuTitle-detail action">도서 정보</span>
			</a>
			<a class="review" onclick="scroll_move('2')">
				<span class="navMenu-detail"></span>
				<span class="menuTitle-detail">리뷰(7)</span>
			</a>
		</div>
	</div>
	
	<div class="infoReview-detail">
		
		<div id="move1">
		<c:forEach var="book" items="${bookinfo}">
			<div class="infoTitle-detail">
				<h2>카테고리 분류</h2>
				<div class="cateTitle-detail">
					<span class="cate-detail"></span>
					<p>국내도서<i class="ri-arrow-drop-right-line"></i>${book.genre}</p>
				</div>
			</div>
			<div class="recom-detail">
				<h2>이 책 소개</h2>
				
				<div class="hashRecom-detail">
					<p>
						<c:set var="noneHash" value="${fn:replace(book.hash, replaceHash, '</p> <p>')}" />
						${fn:replace(noneHash, "#", " ")}
					</p>
				</div>
				<div class="sumRecom-detail">
					<p>
						${fn:replace(book.bookcontent, replaceChar, "<br/>")}
					</p>
				</div>
			</div>
		
		
			<div class="defaultInfo-detail">
				<h2>도서 기본 정보</h2>
				<div class="defaultBox-detail">
					<div class="defaultLeft-detail">
						<div class="leftInfo-detail">
							<label class="infoTtile-detail">발행일</label>
							<p>${book.date}</p>
						</div>
						<div class="leftInfo-detail">
							<label class="infoTtile-detail">쪽수</label>
							<p>${book.pages}쪽</p>
						</div>
						<div class="leftInfo-detail">
							<label class="infoTtile-detail">파일 용량</label>
							<p>${book.size}</p>
						</div>
					</div>
					<div class="defaultRight-detail">
						<div class="rightInfo-detail">
							<label class="infoTtile-detail">이용안내</label>
							<ul>
								<li>e-book 구매 후 바로 읽기</li>
								<li>최대 30일간 대여 가능</li>
								<li>저작권 보호로 인해 인쇄 불가</li>
							</ul>
						</div>
						<div class="rightInfo-detail">
							<label class="infoTtile-detail">지원 기기</label>
							<p>PC(Window)/ PC(Mac)/ /Android/ ios/ 전자책 단말기(일부 기기 사용 불가)</p>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
			
			<!-- REVIEW START -->
			
			<div id="move2" class="reviewWrtBox-detail">
				<h2>리뷰작성</h2>
				
				<!-- 로그인 안했을 시 -->
				
				<!-- <div class="reviewWrt-detail">
					<div class="reviewWrt-detail-title">
						<h1 class="reviewWrt-detail-h1">
							제목
						</h1>
						<input type="text" id="reviewtitle" name="reviewtitle" style="background-color:#f0f0f0;" maxlength="70" placeholder="남기시는 리뷰의 제목을 적어주세요. (최대 70자)" readonly />
					</div>
					<div class="reviewWrt-detail-title">
						<h1 class="reviewWrt-detail-h1">
							내용
						</h1>
						<div class="reviewWrt-textareabox">
							<textarea name="reviewcontent" class="reviewBox-detail" maxlength="600" style="background-color:#f0f0f0;" placeholder="리뷰 작성 시 광고 및 욕설, 비속어나 타인을 비방하는 문구를 작성하면 비공개 처리될 수 있습니다. (최대 600자)" readonly></textarea>
							<a href="login">
								<img id="review-detail-after-login" src="resources/images/detail-after-login.png" alt="after-login" />
							</a>
						</div>
						<button type="button" class="submitBtn-detail">리뷰 남기기</button>
					</div>
				</div> -->
				
				<!-- 로그인 안했을 시 -->
				
				<!-- 로그인 했으면서 리뷰 작성 안했을 시 -->
				
				<!-- <form class="reviewWrt-detail" method="post">
					<div class="reviewWrt-detail-title">
						<h1 class="reviewWrt-detail-h1">
							제목
						</h1>
						<input type="text" id="reviewtitle" name="reviewtitle" maxlength="70" placeholder="남기시는 리뷰의 제목을 적어주세요. (최대 70자)" />
						
					</div>
					<div class="reviewWrt-detail-title">
						<h1 class="reviewWrt-detail-h1">
							내용
						</h1>
						<div class="reviewWrt-textareabox">
							<textarea name="reviewcontent" class="reviewBox-detail" maxlength="600" placeholder="리뷰 작성 시 광고 및 욕설, 비속어나 타인을 비방하는 문구를 작성하면 비공개 처리될 수 있습니다. (최대 600자)"></textarea>
						</div>
						<button type="button" onclick="reviewSubmit()" class="submitBtn-detail">리뷰 남기기</button>
					</div>
				</form> -->
				
				<!-- 로그인 했으면서 리뷰 작성 안했을 시 -->
				
				<!-- 리뷰작성 했을 시 -->
				
				<form class="reviewWrt-detail" method="post">
					<div class="reviewWrt-detail-title">
						<h1 class="reviewWrt-detail-h1">
							제목
						</h1>
						<span class="review-writed review-writedspan">
							재밌어요 호호
						</span>
						<input type="hidden" id="reviewtitle" name="reviewtitle" maxlength="70" placeholder="남기시는 리뷰의 제목을 적어주세요. (최대 70자)" value="재밌어요 호호" />
						
						<button type="button" onclick="reviewModifyCancel()" class="review-deletebtn">리뷰 삭제</button>
						
					</div>
					<div class="reviewWrt-detail-title">
						<h1 class="reviewWrt-detail-h1">
							내용
						</h1>
						<div class="reviewWrt-textareabox">
							<textarea name="reviewcontent" class="reviewBox-detail review-writedarea" maxlength="600" placeholder="리뷰 작성 시 광고 및 욕설, 비속어나 타인을 비방하는 문구를 작성하면 비공개 처리될 수 있습니다. (최대 600자)" readonly>재밌네요 호호</textarea>
						</div>
						<button type="button" onclick="reviewModify()" class="submitBtn-detail">리뷰 수정</button>
					</div>
				</form>
				
				<!-- 리뷰작성 했을 시 -->
				
			</div>
			
			<div class="reviewList-detail">
				<div class="listTile-detail">
					<h2>리뷰(7)</h2>
					<div class="listNav-detail">
					    <button id="recent" class="recent" onclick="listNav_click('recent','${bookcode}')">
					    	<span class="reviewMenu-detail action"></span>
							<span class="reviewTitle-detail action">최신순</span>
					    </button>
					    <button id="like" class="like" onclick="listNav_click('relike','${bookcode}')">
							<span class="reviewMenu-detail"></span>
							<span class="reviewTitle-detail">좋아요순</span>
						</button>
				    </div>
			    </div>
			    
			    <div class="reviewcommentlist-detail action">
			    <!-- 리뷰 있을 때 -->
			    
			    	<!-- <div class="reviewComment-detail">
			    		<div class="reviewTop-detail">
				    		<div class="reviewInfo-detail">
					    		<h1 class="reviewtitle-detail">
					    			최고의 책
					    		</h1>
				    			<textarea class="reviewComment-content" readonly>집중해서 재미있게 읽었습니다. 작가의 경험이 생생하게 잘 전달됩니다.</textarea>
				    		</div>
			    		</div>
			    		<div class="reviewBottom-detail">
		    				<div class="likeBox-detail-span">
				    			<span class="reviewUser-detail">os3a****</span>
				    			<span class="reviewDate-detail">2023. 06. 08</span>
			    			</div>
			    			<button class="likeBox-detail-like">
				    			<img alt="like" src="resources/images/dislike-detail.png">17
			    			</button>
			    		</div>
			    	</div> -->
			    	
			    <!-- 리뷰 있을 때 -->
			    </div>
			    
			    <!-- 리뷰 없을 때 -->
			    
			    <!-- <div class="reviewBox-noncomment">
			    	아직 등록된 리뷰가 없습니다.<br/>
			    	첫 번째 리뷰를 남겨주세요.
			    </div> -->
			    
			    <!-- 리뷰 없을 때 -->
			    
			     <div class="pageNum-detail">
               
	               	<button onclick="rvListPrevNxtBtn(-1,'bookcode')">
	                    <span class="prv"><i class="fa-solid fa-angle-left"></i></span>
	                </button>
	             	<div class="pageNum-detail-btnbox">
	               		<!-- <button class="pageNum-pagebtn active">1</button> -->
	                </div>
	                <button onclick="rvListPrevNxtBtn(1,'bookcode')">
	                	<span class="nxt"><i class="fa-solid fa-angle-right"></i></span>
	                </button>
	                
                </div>
            </div>
            <script src="resources/js/detailreview.js"></script>
            <!-- REVIEW END -->
            
            <div class="suggest-detail">
            	<h2>추천 도서</h2>
            	<div class="suggestBook-detail">
            		<div class="suggestBookBox-detail">
            			<img alt="suggestBookImg" src="resources/bookimg/goodgirl.jpg" class="suggestbookImg-detail">
            			<div class="suggestInfo-detail">
            				<h4>블랙 쇼맨과 환상의 여자</h4>
            				<p><span>히가시노 게이고 저자</span> · <span>알에이치코리아(RHK)</span></p>
            			</div>
            		</div>
            		
            		<div class="suggestBookBox-detail">
            			<img alt="suggestBookImg" src="resources/bookimg/commitment.jpg" class="suggestbookImg-detail">
            			<div class="suggestInfo-detail">
            				<h4>용의자 X의 헌신</h4>
            				<p><span>히가시노 게이고 저자</span> · <span>재인</span></p>
            			</div>
            		</div>
            		
            		<div class="suggestBookBox-detail">
            			<img alt="suggestBookImg" src="resources/bookimg/fighter.jpg" class="suggestbookImg-detail">
            			<div class="suggestInfo-detail">
            				<h4>완득이</h4>
            				<p><span>창비 저자</span> · <span>창비</span></p>
            			</div>
            		</div>
            		
            		<div class="suggestBookBox-detail">
            			<img alt="suggestBookImg" src="resources/bookimg/argument.jpg" class="suggestbookImg-detail">
            			<div class="suggestInfo-detail">
            				<h4>변론의 법칙</h4>
            				<p><span>마이클 코넬리 저자</span> · <span>재인</span></p>
            			</div>
            		</div>
            		
            	</div>
            	
            		
            </div>
			
		</div>
		
	</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="resources/js/detail.js"></script>

<%@include file="include/rboxfooter.jsp" %>
</body>
</html>