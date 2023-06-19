
$(document).ready(function()
{
	document.getElementsByClassName("hg-returnbox")[0].style.display="block";
});
const hg_rightbox = document.getElementsByClassName("hg-rightbox")[0];
window.addEventListener('scroll', function(){
	console.log(window.pageYOffset);
	if(window.pageYOffset>160)
	{
		hg_rightbox.style.top = "20px";
	}
	else
	{
		hg_rightbox.style.top= "180px";
	}
});

let hg_hidenum=0;
function hg_hidebtn()
{
	const hg_rightbox = document.getElementsByClassName("hg-rightbox")[0];
	const hg_himg = document.getElementById("hg-slidebtn");
	if(hg_hidenum==0)
	{
		hg_rightbox.style.right="-130px";
		hg_himg.src="resources/images/slide_left.jpg";
		hg_hidenum=1;
	}
	else
	{
		hg_rightbox.style.right="0";
		hg_himg.src="resources/images/slide_right.jpg";
		hg_hidenum=0;
	}
}

let hg_rboxnum=0;

function rboxbtn(e)
{
	if(hg_rboxnum==0)
	{
		document.getElementsByClassName("hg-returnbox")[1].style.display="block";
		e.innerHTML="-접기";
		hg_rboxnum=1;
	}
	else
	{
		document.getElementsByClassName("hg-returnbox")[1].style.display="none";
		e.innerHTML="+더보기";
		hg_rboxnum=0;
	}
}

function hg_gototop()
{
	window.scrollTo({ top: 0, behavior: "smooth" }); 
}