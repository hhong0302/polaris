<%@page import="com.polaris.home.dto.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<p class="bookHash-detail">${book.hash}</p>
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
							<img alt="like" src="resources/images/emptheart-detail.png">
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
			<div class="infoTitle-detail">
				<h2>카테고리 분류</h2>
				<div class="cateTitle-detail">
					<span class="cate-detail"></span>
					<p>국내도서<i class="ri-arrow-drop-right-line"></i>미디어 추천</p>
				</div>
			</div>
			
			<div class="recom-detail">
				<h2>이 책 소개</h2>
				
				<div class="hashRecom-detail">
					<p>아쿠타가와상 수상 작가 다나베 세이코 대표작<br> 빛나는 감각으로 그려낸 사랑과 연애의 본질</p>
					<p>‘내 인생 잊지 못할 사랑 영화 1위’<br> 이누도 잇신 감독 〈조제, 호랑이 그리고 물고기들〉 원작</p>
					<p>한국판 리메이크 :: 한지민·남주혁 주연, 김종관 감독 영화 〈조제〉 원작<br> 2020 부산국제영화제 폐막작 :: 일본 애니메이션 〈조제, 호랑이 그리고 물고기들〉 원작</p>
					<p>싸한 사랑의 기억, 이 시대 최고의 연애소설</p>
				</div>
				<div class="sumRecom-detail">
					<pre>
『조제와 호랑이와 물고기들』은 일본의 국민작가로 존경받는 아쿠타가와상 수상 작가 다나베 세이코가 ‘연애’를 테마로 쓴 단편소설집이다.
작가 다나베 세이코는 1963년 『감상여행』으로 아쿠타가와상을 수상하고 2000년 국가 문화공로자로 선정되기까지 소설과 에세이, 평전 등 240여 편에 달하는 작품을 펴
냈으며, 특히 일본 2백만 부 베스트셀러 『신 겐지모노가타리』의 저자로 자국에서는 “다나베 겐지”라는 닉네임으로 불리는 관록 있는 작가이다.

조제와 호랑이와 물고기들』의 생을 관통하는 듯한 유머, 인간에 대한 날카로운 관찰로 진부함을 넘어 새롭게 사랑을 정의하고 있는 이 소설은 ‘이 시대 최고의 연애소설’
이라 할 만하다.
독창적인 캐릭터와 간결한 문체, 묘하게도 가슴을 울리는 독특한 연애소설 9편을 엮은 이 연애소설집은 1985년도 출간 당시에도 큰 주목을 받았지만 표제작 「조제와 호
랑이와 물고기들」이 2004년 〈조제, 호랑이 그리고 물고기들〉이라는 타이틀로 영화화되면서 다시 한번 소설 독자와 영화 팬들에게 화제가 되었다. 그리고 ‘제8회 부천국
제판타스틱영화제 최고 화제작’, ‘제77회 『키네마준보』 선정 베스트 일본 영화’ 등 10여 년 동안의 꾸준한 사랑에 힘입어 2016년 ‘내 인생 잊지 못할 사랑 영화 1위(무비
패밀리 조사)’에 선정되면서 한국의 관객들과 스크린에서 다시 만난 바 있다.

뿐만 아니라 〈최악의 하루〉〈더 테이블〉 등 로맨스 영화를 애틋하고 감성적으로 그리는 데 일가견이 있는 김종관 감독이 한국판으로 리메이크한 〈조제〉를 선보인다. 
“고전적인 멜로의 감성으로 재해석”했다는 말에 따라 조제를 사랑해온 독자 및 관객들의 많은 관심을 받았으며, 각자 조제와 츠네오를 연기한 한지민과 남주혁 배우의 
조합만으로도 커다란 기대를 모으고 있다. 또한 2020년 부산국제영화제 폐막작으로 선정되었던 일본 애니메이션 〈조제, 호랑이 그리고 물고기들〉도 2021년 1월 관객을
찾아갈 예정이다. 다나베 세이코의 『조제와 호랑이와 물고기들』은 이토록 여러 방식으로 꾸준히 사랑받고 있다.
 
* “조제, 조제, 조제…… 이 이름을 정말로 좋아했다. 마지막 컷을 촬영하면서, 다시 조제를 볼 수 없을 거란 생각에 울어버렸다.”
 _이누도 잇신(〈조제, 호랑이 그리고 물고기들〉 영화감독)
* “엇갈릴 운명이기에 더욱 격렬하고, 짧은 인연이기에 더욱 강렬하게 혀끝에 남는 싸한 사랑의 맛. 사랑과 죽음과 이별은 모두 같은 맛.” _다나베 세이코
					</pre>
				</div>
			</div>
			
			<div class="defaultInfo-detail">
				<h2>도서 기본 정보</h2>
				<div class="defaultBox-detail">
					<div class="defaultLeft-detail">
						<div class="leftInfo-detail">
							<label class="infoTtile-detail">발행일</label>
							<p>2020년 12월 15일</p>
						</div>
						<div class="leftInfo-detail">
							<label class="infoTtile-detail">쪽수</label>
							<p>308쪽</p>
						</div>
						<div class="leftInfo-detail">
							<label class="infoTtile-detail">파일 용량</label>
							<p>33MB</p>
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
					    <button id="recent" class="recent" onclick="listNav_click('recent','itsok')">
					    	<span class="reviewMenu-detail action"></span>
							<span class="reviewTitle-detail action">최신순</span>
					    </button>
					    <button id="like" class="like" onclick="listNav_click('like','itsok')">
							<span class="reviewMenu-detail"></span>
							<span class="reviewTitle-detail">좋아요순</span>
						</button>
				    </div>
			    </div>
			    
			    <div class="listRecent-detail action">
			    <!-- 리뷰 있을 때 -->
			    
			    	<div class="reviewComment-detail">
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
			    	</div>
			    	
			    <!-- 리뷰 있을 때 -->
			    </div>
			    
			    <!-- 리뷰 없을 때 -->
			    
			    <!-- <div class="reviewBox-noncomment">
			    	아직 등록된 리뷰가 없습니다.<br/>
			    	첫 번째 리뷰를 남겨주세요.
			    </div> -->
			    
			    <!-- 리뷰 없을 때 -->
			    
			     <div class="pageNum-detail">
               
	               	<button>
	                    <span class="prv"><i class="fa-solid fa-angle-left"></i></span>
	                </button>
	             	<div class="pageNum-detail-btnbox">
	               		<button class="pageNum-pagebtn active">1</button>
	               		<button class="pageNum-pagebtn">2</button>
	               		<button class="pageNum-pagebtn">3</button>
	               		<button class="pageNum-pagebtn">4</button>
	               		<button class="pageNum-pagebtn">5</button>
	                </div>
	                <button>
	                	<span class="nxt active"><i class="fa-solid fa-angle-right"></i></span>
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