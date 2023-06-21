let reviewCount = 0;

const rv_writespan=document.getElementsByClassName("review-writedspan")[0];
const rv_title=document.getElementById("reviewtitle");
const rvbox_detail = document.getElementsByClassName("reviewBox-detail")[0];
const review_deletebtn=document.getElementsByClassName("review-deletebtn")[0];
	
const rv_title_value=rv_title.value;
const rvbox_detail_value=rvbox_detail.innerHTML;
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












