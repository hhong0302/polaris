let rightboxLoanList="";
$(document).ready(function()
{
	document.getElementsByClassName("hg-returnbox")[0].style.display="block";
	$.ajax({
		url : "rightboxLoanController",
		type: "GET",
		dataType: "json",
		data:{},
		async:false,
		contentType: "application/json",
		success : function(data) {
			if(data.length==0)
			{
				rightboxLoanList+=`<div class="hg-returnbox">
						<img src="resources/images/home_noloan.png" class="hg-rtimg" alt="noloan" />
					</div>`;
			}
			else
			{
				for(let i=0;i<data.length;i++)
				{
					rightboxLoanList+=`<div class="hg-returnbox" ${i==data.length-1&&i!=0?"style='display:none;'":""}>
						<a href="detail?bookinfo=${data[i].bookcode}">
							<img src="resources/bookimg/${data[i].bookcode}.jpg" class="hg-rtimg" alt="${data[i].bookcode}" />
							
							<span class="hg-righttitle">
								${data[i].booktitle}
							</span>
						</a>
					</div>`;
				}
				if(data.length==2) rightboxLoanList+=`<div class="hg-rightline"></div>
					<button class="hg-rboxbtn" onclick="rboxbtn(this)">+더보기</button>`;
			}
			
			document.getElementsByClassName("hg_returnvalidbox")[0].innerHTML=rightboxLoanList;
		},
  		error : function() {
  		console.log("error");
  		}
		});
});
const hg_rightbox = document.getElementsByClassName("hg-rightbox")[0];
const hg_gototopbtn = document.getElementsByClassName("hg-gototop")[0];
window.addEventListener('scroll', function(){
	if(window.pageYOffset>160)
	{
		hg_rightbox.style.top = "20px";
		hg_gototopbtn.classList.add("active");
	}
	else
	{
		hg_rightbox.style.top= "180px";
		hg_gototopbtn.classList.remove("active");
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
		hg_himg.src="resources/images/slide_left.png";
		hg_hidenum=1;
	}
	else
	{
		hg_rightbox.style.right="0";
		hg_himg.src="resources/images/slide_right.png";
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