let reviewCount = 0;

const rv_writespan=document.getElementsByClassName("review-writedspan")[0];
const rv_title=document.getElementById("reviewtitle");
const rvbox_detail = document.getElementsByClassName("reviewBox-detail")[0];
const review_deletebtn=document.getElementsByClassName("review-deletebtn")[0];
const listNav_recent=document.getElementById("recent");
const listNav_like=document.getElementById("like");
const rv_title_value=rv_title.value;
const rvbox_detail_value=rvbox_detail.innerHTML;

window.onload=function()
{
	listNav_recent.click();
}

//리뷰작성/수정/삭제 부분
function reviewModify()
{
	const rv_writespan=document.getElementsByClassName("review-writedspan")[0];
	const rv_title=document.getElementById("reviewtitle");
	const rvbox_detail = document.getElementsByClassName("reviewBox-detail")[0];
	const review_deletebtn=document.getElementsByClassName("review-deletebtn")[0];
	
	if(reviewCount==0)
	{
		rv_writespan.style.display="none";
		rv_title.setAttribute("type","text");
		rvbox_detail.readOnly=false;
		rvbox_detail.classList.remove("review-writedarea");
		review_deletebtn.innerHTML="수정 취소";
		reviewCount=1;
	}
	else
	{
		
	}
}

function reviewModifyCancel()
{
	if(reviewCount==1)
	{
		rv_writespan.style.display="block";
		rv_title.value=rv_title_value;
		rvbox_detail.value=rvbox_detail_value;
		rv_title.setAttribute("type","hidden");
		rvbox_detail.readOnly=true;
		rvbox_detail.classList.add("review-writedarea");
		review_deletebtn.innerHTML="리뷰 삭제";
		reviewCount=0;
	}
	else
	{
		
	}
}
//리뷰 작성/수정/삭제 부분

//리뷰 리스트 부분
function listNav_click(reviewtype,bookcode)
{
	const rvmenu_detail = document.getElementsByClassName("reviewMenu-detail");
	const rvtitle_detail = document.getElementsByClassName("reviewTitle-detail");
	if(reviewtype=="recent")
	{
		rvmenu_detail[0].classList.add("action");
		rvtitle_detail[0].classList.add("action");
		rvmenu_detail[1].classList.remove("action");
		rvtitle_detail[1].classList.remove("action");
		$.ajax({
		url : "reviewController",
		type: "GET",
		dataType: "json",
		data:{"bookcode":bookcode},
		contentType: "application/json",
		success : function(data) {
		  	if(data==null||data==""||data==0) return;
			else
			{
				
			}
  		},
  		error : function() {
  		console.log("error");
  		}
	});
	}
	else
	{
		rvmenu_detail[0].classList.remove("action");
		rvtitle_detail[0].classList.remove("action");
		rvmenu_detail[1].classList.add("action");
		rvtitle_detail[1].classList.add("action");
	}
}












