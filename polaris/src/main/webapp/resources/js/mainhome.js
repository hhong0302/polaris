const hg_lboxbtn = document.getElementsByClassName("hg-lboxbtn");
const hg_hotmenubtn = document.getElementsByClassName("hg-hotmenubtn");

//화면 시작 시 기능
window.onload = function()
{
	hg_lboxbtn[0].click();
	hg_hotmenubtn[0].click();
}

function lboxbtn(e,bookcode,title)
{
	const hg_leftboxh1 = document.getElementById("hg-leftboxh1");
	const hg_anchor = document.getElementById("hg-lboxanchor");
	const hg_limg = document.getElementById("hg-leftboximg");
	const hg_lefttitle = document.getElementsByClassName("hg-lefttitle")[0];
	for(let i=0;i<hg_lboxbtn.length;i++)
	{
		hg_lboxbtn[i].classList.remove("active");
	}
	hg_anchor.href = "detail?bookinfo="+bookcode;
	hg_leftboxh1.innerHTML=e.innerHTML;
	hg_limg.src = "resources/bookimg/"+bookcode+".jpg";
	hg_lefttitle.innerHTML = title;
	e.classList.add("active");
}

//스라이다
const hg_images = document.querySelectorAll('.hg-slider a');
const hg_slider = document.querySelector('.hg-slider');
const hg_dots = document.querySelectorAll('.pagination li');

let hg_current = 1;
const imgSize = hg_images[0].clientWidth;
hg_slider.style.transform = `translateX(${-imgSize}px)`;

const next = () => {
    if (hg_current >= hg_images.length - 1) return;
    hg_slider.style.transition = '400ms ease-in-out transform';
    hg_current++;
    hg_slider.style.transform = `translateX(${-imgSize * hg_current}px)`;

    for (let i = 0; i < hg_dots.length; i++) {
        if (hg_dots[i].dataset.index == hg_current) {
            hg_dots[i].classList.add('active');
        } else if (hg_current === 6) {
            hg_dots[i].classList.remove('active');
            hg_dots[0].classList.add('active');
        }
        else {
            hg_dots[i].classList.remove('active');
        }
    }
}

hg_slider.addEventListener('transitionend', ()=> {
    if(hg_images[hg_current].classList.contains('hg-first-img')){
        slider.style.transition = 'none';
        hg_current = hg_images.length - 2;
        hg_slider.style.transform = `translateX(${-imgSize * hg_current}px)`;
    }
    if(hg_images[hg_current].classList.contains('hg-last-img')){
        hg_slider.style.transition = 'none';
        hg_current = hg_images.length - hg_current;
        hg_slider.style.transform = `translateX(${-imgSize * hg_current}px)`;
    }
})

setInterval(next, 3000);
//스라이다

//바튼
const hg_novelbtn = document.getElementsByClassName("hg-novelbtn");
const hg_novel = document.getElementsByClassName("hg-mainnovel")[0];
const hg_essaybtn = document.getElementsByClassName("hg-essaybtn");
const hg_essay = document.getElementsByClassName("hg-mainessay")[0];
const hg_hotbtn = document.getElementsByClassName("hg-hotbtn");
const hg_hot = document.getElementsByClassName("hg-mainhot")[0];
let hg_novelnum = 10;
let hg_essaynum = 10;
let hg_hotnum = 10;

function hg_nvmove(px)
{
	const nvsize = hg_novel.scrollWidth-10;
	hg_novelnum += px;
	if(hg_novelnum<-nvsize+1240)
	{
		hg_novelnum=-nvsize+1240;
		return false;
	}
	if(hg_novelnum>10)
	{
		hg_novelnum=10;
		return false;
	}
	hg_novel.style.left=hg_novelnum+'px';
	hg_novelbtn[0].classList.add('active');
	hg_novelbtn[1].classList.add('active');
	if(hg_novelnum==-nvsize+1240)hg_novelbtn[1].classList.remove('active');
	if(hg_novelnum==10)hg_novelbtn[0].classList.remove('active');
}

function hg_esmove(px)
{
	const essize = hg_essay.scrollWidth-10;
	hg_essaynum += px;
	if(hg_essaynum<-essize+1230)
	{
		hg_essaynum=-essize+1230;
		return false;
	}
	if(hg_essaynum>10)
	{
		hg_essaynum=10;
		return false;
	}
	hg_essay.style.left=hg_essaynum+'px';
	hg_essaybtn[0].classList.add('active');
	hg_essaybtn[1].classList.add('active');
	if(hg_essaynum==-essize+1230)hg_essaybtn[1].classList.remove('active');
	if(hg_essaynum==10)hg_essaybtn[0].classList.remove('active');
}

function hg_htmove(px)
{
	const htsize = hg_hot.scrollWidth-10;
	hg_hotnum += px;
	if(hg_hotnum<-htsize+1240)
	{
		hg_hotnum=-htsize+1240;
		return false;
	}
	if(hg_hotnum>10)
	{
		hg_hotnum=10;
		return false;
	}
	hg_hot.style.left=hg_hotnum+'px';
	hg_hotbtn[0].classList.add('active');
	hg_hotbtn[1].classList.add('active');
	if(hg_hotnum==-htsize+1240)hg_hotbtn[1].classList.remove('active');
	if(hg_hotnum==10)hg_hotbtn[0].classList.remove('active');
}
//바튼

//ajax 데이터 받아오기

function hg_hotmenubtnclick(hg_what,num)
{
	let text = "";
	const hg_mainhot = document.getElementsByClassName("hg-mainhot")[0];
	$.ajax({
		url : "mainHotController",
		type: "GET",
		dataType: "json",
		data:{"name":hg_what},
		contentType: "application/json",
		success : function(data) {
		  	for(let i=0;i<data.length;i++)
			{
				text+=`<div class="hg-hotlist">
				<a href="detail?bookinfo=${data[i].bookcode}" class="hg-a">
					<img src="resources/bookimg/${data[i].bookcode}.jpg" alt="${data[i].bookcode}" />
				</a>
				<h3 class="hg-bname"><a href="detail?bookinfo=${data[i].bookcode}">${data[i].booktitle}</a></h3>
				<div class="hg-ap">
					<span><a href="search?query=${data[i].author}">${data[i].author}</a> 저자</span>
					<span class="hg-dotted">·</span>
					<span><a href="search?query=${data[i].publisher}">${data[i].publisher}</a></span>
				</div>
				<div class="hg-content">
					${data[i].bookcontent}
				</div>
			</div>`;
			}
			hg_hot.style.left="10px";
			hg_hotnum = 10;
			hg_hotbtn[0].classList.remove('active');
			hg_hotbtn[1].classList.add('active');
			hg_mainhot.innerHTML=text;
			for(let i=0;i<hg_hotmenubtn.length;i++)
			{
				hg_hotmenubtn[i].classList.remove("active");
			}
			hg_hotmenubtn[num].classList.add("active");
			if(hg_what=="popular") document.getElementById("hg_morewatch").href = "ordersearch?order=인기순";
			if(hg_what=="recent") document.getElementById("hg_morewatch").href = "ordersearch?order=최신순";
			if(hg_what=="lotsloan") document.getElementById("hg_morewatch").href = "ordersearch?order=대여순";
  		},
  		error : function() {
  		console.log("error");
  		}
	});
}

function popupclose()
{
	document.getElementsByClassName("hg-popup")[0].style.display="none";
}












