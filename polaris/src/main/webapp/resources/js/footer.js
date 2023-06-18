window.onload=function()
{
	document.getElementsByClassName("hg-returnbox")[0].style.display="block";
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