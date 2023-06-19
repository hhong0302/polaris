const hg_lboxbtn = document.getElementsByClassName("hg-lboxbtn");

//화면 시작 시 기능
window.onload = function()
{
	hg_lboxbtn[0].click();
}

function lboxbtn(e,images)
{
	const hg_anchor = document.getElementById("hg-lboxanchor");
	const hg_limg = document.getElementById("hg-leftboximg");
	for(let i=0;i<hg_lboxbtn.length;i++)
	{
		hg_lboxbtn[i].classList.remove("active");
	}
	hg_anchor.href = "javascript:void(0)";
	hg_limg.src = "resources/bookimg/"+images+".jpg";
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
let hg_novelnum = 0;
let hg_essaynum = 0;
let hg_hotnum = 0;
const nvsize = hg_novel.scrollWidth;
const essize = hg_essay.scrollWidth;
const htsize = hg_hot.scrollWidth;

function hg_nvmove(px)
{
	hg_novelnum += px;
	if(hg_novelnum<-nvsize+1240)
	{
		hg_novelnum=-nvsize+1240;
		return false;
	}
	if(hg_novelnum>0)
	{
		hg_novelnum=0;
		return false;
	}
	hg_novel.style.left=hg_novelnum+'px';
	hg_novelbtn[0].classList.add('active');
	hg_novelbtn[1].classList.add('active');
	if(hg_novelnum==-nvsize+1240)hg_novelbtn[1].classList.remove('active');
	if(hg_novelnum==0)hg_novelbtn[0].classList.remove('active');
}

function hg_esmove(px)
{
	hg_essaynum += px;
	if(hg_essaynum<-essize+1230)
	{
		hg_essaynum=-essize+1230;
		return false;
	}
	if(hg_essaynum>0)
	{
		hg_essaynum=0;
		return false;
	}
	hg_essay.style.left=hg_essaynum+'px';
	hg_essaybtn[0].classList.add('active');
	hg_essaybtn[1].classList.add('active');
	if(hg_essaynum==-essize+1230)hg_essaybtn[1].classList.remove('active');
	if(hg_essaynum==0)hg_essaybtn[0].classList.remove('active');
}
//바튼(마지막 버튼은 보류)














