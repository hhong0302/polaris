<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Polaris</title>
<link rel="stylesheet" href="resources/css/mainhome.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%@include file="include/header.jsp" %>

<div class="container hg-relative">
	<div class="hg-leftbox">
		<h1 id="hg-leftboxh1">베스트 1</h1>
		<a id="hg-lboxanchor" href="detail">
			<img id="hg-leftboximg" src="resources/bookimg/spaceboy.jpg" alt="spaceboy" />
		</a>
		<span class="hg-lefttitle">당신은 결국 무엇이든 해내는 사람</span>
		<div class="hg-lbtnbox">
		<!-- 버튼 인기순으로 5개 -->
		<c:forEach items="${hg_interest}" var="dto" varStatus="status">
			<button class="hg-lboxbtn" onclick="lboxbtn(this,'${dto.bookcode}','${dto.booktitle}')">
				베스트${status.count}
			</button>
		</c:forEach>
		<!-- 버튼 인기순으로 5개 -->
		</div>
	</div>
	<div id="hg-slide">
		<div class="hg-slide-container">
			<div class="hg-slider">
				<a href="detail?bookinfo=tigerfish" class="hg-first-img">
					<img src="resources/banner/slidebanner05.jpg" alt="slide05" />
				</a>
				<a href="detail?bookinfo=kitchen">
					<img src="resources/banner/slidebanner01.jpg" alt="slide01" />
				</a>
				<a href="detail?bookinfo=moreok">
					<img src="resources/banner/slidebanner02.jpg" alt="slide02" />
				</a>
				<a href="detail?bookinfo=itsok">
					<img src="resources/banner/slidebanner03.jpg" alt="slide03" />
				</a>
				<a href="detail?bookinfo=giant">
					<img src="resources/banner/slidebanner04.jpg" alt="slide04" />
				</a>
				<a href="detail?bookinfo=tigerfish">
					<img src="resources/banner/slidebanner05.jpg" alt="slide05" />
				</a>
				<a href="detail?bookinfo=kitchen" class="hg-last-img">
					<img src="resources/banner/slidebanner01.jpg" alt="slide01" />
				</a>
			</div>
		</div>
	</div>
	
	<ul class="pagination">
	  <li class="active" data-index="1"></li>
	  <li data-index="2"></li>
	  <li data-index="3"></li>
	  <li data-index="4"></li>
	  <li data-index="5"></li>
	</ul>
	
	<h1 class="hg-noveltitle">일상에 소설 한 스푼</h1>
	
	<div class="hg-novelbox">
		<button type="button" class="hg-btn hg-novelbtn hg-leftbtn" onclick="hg_nvmove(310)">
			<i class="fas fa-solid fa-chevron-left"></i>
		</button>
		<button type="button" class="hg-btn hg-novelbtn hg-rightbtn active" onclick="hg_nvmove(-310)">
			<i class=" fa-solid fa-chevron-right"></i>
		</button>
		<div class="hg-mainbox">
			<div class="hg-mainnovel">
				<!-- db받아와서 뿌리기 -->
				<c:forEach items="${hg_novel}" var="dto">
				<div class="hg-novellist">
					<a href="detail?bookinfo=${dto.bookcode}">
						<img src="resources/bookimg/${dto.bookcode}.jpg" alt="${dto.bookcode}" />
					</a>
					<h3 class="hg-bname"><a href="detail?bookinfo=${dto.bookcode}">${dto.booktitle}</a></h3>
					<div class="hg-ap">
						<span><a href="javascript:void(0)">${dto.author}</a> 저자</span>
						<span class="hg-dotted">·</span>
						<span>${dto.publisher}</span>
					</div>
					<div class="hg-content">
						${dto.bookcontent}
					</div>
				</div>
				</c:forEach>
				<!-- db받아와서 뿌리기 -->
				
			</div>
		</div>
	</div>
	<a href="detail?bookinfo=laundry">
		<img src="resources/banner/banner_band03.jpg" alt="banner_band03" />
	</a>
</div>

