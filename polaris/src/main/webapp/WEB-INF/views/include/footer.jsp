<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/footer.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<div class="hg-gototop">
	<button class="hg-topbtn" onclick="hg_gototop()">
		<i class=" fa-solid fa-chevron-up"></i><br/>
		TOP
	</button>
</div>

<footer id="hg-footer">
	<div class="container hg-footer">
		<div class="hg-ftop">
			<div class="hg-ftopleft">
				<a href="/">
					<img src="resources/images/textlogo_white.svg" alt="logo" />
				</a>
				<span id="hg-fspan">회사소개</span>
				<span class="hg-span">|</span>
				<span>이용약관</span>
				<span class="hg-span">|</span>
				<span>개인정보처리방침</span>
				<span class="hg-span">|</span>
				<span>청소년 보호정책</span>
			</div>
			<div class="hg-familysite">
				<a href="http://kbh2753.cafe24.com/polaris/profile/index.html" target="_blank"><span id="hg-prositetxt">Profile Site</span></a>
				<div class="hg-familysitebox">
					<span id="hg-fmysitetxt">Family Site</span>
					<div id="hg-fmysitebox"></div>
				</div>
			</div>
		</div>
		<div class="hg-fbottom">
			<div class="hg-fbtop">
				<span>대표 이사 : 홍길동</span>
				<span>경기 김포시 김포한강4로 125 10층, 장기동 1604</span>
				<span>사업자 등록 번호 : 012-34-56789</span>
			</div>
			<div class="hg-fbmid">
				<span>대표 번호 : 0000-0000(발신자 부담 전화)</span>
				<span>개인정보 보호 책임자 : 홍길동</span>
				<span>통신판매업 신고 : 제 2023-061123호</span>
			</div>
			<div class="hg-fbbottom">
				<span>Copyright © Polaris Company. All Rights Reserved.</span>
			</div>
		</div>
	</div>
</footer>


<script>
const hg_familysite = document.getElementsByClassName("hg-familysite")[0];
const hg_prositetxt = document.getElementById("hg-prositetxt");
const hg_fmysitebox = document.getElementById("hg-fmysitebox");
hg_familysite.addEventListener("click",function()
{
	hg_familysite.classList.toggle("active");
	hg_prositetxt.classList.toggle("active");
	hg_fmysitebox.classList.toggle("active");
});
const hg_gototopbtn = document.getElementsByClassName("hg-gototop")[0];
window.addEventListener('scroll', function(){
	if(window.pageYOffset>160)
	{
		hg_gototopbtn.classList.add("active");
	}
	else
	{
		hg_gototopbtn.classList.remove("active");
	}
});
function hg_gototop()
{
	window.scrollTo({ top: 0, behavior: "smooth" }); 
}
</script>