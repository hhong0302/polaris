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
let listPageNum=0;
let listType;
let allReviewDatas=0;
let scrollCount=0;
const rvcmtcontent = document.getElementsByClassName("reviewComment-content");
const reviewcommentlist = document.getElementsByClassName("reviewcommentlist-detail")[0];
const rvmenu_detail = document.getElementsByClassName("reviewMenu-detail");
const rvtitle_detail = document.getElementsByClassName("reviewTitle-detail");
const pgnum_detail_btnbox = document.getElementsByClassName("pageNum-detail-btnbox")[0];
const pgbtn_prev = document.getElementsByClassName("prv")[0];
const pgbtn_next = document.getElementsByClassName("nxt")[0];

//인기/최신 버튼
function listNav_click(reviewType,bookcode)
{
	let reviewList = "";
	if(reviewType=="recent")
	{
		rvmenu_detail[0].classList.add("action");
		rvtitle_detail[0].classList.add("action");
		rvmenu_detail[1].classList.remove("action");
		rvtitle_detail[1].classList.remove("action");
		listType="recent";
	}
	else//reviewType==relike
	{
		rvmenu_detail[0].classList.remove("action");
		rvtitle_detail[0].classList.remove("action");
		rvmenu_detail[1].classList.add("action");
		rvtitle_detail[1].classList.add("action");
		listType="relike";
	}
		$.ajax({
		url : "reviewController",
		type: "GET",
		dataType: "json",
		data:{"reviewType":reviewType,"bookcode":bookcode},
		async:false,
		contentType: "application/json",
		success : function(datas) {
		  	if(datas==null||datas==""||datas==0) return;
			else
			{
				allReviewDatas=Math.ceil(datas.length/5);
				for(let i=0;i<5;i++)
				{
					reviewList+=`<div class="reviewComment-detail">
			    		<div class="reviewTop-detail">
				    		<div class="reviewInfo-detail">
					    		<h1 class="reviewtitle-detail">
					    			${datas[i].booktitle}
					    		</h1>
				    			<textarea class="reviewComment-content" readonly>${datas[i].bookcontent}</textarea>
				    		</div>
			    		</div>
			    		<div class="reviewBottom-detail">
		    				<div class="likeBox-detail-span">
				    			<span class="reviewUser-detail">${datas[i].bookcode}</span>
				    			<span class="reviewDate-detail">${datas[i].date}</span>
			    			</div>`;
			    	$.ajax({
					url : "reviewLikeController",
					type: "GET",
					dataType: "json",
					data:{"bookcode":bookcode,
					"writer":datas[i].userid},
					async:false,
					contentType: "application/json",
					success : function(hg_number) {
						if(hg_number>0) reviewList+=`<button class="likeBox-detail-like active">
					   					<img alt="like" src="resources/images/like-detail.png">${datas[i].like}
				   			 		</button>`;
						else reviewList+=`<button class="likeBox-detail-like">
					   					<img alt="like" src="resources/images/dislike-detail.png">${datas[i].like}
				   			 		</button>`;
			  		},
			  		error : function() {
			  		console.log("error");
			  		}
					});
					reviewList+=`</div>
				    	</div>`;
				}
				
				let listCount=0;
				let rvButtonList="";
				if(datas.length<25) listCount=Math.ceil(datas.length/5);
				else
				{
					listCount=5;
					pgbtn_next.classList.add("active");
				}
				for(let i=1;i<=listCount;i++)
				{
					rvButtonList+=`<button class="pageNum-pagebtn" onclick="pageNumBtnClick(this,${i-1},'${listType}','${bookcode}')">${i}</button>`;
				}
				reviewcommentlist.innerHTML=reviewList;
				pgnum_detail_btnbox.innerHTML=rvButtonList;
			}
  		},
  		error : function() {
  		console.log("error");
  		}
		});
			document.getElementsByClassName("pageNum-pagebtn")[0].click();	
		for(let i=0;i<rvcmtcontent.length;i++)
		{
			rvcmtcontent[i].style.height=rvcmtcontent[i].scrollHeight+"px";
		}
}

//1,2,3,4,5 그 버튼
function pageNumBtnClick(e,listNumber,lstType,bookcode)
{
	const pgNum_pgbtn = document.getElementsByClassName("pageNum-pagebtn");
	let reviewList = "";
	$.ajax({
		url : "reviewListController",
		type: "GET",
		dataType: "json",
		data:{"listnum":listNumber,"listType":lstType},
		async:false,
		contentType: "application/json",
		success : function(datas) {
			for(let i=0;i<datas.length;i++)
				{
					reviewList+=`<div class="reviewComment-detail">
			    		<div class="reviewTop-detail">
				    		<div class="reviewInfo-detail">
					    		<h1 class="reviewtitle-detail">
					    			${datas[i].booktitle}
					    		</h1>
				    			<textarea class="reviewComment-content" readonly>${datas[i].bookcontent}</textarea>
				    		</div>
			    		</div>
			    		<div class="reviewBottom-detail">
		    				<div class="likeBox-detail-span">
				    			<span class="reviewUser-detail">${datas[i].bookcode}</span>
				    			<span class="reviewDate-detail">${datas[i].date}</span>
			    			</div>`;
			    	$.ajax({
					url : "reviewLikeController",
					type: "GET",
					dataType: "json",
					data:{"bookcode":bookcode,
					"writer":datas[i].userid},
					async:false,
					contentType: "application/json",
					success : function(hg_number) {
						if(hg_number>0) reviewList+=`<button class="likeBox-detail-like active">
					   					<img alt="like" src="resources/images/like-detail.png">${datas[i].like}
				   			 		</button>`;
						else reviewList+=`<button class="likeBox-detail-like">
					   					<img alt="like" src="resources/images/dislike-detail.png">${datas[i].like}
				   			 		</button>`;
			  		},
			  		error : function() {
			  		console.log("error");
			  		}
					});
					reviewList+=`</div>
				    	</div>`;
				}
				reviewcommentlist.innerHTML=reviewList;
		},
  		error : function() {
  		console.log("error");
  		}
		});
	if(scrollCount>0) window.scrollTo({ top: 2600, behavior: "smooth" }); 
	scrollCount=1;
	for(let i=0;i<pgNum_pgbtn.length;i++)
	{
		pgNum_pgbtn[i].classList.remove("active");
	}
	
	e.classList.add("active");
}

//이전,다음 버튼
function rvListPrevNxtBtn(hg_number,bookcode)
{
	const pgNum_pgbtn = document.getElementsByClassName("pageNum-pagebtn");
	listPageNum+=hg_number;
	if(listPageNum<0)
	{
		listPageNum=0;
		return false;
	}
	if(listPageNum>(allReviewDatas/5)-1)
	{
		listPageNum=(allReviewDatas/5)-1;
		return false;
	}
	let rvButtonList="";
	for(i=(listPageNum*5)+1;i<=(listPageNum*5)+5;i++)
	{
		if(i>allReviewDatas)
		{
			break;
		}
		rvButtonList+=`<button class="pageNum-pagebtn" onclick="pageNumBtnClick(this,${i-1},'${listType}','${bookcode}')">${i}</button>`;
	}
	pgnum_detail_btnbox.innerHTML=rvButtonList;
	if(hg_number==1)
	{
		pgNum_pgbtn[0].click();
	}
	else
	{
		pgNum_pgbtn[4].click();
	}
	
	if(listPageNum==0) pgbtn_prev.classList.remove("active");
	else pgbtn_prev.classList.add("active");

	if(listPageNum==(allReviewDatas/5)-1) pgbtn_next.classList.remove("active");
	else pgbtn_next.classList.add("active");
}