<div class="hg-fill-all">
	<div class="container">
		<h1 class="hg-essaytitle">
			삶에 도움이 되는 에세이
		</h1>
		<div class="hg-essaybox">
			<button type="button" class="hg-btn hg-essaybtn hg-leftbtn" onclick="hg_esmove(410)">
				<i class="fas fa-solid fa-chevron-left"></i>
			</button>
			<button type="button" class="hg-btn hg-essaybtn hg-rightbtn active" onclick="hg_esmove(-410)">
				<i class="fas fa-solid fa-chevron-right"></i>
			</button>
			<div class="hg-mainbox">
				<div class="hg-mainessay">
					<!-- db받아와서 뿌리기 -->
					
				<c:forEach items="${hg_essay}" var="dto">
					<div class="hg-essaylist">
						<a href="detail?bookinfo=${dto.bookcode}">
							<img src="resources/bookimg/${dto.bookcode}.jpg" alt="${dto.bookcode}" />
						</a>
						<h3 class="hg-bname"><a href="detail?bookinfo=${dto.bookcode}">${dto.booktitle}</a></h3>
						<div class="hg-ap">
							<span><a href="javascript:void(0)">${dto.author}</a> 저자</span>
							<span class="hg-dotted">·</span>
							<span>${dto.publisher}</span>
						</div>
						<div class="hg-content">
							${dto.bookcontent}
						</div>
					</div>
				</c:forEach>
					<!-- db받아와서 뿌리기 -->
					
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container hg-mainunder">
	<a href="detail?bookinfo=department">
		<img src="resources/banner/banner_band02.jpg" alt="banner_band02" />
	</a>
	
	<div class="hg-hothead">
		<div class="hg-hothleft">
			<h1 class="hg-hottitle">요즘 뜨는 도서</h1>
			<div class="hg-hotmenu">
				<button class="hg-hotmenubtn active" onclick="hg_hotmenubtnclick('popular',0)">인기순</button>
				<button class="hg-hotmenubtn"  onclick="hg_hotmenubtnclick('recent',1)">최신순</button>
				<button class="hg-hotmenubtn"  onclick="hg_hotmenubtnclick('lotsloan',2)">대여순</button>
			</div>
		</div>
		<div class="hg-hothright">
			<a href="javascript:void(0)">+ 더보기</a>
		</div>
	</div>
	
	<div class="hg-hotbox">
		<button type="button" class="hg-btn hg-hotbtn hg-leftbtn" onclick="hg_htmove(310)">
			<i class="fas fa-solid fa-chevron-left"></i>
		</button>
		<button type="button" class="hg-btn hg-hotbtn hg-rightbtn active" onclick="hg_htmove(-310)">
			<i class="fas fa-solid fa-chevron-right"></i>
		</button>
		<div class="hg-mainbox">
			<div class="hg-mainhot">
				<!-- db받아와서 뿌리기 -->
				<!-- <div class="hg-hotlist">
					<a href="javascript:void(0)">
						<img src="resources/bookimg/spaceboy.jpg" alt="spaceboy" />
					</a>
					<h3 class="hg-bname"><a href="javascript:void(0)">우주</a></h3>
					<div class="hg-ap">
						<span><a href="javascript:void(0)">김지혜 저자</a></span>
						<span class="hg-dotted">·</span>
						<span><a href="javascript:void(0)">팩토리나인</a></span>
					</div>
					<div class="hg-content">
						스타트업을 창업해 몇 년간 앞만 보며 달려왔던
						스타트업을 창업해 몇 년간 앞만 보며 달려왔던
						스타트업을 창업해 몇 년간 앞만 보며 달려왔던
						스타트업을 창업해 몇 년간 앞만 보며 달려왔던
					</div>
				</div> -->
				<!-- db받아와서 뿌리기 -->
			</div>
		</div>
	</div>
	<a href="detail?bookinfo=nightstar">
		<img src="resources/banner/banner_band01.jpg" alt="banner_band01" />
	</a>
	
</div>

<script src="resources/js/mainhome.js"></script>

<%@include file="include/rboxfooter.jsp" %>
</body>
</html>